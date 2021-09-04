*Settings
Documentation    Suite de Teste de exclusão de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot           
Library     ${EXECDIR}/resources/factories/Xmen.py

Suite Setup    Super Setup    rafael@yahoo.com

*Test Cases*

Deve remover um personagem pelo ID

    ${personagem}    Factory Ciclope
    ${ciclope}       POST New Character    ${personagem}
    ${ciclope_id}    Set Variable          ${ciclope.json()}[_id]

    ${response}   DELETE Character By Id   ${ciclope_id}

    Status Should Be    204    ${response}

    ${response2}        Get Character By Id   ${ciclope_id} 

    Status Should Be    404    ${response2}

Não deve encontrar o usuario pelo Id inexistente

    #${personagem_id}        Set Variable        6132b33f6af31f00169d3b50
    ${personagem_id}       Get Unique Id

    ${response}    DELETE Character By Id  ${personagem_id}

    Status Should Be    404    ${response}