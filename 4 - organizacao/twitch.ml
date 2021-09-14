module Eduardo =  sig
  val imprime : unit -> unit
end 
= 
struct
  let link = "https://www.twitch.tv/eduardorfs"
  let imprime () = Printf.printf "Você pode ver lives de OCaml em %s \n" link
end

(* Agora link não é mais acessível a partir daqui *)

let link_emelle () = Printf.printf "Você pode ver entrevistas sobre OCaml em %s \n" "https://www.twitch.tv/emelletv";

let lista_links () =
  Eduardo.imprime ();
  link_emelle ()