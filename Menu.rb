require_relative 'CsvReader'
=begin
classe principal utilizada para exibir o menu para o usuario e chamar os respectivos metodos
=end


def menu_inicial()
  puts"|    Menu    |"
  puts"|------------|"
  puts"|1- Iniciar  |"
  puts"|0-  sair    |"
end

def menu_1()
  puts"|   Selec Arq  |"
  puts"|--------------|"
  puts"|  1-Inserir o |"
  puts"|    arquivo   |"
  puts"|  2-Arquivo   |"
  puts"|    padrao    |"
  puts"|  3-Voltar    |"
  puts"|--------------|"
end

def menu_2()
  puts"|  Calculando  |"
  puts"|--------------|"
  puts"|  1-Exibir    |"
  puts"|     Crs      |"
  puts"|  2-Exibir    |"
  puts"|    medias    |"
  puts"|  3-Exibir    |"
  puts"|    ambos     |"
  puts"|  4-Voltar    |"
  puts"|--------------|"
end

#Menu_principal
def menu
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
      while true
        menu_1
        puts ">"
        entrada_menu1 = gets.chomp.to_i
        nome_arq = 'notas.csv'
        case entrada_menu1
        when 1
          puts"Insira o nome do arquivo"
          puts">"
          nome_arq = gets.chomp.to_s
          break
        when 2
          puts"Utilizando arquivo padrao"
          nome_arq = 'notas.csv'
          break
        when 3
          nome_arq = nil
          break
        end
      end

      unless nome_arq.nil?
        arquivo = Leitor.new(nome_arq)
        arquivo.agrupa_dados
        while true
          menu_2
          entrada_menu2 = gets.chomp.to_i
          puts">"
          case entrada_menu2
          when 1
            arquivo.printa_crs
          when 2
            arquivo.printa_media_cursos
          when 3
            arquivo.printa_crs
            arquivo.printa_media_cursos
          when 4
            break
          end
        end
      end

      menu_inicial
    end
  end
end

menu