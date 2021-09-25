# Tipos

Anteriormente trabalhamos com diversos tipos de dados em OCaml, desde os mais básicos, coleções e também tipos que nós mesmos construímos. Agora vamos explorar um pouco mais os tipos que estão presentes na linguagem e complementar o conhecimento sobre tipos falando também sobre Pattern Matching, tratamento de erros e falar um pouco sobre os tipos que ainda não vimos, fechando o conteúdo teórico sobre o básico da linguagem.

## Pattern Matching

Já utilizamos Pattern Matching várias partes desse tutorial, vamos ver agora um pouco mais em detalhe sobre como utilizar pattern match em nosso código OCaml. Essa é uma ferramenta poderosa, OCaml nos permite utilizar pattern match para capturar valores através do padrão que pode ser inferido pela equalidade estrutural (que vimos anteriormente) do dado. Podemos utilizar pattern match em praticamente qualquer estrutura da linguagem:

- Constantes 
> E podemos pensar qualquer valor **let** (Ex. let a = 1) como um pattern match de uma constante a um identificador. 
- Tuplas
- Records
- Casos das Discriminated Unions
- Lists
- Arrays
- Tipos
- null

Aqui temos um Pattern Match simples:
```OCaml
let (a, b) = (1,2)
(* val a : int = 1 *)
(* val b : int = 2 *)
```
Esse tipo de Pattern Match é chamado também de desestruturação. A estrutura desestruturada à esquerda é inferida os valores da estrutura à direita, ou seja o valor 1 será identificado pelo identificador a e o valor 2 será identificado pelo identificador b. 

Em funções isso também é possível. Aqui temos uma função que recebe um valor do tipo Tuple, o primeiro item da tupla recebe o nome do parâmetro f e o segundo recebe s, por fim a função então adiciona os dois valores:

```OCaml
let addPair (f, s) = 
    f + s;;
(* val addPair : int * int -> int = <fun> *)
```
> Obs aqui está sendo inferido o tipo de cada elemento da tupla por os mesmos serem aplicados na função **+**.

No exemplo abaixo temos também um pattern match com a mesma tupla:
```Ocaml
let addPair p = 
    match p with
    | (f, 0) -> f
    | (0, s) -> s
    | (f, s) -> f + s

(* val addPair : int * int -> int = <fun> *)
```
Mas agora estamos usando a palavra reservada **match** para fazermos o pattern match dos nossos valores e isso nos permite especificar múltiplos valores que esse paramêtro pode conter e atribuir um retorno de acordo com o parâmetro recebido, nesse caso o primeiro padrão encontrado que for possível inferir a entrada vai ser o retorno que a expressão irá tomar. 

Nesse nosso exemplo, temos os seguintes matchs:
> Obs: Sendo uma função que retorna a adição dos elementos no par, qualquer soma de dois números que contenha 0 sempre resulta no valor do outro número.
1. Caso seja passado um número como primeiro elemento e 0, então devido a propriedade acima retornamos o número passado.
2. Caso seja passado 0 e então um número como segundo elemento, pela mesma propriedade somente retornamos o número passado.
3. Caso seja passado dois números diferentes de 0, então retornamos a soma de ambos.
> E se for passado (0,0)? Nesse caso o pattern match irá inferir o primeiro caso e retornar 0, como esperado.

> **Que tal testar no REPL?**

O próximo exemplo demonstra que as ramificações (branches) da expressão match podem conter predicados depois da palavra chave.
```OCaml
let fizzbuzzer i =
    match i with
        | _ when i mod 3 = 0 && i % 5 = 0 -> "fizzbuzz"
        | _ when i mod 3 = 0 -> "fizz"
        | _ when i mod 5 = 0 -> "buzz"
        | _ -> string_of_int i;;
(* val fizzbuzzer : int -> string = <fun> *)

[1; 2; 3; 4; 5; 6; 7; 8] |> List.map fizzbuzzer
(*
- : string list = ["1"; "2"; "fizz"; "4"; "buzz"; "fizz"; "7"; "8"]
*)
```
Esse exemplo é uma solução do problema "fizzbuzz" que imprime uma sequência de inteiros substituindo qualquer número divisível por 3 por "fizz" e qualquer número divisível por 5 por "buzz" e todo número divisível por ambos por "fizzbuzz".

