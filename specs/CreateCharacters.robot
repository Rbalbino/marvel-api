*Settings
Documentation   Suite de Teste do cadastro de personagens na API da Marvel

Library     RequestsLibrary

Library     ${EXECDIR}/resources/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem

    Set Client Key      rafael@hotmail.com

    &{personagem}       Factory Thanos

    ${response}         Post
     ...                http://marvel.qaninja.academy/characters
     ...                json=${personagem}
     ...                headers=${headers}

     Status Should Be            200        ${response}

*Keywords*
Set Client Key
    [Arguments]         ${email}

    &{usuario}          Create Dictionary        email=${email}

    ${response}         Post
    ...                 http://marvel.qaninja.academy/accounts
    ...                 json=${usuario}

    ${client_key}       Set Variable            ${response.json()}[client_key]   
    &{HEADERS}          Create Dictionary       client_key=${client_key}

    Set Suite Variable      ${HEADERS}