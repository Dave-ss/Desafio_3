require 'csv'
require_relative 'Universidade'

class Leitor
  def initialize(nome_arquivo)
    @universidade = Univesidade.new
    @nome_arquivo = nome_arquivo
    @arquivo =  CSV.parse(File.read(nome_arquivo), headers: true)
  rescue Exception => exception
    raise Exception, "Falha ao ler o arquivo #{exception}"
    exit(1)
  end

  attr_reader :nome_arquivo
  attr_reader :arquivo
  attr_reader :universidade

  def agrupa_dados
    File.open('notas.csv') do |file|
      dado_bruto = CSV.parse(File.read(file, encoding: 'bom|utf-8'), col_sep: ',', headers: true)
      dados_aluno = dado_bruto.group_by { |row| row['MATRICULA'] }
      dados_aluno.each { |k,v| universidade.insere_aluno(k,v) }
      dados_curso = dado_bruto.group_by { |row| row['COD_CURSO'] }
      dados_curso.each { |k,v|
        alunos = []
        teste = v.group_by{ |row| row['MATRICULA'] }
        teste.each { |x,y| alunos << x
        }
        universidade.insere_curso(k, alunos)
      }
    end
  end

  def printa_crs
    universidade.calcula_cr
    universidade.printa_cr
  end

  def printa_media_cursos
    universidade.calcula_cr
    universidade.media_cursos
  end

end



