*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse a plataforma
Test Teardown    Fechar o navegador


*** Test Cases ***
Verificar preenchimento dos campos do formulário corretamente, inserção dos dados na lista e criação do card no time esperado.
    Dado que preencha os campos do formulário
    E clique no botão Criar Card
    Então indentifica o card no time esperado

Verificar se é possível criar mais um card se preenchermos os campos corretamente.
    Dado que preencha os campos do formulário
    E clique no botão Criar Card
    Então identificar três cards no time esperado

Verificar se é possível criar um card para cada time disponível se os campos forem preenchidos corretamente
    Dado que preencha os campos do formulário
    Então criar e identificar um card em cada time disponível

