#!/usr/bin/env bash

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Verificação de dependências
command -v jq >/dev/null 2>&1 || { echo -e "${RED}Erro: jq não está instalado${NC}"; exit 1; }

# Diretório do Terraform
TERRAFORM_DIR="../terraform"

# Funções de validação
validate_terraform_dir() {
    if [ ! -d "$TERRAFORM_DIR" ]; then
        echo -e "${RED}Erro: Diretório Terraform não encontrado${NC}"
        exit 1
    fi
}

validate_tfvars() {
    if [ ! -f "$TERRAFORM_DIR/common.tfvars" ]; then
        echo -e "${RED}Erro: Arquivo common.tfvars não encontrado${NC}"
        exit 1
    fi
}

# Funções principais
init() {
    echo -e "${YELLOW}Inicializando Terraform...${NC}"
    terraform -chdir="$TERRAFORM_DIR" init
}

plan() {
    echo -e "${YELLOW}Executando Terraform Plan...${NC}"
    terraform -chdir="$TERRAFORM_DIR" plan -var-file=common.tfvars -out=tfplan
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

tfsec() {
    echo -e "${YELLOW}Executando análise de segurança...${NC}"
    tfsec "$TERRAFORM_DIR" --tfvars-file common.tfvars
}

fmt() {
    echo -e "${YELLOW}Formatando arquivos Terraform...${NC}"
    terraform -chdir="$TERRAFORM_DIR" fmt -recursive
}

gera_doc() {
    echo -e "${YELLOW}Gerando documentação...${NC}"
    
    # Gera documentação básica
    terraform-docs markdown "$TERRAFORM_DIR" > "$TERRAFORM_DIR/modules/README.md"
    
    # Analisa o state ou plan
    if [ -f "$TERRAFORM_DIR/terraform.tfstate" ]; then
        GRAPH_SOURCE="terraform show -json terraform.tfstate"
    elif [ -f "$TERRAFORM_DIR/tfplan" ]; then
        GRAPH_SOURCE="terraform show -json tfplan"
    else
        echo -e "${YELLOW}Gerando plano temporário para análise...${NC}"
        terraform -chdir="$TERRAFORM_DIR" plan -out=tfplan -var-file=common.tfvars
        GRAPH_SOURCE="terraform show -json tfplan"
    fi
    
    # Gera grafo de dependências
    eval "$GRAPH_SOURCE" | jq -r '.planned_values.root_module | 
    [.. | select(.type? and .address?)] | 
    map({name: .address, type: .type, depends_on: .dependencies?}) | 
    "graph TD\n" + 
    (map("    " + .name + "[" + .type + "]") | join("\n")) + "\n" + 
    (map(select(.depends_on) | .depends_on[] as $dep | "    " + .name + " --> " + $dep) | join("\n"))' > "$TERRAFORM_DIR/Terramaid.md"
    
    # Adiciona ao README
    {
        cat "$TERRAFORM_DIR/modules/README.md"
        echo
        echo "## Diagrama de Infraestrutura"
        echo
        echo "O diagrama abaixo representa a infraestrutura atual do projeto:"
        echo
        echo "\`\`\`mermaid"
        cat "$TERRAFORM_DIR/Terramaid.md"
        echo "\`\`\`"
    } > "$TERRAFORM_DIR/modules/README.md.tmp" && mv "$TERRAFORM_DIR/modules/README.md.tmp" "$TERRAFORM_DIR/modules/README.md"

    echo -e "${GREEN}Documentação gerada com sucesso!${NC}"
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

# Menu de ajuda
show_help() {
    echo -e "${GREEN}Uso: $0 <comando>${NC}"
    echo "Comandos disponíveis:"
    echo "  init      - Inicializa o Terraform"
    echo "  plan      - Executa terraform plan"
    echo "  apply     - Executa terraform apply"
    echo "  destroy   - Executa terraform destroy"
    echo "  fmt       - Formata os arquivos Terraform"
    echo "  tfsec     - Executa análise de segurança"
    echo "  gera_doc  - Gera documentação"
    echo "  workspace - Gerencia workspaces (list|new|select)"
}

# Validações iniciais
validate_terraform_dir
validate_tfvars

# Execução do comando
case "$1" in
    init|plan|apply|destroy|fmt|tfsec|gera_doc)
        $1
        ;;
    workspace)
        workspace "$@"
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo -e "${RED}Comando inválido. Use '$0 --help' para ver os comandos disponíveis.${NC}"
        exit 1
        ;;
esac