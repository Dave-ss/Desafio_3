require_relative 'Aluno'
class Curso
  def initialize(cod_curso, alunos)
    @cod_curso = cod_curso
    @alunos = []
  end

  attr_reader :alunos

  def insere(vet_alunos)
    vet_alunos.each do |a|
      p a
      alunos << a
    end
  end



end
