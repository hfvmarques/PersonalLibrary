# Personal Library
## Aplicação MVC construída em Ruby on Rails para gerenciamento pessoal de livros
### Versões
- Ruby 2.7.0
- Rails 5.2.0

### Produção
A aplicação roda no endereço https://biblioteca-pessoal.herokuapp.com/

### Desenvolvimento
Clonar o repositório

Atualmente a aplicação roda localmente em um container do docker.

Para _buildar_, entrar na pasta principal da aplicação e rodar o comando `docker-compose build`

Em seguida, para rodá-la, executar `docker-compose up`, ou, se preferir continuar tendo acesso ao terminal com a aplicação rodando em segundo plano, `docker-compose up -d`

Ela estará funcionando em `http://localhost:3000`

Para rodar os testes, executar o comando `docker-compose exec app bin/rspec`

Para rodar o _linter_, executar o comando `docker-compose exec app bundle exec rubocop`
