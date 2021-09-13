# Controle e Organização

## Introdução

Até aqui utilizamos bastante o REPL para fazer experimentos e aprender a usar a linguagem, mas desse capítulo em diante vamos começar a focar um pouco mais em trabalhar com arquivos e projetos e começar a construir programas. Arquivos são mais do que apenas uma forma de armazenar nossas instruções para serem compiladas ou interpretadas, em OCaml os arquivos também correspondem a **módulos** que dividem nossos programas em unidades conceituais de código.

## Main

Diferente de C ou Java não temos uma função chamada **main** por onde nossos programas começam a execução. Quando um programa OCaml é executado todas as suas instruções são avaliadas em execução. Na maioria dos scripts e programas que criamos a declaração **let () =** faz o papel da função main, mas ainda assim devemos ter a consciência que todo nosso arquivo é avaliado em execução e então de alguma forma todos os arquivos em OCaml são uma grande função main.

Parece um pouco estranho escrever **let () =**, mas isso tem um sentido. A nossa atribuição **let** faz pattern match o valor **unit**, que garante que a expressão após **=** retorne um valor igualmente unit.


## Módulos e Assinaturas

Módulos são como **mini arquivos**. Eles podem agregar diversas definições como tipos, valores, constantes, outros módulos e todas as demais coisas que podemos declarar em um arquivo.

Todo arquivo OCaml em si é compilado para um módulo com o mesmo nome do arquivo, mas capitalizado (com a sua inicial maiúscula). Se tivermos um arquivo ```ocaml.ml``` todo seu conteúdo forma um módulo chamado **Ocaml** que pode ser acessado por qualquer outro arquivo. Os conteudos de um módulo podem ser acessados por ponto **.** assim como as propriedades de um record. 

> Por convenção geralmente utilizamos nomes de arquivos inteiramentte em letras minúsculas, nomes capitalizados não causam qualquer tipo de erro ou são inválidos, mas dificilmente encontra-se programadores que utilizam essa convenção. Idependente da convenção, o nome do módulo ainda é o nome capitalizado do arquivo.

Quando escrevemos um programa OCaml que roda inteiramente no mesmo arquivo todos seus valores, funções e estruturas estão interagindo dentro desse módulo que é representado pelo nome do arquivo.

### Assinaturas e Interfaces

Quando escrevemos nosso código OCaml definimos nossas expressões da linguagem em um arquivo ```.ml``` que como vimos define implicitamente um módulo, mas digamos que queremos que um programador possa usar nossa classe sem saber necessariamente a implementação interna de nosso código e para essa situação usamos os arquivos ```.mli``` que definem **interfaces**.

> Assim como todo arquivo .ml é implicitamente um módulo, todo arquivo .mli é implicitamente uma interface.

Para isso, temos que definir uma interface de módulo, que atuará como uma máscara sobre a implementação do módulo. Para defirnirmos a interface de um módulo representado pelo arquivo ```module.ml``` devemos criar um arquivo ```module.mli```na mesma pasta, tanto o compilador padrão de OCaml, quanto dune sempre procuram por um arquivo .mli de mesmo nome que o arquivo que estão compilando e caso não o encontre vão inferir a interface para o módulo.

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

### Tipos Abstratos

Não incomum que nossos móduos em OCaml contenham a definição de novos tipos. E como funciona a exposição de novos tipos? Bem para isso vamos imaginar que estamos criando agora um arquivo **modulob.ml** que vai conter um novo tipo data:

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

Agora aprenas as funções **nova** e **diferenca** podem criar valores do tipo data assim garantindo que não vamos ter records que quebrem a formação esperada desse tipo. Isso vai ajudar a garantir que nada que dependa de um valor desse tipo vai quebrar por conta disso. Isso faz muito sentido em uma biblioteca já que as versões subsequentes dessa biblioteca podem continuar expondo a mesma interface, enquanto internamente a implementação continue mudando inclusive as definições de tipo.

### Submódulos

Módulos podem também conter módulos, quando temos um módulo dentro de outro chamamos essa estrutura de submódulos (submodules) ou módulos aninhados (nested modules). Quando declaramos um modulo em um arquivo, este por sua vez automaticamente torna-se um submódulo do mesmo.

A sintaxe básica para declarar um módulo é:
```ocaml
module Nome = struct
    (* valores e expressões*)
end
```

Para melhor exemplificar imagine que temos um arquivo chamado ```twitch.ml``` e mele vamos declarar um submodulo:
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

Se tentarmos acessar essas declarações de outro modulo teremos dois niveis de modulos. Podemos escrever assim:
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

A definição do nosso módulo ```Eduardo``` acima é equivalente a um part de arquivos ```eduardo.ml``` e ```eduardo.mli``` . Escrever isso em um único bloco de código nem sempre é elegante, é possível escrever a assinatura e as definições em blocos separados:

```ocaml
module type Eduardo_type = sig
    val imprime : unit -> unit 
end

module Eduardo : Eduardo_type = struct
    (* ... *)
end
```

A vantagem de usarmos blocos separados para declarar nossas interfaces é que elas podem ser reaproveitadas em mais de um módulo.

### Abrindo Módulos

A maior parte do tempo nos referimos aos valores, funções e tipos em um módulo usando o acesso qualificado colocando o nome do módulo na frente do valor que está sendo acessado. Por exemplo vamos escrever ```List.map``` para nos referimos a função. Porém quando quisermos nos referir a funções em um módulo sem seu identificador usamos a palavra reservada **open**.

