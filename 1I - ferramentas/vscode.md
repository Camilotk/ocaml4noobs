# IDE: VS Code

O Visual Studio Code é uma editor de texto extensível através de inúmeras extensões para ter as funções de uma IDE completa. Esse editor tem ganhado muita popularidade nos últimos cinco anos e através de algumas extensões para OCaml podemos torná-lo capaz de atender todas as nossas necessidades no desenvolvimento com OCaml. Vamos começar?

## Instalação

1. O primeiro passo é instalar o VS Code em seu sistema operacional preferido, seja ele Mac, Linux ou Windows, isso pode ser feito na página de [Download](https://code.visualstudio.com/#alt-downloads) do projeto.
2. Caso deseje usar a IDE em Português Brazileiro basta seguir o passo a passo abaixo ou use o atalho CRTL+P e cole `ext install MS-CEINTL.vscode-language-pack-pt-BR`.
    1. Abra o menu de extensões.
    ![Imagem mostrando a posição do botão para abrir o menu de extensões no Visual Studio Code](https://github.com/Camilotk/ocaml4noobs/blob/intermezzo-1/1I%20-%20ferramentas/imagens/passo1.png)
    2. Procure a extensão `Portuguese (Brazil) Language Pack for Visual Studio Code` e clique em `install`.
    ![Imagem mostrando como encontrar e instalar a extensão para traduzir a IDE](https://github.com/Camilotk/ocaml4noobs/blob/intermezzo-1/1I%20-%20ferramentas/imagens/passo2.png)
    3. Após a instalação será necessário reiniciar o VS Code, apenas feche e abra novamente ou clique em `restart` na caixa de diálogo que aparece.
    ![Imagem mostrando como reiniciar a IDE após a instalação da tradução](https://github.com/Camilotk/ocaml4noobs/blob/intermezzo-1/1I%20-%20ferramentas/imagens/passo3.png)

## Extensões

Certo agora temos o Visual Studio instalado e configurado, vamos começar a instalar as extensões e ferramentas para desenvolvimento em OCaml.

1. Primeiro precisamos instalar o [Language Server Protocol (LSP)](https://docs.microsoft.com/pt-br/visualstudio/extensibility/language-server-protocol?view=vs-2019) que é importante para que nos auxilie com um autocomplete mais inteligente e na detecção de erros do nosso código usando a ferramenta OPAM que usamos para instalar e gerenciar nossas verões de OCaml.
```terminal
$ opam install ocaml-lsp-server
```
2. Agora vamos instalar a extensão `OCaml Platform` da [OCaml Labs](https://ocamllabs.io/) repetindo o passo-a-passo acima ou através do atalho CRTL+P e cole `ext install ocamllabs.ocaml-platform`.

3. Vamos reiniciar novamente nosso VS Code.

#### Pronto!
Agora é só abrir seu projeto `hello world` que criamos no último capítulo e ao editar `main.ml` deve perceber que agora dispõe de checagem de erros e autocomplete para OCaml.

## Atalhos Úteis

### Navegação

| Atalho       | Comando                                           | OBS                                                                |
|--------------|---------------------------------------------------|--------------------------------------------------------------------|
| CTRL+SHIFT+e | Abre/Oculta o menu de arquivos                    |                                                                    |
| CTRL+b       | Oculta/Abre o explorer de arquivos (menu lateral) | Pode ser necessario usar o comando acima para ter foco no explorer |
| CTRL+SHIFT+f | Abre o menu de pesquisa no projeto                |                                                                    |
| CTRL+SHIFT+g | Abre o menu do Git                                |                                                                    |
| CTRL+SHIFT+d | Abre o menu de depuraçao/debugging                |                                                                    |
| CTRL+SHIFT+x | Abre o menu de extensoes                          |                                                                    |

### Edição

| Atalho                 | Comando                                                   |
|------------------------|-----------------------------------------------------------|
| CTRL+SHIFT+(ALT)¹+DOWN | Duplica a linha atual                                     |
| CTRL+SHIFT+k           | Deleta linha atual                                        |
| CTRL+g                 | Vai para linha : n                                        |
| CTRL+ENTER             | Move o cursor para uma nova linha abaixo                  |
| CTRL+SHIFT+O           | Navega por objetos (search por nomes e assinaturas)       |
| CTRL+SHIFT+`           | Abre/Oculta o terminal integrado                          |
| CTRL+SHIFT+direçao     | Seleciona palavra por palavra ao inves de letra por letra |
| CTRL+HOME              | Vai para o inicio do arquivo                              |
| CTRL+END               | Vai para o final do arquivo                               |
(*Você pode conferir todos os atalhos usando CTRL+K CTRL+S em sequência*)