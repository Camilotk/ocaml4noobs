# Controle e Organização

Até aqui utilizamos bastante o REPL para fazer experimentos e aprender a usar a linguagem, mas desse capítulo em diante vamos começar a focar um pouco mais em trabalhar com arquivos e projetos e começar a construir programas. Arquivos são mais do que apenas uma forma de armazenar nossas instruções para serem compiladas ou interpretadas, em OCaml os arquivos também correspondem a **módulos** que dividem nossos programas em unidades conceituais de código.

#### **Indíce**
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

## Função Main

Diferente de C ou Java não temos uma função chamada **main** por onde nossos programas começam a execução. Quando um programa OCaml é executado todas as suas instruções são avaliadas em execução. Na maioria dos scripts e programas que criamos a declaração **let () =** faz o papel da função main, mas ainda assim devemos ter a consciência que todo nosso arquivo é avaliado em execução e então de alguma forma todos os arquivos em OCaml são uma grande função main.

Parece um pouco estranho escrever **let () =**, mas isso tem um sentido. A nossa atribuição **let** faz pattern match o valor **unit**, que garante que a expressão após **=** retorne um valor igualmente unit.


## Módulos e Assinaturas

Módulos são como **mini arquivos**. Eles podem agregar diversas definições como tipos, valores, constantes, outros módulos e todas as demais coisas que podemos declarar em um arquivo.

Todo arquivo OCaml em si é compilado para um módulo com o mesmo nome do arquivo, mas capitalizado (com a sua inicial maiúscula). Se tivermos um arquivo ```ocaml.ml``` todo seu conteúdo forma um módulo chamado **Ocaml** que pode ser acessado por qualquer outro arquivo. Os conteudos de um módulo podem ser acessados por ponto **.** assim como as propriedades de um record. 

> Por convenção geralmente utilizamos nomes de arquivos inteiramente em letras minúsculas, nomes capitalizados não causam qualquer tipo de erro ou são inválidos, mas dificilmente encontra-se programadores que utilizam essa convenção. Independente da convenção, o nome do módulo ainda é o nome capitalizado do arquivo.

Quando escrevemos um programa OCaml que roda inteiramente no mesmo arquivo todos seus valores, funções e estruturas estão interagindo dentro desse módulo que é representado pelo nome do arquivo.

### Assinaturas e Interfaces

Quando escrevemos nosso código OCaml definimos nossas expressões da linguagem em um arquivo ```.ml``` que como vimos define implicitamente um módulo, mas digamos que queremos que um programador possa usar nossa classe sem saber necessariamente a implementação interna de nosso código e para essa situação usamos os arquivos ```.mli``` que definem **interfaces**.

> Assim como todo arquivo .ml é implicitamente um módulo, todo arquivo .mli é implicitamente uma interface.

Para isso, temos que definir uma interface de módulo, que atuará como uma máscara sobre a implementação do módulo. Para definirmos a interface de um módulo representado pelo arquivo ```module.ml``` devemos criar um arquivo ```module.mli``` na mesma pasta, tanto o compilador padrão de OCaml, quanto dune sempre procuram por um arquivo .mli de mesmo nome que o arquivo que estão compilando e caso não o encontre vão inferir a interface para o módulo.

> Junto com o resultado de toda compilação temos um arquivo com a extensão ```.cmi``` que justamente se trata do resultado de compilação da interface do módulo. Note que mesmo quando não definimos explicitamente um arquivo ```.mli``` esse arquivo está presente, justamente por que o compilador vai inferir uma interface para tudo que está declarado no arquivo e expor todas as expressões e valores do mesmo.

Vendo isso de uma forma mais prática, vamos começar definindo um arquivo (módulo) apenas de exemplo chamado **moduloa.ml**:
```ocaml
let mensagem = "Que bom que você está aprendendo OCaml!"

let imprime () = print_endline mensagem;;
```
E digamos que não queremos que os módulos que vão acessar esse tenham acesso a nossa declaração **mensagem** porque eles devem apenas acessar a nossa função **imprime**, então vamos criar o nosso arquivo ```.mli``` com o mesmo nome, na mesma pasta ou seja **moduloa.mli**:
```ocaml
val imprime : unit -> unit
```

