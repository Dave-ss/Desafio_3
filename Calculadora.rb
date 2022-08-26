class Calculadora

  def initialize()

  end

  def calcula_cr(vet, cargaHoraria)
    # CR = Nota(i)*CargaHoraria(i)/TotalCargaHoraria
    notas = []
    vet.each { |disciplina| notas << disciplina[3].to_i * disciplina[4].to_i }
    cr = notas.sum/cargaHoraria
    return cr
  end

  def calcula_ch(vet)
    cargaHoraria = 0
    vet.each { |disciplina| cargaHoraria += disciplina[4].to_i }
    return cargaHoraria
  end

  def calcula_media(curso, vet_alunos)
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