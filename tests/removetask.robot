**** Settings ****
Resource                  ../resources/base.robot
Test Setup                             Abrir navegador
Test Teardown                          Fechar navegador

**** Variables ****


**** Test Case ****

Remover uma tarefa
  
  Acessar a página home do site
  Criar uma tarefa
  Remover tarefa criada

Remover várias tarefas
  Acessar a página home do site
  Criar várias tarefas
  Remover todas tarefas criadas
