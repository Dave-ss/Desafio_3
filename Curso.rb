require_relative 'Calculadora'

=begin
classe para instanciar o objeto curso com
os atributos codigo, alunos, e o objeto calculadora.
sendo possivel calcular a media do curso metodos da calculadora
=end
class Curso
  def initialize(cod, alunos)
    @cod = cod
    @alunos = []
    @media = 0
    @c = Calculadora.new
    insere_alunos(alunos)
  end

  attr_reader :c
  attr_reader :cod
  attr_reader :alunos
  attr_reader :media


  def insere_alunos(vet)
    vet.each{|k| alunos << k}
  end

  def printa_alunos
    alunos.each { |k| p k }
  end

  def altera_media(m)
    @media = m
  end
end