Os valores estão sendo comparados / inferidos com underline **_** (chamado de wildcard pattern ou "coringa" em uma tradução não literal) que significa que nós não precisamos de um padrão aqui já que não pretendemos utilizar o valor que está sendo comparado para nada. Cada um dos testes faz teste se o valor i é divisivel por 3, 5 ou ambos e caso seja é retornado a mensagem esperado, caso não é utilizado um match descartando o valor e sem predicado que retorna i convertido em string, isso é necessário porque o compilador exige que todas as ramificações desse pattern retornem o mesmo tipo.

## Exception

Exceptions não são incomuns na maioria das linguagens, se você já estudou outra linguagem anteriormente é muito provável que você já conheça o que são e como funcionam. Em OCaml também temmos exceptions e a biblioteca padrão utiliza-os bastante para tratar erros.

Quer um exemplo? Tente executar ` 5 / 0 ` no REPL.

Veremos mais a frente que não utilizamos com muita frequência exceptions quando trabalhamos de forma funcional em OCaml e que para o tratamento de erros normalmente utilizamos o sistema de tipos para tratar eventuais erros nos nossos programas, mas como exceptions são uma feature e são utilizadas para tratar erros presentes no core da linguagem é importante que saibamos trabalhar com exceptions em OCaml.

Para lançar uma exception usamos a função da stdlib **failwith**:
```OCaml
failwith "Deu ruim primos!";;
(* Exception: (Failure "Deu ruim primos!") *)

(failwith);;
(*  - : string -> 'a = <fun> *)
```

As exceções pertencem ao tipo `exn` (um sum type / discriminated union) que pode ser extendido e podemos utilizar a função **raise** da biblioteca principal que recebe um `exn` e retorna uma exceção:
```OCaml
exception MinhaException of string;;

let funcao_com_falha () =
    raise (MinhaException "É não deu!");;
(* val funcao_com_falha : unit -> 'a = <fun> *)

funcao_com_falha ();;
(* Exception: MinhaException "É não deu!". *)
```

E podemos utilizar Pattern Match para capturar exceções específicas:
```F#
try
    failwith "Ah não!"
with
    | Failure msg -> Printf.sprintf "Failed with %s" msg
```

## Tratando erros sem exceções

Em OCaml como utilizamos programação funcional no entanto, buscamos trabalhar construindo funções que possam receber qualquer entrada válida para o tipo definido como entrada na assinatura da função e também que a função possa retornar qualquer valor que seja válido dentro do tipo declarado na nossa função e isso é um problema quando temos exceções.

Para entender digamos que temos a seguinte função:
```OCaml
let divide a b = a / b;;
(* val divide : int -> int -> int = <fun> *)
```

Podemos saber pela assinatura que essa função:
- Recebe dois valores inteiros: a e b, então a mesma deve receber apenas valores contidos no Conjunto dos Números Inteiros (I).
- Retorna também um número inteiro, ou seja, seu valor retornado também deve ser um valor válido dentro do Conjunto I.

Quando fazemos a divisão de 15 por 5, podemos notar que isso é válido. 
```OCaml
divide 15 5;;
(* - : int = 3 *)
```

Mas se tentarmos fazer uma divisão por 0, como vimos anteriormente vamos ter uma exceção que irá violar o contrato uma vez que a mesma não é um inteiro:
```OCaml
divide 15 0;;
(* Exception: Division_by_zero. *)
```

É comum que ao ouvir isso uma pessoa que é muito acostumada a trabalhar com exceções diga: `Mas e daí?` e para responder isso vamos retomar um pouco o que vimos sobre funções anteriormente e como elas funcionam.

Sabemos pela definição de função que vimos anteriormente que funções são definidas por suas entradas e suas saídas. Isso é bastante importante porque quando trabalhamos de forma funcional utilizamos a composição de funções simples para criar programas que resolvem problemas complexos, ou seja, não é incomum que façamos a combinação de duas funções utilizando o retorno de uma como parâmetro de outra.

Digamos que `f` e `g` são funções, então se a saída de `f` for compatível com a entrada de  `g` podemos compô-las em uma função... `f.g`. Isso nos permite construir funcionalidades complexas pela combinação de peças simples e nos permite um grande grau de reuso desse nosso código. 

