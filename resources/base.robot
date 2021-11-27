**** Settings ****
Library                                SeleniumLibrary
Library                                ScreenCapLibrary

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
  Maximize Browser Window
  Start Video Recording

Fechar navegador
  Capture Page Screenshot
  Stop Video Recording
  Close Browser
  

#passo a passo
Acessar a página home do site
  Title Should Be                     To-Do React App
  Page Should Contain Link            xpath=//a[contains(.,"My Todos")]
  Element Text Should Be              xpath=//caption        Lista de Tarefas
  Sleep                               1

Clicar no botão de mais
  Wait Until Element is Visible       css=span > svg
  Click Element                       xpath=//span[@class="uk-icon"]
  Set Selenium Speed                  0.5
  Sleep                               1

Digitar "${NewTask}" na caixa "${PlaceholderTask}"
  Input Text                          //input[@placeholder="${PlaceholderTask}"]       ${NewTask}
  Set Selenium Speed                  0.5

Clicar no botão "${SaveBTN}"
  Click Element                       //button[contains(.,"${SaveBTN}")]
  Sleep                               1

Verificar se a nova tarefa está visível
  Wait Until Element is Visible       //td[contains(.,"${Task}")]
  Table Row Should Contain            xpath=//table[@class="uk-table"]                  2                             ${Task}
  ${target}=                          Get WebElement                                    //td[contains(.,"${Task}")]
  Log To Console                      ${target.text} 
  Log                                 ${target.text} 
  Should Contain                      ${target.text}                                    ${Task}
  Sleep                               1

Verificar se a mensagem de erro "${MsgError}" aparece
  Wait Until Element is Visible       ${InvalidTask}   
  Element Text Should Be              ${InvalidTask}                  ${MsgError}
  Set Selenium Speed                  1

Criar uma tarefa
  FOR    ${COUNT}    IN RANGE    1    2
      Wait Until Element is Visible      css=span > svg
      Click Element                      xpath=//span[@class="uk-icon"]
      Set Selenium Speed                  0.5
      Input Text                         //input[@placeholder="${Placeholder}"]       ${Task}
      Set Selenium Speed                  0.5
      Click Element                      //button[contains(.,"${Save}")]
      Set Selenium Speed                  0.5
      Run Keyword If    ${COUNT} == 2    Log To Console     01 Task criada
      Run Keyword If    ${COUNT} == 2    Log                01 Task criada
    END

Criar várias tarefas
    FOR    ${COUNT}    IN RANGE    1     6
      Wait Until Element is Visible      css=span > svg
      Click Element                      xpath=//span[@class="uk-icon"]
      Set Selenium Speed                  0.5
      Input Text                         //input[@placeholder="${Placeholder}"]       ${Task}
      Set Selenium Speed                  0.5
      Click Element                      //button[contains(.,"${Save}")]
      Set Selenium Speed                  0.5
      Run Keyword If    ${COUNT} == 5    Log To Console     05 Tasks criadas
      Run Keyword If    ${COUNT} == 5    Log                05 Tasks criadas
    END

Remover tarefa criada
  Select Checkbox                     xpath=//input[1][@type="checkbox"]
  Set Selenium Speed                  0.5
  Checkbox Should Be Selected         xpath=//input[1][@type="checkbox"]
  Click Element                       css=button > svg
  Set Selenium Speed                  0.5
  Sleep                               1

Remover todas tarefas criadas
  FOR    ${COUNT1}    IN RANGE    2     7
    Select Checkbox   css=tr:nth-child(${COUNT1}) > td:nth-child(1) > label > input
    Set Selenium Speed                  0.5
  END

  FOR    ${COUNT2}    IN RANGE    1     6
    Click Element     xpath=//tr[2]/td[3]
    Set Selenium Speed                 0.5
  END