Você pode expor qualquer valor ou função utilizando a palavra **val** seguida da sua assinatura (como o REPL mostra quando entramos expressões). Nesse caso quando compilarmos nosso **moduloa.ml** quando alguém abri-lo e tentar acessar apenas terá acesso a **imprime**.

> Podemos usar o compilador de OCaml para inferir as assinaturas do nosso arquivo .ml para nós, para isso usamos ```ocamlc -i <nome do arquivo>```.

Importante saber que quando usamos dune para compilar nossos arquivos não precisamos nos preocupar pois ele vai cuidar dos arquivos .mli para nós, mas quando usamos o compilador de ocaml devemos sempre especificar a compilação dos arquivos .mli antes dos seus respectivos .ml por ex:

```
$ ocamlc moduloa.mli moduloa.ml
```

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#ind%C3%ADce">🔝 Subir para o topo</a></p>

### Tipos Abstratos

Não incomum que nossos módulos em OCaml contenham a definição de novos tipos. E como funciona a exposição de novos tipos? Bem para isso vamos imaginar que estamos criando agora um arquivo **modulob.ml** que vai conter um novo tipo data:

```ocaml
type data = {dia: int; mes: int; ano: int}
```

Quando formos escrever nosso **modulob.mli** vamos ter quatro opções de como expor isso na interface no nosso arquivo ```.mli```:

1. Omitindo completamente o tipo da assinatura.
2. Copiando a definição do tipo na declaração da assinatura.
3. O tipo é transformado em abstrato e apenas seu nome é declarado.
4. Os campos desse record são transformados em apenas leitura.

Nesse caso vamos estudar a opção **3** que vai ser declarada em nosso arquivo assim:
```ocaml
type data
```
Agora os usuários do módulo **Modulob** vão ser capazes de manipular expressões do tipo **date**, mas sem ter acesso aos campos desse record diretamente. Eles precisam usar as funções desse tipo que o módulo contêm. Vamos assumir que esse módulo contêm três funções, uma para criar um valor de data, outra para computar a distância entre duas datas e a outra que retorna a data em ano:

```ocaml
type data

val nova : int -> int -> int -> data

val diferenca : data -> data -> data

val anos : data -> float
```

Agora apenas as funções **nova** e **diferenca** podem criar valores do tipo data assim garantindo que não vamos ter records que quebrem a formação esperada desse tipo. Isso vai ajudar a garantir que nada que dependa de um valor desse tipo vai quebrar por conta disso. Isso faz muito sentido em uma biblioteca já que as versões subsequentes dessa biblioteca podem continuar expondo a mesma interface, enquanto internamente a implementação continue mudando inclusive as definições de tipo.

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#ind%C3%ADce">🔝 Subir para o topo</a></p>

### Submódulos

Módulos podem também conter módulos, quando temos um módulo dentro de outro chamamos essa estrutura de submódulos (submodules) ou módulos aninhados (nested modules). Quando declaramos um módulo em um arquivo, este por sua vez automaticamente torna-se um submódulo do mesmo.

A sintaxe básica para declarar um módulo é:
```ocaml
module Nome = struct
    (* valores e expressões*)
end
```

Para melhor exemplificar imagine que temos um arquivo chamado ```twitch.ml``` e nele vamos declarar um submodulo:
```ocaml
module Eduardo = struct
    let link = "https://www.twitch.tv/eduardorfs"
    let imprime () = Printf.printf "Você pode ver lives de OCaml em %s \n" link
end

let link_emelle () = Printf.printf "Você pode ver entrevistas sobre OCaml em %s \n" "https://www.twitch.tv/emelletv";

let lista_links () =
    Eduardo.imprime ();
    link_emelle ()
```

Se tentarmos acessar essas declarações de outro módulo teremos dois níveis de módulos. Podemos escrever assim:
```OCaml
let () =
    Twitch.Eduardo.imprime ();
    Twitch.link_emelle ()
```

Podemos restringir a interface de um determinado submodulo declarado em nosso arquivo. Isso é normalmente chamado de tipo de módulo (module type). A estrutura básica para isso é

```ocaml
module Nome = sig
    (* Aqui vão as assinaturas *)
end
=
struct
    (* Aqui vão os valores *)
end
```

