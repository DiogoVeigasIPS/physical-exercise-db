use muscle_building;

-- Inserção de tags e categorias relevantes ******************************************************************************************************************************************************
insert ignore into tag (tag) values ('Overweight');
set @ultima_tag = last_insert_id();

insert ignore into categoria (categoria) values ('Lose Weight');
set @ultima_categoria = last_insert_id();

-- Inserção de uma pergunta e as suas respetivas respostas ******************************************************************************************************************************************************
-- Abaixo é inserida uma nova pergunta em inglês com a categoria de id 24
insert ignore into pergunta (pergunta, idioma, id_categoria) values ('Are calisthenics good for people who are above the weigth', 'EN', @ultima_categoria);
set @ultima_pergunta = last_insert_id();

-- Abaixo são inseridas 3 respostas
insert ignore into resposta (resposta) values ('Yes, calisthenics are good for any type of person, just focus on easier exercises for now.');
set @primeira_resposta = last_insert_id();
insert ignore into resposta (resposta) values ('It can be beneficial for any type of person just as any other physical exercise.');
insert ignore into resposta (resposta) values ('Yes, but it can be way more difficult to start, but if you decide to start, start with exercises for beginners');

-- Adicionar tags a respostas ******************************************************************************************************************************************************
insert ignore into resposta_possui_tag(id_resposta, id_tag) values (@primeira_resposta, @ultima_tag);
insert ignore into resposta_possui_tag(id_resposta, id_tag) values (@primeira_resposta+1, @ultima_tag);
insert ignore into resposta_possui_tag(id_resposta, id_tag) values (@primeira_resposta+2, @ultima_tag);

-- De seguida as respostas são associadas com a pergunta
insert ignore into resposta_responde_pergunta(id_resposta, id_pergunta) values (@primeira_resposta, @ultima_pergunta);
insert ignore into resposta_responde_pergunta(id_resposta, id_pergunta) values (@primeira_resposta+1, @ultima_pergunta);
insert ignore into resposta_responde_pergunta(id_resposta, id_pergunta) values (@primeira_resposta+2, @ultima_pergunta);

-- E por fim, deve também aprovar essa dada resposta (user será o administrador, neste caso, Diogo)
insert ignore into aprova (id_user, id_resposta) values (1, @primeira_resposta);
insert ignore into aprova (id_user, id_resposta) values (1, @primeira_resposta+1);
insert ignore into aprova (id_user, id_resposta) values (1, @primeira_resposta+2);

-- Abaixo pode encontrar a pergunta que acabou de ser inserida, bem como as respostas associadas e respetivas tags e categorias
select id_pergunta 'ID Pergunta', pergunta 'Pergunta', 
id_categoria 'ID Categoria', categoria 'Categoria',
id_resposta 'ID Resposta', resposta 'Resposta',
id_tag 'ID Tag', tag 'Tag'
from pergunta
natural join resposta_responde_pergunta 
natural join resposta
natural join categoria
natural join resposta_possui_tag
natural join tag
where id_pergunta = @ultima_pergunta;


-- Search (pesquisa por cada um dos tipos) *****************************************************************************************************************************************************************************
-- Pesquisa por tag: 'Saude'
select * from pesquisa_por_tag where Tag like 'Saude';

-- Pesquisa por Categoria: 'Musculação e Treinamento de Força'
select * from pesquisa_por_categoria 
where Categoria = 'Musculação e Treinamento de Força';

-- Pesquisa por pergunta: 'Obrigado!'
select * from pesquisa_por_frase
where Pergunta = 'Obrigado!';

-- Pesquisa livre: 'muscular'
select * from pesquisa_completa
where concat(Pergunta, Resposta, Categoria, Tag) like '%muscular%';


-- Logic (Aplicação dos métodos e procedimentos) *****************************************************************************************************************************************************************************
-- Criar sessao com todos os valores
call sp_criar_sessao(@token, 1, '123.12.1223', 4, timestamp('2019-01-01', '06:44:05'), timestamp('2019-01-01', '12:20:23'));
select @token as 'Token Gerado';
select * from sessao where token = @token;

-- Criar sessao sem datas
call sp_criar_sessao(@token, 1, '123.12.1223', 4, NULL, NULL);
select @token as 'Token Gerado';
select * from sessao where token = @token;

-- Clonar uma sessão
call sp_clonar_sessao(29, @novo_token);
select @novo_token as 'Token Temporario';
select * from sessao where token = @novo_token;

-- Terminar uma sessão
call sp_terminar_sessao(30, @fim_sessao);
select @fim_sessao as 'Fim Sessao';
select * from sessao where id_sessao = 30;

-- Função que retorna o numero de respostas com uma dada palavra
select fn_pesquisar_palavra('pagar') as 'Nº Respostas';

-- Função que recebe uma data e calcula a idade
select fn_calcular_idade('2003-11-20') as Idade;


-- Realizar uma pesquisa, associar uma resposta, bem como, atrbuir pontuação ***************************************************************************************************************************************************
set @id_sessao = 30;
set @conteudo_pesquisa = "above the weigth";

-- Pesquisa dinâmica do tipo livre
insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(@id_sessao, @conteudo_pesquisa, 'EN', 'L');

set @ultima_pesquisa = last_insert_id();
select @ultima_pesquisa;

-- Respostas obtidas consoante o conteudo de pesquisa
insert ignore into resposta_obtida (id_pesquisa, id_resposta)
select @ultima_pesquisa 'ID Pesquisa', `ID Resposta`  from pesquisa_completa
where concat(Pergunta, Resposta, Categoria, Tag) 
like concat("%", @conteudo_pesquisa, "%");

select * from pesquisa_completa;

-- Atribuir uma avaliacao a algumas das respostas recebidas pela pesquisa
insert into avaliacao (id_pesquisa, id_resposta, pontuacao) 
select id_pesquisa, id_resposta, 8
from resposta_obtida
where id_pesquisa = @ultima_pesquisa;

-- Seleção das respostas obtidas e pontuacao da ultima pesquisa pesquisa
select p.id_pesquisa 'ID Pesquisa', conteudo 'Conteudo Pesquisado',
i.idioma 'Idioma', tp.tipo 'Tipo Pesquisa'
,resposta 'Resposta Obtida', 
pontuacao 'Avaliacao'
from pesquisa p
inner join idioma i on i.codigo_iso = p.idioma
natural join tipo_pesquisa tp
natural join resposta_obtida
natural join resposta
natural join avaliacao
where p.id_pesquisa = @ultima_pesquisa;
