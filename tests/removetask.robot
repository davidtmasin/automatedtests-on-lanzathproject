**** Settings ****
Resource                  ../resources/base.robot
Test Setup                             Abrir navegador
Test Teardown                          Fechar navegador

**** Variables ****


**** Test Case ****

Remover uma tarefa
  [tags]    test4 
  Acessar a página home do site
  Criar uma tarefa
  Remover tarefa criada

Remover várias tarefas
  [tags]    test5
  Acessar a página home do site
  Criar várias tarefas
  Remover todas tarefas criadas
