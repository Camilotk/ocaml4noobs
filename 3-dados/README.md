# Dados
Depois de funções, a coisa mais importante para se entender sobre OCaml (e outras linguagens similares) é dados. Nesse Capítulo vamos dar uma olhada nos tipos de dados e suas extensões em OCaml e entender como trabalhar com eles e definir nossos próprios tipos.

## Tipos Pré-definidos
A bilblioteca padrão de OCaml nos traz tipos pré-definidos (que também podem ser chamados de primitivos) em sua biblioteca padrão. Esses tipos são as formas mais básicas (ou se preferir atômicas) de representação de um dado, são as unidades que são usadas para compor novos valores e tipos.

### Tipos Básicos

Abaixo temos uma tabela dos tipos mais básicos dos tipos pré-definidos em OCaml, sua escrita literal representa um exemplo de entrada usada para criar um valor do tipo descrito.

| Tipo       | Escrita Literal da Sintaxe              |
:--:         | :--:
| int        | 314                                     |
| float      | 3.14 ou 6.                              |
| char       | 'B' ou '\u0042'                         |
| string     | "Foo"                                   |
| bool       | true ou false                           |
| unit       | ()                                      |
| 'a list    | [1; 2]                                  |
| 'a array   | [| 1; 2 |]                              |
| tuple      | ("Capítulos", 3)                        |
| records    | { x = 5; y = 9 }                        |
| union      | type Dia = Segunda_Feira \| Terca_Feira |


## Int

OCaml tem suporte a inteiros de tamanho fixo de bytes, sendo o tamanho em bits do valor inteiro dois bits menor do que o inteiro nativo na máquina (62 bits na maioria dos computadores modernos). A biblioteca padrão também possui módulos de inteiros com o tamanho fixado de inteiros para 32-bit e 64-bit que podem ser usados em qualquer máquina caso o programador tenha como alvo uma arquitetura específica, apesar dos inteiros nesses módulos terem um tamanho maior eles são úteis quando o programador precisa fazer comunicação com outras linguagens como C.

A escrita literal de inteiros acontece da mesma forma que a sua escrita usual.

Ex: `1`, `2`, `-3`, `-34567`

O caractere "Underline" _ pode ser usado como separador (e será ignorado) na escrita literal de números grandes.

Ex: `19_474_489`, `545_690`

Os números inteiros geralmente são escritos na base 10 como padrão, mas também podem ser escritos na base 2, 8 ou 16 normalmente como no exemplo abaixo.

`26` = `0b11010` = `0o32` = `0x1A`

> Cada um dos valores nas bases 2, 8 e 16 começa com um `0` seguido do caractere que representa a flag da base que está sendo usada (`o` para octal, `b` para binário, `x` para hexadecimal) e eles podem ser usados em maiúscula também (`O`, `B` e `X`).

## Float

Os valores de tipo `float`ou ponto flutuante em OCaml seguem o padrão definido no documento IEEE 754, possuem precisão de 64-bits. As operações com floats nunca causam exceções quando acontece estouro, divisão por zero, etc. Ao invés disso, caracteres pré-definidos no padrão IEEE são retornados indicando o que aconteceu de acordo com o retorno, por exemplo se tentarmos fazer a divisão `1. /. 0.` no nosso REPL teremos como retorno `infinity`, teremos `-infinity` se for `-1. /. 0.` e teremos `nan` (Not a Number / Não é um número) se for `0.0 /. 0.0`.

> Observe que usamos `/.` ao invés de `/` para dividir números de ponto flutuante, isso acontece porque `/` é uma função que tem como parâmetro dois inteiros enquanto `/.` tem como parâmetro dois floats, o mesmo ocorre nas demais operações (`+.`, `-.`, `*.`).


## Conversão de Tipos Numéricos

Conversão de tipos é algo importante quando estamos programando em OCaml, pois a inferência de tipos característica da linguagem é capaz de fazer inferências inteligentes graças a sempre evitar fazer conversões implícitas entre tipos. Se tentar passar um valor para um parâmetro ou qualquer tipo de associação de valor e esse valor for diferente do esperado em nenhum momento haverá uma tentativa de conversão para que isso funcione, isso irá retornar um erro. Isso significa que quando programamos em OCaml temos que constantemente fazer conversões explícitas dos valores que estamos trabalhando e quando fazemos isso é pressuposto que sabemos exatamente o que estamos fazendo, então caso seja feita conversões equivocadas isso pode causar perda de dados ou erros fatais na aplicação.

Ex: Em PHP se tentarmos somar um inteiro e um número de ponto flutuante isso irá funcionar.
```php
<?php
echo 1.0 + 3; 
// => 4
```
Já em OCaml a função de soma apenas irá aceitar dois parâmetros float ou dois parametros int, mas nunca um de cada.
```ocaml
1 + 3;;
(* - : int = 4 *)

1. +. 3.;;
(* - : float = 4. *)

1 + 3.;;
(* Error: This expression has type float but an expression was expected of type int *)
```

