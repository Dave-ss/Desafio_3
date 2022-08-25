require 'csv'
require_relative 'Aluno'




File.open('notas.csv') do |file|
  aux = CSV.parse(File.read(file, encoding: 'bom|utf-8'), col_sep: ',', headers: true) #do |row|
  aux.group_by { |row| row['MATRICULA'] }
  #agrupando pela matricula
  i=0
  c=0
  hash = {}
  vet = []
  while aux[i+1] != nil
    aux2 = aux[i]["MATRICULA"]
    if aux[i]["MATRICULA"] == aux[i+1]["MATRICULA"]

      vet << aux[i]
      aux2 = aux[i]["MATRICULA"]
    end
    if aux[i]["MATRICULA"] != aux[i+1]["MATRICULA"]
      break
    end
    i+=1
  end
  p vet[14]


  # separa_matricula(aux)

end



def separa_matricula(aux)
  aux.group_by { |row| row['MATRICULA'] }
  c = conta_matricula(aux)
  p c
end

def conta_matricula(aux)
  i = 0
  c = 0
  matricula = aux[i]["MATRICULA"]
  while matricula != nil
    if matricula != aux[i+1]
      c += 1
    end
    i += 1
  end
  return c
  #laço para contar quantas matriculas distintas há
end


# aux.each do |key, value|
#   p key
#   p value
# end
#
# array = aux



    # aux = Aluno.new(array)
    # array = []
    # hash << aux
  # end
# end
#
# for i in hash
#   i.printa
#   break
# end

# p array[1..2]

