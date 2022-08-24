def menu_inicial()
  puts"|    Menu    |"
  puts"|------------|"
  puts"|1- Iniciar  |"
  puts"|0-  sair    |"
end

def menu_1()
  puts"|  Calculando  |"
  puts"|--------------|"

end

entrada = 5
until entrada == 0 do
  menu_inicial
  puts"> "
  entrada = gets.chomp.to_i
  case entrada
  when 0
    "saindo do programa"
    break
  when 1
    menu_1
    puts"doing my things...."
    novo = nil
    while novo != "s" and novo !="n"
      puts"deseja inserir outro arquivo(s/n):"
      novo = gets.chomp
      if novo == "n"
        entrada = 0
      elsif novo == "s"
        puts"chamando novo metodo pra ler arquivo"
      end
    end
  end
end