Vamos aplicar isso no nosso arquivo ```twitch.ml```:
```ocaml
module Eduardo =  sig
  val imprime : unit -> unit
end 
= 
struct
  let link = "https://www.twitch.tv/eduardorfs"
  let imprime () = Printf.printf "Você pode ver lives de OCaml em %s \n" link
end

(* Agora link não é mais acessível a partir daqui *)

let link_emelle () = Printf.printf "Você pode ver entrevistas sobre OCaml em %s \n" "https://www.twitch.tv/emelletv";

let lista_links () =
  Eduardo.imprime ();
  link_emelle ()
```

A definição do nosso módulo ```Eduardo``` acima é equivalente a um par de arquivos ```eduardo.ml``` e ```eduardo.mli``` . Escrever isso em um único bloco de código nem sempre é elegante, é possível escrever a assinatura e as definições em blocos separados:

```ocaml
module type Eduardo_type = sig
    val imprime : unit -> unit 
end

module Eduardo : Eduardo_type = struct
    (* ... *)
end
```

A vantagem de usarmos blocos separados para declarar nossas interfaces é que elas podem ser reaproveitadas em mais de um módulo.

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#ind%C3%ADce">🔝 Subir para o topo</a></p>

### Abrindo Módulos

A maior parte do tempo nos referimos aos valores, funções e tipos em um módulo usando o acesso qualificado colocando o nome do módulo na frente do valor que está sendo acessado. Por exemplo vamos escrever ```List.map``` para nos referimos a função. Porém quando quisermos nos referir a funções em um módulo sem seu identificador usamos a palavra reservada **open**.

> A razão para preferirmos o acesso qualificado especialmente no módulo List é que isso nos ajuda a evitar conflito com valores de outros módulos que tenham o mesmo identificador, como é o caso do módulo Array que também declara a função map.

Por exemplo, se tivermos dois arquivos um **sum.ml** que contem uma simples função de soma chamada ```add```: 

**sum.ml**
```ocaml
let add x y = x + y
```

E quisermos chamá-la no nosso arquivo **main.ml** podemos tanto utilizar o acesso qualificado:

**main.ml**
```ocaml
let () = 
    let result = Sum.add 2 3 in
    print_endline (string_of_int result);
```

Quanto podemos abrir o módulo e então usar todas as definições presentes em **sum.ml** sem necessitar da qualificação:

**main.ml**
```ocaml
open Sum

let () = 
    let result = add 2 3 in
    print_endline (string_of_int result);
```

Isso parece trivial com o exemplo sendo tão simples, mas a medida que nossos programas crescem começa a tornar-se mais útil utilizar **open**. Abrir um módulo é um trade-off (uma troca) entre ter uma escrita tersa para utilizar as expressões de um módulo e ser explícito em de onde essas expressões vem e como elas se relacionam. Quanto mais módulos você abre, mais limpo o código fica, porém pode ser mais difícil de ler o código e saber de onde vem cada coisa.

Uma outra forma de abrir módulos que fica no meio termo entre essa troca é a abertura local, a principal diferença desse tipo de **open** é que ele é restrito ao escopo e existem duas formas de fazer.

A primeira é utilizando **in**:
```OCaml
let () = 
    let open Sum in
    let result = add 2 3 in
    print_endline (string_of_int result);
```

A outra ainda mais restrita que utilizando **in** pois restringe o escopo dentro de parênteses e é muito útil quando temos pequenas expressões que precisamos.
```OCaml
let () = 
    let result = Sum.(add 2 3) in
    print_endline (string_of_int result);
```

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#ind%C3%ADce">🔝 Subir para o topo</a></p>

### Extendendo Módulos e Assinaturas

Quando trabalhamos com módulos podemos criar novos módulos que estendem os preexistentes, ou seja, eles recebem todas as características declaradas no outro módulo mais as que o usuário define, isso é próximo do conceito de "herança" ou "mixin" em outras linguagens.

> O uso de **include** é desaconselhado pois gera duplicação de código como copy-paste em um nível de compilação.

