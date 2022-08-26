=begin
classe utilizada para fazer os calculos relacionados aos alunos e aos cursos
=end

class Calculadora

  def initialize()

  end
  #este metodo recebe um vetor e uma variavel, nesse caso esta recebendo as disciplinas do aluno e a sua carga horaria
  # para entao calcular e retornar o seu respectivo cr
  def calcula_cr(vet, cargaHoraria)
    # CR = Nota(i)*CargaHoraria(i)/TotalCargaHoraria
    notas = []
    vet.each { |disciplina| notas << disciplina[3].to_i * disciplina[4].to_i }
    cr = notas.sum/cargaHoraria
    return cr
  end
  #este metodo recebe um vetor, nesse caso esta recebendo as disciplinas cursadas pelo aluno e fazendo a soma de
  # suas cargas horarias
  def calcula_ch(vet)
    cargaHoraria = 0
    vet.each { |disciplina| cargaHoraria += disciplina[4].to_i }
    return cargaHoraria
  end

  #este metodo recebe um objeto curso e um vetor contendo todos os alunos
  #para entao verificar os crs dos alunos que tiveram uma passagem por aquele curso
  # e entao fazer o calculo de sua media e retornar a mesma
  def calcula_media(curso, vet_alunos)
    #soma dos crs de alunos que passaram por disciplina do curso / total de alunos passaram por disciplina do curso
    soma_nota = 0
    #verifica e busca os crs dos respectivos alunos e incrementa na var soma_nota
    curso.alunos.each { |aluno|
      vet_alunos.each { |a|
        if a.matricula == aluno
          soma_nota += a.cr
        end}
    }
    media = soma_nota/curso.alunos.length
    return media
  end



end