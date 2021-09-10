# Testes

Testes são uma parte importante do desenvolvimento de software, quando escrevemos testes automatizados nas nossas aplicações conseguimos não apenas garantir um número menor de erros e problemas em produção como também conseguimos saber com mais exatidão quais as partes do nosso sistema que estão com problema.

## Testes Unitários

A primeira forma de teste que vamos aprender e a mais clássica são os testes de unidade (ou testes unitários). 

### O que são testes unitários?

Testes unitários são testes que cobrem pequenas partes de nosso código denominadas unidades (geralmente cada unidade é uma função do nosso sistema). O nosso principal objetivo ao escrever testes de unidade é garantir o funcionamento correto de cada função do nosso sistema de forma isolada. Além disso, os testes de unidade geralmente são usados como testes de regressão, ou seja, são novamente executados antes de o sistema ir para produção ou após alterações para garantir que todas as funções cobertas por testes ainda funcionam e que o sistema não tem bugs.

### Como fazemos testes unitários? 

Os testes unitários precisam verificar de forma isolada o funcionamento de cada função. Existem muitas formas de fazer testes automatizados, mas a forma mais protutiva é utilizando biliotecas ou frameworks de teste que nos auxiliem nessa tarefa. Os mais utilizados em OCaml são:

- **OUnit** que é um framework baseado no padrão xUnit criado por Kent Beck para Smalltalk e contêm as funções clássicas de teste, a maioria dos projetos mais antigos de OCaml utiliza OUnit para testes.

- **Alcotest** o framework que vamos estar utilizando aqui. Ele além de trazer algumas melhorias em relação ao OUnit, também possui outras vantagens como a integração com frameworks de teste de propriedade (como veremos a frente aqui) e melhores outputs. A maioria dos novos projetos em OCaml utiliza Alcotest como padrão.

Para fazemos nossos testes unitários usamos o padrão Triple A:

- **A**rrange, que em português seria "Organiza";
- **A**ct, que em português seria "Age";
- **A**ssert, que em português seria "Infere".

Esses são os nossos três trechos de código que vamos usar para dividir nossos arquivos de teste.

### Arrange

É a parte do nosso código de teste que vamos organizar nosso código preparando-o para o cenário do nosso teste.

### Act

Onde vamos executar nossos códigos que vão executar as ações que estamos fazendo o teste utilizando todas as possíveis entradas esperadas pela função. (Ex: Uma função que espera um número Inteiro deve no mínimo testar a possibilidade de receber números positivos, números negativos, zero e nulo).

### Assert

A parte final do nosso teste em que vamos comparar o resultado recebido pela execução do nosso teste e compará-lo com os valores esperados para as entradas que colocamos.

### Criando nosso projeto

Para iniciar nosso projeto vamos instalar nosso framework de testes:

```
$ opam install alcotest
$ eval $(opam env)
```
Vamos começar inicializando um novo projeto dune.

```
$  dune init proj ocaml_testes --libs alcotest
```

Esse comando do nosso build system Dune que vimos no Intermezzo anterior é utilizado para inicializar um novo projeto OCaml, e ele é composto dos argumentos:

- **init** para inicializar um projeto, ou seja criar um *scaffold* (estrutura inicial).
- **proj** que é o template que queremos, nesse caso usamos *proj* que é o template de um projeto vazio, mas na Parte 1 de Introdução do OCaml4Noobs usamos *exe* que cria uma estrutura inicial para um executável.
- **ocaml_testes** que é o nome do projeto que estamos criando, aqui você pode colocar qualquer nome válido de projeto.
- **--libs** que é um parâmetro para passar quais bibliotecas precisam ser importadas em nossos arquivo **dune**, nesse caso estamos usando apenas *Alcoltest*, mas caso haja mais de uma elas devem ser separadas por vírgula ex. **--libs base,alcotest**.

Após executar esse comando vai inicializar uma estrutura de projeto com essa estrutura:

```
.
├── bin
│   ├── dune
│   └── main.ml
├── lib
│   └── dune
├── ocaml_testes.opam
└── test
    ├── dune
    └── ocaml_testes.ml
```

Onde:
 - **bin** é a pasta para colocar nossos arquivos fonte, seu arquivo dune é configurado para gerar um executável com o nome que passamos para o projeto, nesse caso ocaml_teste.

 - **lib** é a pasta para criarmos uma biblioteca isolada para ser consumida no nosso fonte ou por quem está importando nosso código, o arquivo dune vem configurado para compilar uma lib com o nome que passamos no projeto.

 - **test** é a nossa pasta de testes, feita para colocarmos nossos aqruivos fonte de testes.

 - **ocaml_testes.opam** que é o nosso arquivo .opam necessário para compilar, mas que como não queremos publicar como pacote nosso projeto pode ficar com os valores default.

