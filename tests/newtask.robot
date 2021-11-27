**** Settings ****
Resource                  ../resources/base.robot
Test Setup                             Abrir navegador
Test Teardown                          Fechar navegador

**** Variables ****


**** Test Case ****

Criar uma nova tarefa
  [tags]  test2
  Acessar a página home do site
  Clicar no botão de mais
  Digitar "Estudar automatização de testes" na caixa "Nova tarefa..."
  Clicar no botão "Salvar"
  Verificar se a nova tarefa está visível

Criar uma nova tarefa sem informar o nome da tarefa
  [tags]  test3
  Acessar a página home do site
  Clicar no botão de mais
  Clicar no botão "Salvar"
  Verificar se a mensagem de erro "Tarefa inválida" aparece