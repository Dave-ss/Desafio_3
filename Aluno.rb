require_relative 'Calculadora'

=begin
classe para instanciar o objeto aluno com
os atributos matricula, disciplina, e o objeto calculadora.
sendo possivel calcular o cr e a carga horaria atraves dos
metodos da calculadora
=end

class Aluno
  def initialize(matricula, historico)
    @matricula = matricula
    @disciplinas = historico
    @cargaHoraria = 0
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