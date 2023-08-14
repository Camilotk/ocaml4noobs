# Capítulo 1 - Introdução

## Índice
- [O que é OCaml?](#o-que-%C3%A9-ocaml)
- [História do OCaml](#hist%C3%B3ria-do-ocaml)
- [Instalação](#instala%C3%A7%C3%A3o)
- [Instalando o Dune](#instalando-o-dune)
- [Hello World](#hello-world)
- [Porque OCaml?](#porque-ocaml)
	- [Concisa e Declarativa](#concisa-e-declarativa)
  	- [Linguagens Concisas vs Verbosas](#lingugens-concisas-vs-verbosas)
	- [Menos Erros Acidentais](#menos-erros-acidentais)
- [Particularidades de OCaml](#particularidades-de-ocaml)
	- [Inferência de Tipos](#infer%C3%AAncia-de-tipos)
	- [Imutabilidade](#imutabilidade)
	- [Dados e Operações](#dados-e-opera%C3%A7%C3%B5es)
- [Materiais em Inglês para aprender OCaml](#materiais-em-ingl%C3%AAs-para-aprender-ocaml)

## O que é OCaml?

[OCaml](https://OCaml.org/) é uma linguagem de programação que permite ao programador usar diferentes paradigmas, dependendo do problema que ele quer resolver. Ela tem suporte de primeira classe para o paradigma funcional, que é baseado em funções puras, imutabilidade e recursão. Ela também permite o uso do paradigma imperativo, que é baseado em variáveis, atribuições e laços. Além disso, ela oferece o paradigma orientado a objetos, que é baseado em classes, objetos e herança. Essa flexibilidade faz com que OCaml seja uma linguagem muito expressiva e versátil.

OCaml também se destaca pelo seu sistema de tipos, que é estático e inferido. Isso significa que o compilador verifica os tipos das expressões em tempo de compilação, evitando muitos erros comuns em tempo de execução. Além disso, o programador não precisa declarar explicitamente os tipos das variáveis ou dos parâmetros das funções, pois o compilador é capaz de inferi-los automaticamente. Isso torna o código mais conciso e legível.

Outra característica importante de OCaml é a sua opção de compilação. A linguagem permite que o programador escolha entre dois tipos de compilação: para bytecode ou para código nativo. A compilação para bytecode gera um código intermediário que é executado por uma máquina virtual chamada zinc. Essa opção tem a vantagem de ser mais rápida e portátil, pois o bytecode pode ser executado em qualquer plataforma que tenha a máquina virtual instalada. A compilação para código nativo gera um código específico para a arquitetura do processador do computador onde o programa será executado. Essa opção tem a vantagem de gerar um código mais eficiente e otimizado, pois aproveita as características da plataforma alvo.

Por fim, OCaml tem algumas vantagens sobre outras linguagens de programação, especialmente as funcionais. Uma delas é o seu desempenho em tempo de execução, que é comparável ao de linguagens como C ou C++. Isso se deve ao fato de que o compilador de OCaml gera código nativo com diversas otimizações, como eliminação de caixas (boxing), alocação no registro (register allocation) e análise de escape (escape analysis). Outra vantagem é a sua biblioteca padrão, que é muito bem construída e extensível. Ela oferece diversos módulos para lidar com estruturas de dados, algoritmos, entrada e saída, sistemas operacionais, redes, interfaces gráficas, entre outros. Além disso, OCaml tem uma comunidade ativa e diversificada, que contribui com vários projetos e ferramentas para a linguagem. OCaml é uma linguagem que combina eficiência, expressividade e praticidade de uma forma única.

## História do OCaml

[OCaml](https://pt.m.wikipedia.org/wiki/OCaml) é uma linguagem de programação que nasceu em 1996, fruto da união entre a linguagem funcional [Caml](https://caml.inria.fr/) e o paradigma de [orientação a objetos](https://pt.m.wikipedia.org/wiki/Orienta%C3%A7%C3%A3o_a_objetos). Caml, por sua vez, era uma linguagem derivada de [ML](https://pt.m.wikipedia.org/wiki/ML_(linguagem_de_programa%C3%A7%C3%A3o)), que foi criada na década de 1970 para ser a meta-linguagem de um provador de teoremas. OCaml é uma linguagem multiparadigma, que combina os estilos funcional, imperativo e orientado a objetos, com um sistema de tipos forte e estático, mas com inferência de tipos. OCaml também tem um sistema de módulos parametrizáveis, uma biblioteca padrão extensa e um coletor de lixo automático. OCaml se destaca por sua eficiência e confiabilidade, sendo usada tanto no meio acadêmico quanto no industrial.

A história de OCaml começa com a história de ML, que significa *Meta Language*. ML foi criada na década de 1970 por [Robin Milner](https://en.wikipedia.org/wiki/Robin_Milner) na Universidade de Edimburgo, na Escócia. ML era a linguagem usada para expressar as propriedades lógicas e as provas do sistema LCF (Logic for Computable Functions), que era um provador de teoremas interativo. ML era uma linguagem funcional, ou seja, baseada no conceito matemático de função, que recebe argumentos e retorna valores. ML também era fortemente e estaticamente tipada, ou seja, cada valor e cada função tinha um tipo definido e verificado pelo compilador. ML também tinha inferência de tipos, ou seja, o compilador conseguia deduzir os tipos das variáveis e das funções sem que o programador precisasse declará-los explicitamente.

ML logo chamou a atenção dos primeiros usuários do LCF, que perceberam que ela era uma linguagem poderosa e expressiva para programar outras coisas além de provar teoremas. Assim, ML se tornou uma linguagem geral, com suporte a estruturas de dados como listas, tuplas e registros, e controle de fluxo como condicionais e recursão. ML também tinha um sistema de módulos simples, que permitia organizar o código em unidades separadas.

Em 1984, um grupo de pesquisadores do [INRIA](https://www.inria.fr/en) (Instituto Nacional de Pesquisa em Informática e Automação) na França desenvolveu a primeira versão da linguagem Caml, que significa Categorical Abstract Machine Language. Caml era baseada em ML, mas com algumas diferenças na sintaxe e na semântica. Caml também introduziu uma máquina virtual chamada CAM (Categorical Abstract Machine), que era capaz de executar funções definidas na linguagem. A máquina CAM era baseada em um modelo matemático chamado máquina abstrata categórica, que usava conceitos da teoria das categorias para representar funções e tipos.

Caml passou por várias revisões e melhorias ao longo dos anos, até que em 1996 surgiu a versão chamada Objective Caml, ou OCaml. OCaml adicionou à linguagem Caml o suporte ao paradigma orientado a objetos, permitindo que os programadores definissem classes, objetos e métodos. OCaml também mudou a máquina virtual para uma mais eficiente, chamada ZINC (ZINC Is Not CAML), que foi escrita por [Xavier Leroy](https://xavierleroy.org/). Além disso, OCaml oferece a possibilidade de compilar o código para código nativo, para diversas plataformas, aumentando o desempenho da execução.

OCaml foi desenvolvida por [Didier Rémy](http://pauillac.inria.fr/~remy/) e [Jérôme Vouillon](https://www.irif.fr/~vouillon/), do INRIA, com a colaboração de outros pesquisadores, como [Gérard Huet](http://pauillac.inria.fr/~huet/) e [Jacques Garrigue](https://scholar.google.com/citations?user=erlIoewAAAAJ). O nome OCaml vem de Objective Caml, que significa Caml com Objetos. A introdução de objetos em OCaml possibilitou muitos avanços na pesquisa de sistemas de objetos em linguagens funcionais estaticamente tipadas e com inferência de tipos. Também permitiu melhor interoperabilidade com linguagens OOP como C++ e Java e trouxe novas funcionalidades e mudanças de sintaxe em relação a Caml.

No ano 2000, OCaml recebeu muitas atualizações com novas funcionalidades vindas dos estudos do cientista da computação Jacques Garrigue em seu dialeto de OCaml, Objective Label. Entre elas estão os argumentos opcionais, as variantes polimórficas, as anotações de variância e os métodos polimórficos. Essas funcionalidades aumentaram o poder expressivo e a flexibilidade da linguagem, permitindo que os programadores usassem tipos mais complexos e abstratos.

Desde o início dos anos 2000, OCaml tem atraído popularidade e crescido no número de universidades que adotam a linguagem para lecionar em diversas matérias, entre elas Harvard, Princeton, Brown, Columbia, Cornell, Universidade da Califórnia, Universidade de Illinois, UPenn, Universidade da Beira Interior (Portugal), Universidade de Rennes (França) e Universidade Paris-Diderot (França).

Outro ponto importante para OCaml aconteceu em 2016, quando [Jordan Walke](https://github.com/jordwalke), criador da biblioteca React e na época engenheiro na Meta criou a extensão de sintaxe [ReasonML](https://reasonml.github.io/) para OCaml. ReasonML permite escrever OCaml com uma sintaxe muito próxima do que normalmente os programadores JavaScript (e de supersets como TypeScript) encontram e transpilar essa sintaxe para OCaml onde pode ser usada para gerar binários nativos ou transpilar para JavaScript utilizando o transpilador BuckleScript e, sendo assim, pode ser usada para construir aplicações front-end, além de interagir com o ecossistema JS. Em 2020 o time de desenvolvimento do BuckleScript decidiu criar a linguagem [ReScript](https://rescript-lang.org/) e o projeto BuckleScript recebeu um fork chamado [Melange](https://melange.re/), feito por [Antonio Monteiro](https://github.com/anmonteiro), que é a forma atual de realizar a transpilação.

OCaml é uma linguagem de programação que tem uma longa história e uma grande relevância no cenário das linguagens funcionais. Ela é uma linguagem que combina vários paradigmas e funcionalidades, oferecendo aos programadores uma forma elegante, eficiente e confiável de expressar seus algoritmos e resolver seus problemas. OCaml é uma linguagem que tem uma longa história de produção e vale a pena conhecer e aprender.

<h3 align="center">
<img src="./linha_do_tempo.png" />
</h3>

## Instalação

Certo, agora você sabe o que é OCaml, então agora vamos para a instalação da linguagem e suas ferramentas básicas para que possamos compilar e executar nossos programas.

<strong>🐧 Linux Ubuntu:</strong>
<details>
	
1. **Instale o OPAM**: OPAM é o gerenciador de pacotes oficial do OCaml, que permite alternar facilmente entre as versões do OCaml e muito mais. Por exemplo, o OPAM torna prático lidar com diferentes projetos que requerem diferentes versões do OCaml. Para instalar o OPAM no Ubuntu, abra um terminal e execute os seguintes comandos:
```sh
$ sudo apt-get update
$ sudo apt-get install -y opam
```

2. **Instale o OCaml**: Depois de instalar o OPAM, você pode usar o opam para instalar a versão mais recente do OCaml. Para fazer isso, execute os seguintes comandos:
```sh
$ opam init
$ eval $(opam env)
$ opam switch create 4.14.1
$ eval $(opam env)
```
Isso criará um novo switch chamado `4.14.1` e instalará a versão 4.14.1 do OCaml nesse switch.

3. **Instale o rlwrap**: O rlwrap é uma ferramenta útil que permite usar as teclas de seta para percorrer o histórico de comandos no REPL do OCaml (Read-Eval-Print Loop). Para instalar o rlwrap no Ubuntu, execute os seguintes comandos:
```sh
$ sudo apt-get install -y rlwrap
```

4. **Adicione um alias para usar o rlwrap com o comando 'ocaml'**: Para usar o rlwrap com o comando `ocaml`, você pode adicionar um alias ao seu arquivo `.bashrc`. Abra o arquivo `.bashrc` em seu editor de texto favorito e adicione a seguinte linha ao final do arquivo:
```sh
alias ocaml='rlwrap ocaml'
```
Depois de salvar e fechar o arquivo, execute `source ~/.bashrc` para aplicar as alterações.

</details>

<strong>🍎 MacOS:</strong>
<details>

1. **Instale o Homebrew**: Homebrew é um gerenciador de pacotes para macOS que facilita a instalação de software. Se você ainda não tem o Homebrew instalado, pode instalá-lo abrindo um terminal e executando o seguinte comando:
```sh
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. **Instale o OPAM**: OPAM é o gerenciador de pacotes oficial do OCaml, que permite alternar facilmente entre as versões do OCaml e muito mais. Por exemplo, o OPAM torna prático lidar com diferentes projetos que requerem diferentes versões do OCaml. Para instalar o OPAM no macOS, execute os seguintes comandos:
```sh
$ brew update
$ brew install opam
```

3. **Instale o OCaml**: Depois de instalar o OPAM, você pode usar o opam para instalar a versão mais recente do OCaml. Para fazer isso, execute os seguintes comandos:
```sh
$ opam init
$ eval $(opam env)
$ opam switch create 4.14.1
$ eval $(opam env)
```
Isso criará um novo switch chamado `4.14.1` e instalará a versão 4.14.1 do OCaml nesse switch.

4. **Instale o rlwrap**: O rlwrap é uma ferramenta útil que permite usar as teclas de seta para percorrer o histórico de comandos no REPL do OCaml (Read-Eval-Print Loop). Para instalar o rlwrap no macOS, execute os seguintes comandos:
```sh
$ brew install rlwrap
```

5. **Adicione um alias para usar o rlwrap com o comando 'ocaml'**: Para usar o rlwrap com o comando `ocaml`, você pode adicionar um alias ao seu arquivo `.bashrc` ou `.zshrc`, dependendo do shell que estiver usando. Abra o arquivo apropriado em seu editor de texto favorito e adicione a seguinte linha ao final do arquivo:
```sh
alias ocaml='rlwrap ocaml'
```
Depois de salvar e fechar o arquivo, execute `source ~/.bashrc` ou `source ~/.zshrc` para aplicar as alterações.

</details>


<strong>🪟 Windows:</strong>
<details>

1. **Instale o WSL2**: O WSL2 (Windows Subsystem for Linux 2) permite executar uma distribuição Linux diretamente no Windows. Se você ainda não tem o WSL2 instalado, pode seguir as [instruções de instalação](https://learn.microsoft.com/pt-br/windows/wsl/install) fornecidas pela Microsoft. Aqui estão os passos básicos para instalar o WSL2:
    * Abra o PowerShell ou o Prompt de Comando do Windows no modo de administrador clicando com o botão direito do mouse e selecionando "Executar como administrador".
    * Insira o comando `wsl --install` e reinicie o computador.
    * Esse comando habilitará os recursos necessários para executar o WSL e instalará a distribuição Ubuntu do Linux.

2. **Instale o Ubuntu no WSL2**: Depois de instalar o WSL2, você pode instalar a distribuição Linux Ubuntu no WSL2. Para fazer isso, abra a Microsoft Store, pesquise por "Ubuntu" e clique em "Obter" para instalar a versão mais recente do Ubuntu.

3. **Instale o OPAM**: OPAM é o gerenciador de pacotes oficial do OCaml, que permite alternar facilmente entre as versões do OCaml e muito mais. Por exemplo, o opam torna prático lidar com diferentes projetos que requerem diferentes versões do OCaml. Para instalar o OPAM no Ubuntu do WSL2, abra um terminal com Ubuntu e execute os seguintes comandos:
```sh
$ sudo apt-get update
$ sudo apt-get install -y opam
```

4. **Instale o OCaml**: Depois de instalar o OPAM, você pode usar o opam para instalar a versão mais recente do OCaml. Para fazer isso, execute os seguintes comandos no Ubuntu do WSL2:
```sh
$ opam init
$ eval $(opam env)
$ opam switch create 4.14.1
$ eval $(opam env)
```
Isso criará um novo switch chamado `4.14.1` e instalará a versão 4.14.1 do OCaml nesse switch.

5. **Instale o rlwrap**: O rlwrap é uma ferramenta útil que permite usar as teclas de seta para percorrer o histórico de comandos no REPL do OCaml (Read-Eval-Print Loop). Para instalar o rlwrap no Ubuntu, execute os seguintes comandos:
```sh
$ sudo apt-get install -y rlwrap
```

6. **Adicione um alias para usar o rlwrap com o comando 'ocaml'**: Para usar o rlwrap com o comando `ocaml`, você pode adicionar um alias ao seu arquivo `.bashrc`. Abra o arquivo `.bashrc` em seu editor de texto favorito e adicione a seguinte linha ao final do arquivo:
```sh
alias ocaml='rlwrap ocaml'
```
Depois de salvar e fechar o arquivo, execute `source ~/.bashrc` para aplicar as alterações.

</details>

> Em 16 de dezembro de 2022 foi lançado a versão 5.0.0 de OCaml que trouxe muitas mudanças na linguagem e runtime. Porém, para simplicidade e focar no core da linguagem esse tutorial 4Noobs vai no momento usar a versão 4.14.1. Há planos de trazer uma atualização para as novidades da versão 5.0.0 mais à frente.

## Instalando o Dune

A seguir, vamos instalar a ferramenta **Dune**, um sistema de `build system` para projetos em OCaml/Reason. Ela se encarrega dos detalhes de baixo nível da compilação de OCaml, bastando que configuremos o projeto corretamente. Assim, ela cuidará do resto para nós.

- Em seguida, instalaremos o Dune com o OPAM, que já instalamos anteriormente.
```terminal
$ opam install dune
```

E agora, vamos para nosso primeiro exemplo.

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