Digamos que estamos usando o módulo presente no ambiente padrão de OCaml **List**, mas o que realmente queremos é criar uma função que faça parte de List, para isso criamos um arquivo ```extension.ml``` onde vamos usar a palavra reservada **include** para incluir a definição do módulo List no nosso novo modulo List e declarar a nossa função junto a esse:
```ocaml
module List = struct
    include List
    let rec optmap f = function
      | [] -> []
      | hd :: tl ->
         match f hd with
         | None -> optmap f tl
         | Some x -> x :: optmap f tl
  end;;
```

Isso vai criar um módulo ```Extension.List``` que vai ter um módulo que contêm tudo o que tem no módulo base de **List** e mais a função **optmap**. De outro arquivo podemos abrir o módulo Extension e utilizar a nova definição de List:

```OCaml
open Extensions

...

List.optmap ...
```

Assim como usamos a palavra **include** para estender módulos, também podemos usá-la para estender assinaturas:
```ocaml
module type Pessoa = sig
    val nome : string
    val altura : float
end

module type Pessoa_com_idade = sig
    include A
    val idade : int
end
```

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#ind%C3%ADce">🔝 Subir para o topo</a></p>

## Erros Comuns com Módulos

Quando OCaml compila um programa com uma extensão ```ml``` e um com a extensão ```mli``` vai haver erros caso haja algo fora de lugar do esperado com um ou com outro. Na maioria das vezes será um dos erros a seguir.

- **Type Mismatch**: O erro mais comum de acontecer. Acontece quando alguma das assinaturas no arquivo mli não bate com a implementação declarada no arquivo ml.

- **Missing Definition**: Acontece quando compilamos ambos arquivos mli e ml, porém falta uma das implementações definidas nas assinaturas do arquivo mli no arquivo ml.

- **Type Definition Mismatch**: Os tipos declarados no arquivo mli não estão batendo com os tipos da implementação no arquivo ml.

- **Cyclic Dependencies**: OCaml não permite dependências ciclicas (quando duas definições dependem uma da outra mutuamente). Caso haja dependência cíclica entre dois módulos isso irá causar um erro.

## Projetando Módulos

O sistema de módulos é uma das principais partes da arquitetura de qualquer programa OCaml e por isso é necessário que sejam projetados da forma mais eficiente possível. Vamos ver alguns conceitos que vão ajudar a projetar programas utilizando o sistema de módulos.

### Raramente exponha tipos concretos

Quando estiver estruturando um arquivo .mli, uma das escolhas que você precisa fazer é expor ou não a definição concreta dos tipos em seu módulo ou expor eles como tipos abstratos. Na maioria das vezes, tipos abstratos é a escolha correta por duas razões:

1. Tipos abstratos aumentam a flexibilidade do seu código.
2. Tipos abstratos permitem impor como o tipo deve usado.

Abstração aumenta a flexibilidade do código restringindo como os usuários do seu módulo vão interagir com os tipos, reduzindo o número de formas que os usuários podem criar dependências com a implementação. Se você optar por expor de forma explícita os tipos, os usuários podem depender de qualquer e todo detalhe que está exposto Se você expô-los de forma abstrata então apenas as operações específicas expostas serão disponíveis. Isso significa que você pode tranquilamente mudar a implementação sem afetar o que o cliente está consumindo enquanto você preservar as definições.

### Projete para quem está chamando

Quando estiver escrevendo uma interface você deve considerar o quão será fácil para alguém entender essa interface quando estiver lendo o seu arquivo mli. Você quer que cada chamada tenha uma assinatura óbvia para quem vai consumir essas expressões sejam elas tipos, valores ou funções.

A razão para isso na maioria das vezes é que as pessoas interagindo com a sua API vão estar lendo e modificando o próprio código e não lendo a definição da interface. Fazendo a API ser o mais óbvia o possível por essa perspectiva você está facilitando para as pessoas que estão consumindo.

Você pode fazer isso por exemplo escolhendo bons nomes descritivos para suas funções, tipos variantes e records. Bons nomes geralmente não precisam ser longuíssimos para serem claros. Por exemplo é perfeitamente claro usar x para nomear variáveis em funções anônimas ex: ```(fun x -> x *. x)```. Uma boa regra para se seguir quando está criando o nome de funções para seu programa é que quanto menor o escopo, menor o nome e quanto mais global mais longo e explícito o nome precisa ser.

