**** Settings ****
Resource                  ../resources/base.robot
Test Setup                             Abrir navegador
Test Teardown                          Fechar navegador

**** Variables ****


**** Test Case ****

Verificar se a página inicial é acessível
  [tags]  test1
  Acessar a página home do site
