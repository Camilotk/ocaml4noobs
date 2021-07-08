let double x = x * 2
let double_sum = [6;7;8]
  |> List.map double  
  |> List.fold_left (+) 0;;

Printf.printf "%d" double_sum