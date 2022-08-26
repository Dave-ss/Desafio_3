# require 'pry'
require_relative 'CalculaCr'
class Aluno
  def initialize(mat, historico)
    @matricula = mat
    @disciplinas = []
    @total_carga_horaria = 0
    insere(historico)
    calcula_carga(disciplinas)
    end

  attr_reader :matricula
  attr_reader :disciplinas
  attr_reader :total_carga_horaria

  def calcula_cr()
    p "#{matricula} - #{CalculaCr.new(total_carga_horaria).calcula(disciplinas)}"
  end

  private
  def insere(array)
    array.each { |i|
      disciplinas << i[1..5]
    }
  end

  def calcula_carga(array)
    array.each {|h|
      @total_carga_horaria += h[3].to_i
    }

  end
end