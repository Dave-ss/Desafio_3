require 'csv'
require_relative 'universidade'
=begin
classe para fazer a leitura do arquivo no formato .csv
onde é feito o tratamento dos dados para a criação dos alunos e dos cursos
=end

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


#logica para  resolucao dessa questao utilizar o metodo agrupa dados para agrupar o arquivo de acordo
# com a matricula do aluno para fazer a criação do aluno com suas respectivas materias cursadas,
# e de acordo com o codigo do curso para entao criar o curso com os alunos que cursaram disciplinas do mesmo.

  def agrupa_dados
    File.open('notas.csv') do |file|
      dado_bruto = CSV.parse(File.read(file, encoding: 'bom|utf-8'), col_sep: ',', headers: true)
      dados_aluno = dado_bruto.group_by { |row| row['MATRICULA'] }                                           # agrupa os dados brutos pela matricula
      dados_aluno.each { |k,v| universidade.insere_aluno(k,v) }                                      # envia os dados de cada aluno para a unicersidade onde ele será criado
      dados_curso = dado_bruto.group_by { |row| row['COD_CURSO'] }                                           # agrupa os dados pelo cod do curso
      dados_curso.each { |k,v|                                                                       # para cada item agrupado pelo cod do curso
        alunos = []
        dados_arranjados = v.group_by{ |row| row['MATRICULA'] }                                              # agrupa todos as materias que o aluno fez naquele curso para evitar repetiçoes
        dados_arranjados.each { |x,y| alunos << x                                                    # coloca os alunos em um vetor que sera passado junto com a criação do curso
        }
        universidade.insere_curso(k, alunos)
      }
    end
  end

#metodo para exibir os crs dos alunos
  def printa_crs
    universidade.calcula_cr
    universidade.printa_cr
  end

#metodo para exibir a media dos cursos
  def printa_media_cursos
    universidade.calcula_cr
    universidade.media_cursos
  end

end



