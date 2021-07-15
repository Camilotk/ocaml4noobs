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