# Funções

Em OCaml e em outras linguagens de programação funcional, funções são a forma mais fundamental de se fazer operações sobre dados. Uma função recebe parâmetros, opera e retorna um novo dado.


#### **Indíce**
- [O que é uma função](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#o-que-%C3%A9-uma-fun%C3%A7%C3%A3o)
    - [Definição](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#defini%C3%A7%C3%A3o)
    - [Funções Lineares](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#fun%C3%A7%C3%B5es-lineares)
    - [Funções Quadráticas](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#fun%C3%A7%C3%B5es-quadr%C3%A1ticas)
    - [Funções Trigonométricas](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#fun%C3%A7%C3%B5es-trigonom%C3%A9tricas)
- [Aplicando Funções](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#aplica%C3%A7%C3%A3o-de-fun%C3%A7%C3%B5es)
    - [Funções com um argumento](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#fun%C3%A7%C3%B5es-com-um-argumento)
    - [Funções com múltiplos argumentos](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#fun%C3%A7%C3%B5es-com-m%C3%BAltiplos-argumentos)
- [Tipos de função](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#tipos-de-fun%C3%A7%C3%A3o)
    - [Função de alta ordem](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#fun%C3%A7%C3%B5es-de-alta-ordem)
- [Currying](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#currying)
- [Função em prefixo e em infixo](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#fun%C3%A7%C3%A3o-em-prefixo-e-em-infixo)
    - [Defininfo funções em infixo](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#definindo-fun%C3%A7%C3%B5es-em-infixo)
- [Funções lambda](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#fun%C3%A7%C3%B5es-lambda)
- [Recursão](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#recurs%C3%A3o)
- [Canalização](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#piping--canaliza%C3%A7%C3%A3o)
- [Composição de funções](https://github.com/Camilotk/ocaml4noobs/tree/master/2-funcoes#composi%C3%A7%C3%A3o-de-fun%C3%A7%C3%B5es)

## O que é uma função?

### Definição

Uma função é de uma forma simples, é um transformador (ou se prefirir: operação) que recebe um valor de entrada e devolve um valor de saída. Típicamente existe um conjunto de possíveis entradas que são convertidos em seus respectivos valores de saída. A propriedade mais importante de uma função em OCaml é sua pureza, onde é importante garantir que uma vez dado um parâmetro, todas as vezes subsequentes em que essa função recebê-lo será retornado o mesmo valor de saída.

Em notação se temos um valor de entrada x e uma função f teremos uma saída f(x).
```
x = input
f = função

x -> f -> f(x)
```
ou
```
x = 5
adder(n) = n + 1

5 -> adder(5) = 5 + 1 -> 6
```

A definição da Wikipédia em Inglês sobre funções matemáticas serve como base para que possamos compreender funções em OCaml:
> Uma função é a relação entre um conjunto de entradas (domínio)
> e um conjunto de possíveis saídas com a propriedade de que cada
> saída está relacionada com uma entrada (imagem) - **Wikipédia**

A última parte dessa definição é a mais importante, porque não é necessariamente óbvio que cada saída está necessariamente relacionada com a entrada, uma outra forma que já usamos para descrever a mesma coisa é: *Uma vez dado uma entrada, sempre será retornado a mesma saída*. 

### Funções Lineares

Vamos comparar algumas funções matemáticas, digamos que temos a função linear:
``` 
f(x) = 2 * x
```

E que ela produza o gráfico:
![gráfico da função f de x igual a duas vezes x](https://github.com/Camilotk/ocaml4noobs/blob/capitulo-2/2-funcoes/imagens/linear.png)

Ou em OCaml:
```ocaml
let f x = 2 * x
```

> **Obs**: Na matemática é comum representarmos em equações simples o nome das funções como y(x) ou f(x), mas podemos também nomea-las como linear(x),  onde linear (x) = 2 * x.
> O mesmo acontece em OCaml onde é mais fácil trabalharmos como **let linear x = 2 * x**.


As definições de função em OCaml começam com a palavra reservada **let**, seguida pelo identificador (nome da função), a lista de argumentos (que no caso acima é apenas um, mas poderiam ser múltiplos) e aqui acaba o lado esquerdo da equação, então temos o sinal de igual e o lado direito da equação que é a função em si que no exemplo acima apenas dobra o valor que é passado.

Se observarmos o gráfico gerado pela nossa função vamos lembrar da definição de que uma entrada sempre produz uma mesma saída. De forma visual isso significa que desenhamos uma linha no gráfico, onde cada valor recebe um ponto específico de saída. OCaml não requer que sejamos rigorosos com a definição matemática (como em outras linguagens por ex. Haskell), mas espera que façamos isso sempre que possível porque isso irá nos ajudar a criar programas simples, corretos e funcionais.

### Funções Quadráticas

Existem outro tipo de função, não-linear, denominadas de funções quadráticas.

Na Matemática:
```
f(x) = x^2
```

ou em OCaml:
```OCaml
let f x = x ** 2
```

E que produz o gráfico:

![gráfico da função f de x igual a x elevado a 2](https://github.com/Camilotk/ocaml4noobs/blob/capitulo-2/2-funcoes/imagens/quadratico.png)

A função que declaramos aqui usa a exponenciação (\*\*) isso significa que estamos fazendo x ser elevado a 2. Essa função também atende o requisito de sempre produzir a mesma saída dada o mesma entrada.

### Funções Trigonométricas

Uma última forma de função que vamos dar uma olhada são as funções trigonométricas. Para nosso exemplo vamos utilizar a função Seno (sin), mas nós não precisamos declarar a função sin porque OCaml já traz ela definida. 

Na Matemática:
```
sin(x)
```

ou em OCaml:
```ocaml
sin x
(* Ex: sin 9. => float = 0.412118485241756594 *)
```

E que produz o gráfico:

![gráfico da função seno](https://github.com/Camilotk/ocaml4noobs/blob/capitulo-2/2-funcoes/imagens/trigonometrica.png)

Como podemos observar é um gráfico um tanto quanto bonito.

## Aplicação de funções

A aplicação de função é o ato de aplicar as operações contidas em uma função sobre os argumentos com o objetivo de receber sua saída (resultado). Isso é um conceito fundamental de OCaml, vamos dar uma olhada em como isso funciona com funções que recebem apenas um argumento e com funções que recebem múltiplos argumentos. 

### Funções com um argumento

Vamos considerar a seguinte função com apenas um argumento: 
```ocaml
(* REPL *)

let square x = x * x;;
(* val square : int -> int = <fun> *)

square 3;;
(* - : int = 9 *)
```

> REPL (Read-Print-Evaluate-Loop) é a ferramenta para auxiliar no desenvolvimento e testar código que OCaml e outras linguagens de programação nos oferecem. Vamos utilizá-lo na maioria dos nossos exemplos para testar rapidamente o que estamos aprendendo. Para iniciar a ferramenta basta abrir o terminal do seu sistema UNIX onde instalou OCaml e digitar o comando `ocaml`

Como podemos perceber para usar a nossa nova função tudo o que foi necessário foi chamá-la e passar o valor de seu argumento após um espaço. O valor de seu argumento é avaliado e então é nos retornado o valor produzido pela saída da função, nesse caso passamos 3 que foi multiplicado por seu próprio valor e então obtemos 9. 

Isso pode parecer óbvio, mas começa a se tornar mais complicado quando tentamos algo como:
```ocaml
square 3 + 1;; (* ? *)
```
Pois isso significa que 3 será passado a função, ou 3 + 1 ou 4? Confuso, não? Na verdade, nesse caso, devemos usar parentêses para expressar nossa intenção de forma mais explícita e assim o interpretador conseguir fazer a operação desejada:

```ocaml
(square 3) + 1;;
(* - : int = 10 *)

square (3 + 1);;
(* - : int = 16 *)
```

Caso não seja usado parentêses a função será aplicada como no nosso primeiro exemplo:
```ocaml
square 3 + 1;;
(* - : int = 10 *)
```
Isso porque square é uma função com assinatura x:int -> int ou seja recebe apenas um argumento e o primeiro valor ou seja 3 será passado como argumento formando [square 3] e então o inteiro retornado pela saída dessa função, nesse caso 9 será somado ao valor 1. As funções em OCaml funcionam dessa forma porque em OCaml as aplicações de função são **associativas à esquerda** (left associative), isso significa que os parentêses se agrupam a esquerda. 

A maioria das linguagens populares requerem parênteses e nesses casos isso pode não parecer importante, mas para linguagens que tem parênteses implícitos é necessário entendermos sua associatividade.  

### Funções com múltiplos argumentos

Quando uma função recebe múltiplos argumentos eles são colocados separados por espaço na definição da função.
```OCaml
let distancia x y = x - y |> abs;;
(* val distancia : int -> int -> int = <fun> *)
```
Como podemos perceber a função distancia recebe dois valores x e y e retorna a distância numérica entre eles. Após calcular a diferença, passamos seu resultado para a função **abs** que nos retorna o valor absoluto da mesma.
```ocaml
distancia 5 3;;
(* - : int = 2 *)
```
Para chamar uma função com múltiplos argumentos apenas precisamos digitar seu nome seguido dos valores correspondentes ao seu número de argumentos separados por espaços. Quando tivermos situações mais complexas como:
```ocaml
distancia 5 2 + 1;;
```
Assim como em um caso de função que recebe apenas um argumento a avaliação acontece a partir da esquerda.
1. Temos a chamada da função distancia x:int -> y:int -> int
2. Como é uma função que recebe dois argumentos o compilador irá procurar os próximos dois valores inteiros e aplicalos a distancia
3. O valor de retorno de ditancia após consumir os valores inteiros como parâmetros é substituido no lugar da função e seus parâmetros.
4. Então a operação de soma entre o valor retornado e 1
5. E então o resultado da operação é retornado como valor da expressão

> **Obs**: Para entender melhor a aplicação de funções caso queira é interessante dar uma olhada no [Aligator Eggs](http://worrydream.com/#!/AlligatorEggs) que explica
> um pouco mais sobre aplicação de funções e associação.

## Tipos de função

O exemplo abaixo é uma declaração de função típica de OCaml
```ocaml
let quadrado x = x * x;;
```
E normalmente temos o seguinte retorno
```ocaml
val quadrado : int -> int = <fun>
```
Essa é nossa **assinatura da função**. Quando começamos a ler uma assinatura de função o primeiro valor que nos importa é o tipo após a última flecha que é o tipo de retorno da função e então todos os valores anteriores a última flecha são os tipos dos parâmetros que a função recebe. Essa assinatura pode ser lida como *a função quadrado recebe um parâmetro do tipo inteiro e retorna um valor do tipo inteiro*.

Funcões com múltiplos argumentos funcionam da mesma forma, por exemplo a função **distancia** acima tem uma assinatura em que recebe dois inteiros e retorna um valor inteiro. 

### Funções de alta ordem

Funções de alta ordem são funções que recebem uma outra função como parâmetro ou que retornam uma outra função como valor de retorno. Um exemplo de função de alta ordem é a função List.map porque o seu primeiro argumento é uma função, sua assinatura é:
```ocaml
List.map;;
(* - : ('a -> 'b) -> 'a list -> 'b list = <fun> *)
```
E além disso List.map também é uma **função polimórfica** já que 'a e 'b são tipos não-definidos (unconstrained types) que podem ser substituídos por qualquer outro tipo concreto. Esse tipo de polimorfismo é chamado de **polimorfismo paramétrico** (parametric polymorphism), isso basicamente significa que a função map pode ser usada com valores inteiros, strings, árvores, outras listas, funções ou qualquer outro tipo customizado. É um bom costume se acostumar a entender e ler tipos e assinaturas de funções pois é uma forma simplificada de conseguir rapidamente entender a implementação de uma função.

Somente de ler a assinatura da função map podemos saber que ela recebe dois parâmetros:
1. Uma função que tem um argumento de tipo 'a e retorno do tipo 'b
2. Uma lista de tipo 'a

E retorna um valor:
- Uma lista de tipo 'b

Assim é possível que já saibamos que provavelmente a função map receba uma lista de valores do tipo 'a, aplique a função em que transforma o tipo 'a em 'b e então retorne uma lista do tipo 'b. Isso tudo apenas lendo a assinatura da função.

## Currying 

Para trabalhar efetivamente com as funções e sintaxe de OCaml é necessário que você compreenda dois conceitos relacionados, **currying** e **aplicação parcial de funções** (partial function application). Olhe para a definição da nossa função distancia novamente:
```ocaml
let distancia x y = x - y |> abs;;
(* val distancia : int -> int -> int = <fun> *)
```
Olhando para a assinatura da função é possível percebermos que não existe nenhuma diferença entre os argumentos e o retorno da função. Todos os três são representados como tipos com flechas entre eles e isso tem uma lógica, podemos pensar distancia como uma função de dois inteiros para um terceiro inteiro **ou** podemos pensar como uma aplicação de função de um inteiro para uma segunda função que recebe um inteiro e retorna um inteiro, assim:
```ocaml
 x:int -> (y:int -> int)
```
Efetivamente quando temos uma função com múltiplos argumentos podemos passar todos os argumentos de uma vez só ou podemos passar um de cada vez. Com currying isso não faz diferença, aplicando algumas, mas não todas as partes de uma função é chamado de aplicação parcial de funções.

Por ex:
```ocaml
(* temos uma função que recebe dois argumentos x e y *)
let distancia x y = x - y |> abs;;
(* val distancia : int -> int -> int = <fun> *)

(* porem podemos "prender" um de seus argumentos em apenas um valor *)
let distanciaDe5 = distancia 5;;
(* val distanciaDe5 : int -> int = <fun> *)

(* perceba que a assinatura ficou de inteiro para inteiro, isso acontece porque o
   primeiro valor já foi aplicado *)

(* e agora podemos chamar essa função passando o segundo argumento de distancia *)
distanciaDe5 1;;
(* - : int = 4 *)
```
Podemos também demonstrar isso explicitamente quando chamamos uma função com múltiplos parâmetros:
```ocaml
(distancia 5) 6;;
(* - : int = 1 *)
```
Nesse caso o primeiro parênteses retorna uma função com o primeiro parâmetro aplicado, então essa função recebe o segundo valor. Podemos dizer que isso é exatamente equivalente a chamada sem parênteses, ou seja:
```ocaml
((distancia 5) 6) = (distancia 5 6);;
(* - : bool = true *)
```
## Função em prefixo e em infixo

Funções em prefixo (prefix functions) é a forma regular como trabalhamos com funções e estamos acostumados, quando prefixamos colocamos o nome da função seguido de seus parâmetros:
```ocaml
distancia 5 2;;
(* - : int = 3 *)
```
Uma função em infixo (infix function) é também por vezes chamada de operador em OCaml, usa uma ordem diferente. Uma função com dois argumentos é um caso especial em que algumas vezes faz mais sentido que o nome da função esteja entre os argumentos. Um exemplo de função que utiliza esse tipo de notação é a função +, que nos permite escrever expressões como 1 + 3.
```ocaml
1 + 3;;
(* - : int = 4 *)
```
Se quiser usar um operador na forma em prefixo basta colocá-lo entre parênteses:
```ocaml
(+);;
(* - : int -> int -> int = <fun> *)

(+) 1 3;;
(* - : int = 4 *)
```
Observe que o resultado em utilizar o operador em infixo ou em prefixo é o mesmo e que é possível passá-lo como função o que é particularmente útil quando é necessário passar um operador como argumento para outra função ou caso necessitamos criar uma função parcial.
```ocaml
(* função que retorna o próximo n / adiciona 1 *)
let adiciona1 = (+) 1;;
(* val adiciona1 : int -> int = <fun> *)

(* ex: *)
adiciona1 2;;
(* - : int = 3 *)

adiciona1 5;;
(* - : int = 6 *)
```
Os operadores ou funções em infixo são úteis porque tornam operações binárias (que possuem dois argumentos) mais legíveis, especialmente quando temos múltiplas aplicações de função.
```ocaml
1 + 2 + 3;;
(* - : int = 6 *)
```
Como vimos na seção anterior pela propriedade de associação a esquerda das funções em OCaml isso é o mesmo que:
```ocaml
(1 + 2) + 3;;
(* - : int = 6 *)
```
Uma vez em que primeiro é executada a primeira função soma e o resultado da mesma é aplicado como valor na segunda função soma. Isso pode parecer irrelevante já que a adição tem a propriedade da associatividade em que a ordem em que os elementos são somados não altera o resultado. Porém se considerarmos a divisão que não possui tal propriedade é importante estarmos atento a ordem em como as funções são aplicadas.
```ocaml
40 / 5 / 2;;
(* - : int = 4 *)

40 / (5 / 2);;
(* - : int = 20 *)
```
Caso quisessemos realizar a mesma expressão de soma acima apenas utilizando a forma em prefixo seria mais ou menos assim:
```OCaml
((+) ((+) 1 2) 3);;
(* - : int = 6 *)
```
Isso pode parecer familiar para quem vem de um contexto como LISP, mas em geral torna mais dificil de ler a expressão que estamos escrevendo, porém é possível escrever OCaml dessa forma sem qualquer prejuízo além da legibilidade.

### Definindo funções em infixo

Se quiséssemos definir nossa função distancia que vimos antes como infixo basta declararmos nossos parâmetros como símbolos, ou seja não podemos ter identificadores como nomes ou com carateres alfanuméricos, apenas símbolos e o nome deve ser declarado entre parênteses.
```ocaml
(* função distância em infixo usando |><| como operador
   para identificar a função. *)
let (|><|) x y = x - y |> abs;;
(* val ( |><| ) : int -> int -> int = <fun> *)

3 |><| 2;;
(* - : int = 1 *)

(* podemos também ter múltiplas aplicações de distância *)
3 |><| 2 |><| 6;;
(* - : int = 5 *)
```
Aqui é importante lembrar que a propriedade de associação a esquerda é válida. Primeiramente temos o resultado de (3 |><| 2) que vai nos ternar 1 e então esse valor é aplicado a função juntamente ao valor 6 e temos 5 como resultado.

## Funções Lambda

Nem todas as funções precisam ser reutilizadas futuramente, as vezes precisamos usar uma função uma única vez e por tanto, essa função não precisa de um identificador.  As funções declaradas sem um identificador são chamadas de **Funções Anônimas**, ou então **Funções Lambda**. É de preferência quando escrevemos uma função lambda que a mesma use a sintae mais concisa possível já que elas usualmente aparecem em uma única linha.

Para declararmos uma função lambda iniciamos a expressão com a palavra reservada fun, seguido dos argumentos, uma flecha -> que separa os argumentos do corpo da função e a declaração da função, ex:
```ocaml
List.map (fun x -> x * x) [1;2;3];;
(* - : int list = [1; 4; 9] *)
```
Lambdas com múltiplos argumentos funcionam da mesma forma:
```ocaml
(fun x y -> x - y |> abs) 20 35;;
(* - : int = 15 *)
```
Caso seja necessário especificar os tipos dos parâmetros na função lambda é necessário colocar os parâmentros entre parênteses.
```ocaml
(fun (x:int) (y:int) -> x - y |> abs) 20 35;;
(* - : int = 15 *)
```

## Recursão

Uma função recursiva é uma função que contêm uma chamada a si mesma. Por exemplo, a função tamanho abaixo que retorna o temanho de uma lista é recursiva. Podemos observar primeiramente pela palavra **rec** que indica para o compilador do OCaml que essa função é recursiva e que é necessário que ele faça optimizações para esse caso e também podemos observar que na terceira linha a função chama a si mesma.
```OCaml
let rec tamanho = function
    | [] -> 0
    | x::xs -> 1 + tamanho xs;;
(* val tamanho : 'a list -> int = <fun> *)
```
Quando estamos pensando em como programar uma função recursiva, normalmente pensamos primeiro em qual será o **caso de saída** ou o caso base, nesse caso como retiramos um item da lista a cada repetição nosso caso base é quando a lista estiver vazia, é importante notar que nesse caso, independente do tamanho da lista, sempre iremos chegar a uma lista vazia. Após termos um caso base, vamos para a fase de indução que é como vamos chegar ao caso base, nesse caso é retirando um item da lista a cada chamada.

Outra coisa que podemos notar nessa função é que ela traz uma nova sintaxe, no caso ela está fazendo Pattern Matching nos argumentos da função, algo muito comum quando estamos trabalhando com funções recursivas. Observe que a função não possui nenhum parâmetro explicitamente, não precisamos de um identificador para cada argumento porque a única coisa que usamos é o próprio Pattern Matching. O que indica que essa função utiliza Pattern Matching é a palavra function. Quando chamamos essa função o argumento passado é comparado a lista de possíveis argumentos, nesse caso: uma lista vazia ([]) ou uma lista com n elementos (x:xs), essa é uma comparação exaustiva já que cobre todos os casos possíveis de entrada, ou seja a função recebe uma lista e essa lista apenas pode ser vazia ou possuir elementos, nenhum outro caso é possível.

O primeiro caso, a lista vazia, nesse caso é o nosso caso base caso a função receba uma lista vazia o valor 0 é retornado. O outro caso é o nosso caso recursivo, onde a lista é diminuida, o argumento x::xs separa a lista atribuindo o primeiro elemento a x (esse elemento é chamado de 'cabeça' / head) e os seguintes em lista em xs (essa lista de elementos restantes é chamada de 'cauda' / tail) e então é retornado  1 somado ao valor retornado pela função tamanho recebendo a lista cauda / tail como argumento.

```ocaml
tamanho [1;2;5];;
(* - : int = 3 *)

(*
Como acontece:

tamanho [1;2;5]
    | 1::[2;5] -> 1 + tamanho [2;5]
 
tamanho [2;5]
    | 2::[5] -> 1 + tamanho [5]
 
tamanho [5]
    | 5::[] -> 1 + tamanho []

tamanho []
    | [] -> 0

tamanho [5]
    | 5::[] -> 1 + 0

tamanho [2;5]
    | 2::[5] -> 1 + 1

tamanho [1;2;5]
    | 1::[2;5] -> 1 + 2

// =>  val it : int = 3
*)
```
Outro exemplo clássico de recursão que é utilizado para ilustrar o funcionamento de funções recursivas é o cálculo de fatorial:
```ocaml
(* fatorial n = n * (n-1) * (n-2)...(n-(n-1))
   fatorial 3 = 3 * 2 * 1 = 6 *)
let rec fatorial n =
    if n < 2 then
        1
    else
        n * fatorial (n - 1)
(* val fatorial : int -> int = <fun> *)
```
## Piping / Canalização

Digamos que desejamos calcular o seno de 7, vamos utilizar a função seno que vimos no começo passando 7 com um ponto como valor já que a função espera um valor do tipo float.
```ocaml
sin 7.;;
(* - : float = 0.656986598718789061 *)
```
> Observe que OCaml faz diferença entre 7 (inteiro) e 7. (float)

Agora digamos que queremos fazer isso, mas passando primeiro o valor e depois a função, isso é possível através do pipe operator (operador de canalização):
```ocaml
7. |> sin;;
(* - : float = 0.656986598718789061 *)
```
Mas qual a utilidade disso? Existem algumas opções em que pode ser relevante usar essa sintaxe:
- Simplificar chamadas de função
- Fazer uma sequência de chamadas de função uma após a outra recebendo o valor de saída da anterior
- Remover os parênteses de uma operação

Além de conseguirmos canalizar a saída das nossas funções para a próxima, também podemos usar o backwards pipe operator (operador de canalização invertida) que basicamente passa o valor para a função declarada antes:
```ocaml
(* em OCaml 4.01 ou anterior esse operador era <|, mas nas posteriores foi mudado para @@ *)
sin @@ 2. + 1.;;
(* - : float = 0.141120008059867214 *)
```
Além disso modemos usar os pipe operators ao mesmo tempo, o que deixa a sintaxe de uma função com dois valores similar a uma função em infixo:
```ocaml
(* função min recebe 2 int e retorna o menor entre eles *)
(min);;
(* - : 'a -> 'a -> 'a = <fun> *)

min 10 5;;
(* - : int = 5 *)

(* usando ambos pipe operators *)
7 |> min @@ 2;;
(* - : int = 2 *)
```
Para que seja possível canalizar uma saída de função ou valor é necessário que a função receba apenas um argumento.
```ocaml
3 7 |> min;;
(* Error: This expression has type int
          This is not a function; it cannot be applied. *)
```

## Composição de Funções

Composição, apesar de similar a canalização em primeira vista é bem diferente. A composição é quando conectamos a saída de uma de nossas funções a entrada de outra e armazenamos isso em uma nova função. Por ex, digamos que temos uma função que recebe um argumento da função com tipo 'a e que retorna um valor de tipo 'b e que temos outra função que recebe o tipo 'b e retorna 'c, então podemos compor uma nova função que mapeia do tipo 'a para o tipo 'c conectando ambas as funções dentro da nova função.

```ocaml
(* funções de composição*)
let (<<) f g x = f(g(x));;
let (>>) f g x = g(f(x));;


(* funções exemplo *)
let menos x y = x - y |> abs;;
(* val menos : int -> int -> int = <fun> *)

let menos1 = menos 1;;
(* val menos1 : int -> int = <fun> *)

let vezes x y = x * y;;
(* val vezes : int -> int -> int = <fun> *)

let vezes2 = (vezes) 2;;
(* val vezes2 : int -> int = <fun> *)


(* funções aplicadas *)
menos1 9;;                    
(* - : int = 8 *)

vezes2 8;;
(* - : int = 16 *)

(* redirecionamento *)
let menos1EntaoVezes2 = vezes2 << menos1;;
(* val menos1EntaoVezes2 : int -> int = <fun> *)

menos1EntaoVezes2 9;;
(* - : int = 16 *)

let vezes2EntaoMenos1 = vezes2 >> menos1;;
(* val vezes2EntaoMenos1 : int -> int = <fun> *)

vezes2EntaoMenos1 9;;
(* - : int = 17 *)
```
## Materiais Complementares
- [Função](https://pt.wikipedia.org/wiki/Fun%C3%A7%C3%A3o_(matem%C3%A1tica))
- [Função Linear](https://pt.khanacademy.org/math/algebra-home/alg-linear-eq-func)
- [Função Quadrática](https://pt.khanacademy.org/math/algebra/quadratics)
- [Função Trigonométrica](https://pt.khanacademy.org/math/algebra-home/alg-trig-functions)
- [Funções de primeira classe](https://pt.wikipedia.org/wiki/Fun%C3%A7%C3%A3o_de_primeira_classe)
- [Currying e Aplicação Parcial](https://imasters.com.br/back-end/vamos-falar-sobre-currying-e-aplicacao-parcial)
- [Notação polonesa inversa](https://pt.wikipedia.org/wiki/Nota%C3%A7%C3%A3o_polonesa_inversa)
- [Recursividade](https://pt.wikipedia.org/wiki/Recursividade)
- [Função composta](https://pt.wikipedia.org/wiki/Composi%C3%A7%C3%A3o_de_fun%C3%A7%C3%B5es)
