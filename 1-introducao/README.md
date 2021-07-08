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

## Instalando o Dune

Agora também vamos instalar a ferramenta Dune que é um `build system` para projetos OCaml/Reason. Ele tem como foco em cuidar dos detalhes low-level da compilação de OCaml para nós, desde que façamos a configuração do projeto adequadamente ele irá cuidar do resto para nós. 

- Para fazer isso vamos instalar o Dune globalmente em `user level` usando OPAM que instalamos previamente.
```terminal
$ opam install dune
```

E agora vamos para nosso primeiro exemplo.


## Hello World

Assim como Dennis Ritchie e Brian Kernighan popularizaram em "The C Programming Language", o primeiro programa escrito em uma nova linguagem de programação deve ser o que imprime a mensagem "Hello World" na tela, ou um grande azar vai te perseguir enquanto você usar a linguagem te fazendo sofrer com muitos erros. Como estamos falando de Dennis e Brian que são magos da Computação, vamos evitar lidar com magias ancentrais e começar pela implementação desse programa.

Para isso vamos precisar:
- De um editor de texto minimamente descente (nada de Notepad no Windows)
- Um terminal

Vamos começar criando nosso projeto, para isso vamos criar uma nova pasta com o nome do projeto e entrar nela:
```terminal
$ mkdir helloworld && cd $_
```
> $_ no UNIX significa chamar o parâmetro do último comando. Nesse caso `helloworld`.

Vamos inicializar o projeto, passando como argumento `exe` indicando que queremos criar um executável de nome `helloworld` para comando `dune init`:

```terminal
$ dune init exe helloworld
``` 

Isso vai nos gerar alguns arquivos que estão representados na árvore abaixo:
```
.
├── _build
│   └── log
├── dune
└── helloworld.ml
```
E que respectivamente são:
- **_build**: A pasta que contêm os arquivos de compilação de OCaml.
  - **log**: Que contêm o histórico de ações executadas na build.
- **dune**: Que é o nosso arquivo de build, onde vamos definir as nossas configurações de compilação e execução.
- **helloworld.ml**: O arquivo onde vamos escrever nosso código OCaml.

Se abrirmos nosso arquivo `helloworld.ml` temos o seguinte código que já foi criado para nós no init:
```ocaml
let () = print_endline "Hello, World!"
```

Agora vamos fazer a `build` que irá compilar esse arquivo usando o comando:
```terminal
$ dune build
```

E executar rodando:
```terminal
$ dune exec ./helloworld.exe
```
> Mesmo em ambientes UNIX os arquivos executáveis gerados pelo OCaml tem a extensão .exe

E devemos ter uma mensagem `Hello World!` na tela.

Agora vamos alterar nosso script para imprimir texto formatado.
```ocaml
let () = Printf.printf "Hello, %s!" "World"
```

Vamos recompilar o nosso projeto usando dune:

```terminal
$ dune build
```

 Note que provavelmente dessa vez a compilação aconteceu mais repidamente que da primeira vez mesmo sendo um projeto pequeno, isso acontece porque o compilador de OCaml é inteligente o suficiente para compilar apenas o que é necessário.

E vamos rodar novamente nosso projeto:

```terminal
$ dune exec ./helloworld.exe
```

E vamos ter nosso "Hello World!" impresso na tela. Porém, aqui podemos começar a perceber uma das coisas mais legais de OCaml, até mesmo a interpolação de dados na string usando marcadores é estaticamente checada.

O marcador `%s` espera uma string, se tentarmos passar um valor como `42` ou `true` vamos ter um erro sendo disparado que pode ser visualizado em tempo de compilação:

```
1 | let () = Printf.printf "Hello, %s!" 42
                                        ^^
Error: This expression has type int but an expression was expected of type
         string
```

Interessante, não?

## Porque OCaml?

### Concisa e Declarativa

Uma das características mais marcantes de OCaml é sua sintaxe concisa e declarativa. Concisão é importante porque reduz a dificuldade para um programador entender um programa ou uma code base. 

Um programa conciso é um programa que é expressivo onde a intenção de cada passo de execução pensado pelo programador é claro e sem sintaxe acidental (`incidental syntax`). Ser declarativo é importante porque reduz a distância entre a implementação e a solução. 

Um ambiente de programação produtivo permite diretamente a expressividade da solução do problema que o código resolve sem ter que perder tempo na especificação de um passo a passo, focando mais no resultado.

Vamos agora criar um arquivo chamado `main.ml` na nossa pasta `helloworld` e definir o seguinte código:
```OCaml
let double_num x = x * 2      // 1
let double_sum = [6;7;8]      // 2
  |> List.map double_num      // 3
  |> List.fold_left (+) 0;;   // 4

Printf.printf "%d" double_sum // 5
```

Ele expressa a intenção do que deve ser feito precisamente, sem nenhum código desnecessário ou instruções imperativas verbosas.

1. Temos uma simples função `double_num`, que multiplica um número x por 2. Observe que não é especificado nenhum tipo.
2. Então associamos um array com `double_sum` e aplicamos duas transformações nele.
3. A primeira transformação é feita quando aplicamos a função double em cada item na lista usando `map`, retornando uma nova lista
4. A segunda acontece quando somamos todos os items da lista aplicando a função `+` com `fold_left` e o acumulador iniciando em 0, que nos retorna o valor inteiro da soma.
5. Imprimimos o valor na tela usando a formatação de dados que aprendemos anteriormente.

Agora vamos alterar nosso arquivo de build  `dune` para:
```dune
(executable
 (name main))
```

> Aqui trocamos a diretiva `name` de **helloworld** para **main**

Agora vamos compilar nosso projeto:
```terminal
$ dune build
```

E rodar:
```terminal
$ dune exec ./main.exe
```

E vamos ter `42` impresso na tela.

### Lingugens Concisas vs Verbosas

Sem dúvidas quando estamos falando de código a métrica mais importante que devemos levar em conta é: "Ele funciona?". E a boa notícia é que poderiamos fazer exatamente o mesmo em Java e isso funcionaria, basta que fizessemos isso:

```Java
import java.util.List;
import java.util.ArrayList;

public class Program {
  static int DoubleNum(int x) {
   return x * 2;
  }

  public static void main(String[] args) {
   
   var input = new ArrayList<Integer>();
   
   input.add(6);
   input.add(7);
   input.add(8);
   
   var squared = new ArrayList<Integer>();
   
   for (var number : input) {
    squared.add(DoubleNum(number));
   }
   
   var sum = 0;
   
   for (var number : squared) {
       sum += number;
   }
   
   System.out.println(sum);
      
  }
}
```
A grande diferença entre esse código em Java para nosso programa em OCaml é que Java usa a programação imperativa, enquanto em OCaml usamos a programação declarativa. 

Isso significa que o foco quando programamos em Java é "o que queremos fazer?" e descrevemos cada comando do passo a passo que nos leva ao resultado esperado. Enquanto em OCaml colocamos todo nosso foco no que esperamos que seja o resultado ao invés do exato passo a passo de como isso deve ser feito. 

É possivel obter um estilo de escrita muito mais concisa e funcional em Java e também é possivel escrever OCaml muito mais imperativa e verbosa, mas esse exemplo demonstra de forma exagerada a forma canônica que cada linguagem foi projetada para ser pensado a solução dos problemas que resolvem.

