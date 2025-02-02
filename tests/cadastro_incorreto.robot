*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse a plataforma
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_CARD}    id:form-botao


*** Test Cases ***
Verificar se quando campo obrigatório não for preenchido de corretamente, o sistema exibe mensagem de campo obrigatório
    Dado que eu clique no botão criar card
    Então sistema deve apresentar mensagem de campo obrigatório

