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
2. Agora vamos instalar a extensão `OCaml Platform` da [OCaml Labs](https://ocamllabs.io/)



3. Vamos reiniciar nosso VS Code.