Todavia, para que isso funcione as funções devem ser sem efeitos colaterais, elas não podem disparar exceções ou produzir quelaquer outro efeito que não seja seu valor de saída. 

Para que isso seja possível é necessário que nós embutirmos esses efeitos colaterais na saída da função. Por exemplo, se não queremos disparar uma exceção quando um erro é encontrado então a nossa função precisa retornar um tipo que é capaz de representar um erro ou um sucesso.

Em OCaml utilizamos o tipo `Option` e o tipo `Result`.

## Option

Imagine que você criou uma função que busca um usuário no Banco de Dados, existem apenas dois retornos possíveis a isso:

1. O usuário foi encontrado.
2. Ele não foi encontrado.

Se o resultado da nossa função precisa ser inteiramente incluido no tipo retornado da nossa função então precisamos de uma função que represente esse valor opcional. (Imagine que nossa função tenha como retorno o tipo `User` não podemos retornar `unit` caso nenhum valor seja encontrado porque isso violaria o contrato). Esse é um exemplo clássico uma vez em que a principal função de um Option é justamente representar a existência ou não de um valor.

Em OCaml esse tipo é chamado de **Option**. 
- Para criar uma instância de Option com um valor usamos o construtor **Some**
- Para criar uma instância de Option sem um valor usamos o construtor **None**.

A função **find_opt** recebe uma lista (nesse caso a lista xs passada como parâmetro) e uma função e retorna o primeiro resultado que for filtradpo (tiver um retorno **true**) como Some, caso nenhum retorne então retorna None. Nesse caso passamos uma função que testa se o número é impar e caso seja retorna esse valor como Some.

```OCaml
let primeiro_impar xs =
    List.find_opt (fun x -> x mod 2 = 1) xs;;
(* val primeiro_impar : int list -> int option = <fun> *)

primeiro_impar [2;4;6];;
(* - : int option = None *)
primeiro_impar [2;4;5;6;7];;
(* - : int option = Some 5 *)
```

Option é uma Discriminated Union e tudo o que se aplica a Unions também se aplica a Option, inclusive a forma de usar Pattern Match que é usado para determinar se existe um valor e para desestruturar (retirar) esse valor.  

Caso fossemos definir nós mesmos uma Discriminated Union para representar um option escreveriámos:

```OCaml
(* declarar como option' com ' pois option já existe *)
type 'a option' = 
    | Some of 'a
    | None;;
(* type 'a option' = Some of 'a | None *)

Some "a";;
(* - : string option' = Some "a" *)
```

## Result

OCaml tem no módulo padrão um tipo chamado Result, esse tipo é construído para representar uma computação que resulta em um sucesso ou erro. Result é um variant / sum type / union que contêm dois construtoes sendo eles **Ok** que representa um sucesso e **Error** que representa um erro e utilizamos esse tipo para o retorno de valores que podem resultar em um erro.

Caso fóssemos escrever o nosso próprio result teríamos algo assim:
```OCaml
type ('a, 'b) result =
  | Ok of 'a
  | Error of 'b
```
Um valor `Ok x` significa que a função executou sem erros e teve retorno x e um valor `Error e` significa que aconteceu um erro e que esse erro tem a mensagem e. Utilizamos Pattern Match como utilizariamos com qualquer outra variant / sum type para fazer o tratamento e extrair a informação em ambos casos.  A vantagem de utilizarmos esse tipo de abordagem é que encapsulamos os erros no tipo do retorno sem quebrarmos o contrato de tipos.

Para um exemplo de como utilizar Result, digamos que temos uma requisição que queremos tratar e que ela possua nome e email. Vamos começar a compor uma função de que valida o nome utilizando Result type:
```OCaml
type request =
      { name: string;
        email: string };;
(* type request = { name : string; email : string; } *)


let validate_name request =
    match request.name with
    | "" -> Error "Nome não pode ser vazio."
    | "X Æ A-12" -> Error "Não tem como validar isso."
    | "Douglas" -> Error "Eu sou o Dougras, você não é o Dougras."
    | _ -> Ok request;;
(* val validate_name : request -> (request, string) result = <fun> *)


validate_name { name = "X Æ A-12"; email = "xeaea12@tesla.com" };;
(* - : (request, string) result = Error "Não tem como validar isso." *)
validate_name { name = "Camilo"; email = "camilotk@gmail.com" };;
(* - : (request, string) result =
Ok {name = "Camilo"; email = "camilotk@gmail.com"} *)
```

