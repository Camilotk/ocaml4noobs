# Capítulo 1 - Introdução

## Índice
- [O que é OCaml?](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#o-que-%C3%A9-ocaml)
- [História do OCaml](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#hist%C3%B3ria-do-ocaml)
  - [Resumo e Linha do Tempo](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#resumo-e-linha-do-tempo)
- [Instalação](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#instala%C3%A7%C3%A3o)
- [Instalando o Dune](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#instalando-o-dune)
- [Hello World](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#hello-world)
- [Porque OCaml?](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#porque-ocaml)
	- [Concisa e Declarativa](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#concisa-e-declarativa)
  	- [Linguagens Concisas vs Verbosas](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#lingugens-concisas-vs-verbosas)
	- [Menos Erros Acidentais](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#menos-erros-acidentais)
- [Particularidades de OCaml](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#particularidades-de-ocaml)
	- [Inferência de Tipos](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#infer%C3%AAncia-de-tipos)
	- [Imutabilidade](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#imutabilidade)
	- [Dados e Operações](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#dados-e-opera%C3%A7%C3%B5es)
- [Materiais em Inglês para aprender OCaml](https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#materiais-em-ingl%C3%AAs-para-aprender-ocaml)

## O que é OCaml?

[OCaml](https://OCaml.org/) é uma linguagem de programação multiparadigma, que tem suporte de primeira classe para os paradigmas funcional, imperativo e orientado a objetos. É uma linguagem que é descendente e traz fortes semelhanças com ML (Metalanguage) da qual herda (assim como outras linguagens descendentes de ML) ser estaticamente e fortemente tipada.

OCaml permite dois tipos de compilação, para bytecode que é executado por uma máquina virtual (zinc) ou para código de máquina nativo para um grande número de plataformas. Ela não é uma linguagem puramente funcional, permitindo a existência de valores mutáveis bem como de efeitos colaterais (side-effects), tipicamente existentes apenas em linguagens imperativas. Esta característica distingue-a de outras linguagens puramente funcionais, como por exemplo Haskell.

Seu principal diferencial que tem trazido notoriedade e popularidade para a linguagem é o seu compilador que é capaz de gerar código nativo com excelente desempenho em tempo de execução e uma biblioteca padrão muito bem construída e extensível.

## História do OCaml

OCaml oficialmente nasceu em 1996, quando os cientistas da computação [Didier Rémy](http://cristal.inria.fr/~remy/) e [Jérôme Vouillon](https://www.irif.fr/~vouillon/) do [Instituto Nacional de Pesquisa em Informática e Automação (INRIA)](https://www.inria.fr/en) na França decidiram adicionar Orientação a Objetos à linguagem Caml que também havia sido criada no INRIA em 1987 por [Gérard Huet](http://cristal.inria.fr/~huet/). O nome da linguagem Caml também tem um significado importante para entendermos sobre a história de OCaml e suas particularidades, Caml é uma abreviação de *Categorical Abstract Machine Language* que combina as implementações de uma [Máquina Abstrata Categórica](https://pt.xcv.wiki/wiki/Categorical_abstract_machine) implementada em uma linguagem derivada de [ML](https://pt.wikipedia.org/wiki/ML_(linguagem_de_programa%C3%A7%C3%A3o)).

A introdução de Objetos em OCaml possibilitou muitos avanços, Orientação a Objetos ainda era um paradigma muito recente (C++ havia sido criada apenas dez anos antes) isso foi importante para pesquisas de sistemas de objetos em linguagens funcionais estaticamente tipadas e com inferência de tipos, além de permitir melhor interoperabilidade com linguagens OOP como C++ e Java e trazer novas funcionalidades e mudanças de sintaxe em relação a Caml.

No ano de 2000, OCaml recebeu muitas atualizações com novas funcionalidades vindas dos estudos do Cientista da Computação [Jacques Garrigue](https://www.math.nagoya-u.ac.jp/~garrigue/) entre elas *optional arguments*, *polymorphic variants*, *variance annotations* e *polymorphic methods*. Desde o ínicio dos anos 2000, OCaml tem atraído popularidade e crescido no número de Universidades que adotam a linguagem para lecionar em diversas matérias, entre elas Harvard, Princeton, Brown, Columbia, Cornell, Universidade da Califórina, Universidade de Ilinois, UPenn, Universidade da Beira Interior (Portugal), Universidade de Rennes (França) e Universidade Paris-Diderot (França).

OCaml também influenciou muitas outras linguagens, como Rust e Scala, mas em especial F# que surgiu como "OCaml para .NET" criado em 2005 pelo grupo de pesquisadores liderado por [Don Syme](https://en.wikipedia.org/wiki/Don_Syme) da [Microsoft Research](https://www.microsoft.com/en-us/research/) com interesse de construir uma linguagem funcional para .NET e com sucessivas falhas em implementar Haskell.NET com compatibilidade a C#, decidindo investir em OCaml por sua compatibilidade com código Orientado a Objetos e imperativo. Inicialmente ambos compiladores eram 100% intercambiáveis, mas a partir de F# 2.0 e em todas as versões posteriores a compatibilidade com OCaml foi sendo reduzida para a introdução de novas funcionalidades à linguagem, sendo que hoje (2021) ainda é possível compilar programas simples de uma linguagem no compilador da outra sem prejuízos ou problemas.

Outro ponto importante para OCaml aconteceu em 2016, quando Jodan Walke, criador da biblioteca React e na época Engenheiro no Facebook criou a extensão de sintaxe ReasonML para OCaml (que não vamos tratar nesse 4noobs, mas caso tenha curiosidade a comunidade ReasonBR tem uma [lista de materiais](https://github.com/rescriptbr/comece-aqui) a respeito). ReasonML permite escrever OCaml com uma sintaxe muito próxima do que normalmente os programadores JavaScript (e de supersets como TypeScript) encontram e transpilar essa sintaxe para OCaml onde pode ser usada para gerar binários nativos ou transpilar para JavaScript utilizando o transpilador BuckleScript e, sendo assim, pode ser usada para constuir aplicações front-end, além de interagir com o ecossistema JS. Em 2020 o time de desenvolvimento do BuckleScript decidiu criar a linguagem [ReScript](https://rescript-lang.org/blog/bucklescript-is-rebranding) e o projeto BuckleScript recebeu um fork chamado [Melange](https://github.com/melange-re), feito por [Antonio Monteiro](https://github.com/anmonteiro), que é a forma atual de realizar a transpilação de OCaml ou ReasonML para JavaScript e que se mantêm em desenvolvimento e aperfeiçoamento.

##### Resumo e Linha do Tempo:
- **1973**: [Robin Milner](https://en.wikipedia.org/wiki/Robin_Milner) criou a linguagem de programação [ML](https://en.wikipedia.org/wiki/ML_(programming_language)) que trouxe programação funcional com tipagem estática e inferência de tipos.
- **1980**: Surge Smalltalk, criada por Alan Kay, e tornam-se públicos os conceitos de Orientação a Objetos.
- **1987**: É criada a linguagem Caml.
- **1996**: OCaml extende Caml adicionando OOP a Caml.
- **2000**: OCaml recebe sua maior atualização até hoje.
- **2005**: Outra linguagem - F# - nasce projetada a partir de OCaml, mas com todos os ajustes e mudanças necessárias para que ela adapte-se bem a plataforma .NET
- **2014**: A empresa de negociação de ativos e derivativos [Jane Street](https://www.janestreet.com/) adota OCaml como linguagem principal, se tornando o maior use case de OCaml e passando a contribuir com a linguagem e com [bibliotecas open source](https://github.com/janestreet) para OCaml.
- **2016**: É criada a sintaxe e extensão [ReasonML](https://github.com/reasonml/reason) por [Jordan Walke](https://twitter.com/jordwalke) para OCaml que oferece uma sintaxe próxima de JavaScript e permite transpilar sua sintaxe ReasonML para OCaml no qual é possível gerar binários nativos e JavaScript através do compilador BuckleScript.
- **2020**: Surge a linguagem de programação [ReScript](https://rescript-lang.org/blog/bucklescript-is-rebranding) a partir dos criadores do compilador BuckleScript decidirem criar uma sintaxe própria e unificada para Reason, cortando a compatibilidade com OCaml e retirando funcionalidades como o sistema de objetos. O projeto BuckleScript passa por um fork feito e mantido por [Antonio Monteiro](https://github.com/anmonteiro) tornando-se [Melange](https://github.com/melange-re).

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#cap%C3%ADtulo-1---introdu%C3%A7%C3%A3o">🔝 Subir para o topo</a></p>

## Instalação

Certo, agora você sabe o que é OCaml, então agora vamos para a instalação da linguagem e suas ferramentas básicas para que possamos compilar e executar nossos programas.

> Importante notar que apesar existir suporte de OCaml para Windows é aconselhável que utilize o [Windows Subsistem for Linux (WSL)](https://github.com/SaLandini/wsl4noobs) para programar em OCaml.


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

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#cap%C3%ADtulo-1---introdu%C3%A7%C3%A3o">🔝 Subir para o topo</a></p>

## Hello World

Assim como diz a [lenda da maldição do programador](https://www.urbandictionary.com/define.php?term=The%20Programmer%27s%20Curse) o primeiro programa escrito em uma nova linguagem de programação deve ser o que imprime a mensagem "Hello World" na tela, ou um grande azar vai te perseguir enquanto você usar a linguagem te fazendo sofrer com muitos erros. Como estamos falando de maldições ancestrais, vamos começar pela implementação desse programa.

Para isso vamos precisar:
- De um editor de texto minimamente decente (nada de Notepad no Windows)
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
```OCaml
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

> Caso você receba um erro *"I cannot find the root of the current workspace/project."* isso acontece porque nas versões mais rececentes depois da v3.0 o dune não gera mais automaticamente o arquivo **dune-project** (isso terá [correção futuramente](https://github.com/ocaml/dune/pull/4239#issuecomment-780981029)) para corrigir isso basta usar o comando `$ echo "(lang dune 2.9)" >> dune-project` no seu terminal e continuar o processo de build normalmente.

E devemos ter uma mensagem `Hello World!` na tela.

Agora vamos alterar nosso script para imprimir texto formatado.
```OCaml
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

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#cap%C3%ADtulo-1---introdu%C3%A7%C3%A3o">🔝 Subir para o topo</a></p>

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

### Linguagens Concisas vs Verbosas

Sem dúvidas quando estamos falando de código a métrica mais importante que devemos levar em conta é: "Ele funciona?". E a boa notícia é que poderíamos fazer exatamente o mesmo em Java e isso funcionaria, basta que fizessemos isso:

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

É possível obter um estilo de escrita muito mais concisa e funcional em Java e também é possível escrever OCaml de forma completamente imperativa e mais verbosa (a linguagem tem suporte a programação imperativa e OOP), mas esse exemplo demonstra de forma exagerada a forma canônica que cada linguagem foi projetada para ser pensado a solução dos problemas que resolvem apenas como exemplo.

### Menos Erros Acidentais

No ensaio ["No Silver Bullet" (Não existe bala de prata), Fred Brooks](http://worrydream.com/refs/Brooks-NoSilverBullet.pdf) faz uma distinção entre complexidade acidental e complexidade essencial. 

- **Complexidade Acidental** é a complexidade que é infligida em nós mesmos pelas ferramentas que decidimos usar.
- **Complexidade Essencial** é a complexidade relacionada ao problema que estamos tentando resolver. 

Complexidade Acidental é o problema que pode e deve ser cortado pela raíz, por exemplo, quanto menos ponteiros de memória, manejamento de recursos de memória ou qualquer outra coisa que não seja relacionada com o problema que estamos resolvendo pudermos evitar, melhor. OCaml ajuda a minimizar esse tipo de problema da complexidade acidental para que possamos focar na Complexidade Essencial que é o desafio que precisamos verdadeiramente resolver.

Aqui temos um exemplo do algoritmo Quicksort em OCaml:
<!--
```OCaml 
let rec quicksort list =
  match list with
    | [] -> []
    | x :: xs ->
              let smaller, bigger = List.partition ((>) x) xs in
                  (quicksort smaller) @ (x :: (quicksort bigger));;
```

```OCaml 
let rec quicksort = function
    | [] -> []
    | x :: xs ->
              let smaller = List.filter ((>) x) xs in
              let bigger = List.filter ((<) x) xs in
                quicksort smaller @ [x] @ quicksort bigger;;
```
-->

```OCaml 
let rec quicksort = function
    | [] -> []                                               // 1
    | x :: xs ->
              let smaller = List.filter ((>) x) xs in        // 2
              let bigger = List.filter ((<) x) xs in         // 2
                quicksort smaller @ [x] @ quicksort bigger;; // 3
```

Observe o quanto o algoritmo em OCaml é próximo da definição original do algoritmo de quicksort caso tentássemos explicá-lo. Obviamente existe sintaxe que não é familiar para um usuário que não é familiar a linguagens funcionais. Vejamos:

1. Aqui podemos notar que o Quicksort se divide em duas possibilidades, dois casos:
 - A possibilidade de receber uma lista vazia, que no caso é verificado pelo pattern match, caso seja uma lista vazia o retorno é uma lista vazia.
 -  Todos os outros casos.
2. Quando a função recebe um valor ela divide o restante dos valores em dois grupos:
 - Dos items menores que x
 - Dos items maiores que x
3. Então o grupo menor é ordenado recursivamente, o maior também é ordenado recursivamente e ambos são concatenados com o item x (o primeiro item da lista ou head, retirado através de pattern match em x :: xs, que seria o mesmo que head :: tail) no meio -> [menores. x. maiores]

Na primeira linha temos a palavra <u>rec</u> que é uma abreviação para 'recursive' (recursivo) que informa o compilador que essa função pode ter que chamar a si mesma, isso é um exemplo de complexidade acidental que ainda se mantêm em OCaml uma vez que não tem motivo lógico ou matemático para que esse comando esteja ali uma vez em que logicamente e matematicamente todas as funções devem ser capazes de chamarem a si mesmas, porém por razões externas ao problema que estamos resolvendo precisamos informar ao compilador de OCaml que essa função pode ter que chamar a si mesma.

Um contraste com o mesmo algortimo, mas agora em C++:
```C++
#include <iostream>

void quickSort(int * array, int low, int high) {
  int i = low;
  int j = high;
  int pivot = array[(i + j) / 2];
  int temp;

  while (i <= j) {
    while (array[i] < pivot)
      i++;
    while (array[j] > pivot)
      j--;
    if (i <= j) {
      temp = array[i];
      array[i] = array[j];
      array[j] = temp;
      i++;
      j--;
    }
  }
  if (j > low)
    quickSort(array, low, j);
  if (i < high)
    quickSort(array, i, high);
}
 ```
Com isso podemos ver que em C++ (ou qualquer outra linguagem imperativa como Java ou C#) o que é descrito é o procedimento passo-a-passo e não a definição do algoritmo. Pode ser que por você estar mais acostumado a ler código imperativo que a solução em C++ pareça ser mais clara, mas pense o quão mais complexo é entender todo o número maior de instruções e passos que estão no código em C++ e a recompensa que é poder escrever códigos mais concisos e claros usando OCaml.

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#cap%C3%ADtulo-1---introdu%C3%A7%C3%A3o">🔝 Subir para o topo</a></p>

## Particularidades de OCaml

### Inferência de Tipos

Sendo OCaml derivado de ML, a linguagem usa o Sistema de Tipos [Hindley-Milner](https://en.wikipedia.org/wiki/Hindley%E2%80%93Milner_type_system) que permite uma inferência de tipos excelente em que 99% do tempo você não precisa dizer ao compilador o tipo das variáveis ou dos dados e que acrescenta outras particularidades que vamos ver mais a frente. 

> Inferência de tipos é a propriedade de um Sistema de Tipos que permite ao compilador deduzir - inferir - o tipo de uma variável a partir de seu valor ou expressão. Isso significa que o programador fica livre da obrigação de estar sempre especificando o tipo da variável.

Como vimos no nosso exemplo anterior:
```ocaml
let double_num x = x * 2 
```
Não precisamos informar que x é um parâmetro do tipo inteiro e nem que a função double_num retorna um inteiro, porém se executarmos essa função no repl vamos ter a assinatura desse método inferida como `val double_num : int -> int = <fun>` nos mostrando que o compilador sabe exatamente disso tudo e é capaz de fazer o trabalho de especificar o tipo das nossas variáveis e do retorno da nossa função para nós.

Mas como isso é possível? Que tipo de bruxaria é essa? Bem, na verdade o operador `*` é uma função que aceita dois parâmetros inteiros e retorna um inteiro, logo o compilador sabe que x sendo um dos parâmetros de  `*` é um valor de tipo inteiro e que double_num retorna o resultado de `*` que é um inteiro e por tanto tem o mesmo tipo de retorno. Interessante, não?

### Imutabilidade

OCaml favorece que os dados sejam imutáveis. Imutabilidade significa que valores uma vez criados não podem ser alterados e que identificadores uma vez atribuídos não podem ser mudados. Por isso, quando precisamos mudar um valor, é necessário criar um novo valor baseado no valor anterior. 

Como no nosso código abaixo, a lista numbers com os valores [3..1] é diferente de moreNumbers que tem os valores de [4..1] atualizados. Note que a lista original não é alterada, pois valores imutáveis nunca são mudados. Imutabilidade tem um grande número de efeitos colaterais positivos, incluindo execução assíncrona segura e maior facilidade de entender a lógica de funções.

```OCaml
let numbers = [3;2;1]
let moreNumbers = 4 :: numbers 
```

```Java
var numbers = new ArrayList<int> {1,2,3};
numbers.add(4);
```
A versão idiomática em linguagens imperativas como Java é diferente: o valor de numbers pode ser modificado a qualquer hora. 

Isso é uma mudança fundamental ao significado do operador de igualdade, em OCaml o operador de igualdade tem um significado próximo do operador matemático de igualdade que é que o identificador numbers contém um conjunto de números 3,2,1 e já em Java o operador de igualdade significa que um número arbitrário de números é dado, com os valores temporários 1,2,3. 

Em Java numbers não é a lista 1,2,3 é apenas um identificador que aponta para esses valores momentaneamente e é esse acoplamento temporal de um identificador ao seu(s) valor(es) que faz com que esse tipo de código seja perigoso, já que em Java não basta saber que esse identificador numbers é atrelado a esses valores, é necessário também saber todas as alterações feitas nesse valor para conseguir saber seu valor no atual momento. No modelo de OCaml o identificador numbers não pode ser alterado, então é seguro assumir a qualquer momento que o valor de numbers é 3,2,1.

### Dados e Operações

Orientação a Objetos encoraja o acoplamento entre dados e operações. Na nossa Classe TwoNumbers abaixo em C# é estruturado alguns dados - dois inteiros - e as operações sobre esses dados, como Add().  

```C#
public class TwoNumbers
{
	int fst;
	int snd;
	public TwoNumbers(int fst, int snd)
	{
		this.fst = fst;
		this.snd = snd;
	}
	public int Add()
	{
		return fst + snd;
	}
}
```
Já OCaml organiza dados e operações de uma forma muito diferente. Geralmente os dados são empacotados como valores e as operações são funções simples que operam em tipos particulares de dados. O tipo two_numbers é definido como um novo tipo de dado que contém dois valores inteiros e agora ele pode ser usado em qualquer lugar que seja necessário exatamente dois valores inteiros, sem implicar em nada sobre quais números eles representam e não possuem nenhum tipo específico de operações. A função add opera em um único argumento do tipo two_numbers. 

```OCaml
type two_numbers = int * int

(* add : int * int -> int *)
let add((fst, snd): two_numbers) = fst + snd;;
```
Enquanto normalmente em linguagens com Orientação a Objetos os valores e as suas funções são acopladas dentro de um único estado / objeto, em OCaml normalmente colocamos cada uma dessas coisas separada e independente uma da outra, essa separação ajuda a optimizar as métricas de acoplamento e coesão dos nossos softwares sem precisar nos preocupar com esses detalhes.

Brevemente:
- **Acoplamento** se refere ao grau de interdependência entre componentes.
- **Coesão** se refere à consistência interna desses componentes.

Separando dados e funções dessa forma nós garantimos que nossas dependências são exatamente aquelas das quais precisamos.

## Materiais em Inglês para aprender OCaml
- [Real World OCaml](https://dev.realworldocaml.org/toc.html)
- [Functional Programming in OCaml](https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/)
- [99 Problems](https://ocaml.org/learn/tutorials/99problems.html)
- [OCaml Manual](https://ocaml.org/manual/)
- [janestreet/learn-ocaml-workshop](https://github.com/janestreet/learn-ocaml-workshop)

#### E por enquanto, é só nos vemos no [próximo Capítulo](https://github.com/Camilotk/ocaml4noobs/blob/master/2-funcoes/README.md)! 😉

## Referências
- [Install OCaml](https://OCaml.org/docs/install.html)
- [How to install opam](https://opam.OCaml.org/doc/Install.html)
- [Dune Quickstart](https://dune.readthedocs.io/en/stable/quick-start.html)
- [Caml Language History](https://caml.inria.fr/about/history.en.html)
- [OCaml - Wikipédia](https://pt.wikipedia.org/wiki/OCaml)

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/1-introducao#cap%C3%ADtulo-1---introdu%C3%A7%C3%A3o">🔝 Subir para o topo</a></p>
