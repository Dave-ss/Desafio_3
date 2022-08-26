require 'csv'
# require 'pry'
require_relative 'Aluno'
require_relative 'Curso'
class Leitor


  def initialize
    @alunos = []
    @cursos = []
    @arquivo = CSV.parse(File.read('notas.csv'), headers: true)
    rescue Exception => exception
      raise Exception, "Falha ao ler o arquivo #{exception}"
      exit(1)
  end

  attr_reader :arquivo
  attr_reader :alunos
  attr_reader :cursos

  def separar_aluno
    alunos = []
    File.open('notas.csv') do |file|
      dados = CSV.parse(File.read(file, encoding: 'bom|utf-8'), col_sep: ',', headers: true)
      dados = dados.group_by { |row| row['MATRICULA'] }
      dados.each { |k,v| alunos << Aluno.new(k,v) }
      alunos.each { |aluno| aluno.calcula_cr }
      # dados.each { |k|
      #   p k.to_h
      #   break }
      #
      # #
      # i = 0
      # t =  true
      # vet = []
      # alunos = []
      # while t
      #   if dados[i] == nil
      #     t = false
      #   elsif if (i > 0 and dados[i]["MATRICULA"] == dados[i-1]["MATRICULA"]) or
      #     (i == 0 and dados[i]["MATRICULA"] == dados[i+1]["MATRICULA"])
      #             vet << dados[i]
      #         else
      #           aluno = Aluno.new(vet)
      #           alunos << aluno
      #           vet = []
      #           #para ele nao perder a contagem
      #           if i > 2 and vet.size != 0
      #             i-=1
      #           end
      #         end
      #   end
      #   i += 1
      # end
      # #
      # vet << dados[-1]
      # aluno = Aluno.new(vet)
      # alunos << aluno
      # alunos.each { |aluno|  p aluno.calcula_cr
      # break}
      #parar
    end
  end


  def separar_curso
    alunos = []
    File.open('notas.csv') do |file|
      dados = CSV.parse(File.read(file, encoding: 'bom|utf-8'), col_sep: ',', headers: true)
      dados = dados.group_by { |row| row['COD_CURSO'] }
      dados.each { |k,v| alunos << Aluno.new(k,v)}
      p alunos
      # curso = Curso.new(alunos[0], alunos)




    end

  end
end

p = Leitor.new()
p.separar_aluno
p.separar_curso
