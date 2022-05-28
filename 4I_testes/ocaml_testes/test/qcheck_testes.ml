open Compras
open Alcotest
open QCheck

let carrinho = [  
    { id = 1; nome = "Computador Avell A62"; valor = 8764.50} ;
    { id = 2; nome = "Mouse Blueetoth Microsoft"; valor = 185.99} 
];;

let test_adiciona_item =
  Test.make ~count:1000
    ~name: "adiciona um item"
    (list small_nat)
    (fun l -> (List.length l) + 1 = List.length (adiciona_item 1 l) )


let () =
  Printexc.record_backtrace true;
  run "Adiciona Item" [
    "suite",  List.map QCheck_alcotest.to_alcotest
    [ test_adiciona_item ]
  ]