Quando for necessário, podemos converter valores utilizando as funções presentes na biblioteca padrão de OCaml.
```ocaml
float_of_int 3;;
(* - : float = 3. *)

int_of_float 3.1415;;
(* - : int = 3 *)

float_of_string "3.1415";;
(* - : float = 3.1415 *)
```

## Char

Os valores do tipo `char` ou caractere são valores que representam apenas um caractere ASCII (mas existem bibliotecas que podem extender para Unicode como [Camomile](https://github.com/yoriyuki/Camomile)). A forma literal de escrita do tipo Char é usando aspas simples usando barra invertida no formato UNIX.

Ex: `'\n'`, `'a'`

## String

Os valores to tipo `string` são arrays de bytes imutáveis e indexados por valores inteiros com tamanho de até 2<sup>57</sup>-9 (18 446 744 000 000 000 000) posições na arquitetura de 64-bit. A forma literal de escrita é utilizando qualquer número de caracteres Unicode delimitados por aspas duplas.

Ex: `""`, `" "`, `"foo"`, `"tab\ndata"`, `"🦙"`

É possível quebrar linhas utilizando barra invertida seguida de espaço para delimitar a quebra de linha.

Ex:
```ocaml
let haiku = "Relax, the future \
 is already unfolding \
 from long-planted seeds."
```

### Acessando carateres em uma String

Para acessarmos os caracteres em posições de uma String podemos usar a sintaxe de acesso `.[i]` passando o índice do caractere na String que queremos acessar.

```ocaml
"4noobs".[0];;
(* - : char = '4' *)

"OCaml".[3];;
(* - : char = 'm' *)
```

### Módulo String

A biblioteca padrão de OCaml possui muitos módulos, entre eles os módulos que definem os tipos básicos da linguagem e suas operações, entre todos os tipos básicos o que possuí o maior número de operações que normalmente utilizamos é o módulo `String`.

```ocaml
String.sub "ocaml4noobs" 5 6;;
(* - : string = "4noobs" *)

String.concat "" ["ocaml"; "4"; "noobs"];;
(* - : string = "ocaml4noobs" *)

String.split_on_char '4' "ocaml4noobs";;
(* - : string list = ["ocaml"; "noobs"] *)
```

## Bool

O tipo `bool` ou  booleano representa valores lógicos, especificamente escritos na forma literal sendo um dos valores `true` ou `false`.

### Operadores Booleanos

As funções responsáveis por operações booleanas como AND, OR e NOT seguem uma sintaxe que é familiar para quem já programa em outras linguagens.

- **&&**: Função infixo "E" que recebe dois argumentos do tipo `bool` e retorna `true` caso ambos argumentos sejam do valor `true`.
- **||**: Função infixo "OU" que recebe dois argumentos do tipo `bool` e retorna `true` caso ao menos um dos argumentos seja `true`.
- **not**: Função prefixo "NÃO" que recebe um argumento do tipo `bool` e retorna o valor booleano oposto ao do argumento recebido.

## Unit

Toda expressão em OCaml deve ser avaliada para um valor, nos casos em que a expressão não tenha nenhum resultado lógico possível precisa de um tipo que satisfaça essa situação onde temos a falta de um valor e para esse caso é utilizado o tipo `unit`. Utilizamos a expressão vazia `()` para escrever o tipo de forma literal, que pode ser usada para declarar uma função sem retorno, ou uma função sem parâmetros por ex.

```ocaml
let hello () =  Printf.printf "Hello World\n";;
(* - : unit = () *)
```

## List

Uma lista é uma coleção de elementos imutáveis do mesmo tipo, sendo esse tipo qualquer tipo válido em OCaml. Isso significa que em OCaml as listas devem conter necessessariamente elementos do mesmo tipo. 

Como exemplo, se criarmos uma lista que contêm números inteiros de 1 a 3 `[1; 2; 3]` teremos inferido que essa é uma lista do tipo `int list` ou seja uma lista de inteiros, se criarmos uma lista de caracteres de 'a' a 'c' `['a'; 'b'; 'c']` vamos ter inferido que o tipo é `char list` ou seja uma lista de caracteres, mas se tentarmos criar uma lista com caracteres e inteiros como `[1; 'a'; 2; 'b']` teremos um **erro**, pois essa lista não tem um tipo que pode ser inferido.

```ocaml
(* Criando uma lista vazia em OCaml, observe que 'a é um Generic para qualquer tipo *)
[];;
(* - : 'a list = [] *)

(* Criando uma lista de floats *)
[1.5; 2.; 3.1514];;
(* - : float list = [1.5; 2.; 3.1514] *)
```

Assim como outros valores, listas também são imutáveis uma vez em que são atribuidas, isso significa que não podem ter seus elementos ou seu número de elementos alterados, para que possamos alterar uma lista através de uma função é necessário copiar essa lista e retornar a alteração no retorno dessa função como uma nova lista. Isso é valido também para as operações da biblioteca padrão de OCaml, a função de adicionar um novo elemento a lista ou `head` que utiliza o operador infixo `::`retorna uma nova lista com o elemento concatenado na primeira posição da mesma.

```ocaml
let lista_de_inteiros = [2; 3];;
(* val lista_de_inteiros : int list = [2; 3] *)

1 ::  lista_de_inteiros;;
(* - : int list = [1; 2; 3] *)
```

Em OCaml quando pensamos no tipo `list` podemos pensar em Linked Lists ou listas ligadas simples, onde cada elemento contêm um valor e a referência do próximo item. Isso tem implicações importantes de performance, especialmente quando comparamos com `array` ou outra estrutura. Isso por que dependendo a operação que precisamos fazer como por exemplo acessar o último valor implica que teremos que percorrer todos os elementos da lista.

Outra forma de se pensar é que listas são como conjuntos de elementos que são adicionados até uma lista vazia, podemos pensar que:

```ocaml
(* Se definirmos uma lista como *)
let lista_convencional = ['O'; 'C'; 'a'; 'm'; 'l'];;
(* val lista_convencional : char list = ['O'; 'C'; 'a'; 'm'; 'l'] *)

(* ela também pode ser vista como *)
let lista = ('O' :: ('C' :: ('a' :: ('m' :: ('l' :: [])))));;
(* val lista : char list = ['O'; 'C'; 'a'; 'm'; 'l'] *)

lista = lista_convencional;;
(* - : bool = true *)
```

###  Combinando Listas

Para unir duas listas utilizamos a função `List.append` que é equivalente ao operador de `@` que irá receber duas listas e nos retornar uma nova com os elementos da primeira unidos com os elementos da segunda em uma nova lista.

```ocaml
List.append [1;2;3] [4;5;6];;
(* - : int list = [1; 2; 3; 4; 5; 6] *)

[1;2] @ [2;3];;
(* - : int list = [1; 2; 2; 3] *)

['a';'b'] @ ['c';'d'];;
(* - : char list = ['a'; 'b'; 'c'; 'd'] *)
```

Também é possível concatenar listas usando a função `List.concat`.

```ocaml
List.concat [[1;2];[3;4;5];[6];[]];;
(* - : int list = [1; 2; 3; 4; 5; 6] *)
```

## Arrays

O tipo `array` ou matriz em OCaml a principio se parece com `list`, mas esses tipos possuem características diferentes de performance e enquanto o tipo `list` é estruturalmente imútavel, array tem sua estrutura mutável. A sintaxe de matrizes é a mesma de listas, porém além dos colchetes temos também pipes delimitando os itens do array.

```ocaml
let numbers = [| 1; 2; 3; 4 |] ;;
(* val numbers : int array = [|1; 2; 3; 4|] *)

numbers.(2) <- 4;;
(* - : unit = () *)

numbers;;
(* - : int array = [|1; 2; 4; 4|] *)
```

A sintaxe `.(i)` é usada para acessar a referência de um elemento em determinada posição do array e `<-` é a sintaxe para fazer a modificação no elemento. Como matrizes assim como listas são indexadas em zero, o elemento `.(2)` é o terceiro da lista.

Podemos também utilizar a sintaxe `.(i)` para acessar elementos. Diferente de listas não podemos usar o operador de head `::` para adicionar elementos.

## Tuplas

Tuplas são um grupo de valores imutáveis ordenados, as tuplas são normalmente utilizadas para armazenar resultados intermediários de cálculos, quando precisamos que uma função retorne múltiplos valores ou queremos receber pares de valores como parâmetros. Os valores em uma tupla podem ser de tipos diferentes e seus tipos são escritos em ordem separados por asterisco.

```ocaml
(1, "Camilo", 1.80, true);;
(* - : int * string * float * bool = (1, "Camilo", 1.8, true) *)
```

> Para os amantes de matemática, `*` é usado para separar os tipos `t * s` porque esse tipo corresponde ao conjunto dos pares que ligam um elemento do conjunto `t` a um elemento do conjunto `s`. Em outras palavras é um produto cartesiano entre dois tipos, esse é o motivo que se usa `*`que é o símbolo de produto.

Diferente de arrays e listas, não possuímos nenhum índice em tuplas e por tanto não podemos acessar seus valores a partir de determinada posição. Para fazer isso podemos trabalhar de duas formas.

1. A primeira é quando temos tuplas com dois elementos, nesse caso podemos utilizar a função **fst** para acessar a primeira posição e a função **snd** para acessar a segunda posição. Observe que se tivermos uma tupla com mais que dois elementos como argumento dessa função isso irá nos retornar um erro.

2. Em todos os casos restatnes, utilizamos **Pattern Matching** para acessar os elemntos da tupla.

```ocaml
fst ("ocaml4noobs", 3);;
(* - : string = "ocaml4noobs" *)

snd ("ocaml4noobs", 3);;
(* - : int = 3 *)

let (name, age, height) = ("Camilo", 26, 1.86);;
(* val name : string = "Camilo"
   val age : int = 26
   val height : float = 1.86 *)
```

