class CalculaCr
  def initialize(ch)
    @cargaHoraria = ch

  end

  attr_reader :cargaHoraria

  def calcula(vet)
    # CR = Nota(i)*CargaHoraria(i)/TotalCargaHoraria
    notas = []
    vet.each { |disciplina| notas << disciplina[2].to_i * disciplina[3].to_i }
    cr = notas.sum/cargaHoraria
    return cr
  end
end