require 'csv'
require 'Aluno'

File.open('C:\Users\davi2\RubymineProjects\Desafio_3\notas.csv') do |file|
  CSV.foreach(file, headers: true) do |row|
    next if row.empty?

    puts row["MATRICULA"], row["COD_DISCIPLINA"],
         row["COD_CURSO"], row["NOTA"],
         row["CARGA_HORARIA"], row["ANO_SEMESTRE"]

  end
end