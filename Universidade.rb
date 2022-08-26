
require_relative 'Aluno'
require_relative 'Curso'


class Univesidade
  def initialize()
    @calculadora = Calculadora.new
    @alunos = []
    @cursos = []
  end

  attr_reader :alunos
  attr_reader :cursos
  attr_reader :calculadora

  def insere_aluno(k, v)
    alunos << Aluno.new(k,v)
  end

  def calcula_cr
    alunos.each{|i| i.calcula_cr}
  end

  def printa_cr
    puts "------- O CR dos alunos é: --------"
    alunos.each{|i| i.printa_cr}
    puts "-----------------------------------"

  end

  def insere_curso(k, v)
    cursos << Curso.new(k, v)
  end

  def media_cursos
    puts "----- Média de CR dos cursos ------"
    cursos.each do |c|
      c.altera_media(calculadora.calcula_media(c, alunos))
      puts "#{c.cod} - #{c.media}"
    end
    puts "-----------------------------------
"
  end

end