Outra dica é que quanto menos usado um valor é, maior vantagem em utilizar nomes explícitos e verbosos, uma vez em que o custo de ser verboso diminui e a vantagem de ser explicito aumenta.

### Crie interfaces uniformes

Quando estamos desenvolvendo uma interface não devemos pensá-la de forma isolada. Normalmente nossas interfaces representam valores que interagem com o código e com outras interfaces e isso deve funcionar de forma natural. Normalmente isso torna-se um trabalho mais fácil quando utilizamos convenções ou padrões de interface, o que torna mais fácil consumi-las e trabalhar com elas.

Algumas convenções bastante usadas:

- Um módulo para *praticamente* todo tipo na nossa aplicação. Normalmente construímos um módulo para cada tipo que definimos na nossa aplicação e exportamos o tipo primário do módulo com o nome **t**.

- *Sempre colocamos **t** primeiro*. Se o nosso módulo hipotético chamado ```M``` no qual o tipo primário é ```M.t``` possui funções que usam valor do tipo ```M.t``` colocamos sempre esses valor como o primeiro.

Também existem padrões e convenções sobre funções comumente utilizadas e reescritas frequentemente em módulos, como a função map. A assinatura de map por convenção sempre utiliza tipos genéricos por convenção, isso ajuda a termos uma maior uniformidade, mas esse tipo de convenção específica você consegue aprender com experiência a medida em que acumular prática consumindo interfaces. No momento concentre-se em aprender as duas convenções acima.

### Interface antes da implementação

OCaml é uma linguagem muito concisa e que possui muita flexibilidade com tipos e design de código. Uma das principais tarefas de um programa OCaml bem escrito é a implementação utilizar de forma correta e segura tipos, por isso é importante que a gente pense os tipos que nosso programa usa com cuidado.

Um bom método para isso é escrever as definições de tipo antes da implementação da lógica, tanto escrevendo primeiro a assinatura quando estamos trabalhando com submódulos quanto escrevendo os nossos arquivos ```.mli``` antes dos ```.ml```.

Claro que você não precisa ser estritamente rígido com essa regra, é normal por vezes que seja mais prático escrever primeiro a lógica, principalmente quando estamos prototipando coisas onde nossos parâmetros e valores não são bem definidos. Mas tipos e assinaturas são as ferramentas mais importantes que OCaml nos provê para construir a estrutura do nosso código de uma forma que seja clara o que estamos buscando atingir com nosso código.

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#ind%C3%ADce">🔝 Subir para o topo</a></p>

## Functors

Módulos podem ser passados como funções. Isso é equivalente ao conceito de funções de primeira classe que vimos no capítulo sobre funções. Porém, módulos são intrinsecamente diferentes de funções normais. Ao invés de passarmos eles como funções normais, nós utilizamos funções especiais chamadas **Functors**.

> Na matemática, mais precisamente teoria das categorias, um functor ou funtor é um mapeamento entre categorias, preservando domínios, contradomínios, identidades e composições, analogamente a como, por exemplo, um homomorfismo de grupos preserva o elemento neutro e a operação do grupo.

A principal diferença que temos nos functors é que essas funções recebem módulos como parâmetros e também retornam módulos, somente. Functors nos permitem criar módulos parametrizados e prover um módulo a outro que recebe a implementação. 

Digamos que temos uma assinatura do módulo ```Stringable``` definida, sendo que essa assinatura define a exposição de um tipo abstrato **t** e uma função **toString** que recebe um valor **t** e retorna uma string:

```ocaml
module type Stringable  = sig 
    type t 
    val toString : t -> string 
end

```

E queremos criar um functor que vai receber essa assinatura e utilizar os tipos definidos nessa interface para declarar duas funções parametrizadas que vão utilizar os tipos dessa interface:

```ocaml
module Printer (Item:Stringable) = struct
    let print (t : Item.t) = print_endline (Item.toString t)
    let printList (list : Item.t list) =
      ((list |> (List.map Item.toString)) |>
         (String.concat ((", ") )))
        |> print_endline
end
```

