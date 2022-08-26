require_relative 'CsvReader'


def menu_inicial()
  puts"|    Menu    |"
  puts"|------------|"
  puts"|1- Iniciar  |"
  puts"|0-  sair    |"
end

def menu_1()
  puts"|  Calculando  |"
  puts"|--------------|"
  puts"|  1-Inserir o |"
  puts"|    arquivo   |"
  puts"|  2-Arquivo   |"
  puts"|    padrao    |"
  puts"|--------------|"
end


def menu_2()
  puts"|  Calculando  |"
  puts"|--------------|"
  puts"|  1-Exibir    |"
  puts"|     Crs      |"
  puts"|  2-Exibir    |"
  puts"|    medias    |"
  puts"|--------------|"
end


entrada = 5
menu_inicial
until entrada == 0 do
  puts"> "
  entrada = gets.chomp.to_i
  case entrada
  when 0
    "saindo do programa"
    break
  when 1
    menu_1
    puts ">"
    entrada_menu1 = gets.chomp.to_i
    nome_arq = 'notas.csv'
    case entrada_menu1
    when 1
      puts"Insira o nome do arquivo"
      puts">"
      nome_arq = gets.chomp.to_s
    when 2
      puts"Utilizando arquivo padrao"

    end

    arquivo = Leitor.new(nome_arq)
    arquivo.agrupa_dados

    menu_2
    entrada_menu2 = gets.chomp.to_i
    puts">"
    case entrada_menu2
    when 1
      arquivo.printa_crs
    when 2
      arquivo.media_cursos
    end


    menu_inicial
  end
end

