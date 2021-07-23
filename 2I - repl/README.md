# Scripts e REPL

## Introdução a scripts em OCaml

Podemos escrever pequenos scripts e executá-los usando o interpretador `ocaml` instalado na nossa máquina. Para quem vem de linguagens como Python isso é bem parecido com como funciona os scripts em Python. Por exemplo, vamos criar um pequeno script que imprime `"Hello world!"` no console assim como fizemos no nosso primeiro Capítulo, para isso vamos criar um script com nome `hello.ml` em qualquer lugar do nosso OS com o seguinte conteúdo.

**hello.ml**
```ocaml
print_string "Hello world!\n";;
```

Agora para executarmos esse script basta abrirmos o teminal na mesma pasta em que esse nosso script está salvo e entrar o seguinte comando.

```terminal
$ ocaml hello.ml
```

E vamos ter a nossa mensagem impressa na tela!

### Fazendo scripts executáveis

Assim como Python, podemos passar o caminho do binário responsável por interpretar nosso script como diretiva ao UNIX o que fará com que nosso script seja interpretado ao executarmos o arquivo. Para isso vamos adicionar as diretivas `#! /usr/bin/env ocaml` caso tenha feito a instalação de OCaml pelo OPAM como ensinamos no Capítulo 1 ou `#! /bin/ocaml` caso tenha compilado ou instalado através do gerenciador de dependências do seu OS na primeira linha do nosso script `hello.ml`.

**hello.ml**
```ocaml
#! /usr/bin/env ocaml

print_string "Hello world!\n";;
```

Após isso vamos tornar esse arquivo executável dando-lhe as permissões necessárias.

```terminal
$ chmod 755 hello.ml
```

E agora podemos executar nosso script apenas executando o arquivo.

```terminal
$ ./hello.ml
```

Isso é útil quando queremos fazer automação de tarefas ou alguma outra função que seja mais adequada a fazer pequenos scripts rápidos de alterar e executar.

## Como usar no REPL?

O REPL (Read-Evaluate-Print-Loop) é um ambiente muito útil para testarmos nosso código como já vimos até agora. Porém tem mais algumas coisas que podemos fazer no nosso REPL como executar scripts e importar bibliotecas para nosso REPL.

### Usando REPL

Para começar a utilizar o REPL basta inserir o comando `ocaml` no seu terminal UNIX onde instalamos a linguagem. Assim que o comando for inserido vamos ter uma mensagem que parece com:

```
    OCaml version 4.12.0 // 1

#                         // 2 
```

1. Aqui é o header do REPL que nos informa qual versão de OCaml estamos executando.
2. Aqui é a área de comandos onde vamos entrar nossos trechos de código OCaml.

Os trechos de código OCaml executados no REPL são delimitados por `;;`, caso não seja utilizado esse caractere como delimitação o REPL vai entender todos os comandos inseridos como parte do mesmo. Por exemplo entre a seguinte expressão `5 + 1 ;;` e vamos ter o retorno `- : int = 6` que é tipo (assinatura) do valor retornado e o valor retornado.

No próximo capítulo vamo utilizar bastante o REPL, para isso vamos ter trechos como:
```ocaml
let lista_de_inteiros = [2; 3];;
(* val lista_de_inteiros : int list = [2; 3] *)
```
E será pressuposto que você saiba que a primeira linha é para ser executada no REPL e a segunda é o retorno da expressão executada.

### Carregando scripts no REPL

Podemos carregar funções ou comandos que estão em arquivos `.ml` no nosso REPL sem a necessidade de inserirmos todos os comandos ou a necessidade de criar um novo projeto `dune`. Para mostrar como fazer isso vamos criar um arquivo chamado `script.ml` que irá conter a definição de uma função simples.

**script.ml**
```ocaml
let some_function x y = ( x * y ) + x;;
```

Agora para carregar essa (e qualquer outra definião também no arquivo) basta carregarmos o script em nosso REPL usando o comando `#use`.

```
    OCaml version 4.12.0

# #use "script.ml";;
(* val some_function : int -> int -> int = <fun> *)                 
```

E agora podemos usar essa função quantas vezes quisermos uma vez que está carregada no nosso REPL.

```ocaml
some_function 5 6;;
(* - : int = 35 *)
```