> A razaão para preferirmos o acesso qualificado especialmente no módulo List é que isso nos ajuda a evitar conflito com valores de outros módulos que tenham o mesmo identificador, como é o caso do módulo Array que também declara a função map.

Por exemplo, se tivermos dois arquivos um **sum.ml** que contem uma simples função de soma chamada ```add```: 

**sum.ml**
```ocaml
let add x y = x + y
```

E quisermos chamá-la no nosso arquivo **main.ml** podemos tanto utlizar o acesso qualificado:

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

Isso parece trivial com o exemplo sendo tão simples, mas a medida que nossos programas crescem começa a tornar-se mais útil utilizar **open**. Abrir um módulo é um trade-off (uma troca) entre ter uma escrita tersa para utilizar as expressões de um módulo e ser explicíto em de onde essas expressões vem e como elas se relacionam. Quanto mais módulos você abre, mais limpo o código fica, porém pode ser mais dificíl de ler o código e saber de onde vem cada coisa.

Uma outra forma de abrir módulos que fica no meio termo entre essa troca é a abertura local, a principal diferença desse tipo de **open** é que ele é restrito ao escopo e existem duas formas de fazer.

A primeira é utilizando **in**:
```OCaml
let () = 
    let open Sum in
    let result = add 2 3 in
    print_endline (string_of_int result);
```

A outra ainda mais restrita que utilizando **in** pois restringe o escopo dentro de parenteses e é muito útil quando temos pequenas expressões que precisamos.
```OCaml
let () = 
    let result = Sum.(add 2 3) in
    print_endline (string_of_int result);
```

### Extendendo Módulos e Assinaturas

Quando trabalhamos com módulos podemos criar novos módulos que extendem os pré-existentes, ou seja, eles recebem todas as características declaradas no outro módulo mais as que o usuário define, isso é próximo do conceito de "herança" ou "mixin" em outras linguagens.

> O uso de **include** é desaconsealhado pois gera duplicação de código como copy-paste em um nível de compilação.

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

Assim como usamos a palavra **include** para extender módulos, também podemos usá-la para extender assinaturas:
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

## Erros Comuns com Módulos

Quando OCaml compila um programa com uma extensão ```ml``` e um com a extensão ```mli``` vai haver erros caso haja algo fora de lugar do esperado com um ou com outro. Na maioria das vezes será um dos erros a seguir.

- **Type Mismatch**: O erro mais comum de acontecer. Acontece quando alguma das assinaturas no arquivo mli não bate com a implementação declarada no arquivo ml.

- **Missing Definition**: Acontece quando compilamos ambos arquivos mli e ml, porém falta uma das implementações definidas nas assinaturas do arquivo mli no arquivo ml.

- **Type Definition Mismatch**: Os tipos declarados no arquivo mli não estão batendo com os tipos da implementação no arquivo ml.

- **Cyclic Dependencies**: OCaml não permite dependências ciclicas (quando duas definições dependem uma da outra mutuamente). Caso haja dependencia ciclica entre dois módulos isso irá causar um erro.

## Projetando Programas com Módulos

O sistema de módulos é uma das principais partes da arquitetura de qualquer programa OCaml e por isso é necessário que sejam projetados da forma mais eficiente possível. Vamos ver alguns conceitos que vão ajudar a projetar programas utilizando o sistema de módulos.

### Raramente exponha tipos concretos

Quando estiver estruturando um aquivo .mli, uma das escolhas que você precisa fazer é expor ou não a definição concreta dos tipos em seu módulo ou expor eles como tipos abstratos. Na maioria das vezes, tipos abstratos é a escolha correta por duas razões:

1. Tipos abstratos aumentam a flexibilidade do seu código.
2. Tipos abstratos permitem impor como o tipo deve usado.

Abstração aumenta a flexibilidade do código restringindo como os usuários do seu módulo vão interagir com os tipos, reduzingo o número de formas que os usuários podem criar dependências com a implementação. Se você optar por expor de forma explícita os tipos, os usuários podem depender de qualquer e todo detalhe que está exposto Se você expo-los de forma abstrata então apenas as operações específicas expostas serão disponíveis. Isso significa que você pode tranquilamente mudar a implementação sem afetar o que o cliente está consumindo enquanto você preservar as definições.

### Projete para quem está chamando

Quando estiver escrevendo uma interface você deve considerar o quão será fácil para alguém entender essa interface quando estiver lendo o seu arquivo mli. Você quer que cada chamada tenha uma assinatura óbvia para quem vai consumir essas expressões sejam elas tipos, valores ou funções.

A razão para isso na maioria das vezes é que as pessoas interagindo com a sua API vão estar lendo e modificando o próprio código e não lendo a definição da interface. Fazendo a API ser o mais óbvia o possível por essa perspectiva você está facilitando para as pessoas que estão consumindo.

Você pode fazer isso por exemplo escolhendo bons nomes descritivos para suas funções, tipos variantes e records. Bons nomes geralmente não precisam ser longuíssimos para serem claros. Por exemplo é perfeitamente claro usar x para nomear variáveis em funções anônimas ex: ```(fun x -> x *. x)```. Uma boa regra para se seguir quando está criando o nome de funções para seu programa é que quanto menor o escopo, menor o nome e quanto mais global mais longo e explícito o nome precisa ser.

Outra dica é que quanto menos usado um valor é, maior vantagem em utilizar nomes explícitos e verbosos, uma vez em que o custo de ser verboso diminui e a vantagem de ser explicito aumenta.

### Crie interfaces uniformes



### Interface antes da implementação

## Functors

## Módulos de primeira-classe
