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
  - [Resumo e Linha do Tempo](./1_introducao#resumo-e-linha-do-tempo)
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
- [Dune](https://github.com/Camilotk/ocaml4noobs/tree/master/3I%20-%20build%20)

## Parte 4 - Organização do Código
- [Função Main](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#fun%C3%A7%C3%A3o-main)
- [Módulos e Assinaturas](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#m%C3%B3dulos-e-assinaturas)
    - [Assinaturas e Interfaces](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#assinaturas-e-interfaces)
    - [Tipos Abstratos](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#tipos-abstratos)
    - [Submódulos](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#subm%C3%B3dulos)
    - [Abrindo Módulos](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#abrindo-m%C3%B3dulos)
    - [Extendendo Módulos e Assinaturas](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#abrindo-m%C3%B3dulos)
- [Erros Comuns com Módulos](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#erros-comuns-com-m%C3%B3dulos)
- [Projetando Módulos](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#projetando-m%C3%B3dulos)
    - [Raramente exponha tipos concretos](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#raramente-exponha-tipos-concretos)
    - [Projete para quem está chamando](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#projete-para-quem-est%C3%A1-chamando)
    - [Crie interfaces uniformes](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#crie-interfaces-uniformes)
    - [Interface antes da implementação](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#interface-antes-da-implementa%C3%A7%C3%A3o)
- [Functors](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#functors)
- [Módulos de primeira-classe](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#m%C3%B3dulos-de-primeira-classe)
    - [Construindo módulos de Primeira Classe](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#m%C3%B3dulos-de-primeira-classe)
    - [Acessando módulos de primeira classe](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#acessando-m%C3%B3dulos-de-primeira-classe)
    - [Você pode viver sem módulos de primeira classe](https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#voc%C3%AA-pode-viver-sem-m%C3%B3dulos-de-primeira-classe)

## Intermezzo 4 - Testes
- [Testes Unitários](https://github.com/Camilotk/ocaml4noobs/blob/master/4I%20-%20testes/README.md#testes-unit%C3%A1rios)
- [Testes Baseados em Propriedades](https://github.com/Camilotk/ocaml4noobs/blob/master/4I%20-%20testes/README.md#testes-baseados-em-propriedades)

## Parte 5 - Mais Tipos
- [Pattern Matching](https://github.com/Camilotk/ocaml4noobs/blob/master/5%20-%20tipos/README.md#pattern-matching)
- [Exception](https://github.com/Camilotk/ocaml4noobs/blob/master/5%20-%20tipos/README.md#exception)
- [Tratando erros sem exceções](https://github.com/Camilotk/ocaml4noobs/blob/master/5%20-%20tipos/README.md#exception)
- [Option](https://github.com/Camilotk/ocaml4noobs/blob/master/5%20-%20tipos/README.md#option)
- [Result](https://github.com/Camilotk/ocaml4noobs/blob/master/5%20-%20tipos/README.md#result)
- [Sequence](https://github.com/Camilotk/ocaml4noobs/blob/master/5%20-%20tipos/README.md#sequence)

## Intermezzo 5 - esy
- [esy](https://github.com/Camilotk/ocaml4noobs/tree/master/I5%20-%20dependencias)

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
