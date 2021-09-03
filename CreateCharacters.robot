*Settings
Documentation   Suite de Teste do cadastro de personagens na API da Marvel

Library     RequestsLibrary

*Test Cases*
Deve cadastrar um personagem

    &{usuario}          Create Dictionary       email=rafael@hotmail.com

    ${response}         Post
    ...                 http://marvel.qaninja.academy/accounts
    ...                 json=${usuario}

    ${client_key}       Set Variable            ${response.json()}[client_key]   
    &{headers}          Create Dictionary       client_key=${client_key}

    &{personagem}       Create Dictionary
    ..                  name=Thanos de Titã
    ...                 aliases=Thanos
    ...                 age=3000
    ...                 team=Ordem Negra
    ...                 active=False      


     Post
     ...                http://marvel.qaninja.academy/characters
     ...                json=${personagem}
     ...                headers=${headers}