# App 8

## Descrição

O **App 8** é um aplicativo Flutter que permite aos usuários se registrarem, fazerem login e visualizarem feedbacks. O aplicativo utiliza Firebase para autenticação e armazenamento de dados. A interface do usuário é simples e intuitiva, com suporte para navegação entre diferentes páginas, incluindo login, registro, feed de feedbacks, detalhes do usuário e uma página inicial.

## Funcionalidades

- **Registro de Usuário**: Permite que novos usuários se registrem com nome, email, telefone e senha.
- **Login de Usuário**: Permite que usuários registrados façam login com email e senha.
- **Feed de Feedbacks**: Exibe uma lista de feedbacks enviados pelos usuários.
- **Detalhes do Usuário**: Exibe detalhes de um usuário específico.
- **Página Inicial**: Exibe uma lista de usuários registrados.

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento de aplicativos móveis.
- **Firebase**: Plataforma para desenvolvimento de aplicativos móveis e web.
  - **Firebase Authentication**: Para autenticação de usuários.
  - **Cloud Firestore**: Para armazenamento de dados em tempo real.

## Estrutura do Projeto

- **main.dart**: Arquivo principal que inicializa o aplicativo e configura as rotas.
- **views/**: Contém as diferentes páginas do aplicativo (Login, Registro, Feed, Detalhes, Home).
- **components/**: Contém componentes reutilizáveis, como botões e campos de entrada.
- **services/**: Contém serviços para autenticação e interação com o Firestore.
- **utils/**: Contém utilitários, como funções para exibir mensagens.

## Como Executar

1. **Clone o repositório**:
    ```sh
    git clone https://github.com/seu-usuario/nome-do-repositorio.git
    cd nome-do-repositorio
    ```

2. **Instale as dependências**:
    ```sh
    flutter pub get
    ```

3. **Configure o Firebase**:
    - Siga as instruções no [Firebase Console](https://console.firebase.google.com/) para configurar o Firebase para o seu projeto Flutter.
    - Baixe o arquivo `google-services.json` e coloque-o no diretório `android/app`.
    - Baixe o arquivo `GoogleService-Info.plist` e coloque-o no diretório `ios/Runner`.

4. **Execute o aplicativo**:
    ```sh
    flutter run
    ```

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request.

## Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
