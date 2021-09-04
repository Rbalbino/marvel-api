*Settings
Documentation    Suite de Teste de busca de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot           
Library     ${EXECDIR}/resources/factories/Xmen.py

Suite Setup    Super Setup    rafael@msn.com

*Test Cases*

Deve buscar um personagem pelo ID

    ${personagem}    Factory Logan
    ${logan}         POST New Character    ${personagem}
    ${logan_id}      Set Variable          ${logan.json()}[_id]

    ${response}    Get Character By Id    ${logan_id}

    Status Should Be    200    ${response}

    Should Be Equal     ${logan.json()}[name]      ${personagem}[name]
    Should Be Equal     ${logan.json()}[aliases]   ${personagem}[aliases]
    Should Be Equal     ${logan.json()}[age]       ${personagem}[age]
    Should Be Equal     ${logan.json()}[team]      ${personagem}[team]
    Should Be Equal     ${logan.json()}[active]    ${personagem}[active]

Não deve retornar personagem pelo ID

    #${personagem_id}        Set Variable        6132b33f6af31f00169d3b50
    ${personagem_id}       Get Unique Id

    ${response}     Get Character By Id   ${personagem_id}

    Status Should Be    404    ${response}