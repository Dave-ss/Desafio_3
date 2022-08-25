require 'csv'
# require 'pry'
require_relative 'Aluno'
class Leitor


  def initialize
    @arquivo = CSV.parse(File.read('notas.csv'), headers: true)
    rescue Exception => exception
      raise Exception, "Falha ao ler o arquivo #{exception}"
      exit(1)
  end

  attr_reader :arquivo

  def separar_aluno

    File.open('notas.csv') do |file|
      aux = CSV.parse(File.read(file, encoding: 'bom|utf-8'), col_sep: ',', headers: true)
      aux.group_by { |row| row['MATRICULA'] }
      i = 0
      vet = []
      alunos = []
      #laço para criar os objetos aluno com suas respectivas turmas cursadas
      while aux[i] != nil
        if i > 0
          if aux[i+1] == nil or aux[i]["MATRICULA"] == aux[i-1]["MATRICULA"]
            vet << aux[i]
          else
            p vet[0]['MATRICULA']
            aluno = Aluno.new(vet)
            alunos << aluno
            vet = []
          end
        else
          if aux[i+1] == nil or aux[i]["MATRICULA"] == aux[i+1]["MATRICULA"]

            vet << aux[i]
          else
            p vet[0]['MATRICULA']
            aluno = Aluno.new(vet)
            alunos << aluno
            vet = []
          end
        end
        i += 1
      end
    end
  end

  def separar_curso
    aux = CSV.parse(File.read(file, encoding: 'bom|utf-8'), col_sep: ',', headers: true)
    aux.group_by { |row| row['COD_CURSO'] }



  end


end

p = Leitor.new()
p.separar_aluno