open Compras
open Alcotest

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

(* ACT *)

let test_positivos () =
  (check  @@ float e) "valores positivos de produto"  37026.97 (total cart_positivos)

let test_zeros () =
  (check  @@ float e) "valor zero de produto"  0. (total cart_zeros)

(* ASSERT *)
let () =
  run "Total" [
      "carrinhos de compras", [
          test_case "valores positivos de produto" `Quick test_positivos;
          test_case "valor zero de produto" `Quick test_zeros;
        ];
    ]
