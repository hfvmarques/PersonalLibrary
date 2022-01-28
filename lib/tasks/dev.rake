namespace :dev do
  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando DB...') { %x(rails db:drop) }
      show_spinner('Criando DB...') { %x(rails db:create) }
      show_spinner('Migrando DB...') { %x(rails db:migrate) }
      show_spinner('Cadastrando Admin...') { %x(rails dev:add_default_admin) }
      show_spinner('Cadastrando Admins Extras...') { %x(rails dev:add_extra_admins) }
      show_spinner('Cadastrando Autores...') { %x(rails dev:add_authors) }
      show_spinner('Cadastrando Tipos de Livro...') { %x(rails dev:add_book_types) }
      show_spinner('Cadastrando Editoras...') { %x(rails dev:add_publishers) }
      show_spinner('Cadastrando Assuntos...') { %x(rails dev:add_subjects) }
      show_spinner('Cadastrando Livros...') { %x(rails dev:add_books) }
      show_spinner('Cadastrando Empréstimos...') { %x(rails dev:add_loans) }
    else
      puts "Você não está em ambiente de desenvolvimento!"    
    end    
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona administradores extras"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Cadastrando Autores"
  task add_authors: :environment do
    50.times do |a|
      Author.create!(
        description: Faker::Book.author
      )
    end
  end

  desc "Cadastrando Tipos de Livro"
  task add_book_types: :environment do
    file_name = 'book_types.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      BookType.create!(description: line.strip)
    end
  end

  desc "Cadastrando Editoras"
  task add_publishers: :environment do
    20.times do |p|
      Publisher.create!(
        description: Faker::Book.publisher
      )
    end
  end

  desc "Cadastrando Assuntos"
  task add_subjects: :environment do
    20.times do |s|
      Subject.create!(
        description: Faker::Book.genre
      )
    end
  end

  desc "Cadastrando Livros"
  task add_books: :environment do
    50.times do |b|
      b = Book.create!(
        title: Faker::Book.title,
        publisher: Publisher.all.sample,
        published_at: rand(1900..2022),
        edition: rand(1..30),
        book_type: BookType.all.sample,
        active_loan: false
      )
      b.subjects << Subject.all.sample(rand(1..3))
      b.authors << Author.all.sample(rand(1..3))
    end
  end

  desc "Cadastrando Empréstimos"
  task add_loans: :environment do
    5.times do |l|
      l = Loan.create!(
        book: Book.all.sample,
        description: Faker::Name.name,
        loaned_at: Faker::Date.between(from: 10.days.ago, to: Date.today)
      )
      l.book.active_loan = true
      l.book.save
    end
  end

  private

  def show_spinner(start_msg, end_msg = 'Concluído!')
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}", format: :bouncing)
    spinner.auto_spin
    yield
    spinner.success(end_msg)  
  end

end
