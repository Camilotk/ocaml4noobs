# IDE: VIM

VIM (Visual Improved) é um editor de texto por terminal que tem sido usado para programação desde os anos 70 interruptamente, entre as vantagens que o VIM traz é sua grande capacidade de extensão e customização além de ser o editor de código mais leve e rápido, com menor footprint entre as alternativas mais populares no mercado hoje. Para esse tutorial vamos utilizar o NeoVim uma versão melhorada do VIM criada pelo Brasileiro [Thiago Padilha](https://github.com/tarruda).


## Instalação

1. Instale o VIM no seu ambiente UNIX preferido.
```terminal
$ sudo dnf install -y neovim python3-neovim
```
2. Acesse o site [VIM Bootstrap](https://vim-bootstrap.com/).
    - Selecione as linguagens de programação que vai usar no VIM, entre elas OCaml. No meu caso: C, HTML, JavaScript, LISP, OCaml, Python, Scala e TypeScript.
    - Caso queira usar Svalte ou Vue selecione-os, no meu caso nenhum.
    - Escolha seu tema preferido, no meu caso o Darcula que foi criado pelo Brasileiro [Zeno Rocha](https://github.com/zenorocha).
    - Selecione Neovim.
    - Clique em `Generate` e baixe a configuração.
3. Vamos criar uma pasta de configuração para nosso **Neovim**:
```terminal
$ mkdir ~/.config/nvim
```
4. Vamos renomear o arquivo Generate.vim que baixamos para .vimrc e move-lo para nossa home:
```terminal
$ mv ~/Downloads/generate.vim ~/.config/nvim/init.vim
```
5. Vamos iniciar nosso vim com:
```terminal
$ nvim
```
6. Nessa etapa o Neovim vai instalar os plugins.

7. Após conluir você pode fechar o menu que mostra os plugins instalados pelo Vundle com `:q` e na outra janela abrir nosso arquivo `main.ml` do projeto dune que criamos no primeiro capítulo com `:e <path>`.


#### Pronto!
Você agora tem uma configuração básica do VIM para programar em OCaml.

## Navegação, Terminal e mais....
- Cuidado com os modos no VIM, para editar o arquivo é necessário entrar no modo normal com a letra `i` e para inserir comandos é necessário estar no modo normal usando a tecla `ESC`.
- Após abrir o arquivo você pode abrir o menu de navegação com a tecla `F2` e esconder com a tecla `F3`.
- Para abrir um terminal integrado basta abrir uma divisão de tela com `:vs terminal` ou `:hs terminal` dependendo de como você prefere a divisão de tela e usar o comando `:terminal` e mudar para o modo normal para começar a usar.
> Obs: O terminal do VIM tem um modo próprio, para sair do terminal mode é só usar `CTRL+\ CTRL+n`.
- Além disso temos uma Powerline instalada, configurada e habilitada por padrão.

## Comandos básicos

| Atalho / Comando | O que faz?                                                                       |
|------------------|----------------------------------------------------------------------------------|
| h j k l          | Move o cursor                                                                    |
| y y              | Copia a linha                                                                    |
| p                | Cola a linha abaixo                                                              |
| d d              | Apaga a linha                                                                    |
| gg               | Vai para o começo do arquivo                                                     |
| G                | Vai para o final do arquivo                                                      |
| 50G              | vai para a linha 50                                                              |
| :s/busca/g       | Busca todas as ocorrencias de "busca". n vai para a proxima e b para a anterior. |
| o                | Insere uma linha em branco abaixo                                                |

## Indo além!
O Neovim não tem absolutamente nada de diferente em questão de usabilidade, comandos ou funcionalidades básicas do VIM, as diferenças entre o Neovim e o VIM são de lincença, modelo de desenvolvimento, linguagens de extensão e outras coisas que pragmaticamente não fazem diferença para quem vai usar como ferramenta de programação e a boa notícia é: existe um 4noobs inteiramente dedicado ao VIM, acessa aí [vim4noobs](https://github.com/luanmateuz/vim4noobs) e começe a aprender VIM.
