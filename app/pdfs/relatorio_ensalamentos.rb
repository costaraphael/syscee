class RelatorioEnsalamentos< Prawn::Document

  def initialize(ensalamentos, periodo)
    super()
    @ensalamentos = ensalamentos
    @periodo = periodo
    header
    text_content
    table_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    # image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
    text 'SYSCEE - Sistema de Controle de Equipamentos e Espaços - Relatório de ensalamentos.', size: 15, style: :bold
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 25

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    now = Time.now

    bounding_box([0, y_position], width: 540, height: 50) do
      text "Este relatório contém todos os ensalamentos realizados para o período \"#{@periodo.nome}\", até a data de sua emissão, #{now.strftime('dia %d/%m/%Y às %H:%M')}"
    end

  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths

    if @ensalamentos.nil?
      return text 'Não existe nenhum ensalamento efetuado para este período.'
    end
    table product_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
  end

  def product_rows
    [['COD', 'Disciplina', 'Sala']] +
        @ensalamentos.map do |ensalamento|
          [ensalamento.id, "(#{ensalamento.disciplina.curso.nome}) #{ensalamento.disciplina.nome}", ensalamento.sala.nome]
        end
  end
end