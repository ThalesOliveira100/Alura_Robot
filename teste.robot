*** Settings ***
Documentation   Exemplos do uso de IF nos testes
Test Setup      Log To Console    ${\n}
Test Teardown   Log To Console    ${\n}

*** Variables ***
${NUMERO}   ${0}

*** Test Cases ***
Exemplo blocos IF - ELSE IF
    IF  ${NUMERO} > 0
        Mostrar mensagem quando o número for maior que zero
        Log  message=Você está vendo essa mensagem porque o número [${NUMERO}] é maior que zero!!!  console=True
    ELSE IF    ${NUMERO} < 0
        Mostrar mensagem quando o número for menor que zero
        Log  message=Você está vendo essa mensagem porque o número [${NUMERO}] é menor que zero!!!  console=True
    ELSE IF    ${NUMERO} == 0
        Mostrar mensagem quando o número for igual a zero
        Log  message=Você está vendo essa mensagem porque o número [${NUMERO}] é igual a zero!!!  console=True
    END

Teste de FOR do tipo IN RANGE
    Usando FOR IN RANGE

*** Keywords ***
Mostrar mensagem quando o número for maior que zero
    Log   O número [${NUMERO}] é maior que zero!
    Log To Console    O número [${NUMERO}] é maior que zero!

Mostrar mensagem quando o número for menor que zero
    Log   O número [${NUMERO}] é menor que zero!
    Log To Console    O número [${NUMERO}] é menor que zero!

Mostrar mensagem quando o número for menor ou igual a zero
    Log   O número [${NUMERO}] é menor ou igual a zero!
    Log To Console    O número [${NUMERO}] é menor ou igual a zero!
Mostrar mensagem quando o número for igual a zero
    Log   O número [${NUMERO}] é igual a zero!
    Log To Console    O número [${NUMERO}] é igual a zero!

Usando FOR IN RANGE
    Log To Console  ${\n}
    FOR  ${CONTADOR}   IN RANGE  0   5
        Log To Console    Minha posição agora é: ${CONTADOR}
        Log   Minha posição agora é: ${CONTADOR}
    END