Vamos criar um pequeno projeto que vai simular um carrinho de compras para que possamos testar. Para isso vamos criar primeiramente em **lib** dois arquivos:

**lib/produto.ml**
```ocaml
(* Primeiro definimos um produto *)
type produto = { 
    id: int;
    nome: string; 
    valor: float 
}
```

**lib/carrinho.ml**
```ocaml
open Produto

(* E então temos nossa função que soma o total da compra *)
let total carrinho =
    let valores = List.map (fun produto -> produto.valor) carrinho in
    List.fold_left (+.) 0. valores;;

(* Temos a função que adiciona mais uma un. de item a um carrinho *)
let adiciona_item item carrinho = carrinho @ [item];;
```

O primeiro arquivo vai definir um record que vai estruturar os dados dos nossos produtos e o segundo vai ter duas funções, uma que adiciona um item a um carrinho que será uma lista de produtos e outra que recebe essa lista e nos dá o valor total da compra, caso tenha acompanhado OCaml4Noobs até aqui é tranquilo para você entender, mas caso queira revisar, é recomendável voltar e dar uma olhada na Parte 2 - Funções.

Agora vamos renomear esse módulo de biblioteca para um módulo que futuramente possamos chamar em nosso main, nesse caso **Compras** para isso vamos primeiro alterar o arquivo **dune** para:

**lib/dune**:
```
(library
 (name compras))
```

E então vamos criar um arquivo **compras.ml** que irá abrir os outros módulos da Lib afim de que ele sirva para centralizar nossos valores em um arquivo.

**lib/compras.ml**:
```ocaml
include Carrinho
include Produto
```

Precisamos renomear a lib incluinda em **bin/dune**, o arquivo vai ficar assim:

**bin/dune**
```
(executable
 (public_name ocaml_testes)
 (name main)
 (libraries compras alcotest))
```

Vamos criar a execução principal do nosso código, mudando **bin/main.ml** para:
```ocaml
open Compras

let () =
    let carrinho = [
        { id = 1; nome = "Samsung Galaxy s30 Plus"; valor = 36789.98} ;
        { id = 2; nome = "Fone de Ouvido Bluettoth JBL"; valor = 236.99} ;
    ]  in
    Printf.printf "--- Nota Fiscal --- \n Total da Compra: %s \n" (Float.to_string (total carrinho));;
```

Aqui estamos simulando um carrinho de compras com dois produtos e nosso programa está dando o total.

Podemos testar se está tudo funcionando usando o comando build para compilarmos nosso projeto:
```
$ dune build
```

E o comando exec para executamos nosso arquivo principal e vermos a saida no terminal:
```
$ dune exec ./bin/main.exe
```

Aplicação de brincadeira criada, vamos agora então realmente aprender como fazer nossos testes de unidade na prática, para isso vamos escolher uma de nossas duas funções para testar, nesse caso vamos escolher a função **total**.

Para começarmos os testes da função total vamos começar criando um arquivo ocaml com o prefixo test_ + nome da função que estamos testando, nele vamos abrir o módulo que contêm nossa função, o módulo do **Alcotest** que é nossa biblioteca de código e fazer três comentários do nosso **Tiple A**:

**test_total.ml**
```ocaml
open Compras
open Alcotest

(* ARRANGE *)

(* ACT *)

(* ASSERT *)
```

A primeira parte é **Arrange** aqui nós vamos organizar nosso código para que ele possa ser testado. É muito importante que todos os testes sejam feitos de forma isolada, por isso é normal que aqui façamos funções que simulem a entrada dos dados que estamos trabalho ou criarmos dados in memory como arrays ou records para simular os dados da nossa aplicação.

Aqui vamos começar a definir os nossos casos de teste que vão ser carrinhos com diferentes cenários dos dados que estamos testando, nesse caso vamos testar o comportamento da função quando passamos um carrinho que tem produtos variados e outro carrinho com produtos gratuitos.

```ocaml
(* ARRANGE *)

let e = epsilon_float

let cart_positivos = [  
    { id = 1; nome = "Samsung Galaxy s30 Plus"; valor = 36789.98} ;
    { id = 2; nome = "Fone de Ouvido Bluettoth JBL"; valor = 236.99} 
];;

let cart_zeros = [
    { id = 1; nome = "Samsung Galaxy s30 Plus"; valor = 0. } ;
    { id = 2; nome = "Fone de Ouvido Bluettoth JBL"; valor = 0. } ;
];;
```

