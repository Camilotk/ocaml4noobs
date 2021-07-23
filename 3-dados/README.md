# Dados
Depois de funções, a coisa mais importante para se entender sobre OCaml (e outras linguagens similares) é dados. Nesse Capítulo vamos dar uma olhada nos tipos de dados e suas extensões em OCaml e entender como trabalhar com eles e definir nossos próprios tipos.

#### **Indíce**
- [Tipos Pré-definidos](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#tipos-pr%C3%A9-definidos)
 - [Tipos Básicos](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#tipos-b%C3%A1sicos)
 - [Int](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#int)
 - [Float](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#float)
 - [Conversão de Tipos Numéricos](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#convers%C3%A3o-de-tipos-num%C3%A9ricos)
 - [Char](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#char)
 - [String](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#string)
	 - [Acessando caracteres em uma String](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#acessando-carateres-em-uma-string)
	 - [Módulo String](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#m%C3%B3dulo-string)
 - [Bool](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#bool)
 	- [Operadores Booleanos](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#operadores-booleanos)
- [Unit](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#unit)
- [List](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#list)
	- [Combinando listas](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#combinando-listas)
- [Arrays](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#arrays)
- [Tuplas](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#tuplas)
- [Records](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#records)
 - [Valores Mutáveis](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#valores-mut%C3%A1veis)
 - [Copiando e Alterando Valores](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#copiando-e-alterando-valores)
- [Discriminated Union](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#discriminated-union)
- [Pattern Matching](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#pattern-matching)
- [Igualdade Estrutural](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#igualdade-estrutural)
- [Generics](https://github.com/Camilotk/ocaml4noobs/tree/master/3-dados#generics)


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
| 'a array   | [\| 1; 2 \|]                            |
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

Ex: `2.`, `2.0`, `1.7653`

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

## Records

Um tipo `record` representa uma coleção de valores que são armazenados como um, onde cada componente é identificado com um campo diferente de nome. A sintaxe básica para um record é a seguinte:
```
type <nome do record> =
    {
        <campo>: <tipo>;
        <campo>: <tipo>;
        ...
    }
```
> Importante: todos os campos de um record devem começar com **letra minúscula**

Aqui abaixo declaramos um record simples chamado `pessoa` como exemplo.
```ocaml
type pessoa = {
    nome: string;
    idade: int
};;
(* type pessoa = { nome : string; idade : int; } *)
```
Uma vez que declaramos o record de alguma determinada estrutura de valores e campos, podemos definir valores que terão o record que declaramos como tipo.
```ocaml
{ nome = "Camilo"; idade = 26 };;
(* - : pessoa = { nome = "Camilo"; idade = 26 } *)
```
Observe que não precisamos dizer de qual record esse valor que digitamos no REPL pertence, pois o compilador consegue inferir a partir do número de campos e seus tipos a qual record esse valor pertence.

> Caso os valores de record tenham os mesmos campos e os mesmos tipos é recomendável que estejam separados em **módulos** diferentes, que será o assunto do nosso próximo capítulo. Porém, caso queira apenas testar rapidamente tambpem é possível dar uma dica ao compilador quando temos records iguais em um mesmo espaço de qual utilizando acesso `{pessoa.nome = "Camilo"; idade = 26 }`, mas sempre dê preferência pela separação em módulos em projetos reais, isso vai evitar que alguém tente cortar seus dedos como punição.

Quando queremos acessar um valor de um record podemos usar ponto seguido do nome do campo para retornar o valor do mesmo
```ocaml
{nome = "Camilo"; idade = 26}.idade;;
(* - : int = 26 *)

let edu_rfs = {nome = "Eduardo"; idade=22};;
(* val edu_rfs : pessoa = {nome = "Eduardo"; idade = 22} *)

edu_rfs.idade;;
(* - : int = 22 *)
```

### Valores Mutáveis

Os `records` são imutáveis por padrão porém você pode criar registros que podem ter campos mutáveis utilizando a palavra `mutable` para indicar que o campo precisa ser mutável.

```ocaml
type carro = {
    modelo: string;
    ano: int;
    mutable odometro: int
};;
(* type carro = { modelo : string; ano : int; mutable odometro : int; } *)

let meu_carro = { modelo = "Gol"; ano = 2013; odometro = 198470 };;
(* val meu_carro : carro = {modelo = "Gol"; ano = 2013; odometro = 198470} *)

meu_carro.odometro <- meu_carro.odometro + 1;;
(* - : unit = () *)
```

### Copiando e Alterando Valores

Digamos que temos um valor do nosso record `pessoa` que definimos anteriormente, porém a pessoa fez aniversário e agora precisamos fazer uma atualização da sua idade. Para isso é necessário usar a função `with` que vai nos retornar um novo record com os valores dos campos que especificarmos alterados.

```ocaml
type pessoa = {
    nome: string;
    idade: int
};;
(* type pessoa = { nome : string; idade : int; } *)


let camilo = {nome = "Camilo"; idade = 25};;
(* val camilo : pessoa = {nome = "Camilo"; idade = 25} *)

{ camilo with idade = 26 };;
(* - : pessoa = {nome = "Camilo"; idade = 26} *)
```

Isso também é útil quando queremos criar uma novo valor de determinado record apenas alterando um determinado valor.

```ocaml
let ana = { camilo with nome = "Ana" };;
(* val ana : pessoa = {nome = "Ana"; idade = 25} *)
```

Ou quando queremos criar uma função que nos retorna um record com valores atualizados.
```ocaml
type carro = {
    modelo: string;
    ano: int;
    odometro: int
};;
(* type carro = { modelo : string; ano : int; mutable odometro : int; } *)

let adiciona_quilometragem (carro: carro) = { carro with odometro = carro.odometro + 1 };;
(* val adiciona_quilometragem : carro -> carro = <fun> *)

let meu_carro = { modelo = "Gol"; ano = 2013; odometro = 198470 };;
(* val meu_carro : carro = {modelo = "Gol"; ano = 2013; odometro = 198470} *)

adiciona_quilometragem meu_carro;;
(* - : carro = {modelo = "Gol"; ano = 2013; odometro = 198471} *)
```

## Discriminated Union

Programadores estão acostumados com tipos definindo a estrutura de algum dado, mas como seria se os tipos definissem um conjunto de escolhas? Uma Discriminated Union pode ter um determinado conjunto de casos e o valor de um tipo deve ser um desses casos que foram definidos. Por causa da representação de Discriminated Union é a soma de todos os casos ela também é conhecida como **Sum Types** correspondendo tipos como produtos em tuplas. 

Digamos que quiséssemos um tipo que definisse os dias da semana, poderiamos criá-lo assim:
```ocaml
type dia = Segunda_Feira 
         | Terca_Feira 
         | Quarta_Feira 
         | Quinta_Feira 
         | Sexta_Feira 
         | Sabado 
         | Domingo;;
```

Isso é um conceito parecido com Enumerações para quem vem de outras linguagens. Um valor que seja do tipo `dia` tem que ter como valor uma das opções. 

```ocaml
let dia_de_descansar = Domingo;;
(* val dia_de_descansar : dia = Domingo *)

let dias_de_estudar = [Segunda_Feira; Terca_Feira; Quarta_Feira; Quinta_Feira; Sexta_Feira];;
(* val dias_de_estudar : dia list =
  [Segunda_Feira; Terca_Feira; Quarta_Feira; Quinta_Feira; Sexta_Feira] *)
```

Discriminated Unions podem ter dados adicionais aos valores em si, o tipo desse dado pode ser qualquer outro tipo desde int, float, tuple... até records e outras discriminated unions.

```ocaml
type naipe = Espadas
           | Ouros
           | Copas
           | Paus ;;
(* type naipe = Espadas | Ouros | Copas | Paus *)

type carta = Coringa | Carta of int * naipe;;
(* type carta = Carta of int * naipe *)

Carta(1, Espadas);;
(* - : carta = Carta (1, Espadas) *)

Coringa;;
(* - : carta = Coringa *)
```

> Observe que `int * naipe` é a sintaxe para o tipo das tuplas como vimos acima, nesse caso como estamos trabalhando com definições definimos tuplas de valores dessa forma.

## Pattern Matching

Pattern Matching é utilizado para identrificar e extrair informações de praticamente qualquer tipo complexo em OCaml, entre eles listas, records, tuples. Porém, quando falamos em Discriminated Unions ambos tem uma ligação especial, pois o fato de que o compilador já sabe de antemão todas as possibilidades permite que ele faça uma checagem exaustiva se não existe nenhum caso que foi esquecido.

```ocaml
let cor_do_naipe = function
    | Copas -> "Vermelho";;

(* Warning 8 [partial-match]: this pattern-matching is not exhaustive. Here is an example of a case that is not matched: (Espadas|Ouros|Paus) *)
```

Esse aconteceu porque esquecemos de tratar os casos em todas as possibilidades de naipes, o compilador não só nos avisa que cometemos um engano, como nos diz quais casos esquecemos.

```ocaml
let cor_do_naipe = function
    | Espadas -> "Preto"
    | Ouros -> "Vermelho"
    | Paus -> "Preto"
    | Copas -> "Vermelho";;
(* val cor_do_naipe : naipe -> string = <fun> *)
```

Da mesma forma irá funcionar com nosso exemplo `carta`.
```ocaml
match Carta(12, Paus) with
    | Carta(valor, naipe) -> Printf.sprintf "O valor é: %d" valor
    | Coringa -> "🃏" ;;
(* - : string = "O valor é: 12" *)
```

## Igualdade Estrutural

OCaml tem suporte a Programação Funcional e Orientada a Objetos, mas o que OCaml realmente estimula é a programação pensando primariamente que dados e a equalidade entre valores é algo muito importante.  Primitivos, Listas, Arrays, Tuplas, Records e Discriminated Unions tem **igualdade estrutural**, o que significa que esses dados são considerados como iguais caso seu valor seja o mesmo.

> OCaml tem como operador de igualdade o sinal **=** que é o mesmo usado para atribuição, o contexto da operação é capaz de ser inferido dependendo da operação.

Aqui temos duas cópias da mesma lista e elas são iguais pois possuem o mesmo número de elementos e os mesmos valores.

```ocaml
[1;2;3] = [1;2;3];;
(* - : bool = true *)
```

O mesmo acontece com as tuplas.
```ocaml
(1, 'a') = (1, 'a');;
(* - : bool = true *)
```

Objetos por outro lado usam **igualdade referencial**, o que significa que os Objetos são considerados como iguais caso contenham a referência para o mesmo Objeto. Isso significa que não é o suficiente que objetos tenham os mesmos valores.

## Generics

Generics é uma feature que nos permite programar diminuindo a quantidade de casting e código redundante. Os tipos genéricos são declarados utilizando `'` na frente de seu rótulo, geralmente como `'a` ou `'b`. Os tipos genéricos também são conhecidos como **tipos polimórficos**.

Por exemplo digamos que estamos criando um novo `record` que será um nó que contem um nome do tipo no tipo `string` e um valor do tipo genérico.
```ocaml
type 'a no = { nome: string; valor: 'a } ;;

{ nome = "Inteiro"; valor = 1 };;
(* - : int no = {nome = "Inteiro"; valor = 1} *)

{ nome = "Char"; valor = 'a' } ;;
(* - : char no = {nome = "Char"; valor = 'a'} *)
```

Note que Generics é diferente de `any` para quem vem de TypeScript ou PHP, `'a` é a representação de um tipo então se temos dois valores representados como `'a` ambos devem ser do mesmo tipo, pois ambos são do tipo `'a`. Podemos ter múltiplas representações `'a`, `'b`... mas cada uma delas individualmente é inferida a um tipo concreto ou seja todas as representações de `'b` por ex. tem o mesmo tipo.
