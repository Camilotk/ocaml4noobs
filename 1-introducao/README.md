# Capítulo 1 - Introdução

## O que é OCaml?

OCaml é uma linguagem de programação multiparadigma, que tem suporte de primeira classe para os paradigmas funcional, imperativo e orientado a objetos. É uma linguagem que é descendente e traz fortes semelhanças com ML (Metalanguage) da qual herda (assim como outras linguagens descendentes de ML) ser estaticamente e fortemente tipada.

## Instalação

Certo, agora você sabe o que é OCaml, então agora vamos para a instalação da linguagem e suas ferramentas básicas para que possamos compilar e executar nossos programas.

> Importante notar que apesar existir suporte de OCaml para Windows é aconselhável que utilize o Windows Subsistem for Linux (WSL) para programar em OCaml.


1. Abra seu terminal da sua distro preferida, nesse caso vamos utilizar o package manager dnf como exemplo já que os testes foram feitos através dele, mas caso esteja no Ubuntu / Debian use o apt, caso OpenSUSE zypper, Arch / Manjaro pacman... para instalar o OCaml Package Manager (OPAM).

```terminal
$ sudo dnf install opam
```

2. Vamos então dar o comando init que vai fazer a pré-configuração das variaveis de ambiente no seu shell padrão.

```terminal
$ opam init
```
> Esse comando irá abrir um prompt perguntando se realmente queremos que as variáveis sejam adicionadas ao nosso ~/.bashrc responda `y` para confirmar

3. Vamos utilizar o comando eval para carregar as novas variáveis de ambiente.

```terminal
$ eval $(opam env)
```

4. Vamos testar a instalação e ver qual versão está instalada na máquina.

```terminal
$ ocaml -version
```

- Caso desejamos instalar outra versão de OCaml como a 4.11.1 usando o OPAM basta: `opam switch create 4.11.1` e logo após carregar o novo ambiente com `eval $(opam env)`
- Para voltarmos a versão anterior basta digitarmos o comando `opam switch default` e logo após carregar o novo ambiente com `eval $(opam env)`

5. Instale o utilitário `rlwrap` que irá nos ajudar a repetir comandos e movimentar o cursor no ambiente de Read-Print-Evaluate-Loop (REPL).

```
$ sudo dnf install rlwrap
```

6. Crie um alias para o rlwrap no seu ~/.bashrc ou ~/.zshrc

```terminal
$ echo "alias ocaml=\"rlwrap ocaml\"" >> ~/.bashrc
```

## Hello World

Assim como Dennis Ritchie e Brian Kernighan popularizaram em "The C Programming Language", o primeiro programa escrito em uma nova linguagem de programação deve ser o que imprime a mensagem "Hello World" na tela, ou um grande azar vai te perseguir enquanto você usar a linguagem te fazendo sofrer com muitos erros. Como estamos falando de Dennis e Brian que são magos da Computação, vamos evitar lidar com magias ancentrais e começar pela implementação desse programa.

Para isso vamos precisar:
- De um editor de texto minimamente descente (nada de Notepad no Windows)
- Um terminal

Vamos criar um novo script que vai se chamar hello.ml com o seguinte conteúdo:

**hello.ml**
```ocaml
Printf.printf "Hello %s!" "World"
```

Agora podemos rodar esse nosso novo programa OCaml no terminal passando o caminho desse arquivo (relativo ou absoluto) para nosso interpretador OCaml:
```terminal
$ ocaml hello.ml
```

E vamos ter nosso "Hello World!" impresso na tela. Porém, aqui podemos começar a perceber uma das coisas mais legais de OCaml, até mesmo a interpolação de dados na string usando marcadores é estaticamente checada.

O marcador `%s` espera uma string, se tentarmos passar um valor como `42` ou `true` vamos ter um erro sendo disparado.