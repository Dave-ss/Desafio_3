require_relative 'Calculadora'


class Aluno

  def initialize(matricula, historico)
    @matricula = matricula
    @disciplinas = historico
    @cargaHoraria =
      @cr = 0
    @c = Calculadora.new()
  end

  attr_reader :c
  attr_reader :cr
  attr_reader :matricula
  attr_reader :disciplinas
  attr_reader :cargaHoraria

  def calcula_cr
    @cargaHoraria = c.calcula_ch(disciplinas)
    @cr = c.calcula_cr(disciplinas, cargaHoraria)
  end

  def printa_cr
    puts "#{matricula} - #{cr}"
  end

end