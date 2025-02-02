# Essa clase deve conter métodos que representam **ações executáveis** na página, além de elementos da interface relevantes para cada ação.
*** Settings ***
Resource    ../main.robot

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

Dado que eu clique no botão criar card
    Click Element    ${CAMPO_CARD}

Então sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro