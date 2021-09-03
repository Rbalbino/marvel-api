*Settings
Documentation    Suite de Teste do cadastro de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot    
Library     ${EXECDIR}/resources/factories/Thanos.py

Suite Setup     Set Client Key  rafael@hotmail.com

*Test Cases*
Deve cadastrar um personagem

    ${personagem}    Factory Thanos
    ${response}      POST New Character    ${personagem}

    Status Should Be    200    ${response}    

Não deve Cadastrar com o mesmo nome
    [Tags]      dup

    ${personagem}         Factory Thanos
    POST New Character    ${personagem}

    ${response}    POST New Character    ${personagem}

    Status Should Be    409                          ${response}
    Should Be Equal     ${response.json()}[error]    Character already exists :(
