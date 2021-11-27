**** Settings ****
Library                                SeleniumLibrary


**** Variables ****
${URL}                                 https://react-todo-lanzath.vercel.app/
${BROWSER}                             chrome
${Task}                                Estudar automatização de testes
${InvalidTask}                         xpath=//small/strong[contains(.,"Tarefa inválida")]
${Placeholder}                         Nova tarefa...
${Save}                                Salvar

**** Keywords ****
Abrir navegador
  Open Browser        ${URL}           ${BROWSER} 

Fechar navegador
  Capture Page Screenshot
  Close Browser

#passo a passo
Acessar a página home do site
  Title Should Be                     To-Do React App
  Page Should Contain Link            xpath=//a[contains(.,"My Todos")]
  Element Text Should Be              xpath=//caption        Lista de Tarefas
  Sleep                               2

Clicar no botão de mais
  Wait Until Element is Visible       css=span > svg
  Click Element                       xpath=//span[@class="uk-icon"]
  Sleep                               2

Digitar "${NewTask}" na caixa "${PlaceholderTask}"
  Input Text                          //input[@placeholder="${PlaceholderTask}"]       ${NewTask}
  Sleep                               2

Clicar no botão "${SaveBTN}"
  Click Element                       //button[contains(.,"${SaveBTN}")]

Verificar se a nova tarefa está visível
  Wait Until Element is Visible       //td[contains(.,"${Task}")]
  Table Row Should Contain            xpath=//table[@class="uk-table"]                  2                             ${Task}
  ${target}=                          Get WebElement                                    //td[contains(.,"${Task}")]
  Log To Console                      ${target.text} 
  Log                                 ${target.text} 
  Should Contain                      ${target.text}                                    ${Task}
  Sleep                               2

Verificar se a mensagem de erro "${MsgError}" aparece
  Wait Until Element is Visible       ${InvalidTask}   
  Element Text Should Be              ${InvalidTask}                  ${MsgError}

Criar uma tarefa
  FOR    ${COUNT}    IN RANGE    1    2
      Wait Until Element is Visible      css=span > svg
      Click Element                      xpath=//span[@class="uk-icon"]
      Input Text                         //input[@placeholder="${Placeholder}"]       ${Task}
      Click Element                      //button[contains(.,"${Save}")]
      Run Keyword If    ${COUNT} == 2    Log To Console     01 Task criada
      Run Keyword If    ${COUNT} == 2    Log                01 Task criada
    END

Criar várias tarefas
    FOR    ${COUNT}    IN RANGE    1     6
      Wait Until Element is Visible      css=span > svg
      Click Element                      xpath=//span[@class="uk-icon"]
      Input Text                         //input[@placeholder="${Placeholder}"]       ${Task}
      Click Element                      //button[contains(.,"${Save}")]
      Run Keyword If    ${COUNT} == 5    Log To Console     05 Tasks criadas
      Run Keyword If    ${COUNT} == 5    Log                05 Tasks criadas
    END

Remover tarefa criada
  Select Checkbox                     xpath=//input[1][@type="checkbox"]
  Checkbox Should Be Selected         xpath=//input[1][@type="checkbox"]
  Click Element                       css=button > svg
  Sleep                               5

Remover todas tarefas criadas
  FOR    ${COUNT1}    IN RANGE    2     7
    Select Checkbox   css=tr:nth-child(${COUNT1}) > td:nth-child(1) > label > input
  END

  FOR    ${COUNT2}    IN RANGE    1     6
    Click Element     xpath=//tr[2]/td[3]
  END