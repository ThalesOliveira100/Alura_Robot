*** Settings ***
Library    SeleniumLibrary
Library    XML


*** Test Cases ***
Abrir navegador e acessar o site do organo
    Open Browser  url=http://localhost:3000/  browser=Chrome

Preencher campos do formulário, clicar no botão 'Criar Card' e validar se o card é criado
    Input Text       id:form-nome               Thales
    Input Text       id:form-cargo              QA Analist
    Input Text       id:form-imagem             https://picsum.photos/200/300
    Click Element    class:lista-suspensa
    Click Element    //option[contains(., 'Programação')]
    Sleep    5s
    Click Element    id:form-botao
    Element Should Be Visible    class:colaborador
    Sleep    5s