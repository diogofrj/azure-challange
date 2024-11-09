#!/usr/bin/env bash

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Verificação de dependências
#command -v jq >/dev/null 2>&1 || { echo -e "${RED}Erro: jq não está instalado${NC}"; exit 1; }

# Diretório do Terraform
TERRAFORM_DIR="../terraform"

###### Funções de validação
validate_terraform_dir() {
    if [ ! -d "$TERRAFORM_DIR" ]; then
        echo -e "${RED}Erro: Diretório Terraform não encontrado${NC}"
        exit 1
    else
        echo -e "${GREEN}Diretório Terraform encontrado: $TERRAFORM_DIR${NC}"
    fi
}
validate_tfvars() {
    if [ ! -f "$TERRAFORM_DIR/common.tfvars" ]; then
        echo -e "${RED}Erro: Arquivo common.tfvars não encontrado${NC}"
        exit 1
    else
        echo -e "${GREEN}Arquivo common.tfvars encontrado: $TERRAFORM_DIR/common.tfvars${NC}"
    fi
}
###### Funções principais
init() {
    echo -e "${YELLOW}Inicializando Terraform...${NC}"
    terraform -chdir="$TERRAFORM_DIR" init -upgrade
}
plan() {
    echo -e "${YELLOW}Gerando plano de execução...${NC}"
    terraform -chdir="$TERRAFORM_DIR" plan
}
fmt() {
    echo -e "${YELLOW}Formatando arquivos Terraform...${NC}"
    terraform -chdir="$TERRAFORM_DIR" fmt -recursive
}
validate() {
    echo -e "${YELLOW}Validando arquivos Terraform...${NC}"
    terraform -chdir="$TERRAFORM_DIR" validate
}
plan() {
    echo -e "${YELLOW}Executando Terraform Plan...${NC}"
    terraform -chdir="$TERRAFORM_DIR" plan -var-file=common.tfvars -out=tfplan
}
infracost() {
    echo -e "${YELLOW}Executando Infracost...${NC}"
    if [ -z "$INFRACOST_API_KEY" ]; then
        echo -e "${RED}Erro: Variável INFRACOST_API_KEY não está definida: Acesse https://www.infracost.io/docs/#2-get-api-key para obter a chave${NC}"
        exit 1
    else
        docker run --rm -e INFRACOST_API_KEY=${INFRACOST_API_KEY} -v $(pwd)/$TERRAFORM_DIR:/code/ infracost/infracost:ci-latest breakdown --path /code/
    fi
}

