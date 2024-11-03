#!/usr/bin/env bash

function plan() {
    terraform plan -var-file=auto.tfvars
}

function apply() {
    terraform apply -var-file=auto.tfvars -auto-approve
    }

function gera_doc() {
    terraform-docs markdown . > modules/README.md
    terramaid
    sleep 10
    $(echo -e \\n\#\#\ Diagrama\ de\ Infraestrutura\\n\\nO\ diagrama\ abaixo\ representa\ a\ infraestrutura\ atual\ do\ projeto:\\n\\n\ >> modules/README.md  && cat Terramaid.md >> modules/README.md)
}

# Executando as funções
plan
apply
gera_doc