Agora podemos usar esse functor passando um módulo que implementa essa interface como parâmetro e passando as implementações concretas desse tipo:
```ocaml
module IntPrinter = Printer (struct 
    type t = int
    let toString = string_of_int end)
```
O functor irá nos retornar uma implementação concreta de um módulo que será atribuída para o módulo **IntPrinter** que além de conter os tipos do módulo passado como parâmetro para o functor também vai conter as funções que foram declaradas paramétricamente em sua definição.
```ocaml
IntPrinter.printList [1; 2; 3];;
(* 1, 2, 3 
   - : unit = () *)

IntPrinter.print 10;;
(* 10
   - : unit = () *)
```

E agora podemos usar esse functor para gerar a implementação de outros módulos que implementam a mesma assinatura:
```ocaml
module FloatPrinter = Printer (struct 
    type t = float
    let toString = string_of_float end)

FloatPrinter.printList [1.3; 5.6; 9.7];;
(* 1.3, 5.6, 9.7
   - : unit = () *)
```

Obviamente, o functor assim como o restante em OCaml tem uma forte checagem para garantir que o módulo passado corresponde a implementação da interface usada como parâmetro e se tentarmos passar um módulo que não atenda essa definição: 
```ocaml
 module FalsePrinter = Printer (struct 
      let toString = 1 end);;
```

Teremos um erro:
```
Error: Signature mismatch:
       Modules do not match:
        sig val toString : int end
       is not included in
        Stringable
       The type `t' is required but not provided
```

Functors nos ajudam a parametrizar nossas aplicações e modelar melhores módulos, além de permitir um grande reaproveitamento de código usá-los da forma correta pode ser útil para resolver vários problemas de estrutura de código incluindo:

- **Injeção de dependência** Pois fazem que a implementação de alguns componentes sejam cambiáveis. Isso é particularmente útil quando a intenção é prototipar partes do sistema para testes e simulações.

- **Autoextensão de módulos** Functors nos proveem uma forma de estender nossos módulos com novas funcionalidades de uma forma padronizada. Functors nos permitem escrever a lógica apenas uma vez e reaplicá-la e como vimos anteriormente podemos usar **include** para fazer isso, mas certamente functors podem nos prover isso de forma mais organizada e eficiente.

- **Instanciar módulos com estado** Módulos podem conter estados mutáveis, isso significa que algumas vezes pode ser útil ter múltiplas instâncias de um módulo em particular, cada um com seu estado individual. Functors nos permitem automatizar a construção desses módulos.

Essas são algumas dessas aplicações, existem muitas outras que são possibilitadas com a utilização de Functors e que você pode encontrar em codebases OCaml.

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#ind%C3%ADce">🔝 Subir para o topo</a></p>

## Módulos de primeira-classe

Você pode pensar no OCaml como sendo dividido em duas partes: uma linguagem que se preocupa com valores e tipos e uma linguagem que se preocupa com módulos e assinaturas de módulo. Essas sublinguagens são separadas, em que os módulos podem conter tipos e valores, mas os valores comuns não podem conter módulos ou tipos de módulo. Isso significa que você não pode fazer coisas como definir uma variável cujo valor é um módulo ou uma função que recebe um módulo como argumento.

OCaml fornece uma maneira de contornar essa separação na forma de módulos de primeira classe. Módulos de primeira classe são valores comuns que podem ser criados e convertidos de volta em módulos regulares.

Módulos de primeira classe são uma técnica sofisticada e você precisará se familiarizar com alguns aspectos avançados da linguagem para usá-los de forma eficaz. Mas vale a pena aprender, porque deixar os módulos na linguagem central é bastante poderoso, aumentando o alcance do que você pode expressar e tornando mais fácil construir sistemas flexíveis e modulares.

### Construindo módulos de Primeira Classe

Para melhor entender esse conceito, digamos que temos uma assinatura de um módulo que apenas contem um tipo inteiro:
```ocaml
module type IntValue = sig
    val value : int
end
```
Nós podemos criar um módulo que implemente essa assinatura:
```ocaml
module Tres : IntValue = struct
    let value = 3
