module List = struct
  include List
  let rec optmap f = function
    | [] -> []
    | hd :: tl ->
       match f hd with
       | None -> optmap f tl
       | Some x -> x :: optmap f tl
end;;

module type A = sig
	val nome : string
  val altura : float
end

module type B = sig
	include A
  val idade : int
end