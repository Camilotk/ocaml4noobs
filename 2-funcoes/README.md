# Funções

Em OCaml e em outras linguagens de programação funcional, funções são a forma mais fundamental de se fazer operações sobre dados. Uma função recebe parâmetros, opera e retorna um novo dado.

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

Uma última forma de função que vamos dar uma olhada são as funções trigonométricas. Para nosso exemplo vamos utilizar a função Seno (sin), mas nós não precisamos declarar a função sin porque F# já traz ela definida. 

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

## Curying 

Para trabalhar efetivamente com as funções e sintaxe de F# é necessário que você compreenda dois conceitos relacionados, **curying** e **aplicação parcial de funções** (partial function application). Olhe para a definição da nossa função distancia novamente:
```ocaml
let distancia x y = x - y |> abs;;
(* val distancia : int -> int -> int = <fun> *)
```
Olhando para a assinatura da função é possível percebermos que não existe nenhuma diferença entre os argumentos e o retorno da função. Todos os três são representados como tipos com flechas entre eles e isso tem uma lógica, podemos pensar distancia como uma função de dois inteiros para um terceiro inteiro **ou** podemos pensar como uma aplicação de função de um inteiro para uma segunda função que recebe um inteiro e retorna um inteiro, assim:
```ocaml
 x:int -> (y:int -> int)
```
Efetivamente quando temos uma função com múltiplos argumentos podemos passar todos os argumentos de uma vez só ou podemos passar um de cada vez. Com curying isso não faz diferença, aplicando algumas, mas não todas as partes de uma função é chamado de aplicação parcial de funções.

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