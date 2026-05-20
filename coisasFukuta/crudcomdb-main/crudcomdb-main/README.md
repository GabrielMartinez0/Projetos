# 🚀 Projeto C# Blazor - Engenharia de Software III

![.NET](https://img.shields.io/badge/.NET-8.0-512BD4?style=flat&logo=dotnet)
![Blazor](https://img.shields.io/badge/Blazor-Web-512BD4?style=flat&logo=blazor)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Data-336791?style=flat&logo=postgresql)

Este repositório contém o projeto de software desenvolvido para a disciplina de **Engenharia de Software III - Programação Orientada a Objetos**, ministrada pelo **Prof. Alessandro Fukuta** na **Fatec Franca**.

O projeto foca na construção de uma aplicação moderna, utilizando arquitetura monolítica e padrões de desenvolvimento corporativos.

---

## 🛠️ Tecnologias e Ferramentas

*   **Frontend & Backend:** [ASP.NET Core Blazor](https://dotnet.microsoft.com/en-us/apps/aspnet/web-apps/blazor)
*   **Linguagem:** C# (.NET 9)
*   **Banco de Dados:** PostgreSQL
*   **Mapeamento Objeto-Relacional (ORM):** Entity Framework Core
*   **Injeção de Dependência:** Container nativo do .NET

---

## 🏗️ Arquitetura e Padrões

O projeto foi desenhado seguindo as boas práticas da **Programação Orientada a Objetos**, com foco nos seguintes pilares:

### 1. Monolito Modular
A aplicação é estruturada como um sistema único, facilitando a gestão do ciclo de vida de desenvolvimento para fins educacionais, sem abrir mão da separação de responsabilidades (UI, Business Logic e Data Access).

### 2. Injeção de Dependência (DI)
Utilizada para promover o baixo acoplamento entre os componentes. Todos os serviços e repositórios são registrados e resolvidos via DI, facilitando a manutenção e a testabilidade do software.

### 3. Persistência de Dados
Implementação robusta utilizando **PostgreSQL** com o **Entity Framework Core**, aplicando conceitos de *Migrations* para versionamento do esquema do banco de dados.

---

## 📋 Pré-requisitos

Para executar este projeto em sua máquina local, você precisará de:

*   [.NET SDK 9.0](https://dotnet.microsoft.com/download) ou superior.
*   [PostgreSQL](https://www.postgresql.org/download/) instalado e rodando.
*   IDE recomendada: [Visual Studio 2022](https://visualstudio.microsoft.com/) ou [VS Code](https://code.visualstudio.com/).

---

## 🚀 Como Executar o Projeto

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/seu-usuario/nome-do-projeto.git](https://github.com/seu-usuario/nome-do-projeto.git)
    ```

2.  **Configuração do Banco de Dados:**
    Localize o arquivo `appsettings.json` e ajuste a sua *Connection String*:
    ```json
    "ConnectionStrings": {
      "DefaultConnection": "Host=localhost;Database=fatec_projeto;Username=seu_usuario;Password=sua_senha"
    }
    ```

3.  **Atualize o Banco de Dados (Migrations):**
    No terminal da pasta do projeto, execute:
    ```bash
    dotnet ef database update
    ```

4.  **Rode a Aplicação:**
    ```bash
    dotnet watch
    ```

---

## Links de vídeos relacionados

* [Componentes] (https://youtu.be/wAJAeqt8eSI).
* [InputSelect] (https://youtu.be/wyeTJ6_Rzg8).
* [Mascaras]    (https://youtu.be/kZxMfeyseTQ).

---

---

## 👨‍🏫 Informações Acadêmicas

*   **Instituição:** Faculdade de Tecnologia de Franca (Fatec Franca)
*   **Curso:** Análise e Desenvolvimento de Sistemas
*   **Disciplina:** Engenharia de Software III - POO
*   **Professor:** Prof. Alessandro Fukuta

---

## 📄 Licença

Este projeto é de caráter acadêmico e educativo.