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

<script src="https://cdn.geogebra.org/apps/deployggb.js"></script>
<div id="ggbApplet"></div>
<script>
var parameters = {
"id": "ggbApplet",
"width":1870,
"height":786,
"showMenuBar":true,
"showAlgebraInput":true,
"showToolBar":true,
"customToolBar":"0 73 62 | 1 501 67 , 5 19 , 72 75 76 | 2 15 45 , 18 65 , 7 37 | 4 3 8 9 , 13 44 , 58 , 47 | 16 51 64 , 70 | 10 34 53 11 , 24  20 22 , 21 23 | 55 56 57 , 12 | 36 46 , 38 49  50 , 71  14  68 | 30 29 54 32 31 33 | 25 17 26 60 52 61 | 40 41 42 , 27 28 35 , 6",
"showToolBarHelp":true,
"showResetIcon":false,
"enableLabelDrags":false,
"enableShiftDragZoom":true,
"enableRightClick":false,
"errorDialogsActive":false,
"useBrowserForJS":false,
"allowStyleBar":false,
"preventFocus":false,
"showZoomButtons":true,
"capturingThreshold":3,
// add code here to run when the applet starts
"appletOnLoad":function(api){ /* api.evalCommand('Segment((1,2),(3,4))');*/ },
"showFullscreenButton":true,
"scale":1,
"disableAutoScale":false,
"allowUpscale":false,
"clickToLoad":false,
"appName":"classic",
"buttonRounding":0.7,
"buttonShadows":false,
"language":"pt",
// use this instead of ggbBase64 to load a material from geogebra.org
// "material_id":"RHYH3UQ8",
// use this instead of ggbBase64 to load a .ggb file
// "filename":"myfile.ggb",
"ggbBase64":"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",
};
// is3D=is 3D applet using 3D view, AV=Algebra View, SV=Spreadsheet View, CV=CAS View, EV2=Graphics View 2, CP=Construction Protocol, PC=Probability Calculator DA=Data Analysis, FI=Function Inspector, macro=Macros
var views = {'is3D': 0,'AV': 1,'SV': 0,'CV': 0,'EV2': 0,'CP': 0,'PC': 0,'DA': 0,'FI': 0,'macro': 0};
var applet = new GGBApplet(parameters, '5.0', views);
window.onload = function() {applet.inject('ggbApplet')};
applet.setPreviewImage('data:image/gif;base64,R0lGODlhAQABAAAAADs=','https://www.geogebra.org/images/GeoGebra_loading.png','https://www.geogebra.org/images/applet_play.png');
</script>

Ou em OCaml:
```ocaml
let f x = 2 * x
```
> **Obs**: Na matemática é comum representarmos em equações simples o nome das funções como y(x) ou f(x), mas podemos também nomea-las como linear(x),  onde linear (x) = 2 * x.
> O mesmo acontece em OCaml onde é mais fácil trabalharmos como **let linear x = 2 * x**.