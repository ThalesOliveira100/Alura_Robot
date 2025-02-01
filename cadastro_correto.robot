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
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]

*** Test Cases ***
Verificar preenchimento dos campos do formulário corretamente, inserção dos dados na lista e criação do card no time esperado.
    
    Dado que preencha os campos do formulário
    E clique no botão Criar Card
    Então indentifica o card no time esperado


Verificar se é possível criar mais um card se preenchermos os campos corretamente.
    Dado que preencha os campos do formulário
    E clique no botão Criar Card
    Então identificar três cards no time esperado

*** Keywords ***
Dado que preencha os campos do formulário
    ${Nome}          FakerLibrary.First Name
    ${Cargo}         FakerLibrary.Job
    ${Imagem}        FakerLibrary.Image Url

    Input Text       ${CAMPO_NOME}              ${Nome}
    Input Text       ${CAMPO_CARGO}             ${Cargo}
    Input Text       ${CAMPO_IMAGEM}            ${Imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${OPCAO_PROGRAMACAO}
    
E clique no botão Criar Card
    Click Element    ${BOTAO_CARD}

Então indentifica o card no time esperado
    Element Should Be Visible                   class:colaborador
    Sleep    10

Então identificar três cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que preencha os campos do formulário
        E clique no botão Criar Card
    END
    Sleep    10s