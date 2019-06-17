# ComandaAPI :notebook:

Esta é uma simples API para cadastro de comandas e usuários. Desenvolvida em ruby, utlizando o framework Ruby on Rails.


## Do que você vai precisar :point_down:

Ruby versão: 
```
2.3.3
```

Rails versão:
```
5.1.7
```
Banco de Dados:
```
MariaDB 
```

## Bora rodar esse projeto? :ok_woman:

1. Primeiramente, altere o arquivo _database.yml_, com os dados para a conexão do seu banco de dados.

```
default: &default
  adapter: mysql2
  encoding: utf8
  host: <seu host>
  username: <seu username>
  password: <sua senha>
  
```

2. Agora você precisa alterar o nome da database, para rodar o projeto. Ainda no mesmo arquivo  _database.yml_, nos ambientes, caso você for rodar localmente, você pode alterar apenas o ambiente _development_.

```
development:
  <<: *default
  database: <sua database>
  
```

3. Rodar migrations para a crição das tabelas na database:
```
rake db:migrate
```
4. Iniciar o projeto

```
rails s
```

Prontinho, agora é só começar a fazer requisições para os métodos diponíveis na API. :bowtie:

A documentação encontra-se em localhost:8080/RestApiFurb/api-docs :squirrel:

