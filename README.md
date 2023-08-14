<p align="center">
  <a href="https://github.com/he4rt/4noobs" target="_blank">
    <img src="./images/header-4noobs.svg">
  </a>
</p>

<h1 align="center">
  <img src="./images/logo_ocaml_noobs.png" alt="ocaml">
</h1>

<p align="center">Tutorial de OCaml para iniciantes na Linguagem.</p>

<p align="center">
    <a href="https://github.com/Camilotk/ocaml4noobs/issues">Report Bug</a>
    ·
    <a href="https://github.com/Camilotk/ocaml4noobs/issues">Request Feature</a>
  </p>
</p>

<p align="center">
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License MIT">
  </a>
</p>

## ROADMAP

## Parte 1 - Introdução
- [O que é OCaml?](./1_introducao#o-que-é-ocaml)
- [História do OCaml](./1_introducao#hist%C3%B3ria-do-ocaml)
- [Instalação](./1_introducao#instala%C3%A7%C3%A3o)
- [Instalando o Dune](./1_introducao#instalando-o-dune)
- [Hello World](./1_introducao#hello-world)
- [Porque OCaml?](./1_introducao#porque-ocaml)
	- [Concisa e Declarativa](./1_introducao#concisa-e-declarativa)
  	- [Lingugens Concisas vs Verbosas](./1_introducao#linguagens-concisas-vs-verbosas)
	- [Menos Erros Acidentais](./1_introducao#menos-erros-acidentais)
- [Particularidades de OCaml](./1_introducao#particularidades-de-ocaml)
	- [Inferência de Tipos](./1_introducao#infer%C3%AAncia-de-tipos)
	- [Imutabilidade](./1_introducao#imutabilidade)
	- [Dados e Operações](./1_introducao#dados-e-opera%C3%A7%C3%B5es)
- [Materiais em Inglês para aprender OCaml](./1_introducao#materiais-em-ingl%C3%AAs-para-aprender-ocaml)

## Intermezzo 1 -  Ferramentas
#### Escolha a sua:
- [VS Code](./1I_ferramentas/vscode.md)
- [Emacs](./1I_ferramentas/emacs.md)
- [VIM](./1I_ferramentas/vim.md)

## Parte 2 - Funções
- [O que é uma função](./2_funcoes#o-que-é-uma-função)
    - [Definição](./2_funcoes#definição)
    - [Funções Constantes](./2_funcoes#funções-constantes)
    - [Funções Lineares](./2_funcoes#funções-lineares)
    - [Funções Quadráticas](./2_funcoes#funções-quadráticas)
    - [Funções Trigonométricas](./2_funcoes#funções-trigonométricas)
- [Aplicando Funções](./2_funcoes#aplicação-de-funções)
    - [Funções com um argumento](./2_funcoes#funções-com-um-argumento)
    - [Funções com múltiplos argumentos](./2_funcoes#funções-com-múltiplos-argumentos)
- [Tipos de função](./2_funcoes#tipos-de-função)
    - [Função de alta ordem](./2_funcoes#funções-de-alta-ordem)
- [Currying](./2_funcoes#currying)
- [Função em prefixo e em infixo](./2_funcoes#função-em-prefixo-e-em-infixo)
    - [Defininfo funções em infixo](./2_funcoes#definindo-funções-em-infixo)
- [Funções lambda](./2_funcoes#funções-lambda)
- [Recursão](./2_funcoes#recursão)
- [Canalização](./2_funcoes#piping--canalização)
- [Composição de funções](./2_funcoes#composição-de-funções)

## Intermezzo 2 -  Scripts e REPL
- [Scripts e REPL](./2I_repl)

## Parte 3 - Dados
- [Tipos Pré-definidos](./3_dados#tipos-pré-definidos)
 - [Tipos Básicos](./3_dados#tipos-básicos)
 - [Int](./3_dados#int)
 - [Float](./3_dados#float)
 - [Conversão de Tipos Numéricos](./3_dados#conversão-de-tipos-numéricos)
 - [Char](./3_dados#char)
 - [String](./3_dados#string)
	 - [Acessando caracteres em uma String](./3_dados#acessando-carateres-em-uma-string)
	 - [Módulo String](./3_dados#módulo-string)
 - [Bool](./3_dados#bool)
 	- [Operadores Booleanos](3_dados#operadores-booleanos)
- [Unit](3_dados#unit)
- [List](./3_dados#list)
	- [Combinando listas](./3_dados#combinando-listas)
- [Arrays](./3_dados#arrays)
- [Tuplas](./3_dados#tuplas)
- [Records](./3_dados#records)
	- [Valores Mutáveis](./3_dados#valores-mutáveis)
	- [Copiando e Alterando Valores](./3_dados#copiando-e-alterando-valores)
- [Discriminated Union](./3_dados#discriminated-union)
- [Pattern Matching](./3_dados#pattern-matching)
- [Igualdade Estrutural](./3_dados#igualdade-estrutural)
- [Generics](./3_dados#generics)

## Intermezzo 3 -  Sistema de Build
- [Dune](./3I_build)

## Parte 4 - Organização do Código
- [Função Main](./4_organizacao#função-main)
- [Módulos e Assinaturas](./4_organizacao#módulos-e-assinaturas)
    - [Assinaturas e Interfaces](./4_organizacao#assinaturas-e-interfaces)
    - [Tipos Abstratos](./4_organizacao#tipos-abstratos)
    - [Submódulos](./4_organizacao#submódulos)
    - [Abrindo Módulos](./4_organizacao#abrindo-módulos)
    - [Extendendo Módulos e Assinaturas](./4_organizacao#extendendo-módulos-e-assinaturas)
- [Erros Comuns com Módulos](./4_organizacao#erros-comuns-com-módulos)
- [Projetando Módulos](./4_organizacao#projetando-módulos)
    - [Raramente exponha tipos concretos](./4_organizacao#raramente-exponha-tipos-concretos)
    - [Projete para quem está chamando](./4_organizacao#projete-para-quem-está-chamando)
    - [Crie interfaces uniformes](./4_organizacao#crie-interfaces-uniformes)
    - [Interface antes da implementação](./4_organizacao#interface-antes-da-implementação)
- [Functors](./4_organizacao#functors)
- [Módulos de primeira-classe](./4_organizacao#módulos-de-primeira-classe)
    - [Construindo módulos de Primeira Classe](./4_organizacao#construindo-módulos-de-primeira-classe)
    - [Acessando módulos de primeira classe](./4_organizacao#acessando-módulos-de-primeira-classe)
    - [Você pode viver sem módulos de primeira classe](./4_organizacao#você-pode-viver-sem-módulos-de-primeira-classe)

## Intermezzo 4 - Testes
- [Testes Unitários](./4I_testes#testes-unitários)
- [Testes Baseados em Propriedades](./4I_testes#testes-baseados-em-propriedades)

## Parte 5 - Mais Tipos
- [Pattern Matching](./5_tipos#pattern-matching)
- [Exception](./5_tipos#exception)
- [Tratando erros sem exceções](./5_tipos#tratando-erros-sem-exceções)
- [Option](./5_tipos#option)
- [Result](./5_tipos#result)
- [Sequence](./5_tipos#sequence)

## Intermezzo 5 - esy
- [esy](./5I_dependencias)

## Parte 6 - CRUD
- *em breve*

## Apêndice 1 - OOP
- *em breve*

## Apêndice 2 - FFI com C
- *em breve*

<p align="center">Made with 🐫💜</p>

## Contribuidores ✨

Nosso agradecimento a todas essas pessoas ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/Camilotk"><img src="https://avatars.githubusercontent.com/u/30880723?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Camilo Cunha de Azevedo</b></sub></a><br /><a href="#content-Camilotk" title="Content">🖋</a> <a href="https://github.com/Camilotk/OCaml4Noobs/commits?author=Camilotk" title="Code">💻</a> <a href="#maintenance-Camilotk" title="Maintenance">🚧</a> <a href="#mentoring-Camilotk" title="Mentoring">🧑‍🏫</a></td>
    <td align="center"><a href="https://github.com/eduardocanellas"><img src="https://avatars.githubusercontent.com/u/34381457?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Eduardo Canellas de Oliveira</b></sub></a><br /><a href="#content-eduardocanellas" title="Content">🖋</a></td>
    <td align="center"><a href="https://vitorsalmeida.vercel.app/"><img src="https://avatars.githubusercontent.com/u/70543018?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Vitor</b></sub></a><br /><a href="#content-vit0rr" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/bihellzin"><img src="https://avatars.githubusercontent.com/u/49006461?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Gabriel</b></sub></a><br /><a href="#content-bihellzin" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/vinisioux"><img src="https://avatars.githubusercontent.com/u/36283335?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Vinicius Leonardo</b></sub></a><br /><a href="#content-vinisioux" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/nogw"><img src="https://avatars.githubusercontent.com/u/65539816?v=4?s=100" width="100px;" alt=""/><br /><sub><b>nogw</b></sub></a><br /><a href="#content-nogw" title="Content">🖋</a> <a href="https://github.com/Camilotk/OCaml4Noobs/commits?author=nogw" title="Code">💻</a></td>
    <td align="center"><a href="https://heartdevs.com/"><img src="https://avatars.githubusercontent.com/u/44484286?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Mateus Mendes </b></sub></a><br /><a href="#design-m7he4rt" title="Design">🎨</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/caiomartins1"><img src="https://avatars.githubusercontent.com/u/45666995?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Caio Martins</b></sub></a><br /><a href="https://github.com/Camilotk/OCaml4Noobs/pulls?q=is%3Apr+reviewed-by%3Acaiomartins1" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/tujmon"><img src="https://avatars.githubusercontent.com/u/61995846?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Arthur Monici</b></sub></a><br /><a href="https://github.com/Camilotk/OCaml4Noobs/pulls?q=is%3Apr+reviewed-by%3Atujmon" title="Reviewed Pull Requests">👀</a></td>
    <td align="center"><a href="https://github.com/gsbcamargo"><img src="https://avatars.githubusercontent.com/u/47952041?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Gabriel Schreiner</b></sub></a><br /><a href="https://github.com/Camilotk/OCaml4Noobs/pulls?q=is%3Apr+reviewed-by%3Agsbcamargo" title="Reviewed Pull Requests">👀</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

Esse projeto segue a especificação do [all-contributors](https://github.com/all-contributors/all-contributors). Contribuições de todos os tipos são bem-vindas!