apply() {
    echo -e "${YELLOW}Executando Terraform Apply...${NC}"
    terraform -chdir="$TERRAFORM_DIR" apply -var-file=common.tfvars -auto-approve
}
destroy() {
    echo -e "${RED}Atenção: Isso irá destruir toda a infraestrutura!${NC}"
    read -p "Você tem certeza? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        terraform -chdir="$TERRAFORM_DIR" destroy -var-file=common.tfvars -auto-approve
    fi
}
workspace() {
    case "$2" in
        list)
            terraform -chdir="$TERRAFORM_DIR" workspace list
            ;;
        new)
            terraform -chdir="$TERRAFORM_DIR" workspace new "$3"
            ;;
        select)
            terraform -chdir="$TERRAFORM_DIR" workspace select "$3"
            ;;
        *)
            echo -e "${RED}Comando workspace inválido. Use: workspace [list|new|select] [nome]${NC}"
            exit 1
            ;;
    esac
}
###### Funções de segurança
checkov() {
    echo -e "${YELLOW}Executando Checkov...${NC}"
    docker run --tty --volume $(pwd)/$TERRAFORM_DIR:/tf --workdir /tf bridgecrew/checkov --directory /tf --quiet --compact
}
tfsec() {
    echo -e "${YELLOW}Executando análise de segurança...${NC}"
    docker run --rm -it -v "$(pwd)/$TERRAFORM_DIR:/src" aquasec/tfsec --tfvars-file /src/common.tfvars --force-all-dirs --soft-fail --concise-output /src 
}
tflint() {
    echo -e "${YELLOW}Executando análise de lint...${NC}"
    # docker run --rm -it -v "$(pwd)/$TERRAFORM_DIR:/src" wata727/tflint --recursive --config=/src/.tflint.hcl /src
    docker run --rm -v $(pwd)/$TERRAFORM_DIR:/data -t ghcr.io/terraform-linters/tflint --recursive
}
terrascan() {
    echo -e "${YELLOW}Executando análise de segurança...${NC}"
    
    # Procura por providers em todos os arquivos .tf
    if grep -r 'provider "aws"' "$TERRAFORM_DIR"/*.tf >/dev/null 2>&1; then
        echo -e "${YELLOW}Analisando provider AWS...${NC}"
        docker run --rm -it -v "$(pwd)/$TERRAFORM_DIR:/iac" -w /iac tenable/terrascan scan -t aws -o human
    fi

    if grep -r 'provider "azurerm"' "$TERRAFORM_DIR"/*.tf >/dev/null 2>&1; then
        echo -e "${YELLOW}Analisando provider Azure...${NC}"
        docker run --rm -it -v "$(pwd)/$TERRAFORM_DIR:/iac" -w /iac tenable/terrascan scan -t azure -o human
    fi

    if grep -r 'provider "google"' "$TERRAFORM_DIR"/*.tf >/dev/null 2>&1; then
        echo -e "${YELLOW}Analisando provider GCP...${NC}"
        docker run --rm -it -v "$(pwd)/$TERRAFORM_DIR:/iac" -w /iac tenable/terrascan scan -t gcp -o human
    fi

    # Se nenhum provider for encontrado
    if ! grep -r 'provider "\(aws\|azurerm\|google\)"' "$TERRAFORM_DIR"/*.tf >/dev/null 2>&1; then
        echo -e "${RED}Erro: Nenhum provider AWS, Azure ou GCP encontrado!${NC}"
        exit 1
    fi
}
kics() {
    echo -e "${YELLOW}Executando análise de segurança...${NC}"
    docker run -t -v $(pwd)/$TERRAFORM_DIR:/path checkmarx/kics:latest scan -p /path -o terraform  --exclude-severities 'info,low' --minimal-ui
}

###### Funções de documentação
gera_docs() {
    echo -e "${YELLOW}Gerando documentação...${NC}"
    
    # Gera documentação básica
    terraform-docs markdown "$TERRAFORM_DIR" > "$TERRAFORM_DIR/modules/README.md"
    terramaid -w "$TERRAFORM_DIR/modules" 
    sleep 2
#         cat > "$TERRAFORM_DIR/modules/README.md" << EOF
# $(cat "$TERRAFORM_DIR/modules/README.md")

# ## Diagrama de Infraestrutura

# O diagrama abaixo representa a infraestrutura atual do projeto:

# $(cat "$TERRAFORM_DIR/Terramaid.md")

# ## Dependências dos Recursos
# EOF
    echo -e "${GREEN}Documentação gerada com sucesso!${NC}"
}


# Processamento dos argumentos da linha de comando
main() {
    if [ $# -eq 0 ]; then
        echo -e "${RED}Erro: Nenhum comando especificado${NC}"
        echo -e "${YELLOW}Comandos disponíveis:${NC}"
        echo -e "${GREEN}  Funções de validação:${NC}"
        echo -e "    validate_terraform_dir   - Valida se o diretório Terraform existe"
        echo -e "    validate_tfvars          - Valida se o arquivo common.tfvars existe"
        echo -e "${GREEN}  Funções principais:${NC}"
        echo -e "    init                     - Inicializa o Terraform"
        echo -e "    validate                 - Valida o plano de execução"
        echo -e "    fmt                      - Formata os arquivos Terraform"
        echo -e "    plan                     - Gera o plano de execução"
        echo -e "    infracost                - Verifica os custos da infraestrutura"
        echo -e "    apply                    - Aplica as mudanças"
        echo -e "    destroy                  - Destrói toda a infraestrutura"
        echo -e "    workspace                - Gerencia os workspaces"
        echo -e "${GREEN}  Funções de segurança:${NC}"
        echo -e "    checkov                  - Executa o Checkov"
        echo -e "    tfsec                    - Executa o Tfsec"
        echo -e "    tflint                   - Executa o Tflint"
        echo -e "    terrascan                - Executa o Terrascan"
        echo -e "    kics                     - Executa o Kics"
        echo -e "${GREEN}  Funções de documentação:${NC}"
        echo -e "    gera_docs                - Gera a documentação"
        exit 1
    fi

    comando=$1
    case $comando in
        "validate_terraform_dir")
            validate_terraform_dir
            ;;
        "validate_tfvars")
            validate_tfvars
            ;;
        "init")
            init
            ;;
        "validate")
            validate
            ;;
        "plan")
            plan
            ;;
        "infracost")
            infracost
            ;;
        "fmt")
            fmt
            ;;
        "apply")
            apply
            ;;
        "destroy")
            destroy
            ;;
        "workspace")
            workspace "$@"
            ;;
        "checkov")
            checkov
            ;;
        "tfsec")
            tfsec
            ;;
        "tflint")
            tflint
            ;;
        "terrascan")
            terrascan
            ;;
        "kics")
            kics
            ;;
        "gera_docs")
            gera_docs
            ;;
        *)
            echo -e "${RED}Erro: Comando '$comando' não reconhecido${NC}"
            echo -e "${YELLOW}Comandos disponíveis:${NC}"
            echo -e "  validate_terraform_dir  - Valida se o diretório Terraform existe"
            echo -e "  validate_tfvars         - Valida se o arquivo common.tfvars existe"
            echo -e "  init                    - Inicializa o Terraform"
            echo -e "  validate                - Valida o plano de execução"
            echo -e "  fmt                     - Formata os arquivos Terraform"
            echo -e "  plan                    - Gera o plano de execução"
            echo -e "  infracost               - Verifica os custos da infraestrutura"
            echo -e "  apply                   - Aplica as mudanças"
            echo -e "  destroy                 - Destrói toda a infraestrutura"
            echo -e "  workspace               - Gerencia os workspaces"
            echo -e "  checkov                 - Executa o Checkov"
            echo -e "  tfsec                   - Executa o Tfsec"
            echo -e "  tflint                  - Executa o Tflint"
            echo -e "  terrascan               - Executa o Terrascan"
            echo -e "  kics                    - Executa o Kics"
            echo -e "  gera_docs               - Gera a documentação"
            exit 1
            ;;
    esac
}

# Executa o script
main "$@"

