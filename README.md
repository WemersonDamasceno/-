# TIC TAC TOE
<img width="150" src="https://github.com/WemersonDamasceno/tic-tac-toe/assets/37156004/48cc2b4c-5211-4b8d-981d-7144df0b23d6"/>



# Arquitetura 🚀

## Arquitetura MVVM
A arquitetura MVVM (Model-View-ViewModel) se destaca como um padrão de design de software amplamente utilizado, particularmente no desenvolvimento de aplicativos. Sua popularidade reside na capacidade de promover a separação de responsabilidades, resultando em aplicações mais robustas, testáveis ​​e fáceis de manter. Para aprofundar sua compreensão, vamos dissecar os componentes principais da MVVM e explorar seus benefícios:

### Model (Modelo):

O Model representa a essência dos dados da sua aplicação. Ele encapsula os objetos de domínio que armazenam e gerenciam os dados da sua aplicação. O Model é independente da interface do usuário e da lógica de apresentação, garantindo que os dados permaneçam consistentes e livres de dependências de visualização.

### View (Visão):

A View assume o papel de interface do usuário, responsável pela apresentação visual dos dados do Model. Ela utiliza elementos de interface gráfica para exibir informações e interagir com o usuário. A View não possui lógica de negócios e se concentra exclusivamente na apresentação dos dados.

### ViewModel (Modelo de Visão):

O ViewModel atua como elo crucial entre o Model e a View. Ele expõe propriedades e comandos observáveis ​​que a View pode se vincular e atualizar. O ViewModel manipula os dados do Model, formata-os para a View e lida com os eventos da interface do usuário, atualizando o Model de acordo.

# O que esta incluso no projeto? 📦


✅&nbsp; [Bloc][bloc_link] - Bloc architecture para código escalável e testável que oferece uma separação clara entre lógica de negócios e apresentação

✅&nbsp; [Testing][testing_link] - Testes Unitários e Widgets

✅&nbsp; [Continuous Integration][github_actions_link] - Lint, format, test, e aplicação de code coverage usando [GitHub Actions][github_actions_link]



[architecture_link]: https://raw.githubusercontent.com/ResoCoder/flutter-tdd-clean-architecture-course/master/architecture-proposal.png
[bloc_link]: https://bloclibrary.dev
[github_actions_link]: https://github.com/features/actions
[testing_link]: https://flutter.dev/docs/testing

 
# Telas implementadas
 
https://github.com/WemersonDamasceno/tic-tac-toe/assets/37156004/fb27563a-de57-416c-bb8b-cecb34266afe




# Como usar 
Antes de tudo, configure o ambiente Flutter da sua maquina, veja mais em https://flutter.dev/docs/get-started/install

- Faça o clone do repositório:
$ git clone https://github.com/WemersonDamasceno/tic-tac-toe

- Entre na pasta:
$ cd tic-tac-toe

- Instale as dependencias:
$ flutter pub get

- Execute o App com o comando: 
$ flutter run


O app pode ser baixado aqui: <a href="https://drive.google.com/file/d/1ZMeDHhdDrAcg66CNDtRjxEZnchV_LDNC/view?usp=sharing">Download aqui!</a>

Made with :heart: and Flutter 3.19.5 e Dart 3.3.3.
