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
    file_name = 'authors.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Author.create!(description: line.strip)
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
    file_name = 'publishers.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Publisher.create!(description: line.strip)
    end
  end

  desc "Cadastrando Assuntos"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
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
