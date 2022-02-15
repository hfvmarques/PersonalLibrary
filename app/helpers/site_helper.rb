# frozen_string_literal: true

module SiteHelper
  # rubocop:disable Metrics/AbcSize
  def header_message
    case params[:action]
    when 'index'
      "Todos os livros cadastrados: #{count_books}"
    when 'books'
      "Resultado de busca de livros cujos assuntos possuam \"#{params[:term]}\": #{count_books}"
    when 'subject'
      "Livros cadastrados com assunto \"#{params[:subject]}\": #{count_books}"
    when 'author'
      "Livros cadastrados do autor \"#{params[:author]}\": #{count_books}"
    when 'publisher'
      "Livros cadastrados da editora \"#{params[:publisher]}\": #{count_books}"
    when 'book_type'
      "Livros cadastrados do tipo \"#{params[:book_type]}\": #{count_books}"
    end
  end
  # rubocop:enable Metrics/AbcSize

  private

  # rubocop:disable Rails/HelperInstanceVariable
  def count_books
    @books.count
  end
  # rubocop:enable Rails/HelperInstanceVariable
end
