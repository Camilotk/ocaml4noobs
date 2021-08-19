# Dune

<img src="https://dune.build/assets/imgs/dune_logo.png"/>


Quando trabalhamos em projetos simples em OCaml como trabalhamos até agora é muito simples de trabalhar com um ou dois arquivos, mas a medida que nossos projetos crescem cada vez torna-se mais e mais díficil manter um projeto, por muitos motivos, desde a complexidade da dependencia dos nossos arquivos até o gerenciamento do nosso processo de compilação. Para tornar essas coisas mais simples, temos uma ferramenta que utiliza uma série de regras de automação para tornar esses processos mais simples de manter para nós, em OCaml temos múltiplas opções de sistemas de build para escolher, mas sem dúvida o mais popular é o [Dune](https://dune.build/).

## Como funcionam arquivos em OCaml

Você talvez ainda não saiba, mas você pode chamar o código de um arquivo OCaml que esteja na mesma pasta em outro usando a palavra `open`, OCaml irá tratar o nome do arquivo como um módulo que será o assunto do nosso próximo capítulo, por enquanto pense nisso como um identificador. Então digamos que temos o arquivo **sum.ml** que contêm uma função de soma que desejamos usar no nosso arquivo **main.ml**, podemos "importar" ou como chamamos em OCaml "abrir" o código de Sum em main assim:

**sum.ml**
```ocaml
let add x y = x + y
```

**main.ml**
```ocaml
open Sum

let () = 
    let result = add 2 3 in
    print_endline (string_of_int result);
```

E se compilarmos esses arquivos para código nativo usando a nossa ferramenta **ocamlopt**:
```terminal
$ ocamlopt -o main sum.ml main.ml
```

E executarmos o arquivo:
```terminal
$ ./main
```

Vamos ter o nosso resultado **5**, mas isso não é tão simples quanto parece, primeiro por que a ordem de compilação dos arquivos importa, eles devem seguir a ordem de dependências se tentarmos `ocamlopt -o main main.ml sum.ml` vamos ter um erro, se começarmos a ter subpastas e outras estruturas, nossa estrutura de módulos começa a aumentar rapidamente a complexidade e em projetos grandes é exatamente tudo o que não queremos. Para simplificar tudo isso é que usamos **Dune** que torna nossa vida muito mais fácil.

Vamos ver então como ele funciona criando um projeto de exemplo, configurando e rodando o mesmo a seguir.

## Configurando o seu projeto

Para instalar Dune vamos utilizar o nosso Gerenciador de Dependências que instalamos no Capítulo 1, OPAM.

```terminal
$ opam install dune
```
> Lembrando que já fizemos a instalação do mesmo no primeiro capítulo.

Agora vamos criar um projeto de exemplo, chamado 'Exemplo'. Para começar vamos criar uma nova pasta que irá conter o nosso projeto.

```terminal
$ mkdir Exemplo && cd $_
```

Antes de começarmos a usar **Dune** precisamos precisamos primeiro configurar um arquivo para gerenciar as nossas dependências com o nome \<nome do meu projeto\>.opam que você pode pensar como **package.json** para quem vem do JavaScript, **composer.json** para quem vem do PHP ou **POM.xml** para quem vem do Java.

```terminal
$ touch exemplo.opam
```

Mas não se preocupe com conteúdo desse arquivo, ele não será o nosso foco agora e futuramente vamos mostrar como fazer o Gerenciamento de Dependências em OCaml com outras ferramentas.


Cada diretório em nosso projeto vai conter um arquivo chamado **dune** (sem qualquer extensão de arquivo) especificando os arquivos que estão nesse diretório e como fazer a build dos mesmos.

Além desses arquivos, nosso projeto irá conter um arquivo chamado **dune-project** em sua raiz. Nesse arquivo vamos especificar as nossas diretivas de build como por exemplo o nome do projeto, versão do Dune usada na build e demais configurações do projeto. Esse arquivo é composto de stanzas (em tradução literal versos ou estrofes) que são os comandos utilizados na build. Os primeiros comandos que vamos aprender são:
 - **lang**: Que define a versão de Dune que será utilizada na build, isso significa que os projetos são retroativamente compatíveis, você pode fazer build de qualquer projeto dune feito a qualquer momento (desde que tenha a última versão instalada) e isso deve funcionar.
 - **name** que define o nome do projeto na build.

Esse arquivo na raiz do projeto deve ficar assim:

**dune-project**
```
(lang dune 2.0)
(name exemplo)
```

Com isso configurado vamos começar a aprender a escrever nossos arquivos **dune** que irão dentro de nossas pastas!

## Arquivos dune

Os aquivos **dune** são onde vamos especificar todas as configurações de build dos arquivos que estão na mesma pasta.

Existem três diferentes tipos de stanza que podemos utilizar em nossos arquivos **dune** quando vamos começar.

### Executable

O primeiro é o template para gerar arquivos binários que podem ser executados.

```
(executable
    (name nome)
    <opções>
)
```

### Test

O segundo é para quando queremos escrever testes, estes arquivos são executados quando rodamos o comando de testes do Dune.

```
(tests
    (name nome)
    <opções>
)
```
ou
```
(tests
    (names nome outro_nome mais_um_nome)
    <opções>
)
```

### Library

O último é quando queremos criar uma biblioteca que pode ser compilada utilizando o comando de build da ferramenta. Podemos nos referir a qualquer arquivo compilado como biblioteca (library) chamando o seu módulo como `Lib.Nome`. Você pode pensar no módulo `Lib` (sendo lib o nome que definimos na diretiva name) como um módulo que contêm todos os módulos dos arquivos dentro da pasta que contêm esse arquivo **dune**.

```
(library
    (name lib)
    <opções>
)
```

### Configurando nosso arquivo

Então agora vamos criar alguns arquivos em nosso projeto de exemplo para que possamos entender melhor como isso funciona na prática.

Primeiro vamos criar uma pasta **src** onde vamos colocar um arquivo **multiply.ml** que vai ter algumas funções do nosso projeto.

```
$ mkdir src
```

**multiply.ml**
```OCaml
let multiply a b = a * b;;
let multiplyBy2 = multiply 2;;
let multiplyBy3 = multiply 3;;
let multiplyBy4 = multiply 4;; 
```

Dentro dessa mesma pasta vamos criar um arquivo **dune** e vamos nesse caso colocar esse nosso arquivo como biblioteca com o nome de "math".

**dune**
```
(library
    (name math)
)
```

E agora vamos fazer o build desse projeto.

```terminal
$ dune build
```

Se não houver nenhum erro podemos prosseguir, caso haja, revise os passos anteriores. Agora vamos criar um aquivo **exemplo.ml** na nossa raiz que será nosso arquivo principal e um outro arquivo **dune** na raiz com as diretivas de compilação do mesmo.

**exemplo.ml**
```OCaml
open Math.Multiply

let () = print_int (multiplyBy2 4);;
```

**dune**
```
(executable
  (name exemplo)
  (libraries math)
)
```
Aqui vamos aprender uma nova opção que é a opção **libraries** que usamos para carregar os módulos das nossas bibliotecas instaladas e que buildamos com dune.

Nossa árvore de arquivos deverá estar assim:
```
Exemplo
├── dune
├── dune-project
├── exemplo.ml
├── exemplo.opam
└── src
    ├── dune
    └── multiply.ml
```

Após ter todo o projeto definido podemos novamente fazer a build.
```terminal
$ dune build
```

E em seguida podemos executar o executável gerado do nosso projeto.
```terminal
$ dune exec ./exemplo.exe
```

E pronto! Legal, não? O Dune nos ajudou a construir nosso projeto de forma mais estruturada e a organizar os módulos de nossa biblioteca, logo mais para frente vamos continuar aprendendo mais coisas sobre Dune.

#### Obs
 - Caso deseje aprender mais stanzas pode usar a referência na [documentação](https://dune.readthedocs.io/en/stable/dune-files.html) que por enquanto infelizmente está apenas em inglês, mas que podemos ter uma futura tradução.
- Caso queira ver como fica o projeto criado nesse capítulo você pode vê-lo [aqui](https://github.com/Camilotk/ocaml4noobs/tree/intermezzo-3/3I%20-%20build%20/Exemplo).