Como explicamos anteriormente usar Exceptions causa problemas quando trabalhamos com combinação de funções e uma das nossas maiores motivações para utilizar result é justamente para fazer isso... então, Result types podem ser combinados utilizando muitas funções do módulo padrão `Result` como `map`, `>>=`, etc...

Digamos que agora queremos validar a nossa requisição por completo:
```OCaml
let validate_email request =
    match request.email with
    | "" -> Error "Email está vazio."
    | _ -> Ok request;;
(* val validate_email : request -> (request, string) result = <fun> *)

let validate_request result =
    Result.(bind (Result.bind result validate_name) validate_email);;
(* val validate_request : (request, string) result -> (request, string) result =
  <fun> *)
```

Agora vamos criar uma requisição e fazer pattern match no result:
```OCaml
let first_request = { name = "Camilo"; email = "camilotk@gmail.com" };;
(* val first_request : request = {name = "Camilo"; email = "camilotk@gmail.com"} *)
let response = validate_request (Ok first_request);;
(* val response : (request, string) result =
  Ok {name = "Camilo"; email = "camilotk@gmail.com"} *)

match response with
| Ok request -> Printf.sprintf "Valido! O nome é %s e o  email %s" request.name request.email
| Error e -> Printf.sprintf "Erro %s" e;;
(* - : string = "Valido! O nome é Camilo e o  email camilotk@gmail.com" *)
```

E isso também vai funcionar para quando temos um erro:
```OCaml
let second_request = { name = "Douglas"; email = "dougras@gmail.com" };;
(* val second_request : request = {name = "Douglas"; email = "dougras@gmail.com"} *)
let second_response = validate_request (Ok second_request);;
(* val second_response : (request, string) result =
   Error "Eu sou o Dougras, você não é o Dougras." *)

match second_response with
| Ok request -> Printf.sprintf "Valido! O nome é %s e o  email %s" request.name request.email
| Error e -> Printf.sprintf "Erro %s" e;;
(* - : string = "Erro Eu sou o Dougras, você não é o Dougras." *)
```

Como podemos perceber é muito fácil de encadear funções quando utilizamos Result como retorno. Isso nos permite trabalhar com pequenas funções que são combináveis em funções maiores mais complexas. Isso também nos ajuda a melhorar a verificação de erros dos nossos programas com o uso de Pattern Match que é verificável pelo compilador.

## Sequence

Já vimos algumas das coleções de OCaml como `List` e `Array`, agora vamos ver um terceiro tipo de coleção mais abstrata que as anteriores chamada `Sequence`. Uma Sequence é muito próxima de uma List, mas com a diferença de que a Sequence opera com Lazy Evaluation o que garante que a mesma possa conter mais de um milhão de elementos, mas computando apenas os que são necessários o que nos garante um uso eficiente e econômico de memória e recursos computacionais.

Para criarmos uma Sequence usamos as funções presentes da biblioteca padrão geralmente utilizando a função `List.to_seq` para fazer:

```OCaml
let sequence = List.to_seq [1; 2; 3];;
(* val sequence : int Seq.t = <fun> *)
```

Assim como temos a função `to_seq` que cria Sequence de List temos também a função `of_seq` que nos permite converter Sequence para List:
```OCaml
let list = sequence
  |> Seq.map (fun x -> x + 1) 
  |> Seq.map (fun x -> x * 3) 
  |> List.of_seq;;
(* val list : int list = [6; 9; 12] *)
```

Quando trabalhamos com Sequences trabalhamos com coleções não ordenadas assim como Lists e por isso utilizamos Pattern Match e as funções de coleção disponíveis no módulo `Seq` para manipular Sequences.

Além das funções que conhecemos em coleções e estão presentes em `Seq` como maps, filters e folds também temos algumas funções de criação que são utilizadas especificamente com Sequences:
```OCaml
(* Cria uma Sequence vazia *)
let nova_sequence = Seq.empty;;
(* val nova_sequence : 'a Seq.t = <fun> *)

let seq_combinadas = Seq.append nova_sequence sequence;;
(* val seq_combinadas : int Seq.t = <fun> *)

seq_combinadas |> List.of_seq;;
(* - : int list = [1; 2; 3] *)
```

