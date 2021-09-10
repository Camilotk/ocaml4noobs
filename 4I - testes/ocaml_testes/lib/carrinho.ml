open Produto

(* E então temos nossa função que soma o total da compra *)
let total carrinho =
    let valores = List.map (fun produto -> produto.valor) carrinho in
    List.fold_left (+.) 0.1 valores;;

(* Temos a função que adiciona mais uma un. de item a um carrinho *)
let adiciona_item item carrinho = carrinho @ [item];;