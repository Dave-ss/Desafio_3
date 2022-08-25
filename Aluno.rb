# require 'pry'
class Aluno
  def initialize(array)
    @matricula = array[0]["MATRICULA"]
    @disciplinas = []
    @total_carga = 0
    # calcula_carga(array)
    insere(array)
    p total_carga
    # @disciplinas[:disciplina["COD_DISCIPLINA"]] = {disciplina[:"COD_DISCIPLINA"] = disciplina["COD_DISCIPLINA"], disciplina[:"COD_CURSO"] = disciplina["COD_CURSO"]}

  end

  attr_reader :matricula
  attr_reader :disciplinas
  attr_reader :total_carga


  def printa
    # disciplinas.each do |row|
    #   p row
    p disciplinas


  end

  # def call
  #   printa
  # end

  private
  def insere(array)
    array.each { |i|
      disciplinas << i[1..5]
    }
  end

  def calcula_carga(array)
    array.each {|h|
      p h[1]
      # @total_carga += h[4].to_i
    }

  end
end