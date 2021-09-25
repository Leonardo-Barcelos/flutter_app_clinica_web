# Projeto Clínica

Um projeto flutter web para teste de conhecimentos adquiridos.

![GitHub last commit](https://img.shields.io/github/last-commit/Leonardo-Barcelos/flutter_app_clinica_web?style=flat-square)

## Introdução

Projeto sendo desenvolvido utilizando o framework **[Flutter](https://flutter.dev/)** em sua versão web, onde utilizarei como backend o **[Firebase](https://firebase.google.com/?hl=pt-br)**. Com o intuito de simular um software que seja possível a elaboração desde a criação da ficha do paciente, cadastramento de consulta e a visualização por parte da atendente e o médico de sua agenda.
Objetivo do projeto é a criação onde esteja presente as seguintes características:
- Login via email / cadastro via email (por parte dos atendentes e médicos).
- Telas distintas para os tipos de usuários(atendentes e médicos).
- **[CRUD](https://developer.mozilla.org/pt-BR/docs/Glossary/CRUD)** de pacientes.
- **[CRUD](https://developer.mozilla.org/pt-BR/docs/Glossary/CRUD)** de consultas (Onde será possível a visualização da agenda do médico em um calendário da qual a atendente selecionará em um dia e horário que desejar a criação da consulta).
- Dentro de cada consulta o médico terá acesso ao perfil do paciente onde poderá fazer anotações sobre o paciente, que apenas ele terá acesso.
- Possíveis novas funcionalidades em breve...


### Status do projeto
- Criação do projeto no Github : <span style="color:green"><strong> Ok</strong></span>
- Criação das estruturas de pastas do projeto:<span style="color:orange"><strong>Ok</strong></span>
- Integração com firebase:<span style="color:orange"><strong>OK</strong></span>
- Sistema de login e cadastro de usuário com o firebase:<span style="color:orange"><strong>OK</strong></span>
- Sistema de diferenciação de telas para cada tipo de usuário:<span style="color:blue"><strong>OK</strong></span>
    - Tela da atendente:<span style="color:blue"><strong>OK</strong></span>
    - Tela do médico:<span style="color:blue"><strong>OK</strong></span>

- CRUD de pacientes:<span style="color:blue">Em andamento...</span>
    - Cadastro:<span style="color:blue">Em andamento...</span>
    - Cadastro com imagem:<span style="color:blue"><strong></strong></span>
    - Trazer dados do usuário:<span style="color:blue"><strong>Em andamento...</strong></span>
    - Trazer a imagem do usuário:<span style="color:blue"><strong>Em andamento...</strong></span>
    - Atualizar dados do usuário:<span style="color:blue"><strong>Em andamento...</strong></span>
    - Atualizar a imagem do usuário:<span style="color:blue"><strong></strong></span>
    - Exclusão do usuário:<span style="color:blue"><strong></strong>Em andamento...</span>
    - Exclusão da imagem do usuário:<span style="color:blue"><strong>Em andamento...</strong></span>

- CRUD de consultas:<span style="color:blue"><strong>Em andamento...</strong></span>
    - Cadastro:<span style="color:blue"><strong>Em andamento...</strong></span>
    - Cadastro utilizando o calendário:<span style="color:blue"><strong>Em andamento...</strong></span>
    - Leitura dos dados:<span style="color:blue"><strong>Em andamento...</strong></span>
    - Leitura dos dados com o calendário:<span style="color:blue">Em andamento...</span>
    - Atualização dos dados:<span style="color:blue"><strong></strong></span>
    - Atualização dos dados com o calendário:<span style="color:blue"><strong></strong></span>
    - Exclusão dos dados:<span style="color:blue"><strong></strong></span>
    - Exclusão dos dados com o calendário:<span style="color:blue"><strong></strong></span>

- Utilização do calendário:<span style="color:blue"><strong>Em andamento...</strong></span>
- CRUD de anotações do médico por paciente:<span style="color:blue"><strong></strong></span>
    - Cadastro:<span style="color:blue"><strong></strong></span>
    - Leitura dos dados:<span style="color:blue"><strong></strong></span>
    - Atualização dos dados:<span style="color:blue"><strong></strong></span>
    - Exclusão dos dados:<span style="color:blue"><strong></strong></span>

 ### Imagens do projeto
    (Imagens e cores  apenas para fins de demostração, não representam o projeto final!!!)
 ## Tela de login e cadastro
![loginCadastro](https://user-images.githubusercontent.com/56855137/134779030-ec44b3b0-484f-4a5f-b112-d73d6f0788a5.gif)
 ## Tela inicial versão web
 ![image](https://user-images.githubusercontent.com/56855137/134779624-cdfb22e3-cc24-4930-9a07-e58ca77d4950.png)
## Tela de pacientes
![image](https://user-images.githubusercontent.com/56855137/134779474-a7f08220-fd98-461a-afc5-8099315be5f5.png)
## Formulário para cadastro de pacientes
![image](https://user-images.githubusercontent.com/56855137/134779503-189d6c06-d398-4f6f-aaf9-44d828f257a3.png)

## Exemplo de como ficará tela de agenda
![image](https://user-images.githubusercontent.com/56855137/134779556-8ed5d586-56a9-46ae-843f-a34e74f6cce5.png)
