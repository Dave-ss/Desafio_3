class Aluno
  attr_reader :nome

  def initialize(matricula, disciplinas)
    @matricula = matricula["MATRICULA"]
    @disciplinas = disciplinas
  end

end