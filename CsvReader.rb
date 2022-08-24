require 'csv'
require 'pry'

class Leitor


  def initialize
    @file = CSV.parse(File.read('C:\Users\davi2\RubymineProjects\Desafio_3\notas.csv'), headers: true)
    rescue Exception => exception
      raise Exception, "Falha ao ler o arquivo #{exception}"
  end

  # binding.pry

  def ler
    CSV.foreach(file,header: true) do|row|
      next if row.empty?
      puts row["MATRICULA"], row["COD_DISCIPLINA"],
           row["COD_CURSO"], row["NOTA"],
           row["CARGA_HORARIA"], row["ANO_SEMESTRE"]
      end
  end

  attr_reader :file
end

p = Leitor.new()
p.ler