Agora temos que ter um único cuidado por estarmos trabalhando com floats, a documentação da biblioteca Alcotest traz muitos exemplos e ela nos diz que quando trabalhamos com floats devemos chamar uma constante **e** que armazena o valor de **epsilon_float** presente no módulo de Alcotest. Depois disso então vamos para nossa etapa de **Act** ou Ação onde vamos criar algumas funções que vão executar nossas função total para cada um dos casos e tentar comparar com o valor esperado. 

```ocaml
(* ACT *)

let test_positivos () =
  (check  @@ float e) "valores positivos de produto"  37026.97 (total cart_positivos)

let test_zeros () =
  (check  @@ float e) "valor zero de produto"  0. (total cart_zeros)
```

Note que para isso criamos uma função com parâmetro Unit, ou seja sem parametros que chama a função check dentro do módulo Alcotest, passamos para essa função o valor float que é o tipo que estamos testando e a constante e utilizando a função apply através de seu operador @@. A função check está sendo aplicada na forma de currying aos parametros assim como uma string de descrição, valor esperado e valor recebido (gerado atráves da execução da função com nossos dados preparados).

E agora precisamos rodar nossos testes para que possamos ver os nossos resultados é aqui temos a nossa parte **Assert** ou Infere, em que vamos ter o resultado de quais testes passaram ou falharam durante a execução dos testes. Para isso vamos:

```ocaml
(* ASSERT *)
let () =
  run "Total" [
      "carrinhos de compras", [
          test_case "valores positivos de produto" `Quick test_positivos;
          test_case "valor zero de produto" `Quick test_zeros;
        ];
    ]
```

Essa é uma função que será executada quando executarmos nosso arquivo de testes e aqui nos utilizamos a função run seguida de um nome descritivo para qual função está sendo testada e uma lista que vai conter um nome para um conjunto de testes em string e outra lista em que cada linha é uma chamada a função test_case com o nome do caso de teste em string e a função `Quick que é nosso modo de teste seguido do indentificador da função de teste.

> Na documentação é possível encontar exemplos com outras funções de teste, sobre como lidar com testes assíncronos e exemplos de como testar outros tipos de valor.

Agora vamos compilar nosso projeto com nossos testes:
```
$ dune build
```

E vamos então executar nosso arquivo de teste:
```
$ dune exec ./test/ocaml_testes.exe
```

E devemos ter um output como esse:
```
Testing `Total'.     
This run has ID `B266FFE0-AB61-4F30-B842-9A21564554B0'.

  [OK]          carrinhos de compras          0   valores positivos de produto.
  [OK]          carrinhos de compras          1   valor zero de produto.

Full test results in `~/Programas/ocaml4noobs/4I - testes/ocaml_testes/_build/_tests/Total'.
Test Successful in 0.000s. 2 tests run.
```

Veja que todos nossos testes passaram, isso sigifica que temos todas as saídas batendo com os resultados que definimos como esperados.

Mas digamos que temos um erro na nossa aplicação, que por alguma razão tivemos que mexer na nossa função total e sem ver alteramos o contador inicial da nossa função fold_left de 0. para 0.1, quando tentarmos novamente executar nossa função de testes teremos:
```
Testing `Total'.     
This run has ID `A30235E0-4025-46EC-A4EC-8A10E2BF7AFB'.

> [FAIL]        carrinhos de compras          0   valores positivos de produto.
  [FAIL]        carrinhos de compras          1   valor zero de produto.
 ───────
┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ [FAIL]        carrinhos de compras          0   valores positivos de produto.                                            │
└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
ASSERT valores positivos de produto
FAIL valores positivos de produto

   Expected: `37027'
   Received: `37027.1'

Logs saved to `~/Programas/ocaml4noobs/4I - testes/ocaml_testes/_build/_tests/Total/carrinhos de compras.000.output'.
 ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Full test results in `~/Programas/ocaml4noobs/4I - testes/ocaml_testes/_build/_tests/Total'.
2 failures! in 0.000s. 2 tests run.
```
Ou seja nossos testes falharam!

Mas além disso essas falhas nos trazem algumas informações:
- No começo dos testes já é nos indicado que todos os testes falharam
- Seguido da demonstração de que era esperado 37027 e foi recebido 37027.1, o que já nos ajuda a identificar que tem um erro no valor de exatamente 0.1 acontecendo.
- Então temos os logs de execução caso desejamos depurar, salvo na pasta de build / compilação.
- E a contagem de quantos testes foram executados e quantos falharam.

Isso irá nos ajudar a identificar muito mais facilmente quais as funções do nosso sistema possuem erros, onde encontrá-los e como corrigi-los.

## Testes Baseados em Propriedades