end
```

Para construir um módulo de primeira classe devemos empacotar o módulo e sua assinatura. Isso é feito utilizando a palavra reservada **module** nessa estrutura:
```
(module <Nome> :  <Tipo>)
```

Por exemplo para nosso exemplo que definimos acima isso seria feito da seguinte forma:
```ocaml
let tres = (module Tres : IntValue);;
(* val tres : (module IntValue) = <module> *)
```

O tipo do módulo é opcional na construção de um módulo de primeira classe quando ele pode ser inferido pelo conteúdo:
```ocaml
module Quatro = struct let value = 4 end ;;
(* module Quatro : sig val value : int end *)
```

Quando empacotamos módulos podemos utilizá-los como valores, por exemplo em listas:
```ocaml
let numeros = [tres; (module Quatro)];;
(* val numeros : (module IntValue) list = [<module>; <module>] *)
```

Também podemos usar **módulos anônimos** para criar módulos de primeira classe, podemos definir um módulo anônimos em OCaml utilizamos a estrutura:
```
(module struct <let...> end)
```
Por exemplo:
```ocaml
let numeros = [tres; (module struct let value = 5 end)] ;;
(* val numeros : (module IntValue) list = [<module>; <module>] *)
```
> Observe que foi inferido que o módulo anônimo na lista trata-se de uma implementação de **IntValue** pelo compilador. Se tentássemos declarar como um módulo que não há assinatura, teríamos um erro.

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#ind%C3%ADce">🔝 Subir para o topo</a></p>

### Acessando módulos de primeira classe

Podemos acessar o conteúdo de módulos de primeira classe quando os desempacotamos em módulos normais. Para fazer isso usamos a palavra reservada **val** com a seguinte estrutura:
```
(val <Modulo> : <Tipo do modulo>)
```
Por exemplo:
```ocaml
module Outro_tres = (val tres : IntValue) ;;
(* module Outro_tres : IntValue *)

Outro_tres.value ;;
(* - : int = 3 *)
```

Nós também podemos escrever funções que consomem e produzem módulos de primeira classe. 

```ocaml
let to_int input_module =
  let module M = (val input_module : IntValue) in
  M.value
(* val to_int : (module IntValue) -> int = <fun> *)

let soma first_module second_module = 
    (module struct 
        let value = to_int first_module + to_int second_module
    end : IntValue)
(* val soma : (module IntValue) -> (module IntValue) -> (module IntValue) = <fun> *)
```

Agora podemos usar essas funções para trabalhar definindo novos módulos:
```ocaml
let seis = soma tres tres;;
(* val seis : (module IntValue) = <module> *)
```

E podemos perceber que quando desempacotarmos nosso módulo seu valor passa a ser o retornado pela nossa função.

### Você pode viver sem módulos de primeira classe

Módulos de primeira classe é um conceito avançado da linguagem e ele serve como atalho e uma forma de facilitar a solução de problemas específicos. Porém é importante que você saiba que tudo que pode ser feito usando módulos de primeira classe, pode ser feito sem usar módulos de primeira classe.

Especialmente quando estamos trabalhando em projetos pequenos e/ou de baixa complexidade talvez eles nem mesmo sejam necessários de nenhuma forma. Por isso sempre leve em consideração quando estiver escrevendo seus módulos o trade off de ganho x aumento de complexidade que técnicas como essa oferecem.

<p align="right"><a href="https://github.com/Camilotk/ocaml4noobs/tree/master/4%20-%20organizacao#ind%C3%ADce">🔝 Subir para o topo</a></p>

## Materiais Complementares e Referências
- [Ponto de entrada](https://translate.google.com/translate?sl=en&tl=pt&u=https://en.wikipedia.org/wiki/Entry_point%23OCaml)
- [Functor](https://pt.wikipedia.org/wiki/Functor)
- [Cidadões de primeira classe](https://pt.wikipedia.org/wiki/Cidad%C3%A3o_de_primeira_classe)
- [Função de primeira classe](https://pt.wikipedia.org/wiki/Fun%C3%A7%C3%A3o_de_primeira_classe)
- [Diferença de functors em Haskell e OCaml](https://try2explore.com/questions/pt/10341180)

#### E por enquanto, é só nos vemos no próximo [Capítulo](https://github.com/Camilotk/ocaml4noobs/tree/master/5%20-%20tipos)! 😉
