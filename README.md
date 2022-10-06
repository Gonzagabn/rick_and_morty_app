# rick_and_morty_app

Projeto flutter desenvolvido com GetX e GetX Pattern.

## Resumo do Projeto

O projeto tem objetivo de apresentar alguns dados dos personagens da série Rick and Morty, 
a partir de uma REST API "https://rickandmortyapi.com/" (documentação aqui)

## Funções do app

Na tela Home é possivel ver três cards que direcionam o usuário para as funcionalidades de:

  - Lista de Personagens;
  - Busca de Personagens;
  - Detalhes do Personagem;
  - Personagens favoritos.
 
### Lista de personagens

Essa funcionalidade exibe uma tela com todos os personagens, sendo carregados de 20 em 20 de
acordo com a vontade do usuário, clicando no botão "carregar mais".

### Busca de Personagens

Aqui nessa funcionalidade, é permitido ao usuário buscar personagens pelo seu nome, ou parte
dele, podendo ainda escolher filtrar o personagem por espécie, selecionando "Humano", "Alien",
ou ainda nenhuma das duas opções, o que retorna todos os resultados para a busca.

Nesta página o carregamento e atualização de novos personagens acontece com o simples scroll da lista. 

### Detalhes do personagem

Ao visualizar e clicar no card que contem o nome e a foto de um personagem, é possível visualizar 
mais informações deste, como "nome", "gênero", "origem", "status", "specie" e "episódios" em que ele aparece.
Além disso ao clicar no card que contém a foto do personagem e um coração ao lado, este pode ser marcado, 
ou desmarcado como favorito.

### Personagens favoritos

Nesse módulo o usuário consegue ver a lista de personagens favoritos, sendo possível acessar seus 
detalhes, e limpar a lista quando quiser.

## Detalhes de implementação

Este projeto possui:

  - Armazenamento local com GetStorage;  
  - Navegação com passagem de parâmetros;
  - Requisições HTTP com GetConnect;
  - QueryStrings para filtragem de dados;
  - Tratamento de erros http;
  - Teste de integração;
  - Componentização de widgets;
  - Componentização de estilos e cores;
  - Ícone customizado;
  - Splash screen customizada.
