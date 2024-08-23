# DigioApp

[![Swift Version](https://img.shields.io/badge/Swift-5.5-orange.svg)](https://swift.org) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Sobre o Projeto

O **DigioApp** é um aplicativo de teste para o desafio da Digio, foi desenvolvido em Swift para exibir uma interface de usuário moderna, consumir APIs e aplicar conceitos de arquitetura limpa, como MVVM e uso de Coordinators para gerenciar a navegação. O projeto inclui testes unitários abrangentes e utiliza boas práticas de desenvolvimento para garantir código escalável e de fácil manutenção. 

## Features

- Exibição de uma lista de produtos com detalhes.
- Funcionalidade de recarga de produtos como (Uber, Xbox, etc.) integrada.
- Seção de destaques com banners.
- Gerenciamento de navegação através de Coordinators.
- Tratamento de erros com alertas personalizados e componentizados.
- Testes unitários completos utilizando XCTest.

## Estrutura do Projeto

O projeto segue a arquitetura MVVM (Model-View-ViewModel), facilitando a separação de responsabilidades e tornando o código mais testável e modular. A navegação é gerenciada por uma estrutura de **Coordinators**.

- **Model:** Contém as estruturas de dados que representam os objetos principais do aplicativo.
- **View:** Compreende as interfaces de usuário, como ViewControllers, UICollectionViews, etc.
- **ViewModel:** Contém a lógica de apresentação e transforma dados da Model para a View.
- **Coordinator:** Gerencia o fluxo de navegação entre diferentes telas.

## Pré-requisitos

- **Xcode 13** ou superior
- **Swift 4.2** ou superior
- **iOS 12** ou superior

## Instalação

1. Clone o repositório:
   \`\`\`sh
   git clone https://github.com/devmmarques/DigioApp.git
   \`\`\`
2. Abra o projeto no Xcode:
   \`\`\`sh
   cd DigioApp
   open DigioApp.xcodeproj
   \`\`\`
3. Construa e execute o aplicativo:
   - Selecione o target `DigioApp`.
   - Pressione `Cmd + R` para rodar no simulador.

## Como Usar

1. Ao abrir o aplicativo, você verá uma lista de produtos e banners em destaque.
2. Toque em qualquer item para ver mais detalhes.
3. Na tela de detalhes de Recarga e Produtos, é possível clicar no botão para realizar uma recarga.


## Testes

O projeto inclui testes unitários abrangentes, focados na ViewModel e nos Coordinators:

- Para rodar os testes:
  \`\`\`sh
  Cmd + U
  \`\`\`
- Verifique a cobertura de testes no relatório de testes do Xcode.

## Licença

Distribuído sob a licença MIT. Veja `LICENSE` para mais informações.

## Contato

Marco Marques - [developer.mmarques@gmail.com](mailto:developer.mmarques@gmail.com)

Link do Projeto: [https://github.com/devmmarques/DigioApp](https://github.com/devmmarques/DigioApp)
