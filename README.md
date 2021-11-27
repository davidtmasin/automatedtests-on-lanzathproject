# Teste Automatizado c/ Robot Framework -> react-typescript-todo-project

## Projeto de teste automatizado para validar o projeto **react-typescript-todo-project** de autoria do usuário do GitHub **[lanzath](https://github.com/lanzath)**.

### Testes realizados:

- Testar se a página inicial está acessível
- Testar a criação de uma tarefa
- Testar a criação de uma tarefa sem informar o nome da tarefa
- Testar a criação de uma tarefa e depois excluí-la
- Testar a criação de várias tarefas e depois excluí-las

### Link direto para o repositório do projeto usado como base para os testes automatizados:

**[react-typescript-todo-project](https://github.com/lanzath/react-typescript-todo-project)**

### Link direto para do projeto online (Deploy realizado no Vercel):

**[react-typescript-todo-project](https://react-todo-git-main-lanzath.vercel.app/~)**

### Informações adicionais

1. Biblioteca ScreenCapLibrary que possibilita gravar os testes foi instalada

- `pip install --upgrade robotframework-screencaplibrary`

2. Importada a biblioteca ScreenCapLibrary no arquivo **base.robot**

- `Library ScreenCapLibrary`

3. Adicionar a Keyword que inicia a gravação no Setup (**gravação em vídeo .webm**)

- `Start Video Recording`

4. Adicionar a Keyword que encerra a gravação no Teardown

- `Stop Video Recording`

5. Adicionar a Keyword que inicia a gravação no Setup (**gravação em .gif**)

- `Start Gif Recording`

6. Adicionar a Keyword que encerra a gravação no Teardown

- `Stop Gif Recording`

7. Ajuste na velocidade de execução das Keywords da SeleniumLibrary

- `Set Selenium Speed (valor em segundos)`
