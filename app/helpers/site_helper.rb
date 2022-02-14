# frozen_string_literal: true

module SiteHelper
  def header_message
    case params[:action]
    when 'index'
      'Todos os livros cadastrados'
    when 'books'
      "Resultado de busca de livros cujos assuntos possuam \"#{params[:term]}\""
    when 'subject'
      "Livros cadastrados com assunto \"#{params[:subject]}\""
    when 'author'
      "Livros cadastrados do autor \"#{params[:author]}\""
    when 'publisher'
      "Livros cadastrados da editora \"#{params[:publisher]}\""
    when 'book_type'
      "Livros cadastrados do tipo \"#{params[:book_type]}\""
    end
  end
end
