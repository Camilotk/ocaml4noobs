# IDE: Emacs
O Emacs para alguns é o melhor editor de texto extensível devido a sua poderosa linguagem de extensão EMACS Lisp e seu grande número de aplicações internas e integradas. Caso deseje se aventurar pelo mundo do Emacs recomendamos que começe através da pré-configuração Spacemacs, que automaticamente nos ajuda a confirgurar nosso ambiente de trabalho sem termos que fazer muitas configurações manuais.

## Instalação

1. Instale o Emacs através do gerenciador de dependências do seu SO UNIX preferido. Como estamos usando Fedora como exemplo:
```terminal
$ sudo dnf install emacs
``` 

2. Vá até o [site do projeto Spacemacs](https://www.spacemacs.org/#) e clicar em `Install` e logo em seguida `COPY TO CLIPBOARD`.

![Uma imagem mostrando como selecionar os botões install e copy to clipboard no site do spacemacs](https://github.com/Camilotk/ocaml4noobs/blob/intermezzo-1/1I%20-%20ferramentas/imagens/emacs1.png)

3. Vamos colar o comando que foi copiado no site no terminal.
```terminal
$ git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

4. Abra o Emacs, será aberto um prompt com algumas perguntas, use os direcionais para navegar entre as opções e enter para escolher.
    - A primeira pergunta será se prefere ter os atalhos do **vim** ou do **emacs**, selecione o de sua preferência, no meu caso **vim**. Observe que instalando os atalhos do vim, os do emacs ainda estarão disponíveis, mas se selecionar emacs os atalhos do vim não estarão disponíveis.
    - A segudna pergunta é se deseja uma instalação completa do spacemacs que se chama **spacemacs** ou uma instalação mínima que se chama **spacemacs-base**. A menos que já possua algum conhecimento prévio de como instalar e configurar o emacs recomendo a instalação completa.

> Apos selecionar as opções desejadas pode levar alguns minutos para que o spacemacs baixe e instale todas as extensões e configurações necessárias. No final da instalação terá um `Spacemacs is ready` na área de comandos.

5. Reinicie o Emacs (para sair você pode usar o comando `CTRL+x CTRL+c`).

6. Vamos editar o nosso arquivo ~/.spacemacs usando nosso editor, para isso abra o Emacs e use o comando `CTRL+c CTRL+f` e coloque o caminho para esse arquivo no seu sistema, caso ainda tenha algum outra mensagem aberta em alguma divisão da tela use `CTRL+1` para fechar todas as outras navegações abertas.

7. Vamos adicionar o elemento `ocaml` na lista de configurações que vão ser carregadas chamada `dotspacemacs-configuration-layers`, além disso podemos também habilitar mais umas coisas úteis deixando essa configuração assim:

```lisp
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     git
     helm
     lsp
     markdown
     multiple-cursors
     neotree
     ocaml
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     treemacs)
```

8. Vamos salvar com `CTRL+c CTRL+s` e confirmar que queremos salvar.
9. Vamos fechar a IDE para que as configurações sejam instaladas e configuradas.
10. Vamos instalar a ferramenta `utop` com o OPAM para que o REPL funcione no Emacs.
```terminal
$ opam install utop
```
11. Vamos reabrir nosso Emacs.
12. Ao abrir vamos usar `SPACE f t` para abrir a nossa neotree e vamos colocar nosso workspace como a pasta **raiz** do projeto a qual vamos trabalhar.
13. Vamos usar `CTRL+o` para navegar entre o explorer de arquivos/janelas abertas e os direcionais para abrir nosso arquivo `main.ml` do nosso projeto do capítulo anterior.

#### Pronto!
Agora dispomos da checagem de erros, ferramentas e autocomplete para trabalhar com OCaml no Emacs.

## Usando o REPL

Após instalar, configurar e abrir nosso arquivo `main.ml` é insteressante que você aprenda como utilizar o REPL integrado com o Emacs, para isso use `SPACE m s i` para iniciar um novo REPL.

E você pode brincar utilizando os sequintes comandos.

| Comando   | O que faz?                                                               |
|-----------|--------------------------------------------------------------------------|
| SPC m s b | Envia todo arquivo para ser interpretado de cima para baixo no REPL      |
| SPC m s p | Envia a linha que o cursor está em cima para ser interpretada no REPL    |
| SPC m s r | Envia o caracter que o cursor esta em cima para ser interpretado no REPL |
| CTRL+x o  | Muda do REPL para o Arquivo e vice-versa.                                |

> SPC = SPACE


## Comandos de Gerenciamento de Projeto no Neotree


| Key               | Action                                 | Description                                               |
|-------------------|----------------------------------------|-----------------------------------------------------------|
| C-c C-p a         | treemacs-add-project-to-workspace      | Seleciona um novo projeto para adicionar para o workspace |
| C-c C-p p         | treemacs-projectile                    | Seleciona um novo projeto do projectile para add no workspace|
| C-c C-p d         | treemacs-remove-project-from-workspace | Remove o projeto que o cursor está do workspace           |
| C-c C-p r         | treemacs-rename-project                | Renomeia o projeto que o cursor está sobre.               |
| C-c C-p c c       | treemacs-collapse-project              | Coalpsa o projeto que o cursor está sobre                 |
| C-c C-p c o/S-TAB | treemacs-collapse-all-projects         | Colapsa todos os projetos.                                |
| C-c C-p c o       | treemacs-collapse-all-projects         | Colapsa todos os outros projetos.                         |


> C = CTRL

## Indo além!

Existem muitas coisas que o Emacs pode fazer por nós e para nós, para aprender mais sobre Emacs você pode conferir diversos materiais na Web como [Emacs is sexy](https://emacs.sexy/), [Emacs rocks](http://emacsrocks.com/) ou [EmacsWiki](https://www.emacswiki.org/emacs?interface=pt).



### e que St. Ignucius abençoe a todos!
![Um defensor de pedófilos chamado Richard Stallmann extendendo sua mão para frente enquanto autíticamente veste uma aureola feita com habilidades de estudante do Ensino Fundamental](https://github.com/Camilotk/ocaml4noobs/blob/intermezzo-1/1I%20-%20ferramentas/imagens/ignucius.jpg)
