type data = {dia: int; mes: int; ano: int}

let nova dia mes ano = { dia = dia; mes = mes; ano = ano }

let diferenca primeira segunda = { 
  dia = primeira.dia - segunda.dia;
  mes = primeira.mes - segunda.mes;
  ano = primeira.ano - segunda.ano; 
}

let anos data = data.ano;