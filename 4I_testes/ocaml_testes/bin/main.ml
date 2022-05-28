open Compras

let () =
    let carrinho = [
      { id = 1; nome = "Samsung Galaxy s30 Plus"; valor = 36789.98} ;
      { id = 2; nome = "Fone de Ouvido Bluettoth JBL"; valor = 236.99} ;
    ]  in
    Printf.printf "--- Nota Fiscal --- \n Total da Compra: %s \n" (Float.to_string (total carrinho));;