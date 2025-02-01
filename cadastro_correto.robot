*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt_BR
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse a plataforma
Test Teardown    Fechar o navegador

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${CAMPO_CARD}             id:form-botao
@{selecionar times}
...      //option[contains(.,'Programação')]
...      //option[contains(.,'Front-End')]
...      //option[contains(.,'Data Science')]
...      //option[contains(.,'Devops')] 
...      //option[contains(.,'UX e Design')]
...      //option[contains(.,'Mobile')]
...      //option[contains(.,'Inovação')]

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

*** Keywords ***
Dado que preencha os campos do formulário
    ${Nome}          FakerLibrary.First Name
    ${Cargo}         FakerLibrary.Job
    ${Imagem}        FakerLibrary.Image Url    width=100    height=100
    Input Text       ${CAMPO_NOME}              ${Nome}
    Input Text       ${CAMPO_CARGO}             ${Cargo}
    Input Text       ${CAMPO_IMAGEM}            ${Imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${selecionar times}[0]
    
E clique no botão Criar Card
    Click Element    ${CAMPO_CARD}

Então indentifica o card no time esperado
    Element Should Be Visible                   class:colaborador

Então identificar três cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que preencha os campos do formulário
        E clique no botão Criar Card
    END
    Sleep    10s

Então criar e identificar um card em cada time disponível
    FOR    ${indice}    ${time}    IN ENUMERATE    @{selecionar times}
        Dado que preencha os campos do formulário
        Click Element    ${time}
        E clique no botão Criar Card        
    END
    Sleep    10s