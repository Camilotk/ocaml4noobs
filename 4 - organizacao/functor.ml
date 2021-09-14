module type Stringable = sig 
  type t 
  val toString : t -> string 
end

module Printer (Item:Stringable) =
  struct
    let print (t : Item.t) = print_endline (Item.toString t)
    let printList (list : Item.t list) =
      ((list |> (List.map Item.toString)) |>
         (String.concat ((", ")[@reason.raw_literal ", "])))
        |> print_endline
  end

module IntPrinter = Printer(struct 
  type t = int 
  let toString = string_of_int 
end)

let _ = IntPrinter.print 10