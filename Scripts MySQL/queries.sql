use muscle_building;

-- Q1.1 
-- Listagem de utilizadores do género feminino
select id_user 'ID Utilizador', concat(nome_proprio, " ", apelido) 'Nome Completo',
email 'Email', data_nascimento 'Data Nascimento', 
fn_calcular_idade(data_nascimento) 'Idade',
`password` 'Password', p.codigo_iso 'Codigo ISO', pais 'Pais',
g.codigo_genero 'Codigo Genero', genero 'Genero' from `user`
natural join pais p
natural join genero g
where g.codigo_genero = 'F'
order by nome_proprio, apelido;

-- Q1.2 
-- Listagem de utilizadores do Reino Unido
select id_user 'ID Utilizador', concat(nome_proprio, " ", apelido) 'Nome Completo',
email 'Email', `data_nascimento` 'Data Nascimento', 
fn_calcular_idade(data_nascimento) 'Idade',
`password` 'Password', p.codigo_iso 'Codigo ISO', pais 'Pais',
g.codigo_genero 'Codigo Genero', genero 'Genero' from `user`
natural join pais p
natural join genero g
where p.codigo_iso =  'UK'
order by nome_proprio, apelido;

-- Q1.3
-- Listagem de utilizadores com pelo menos 18 anos
select id_user 'ID Utilizador', concat(nome_proprio, " ", apelido) 'Nome Completo',
email 'Email', `data_nascimento` 'Data Nascimento', 
fn_calcular_idade(data_nascimento) 'Idade',
`password` 'Password', p.codigo_iso 'Codigo ISO', pais 'Pais',
g.codigo_genero 'Codigo Genero', genero 'Genero' from `user`
natural join pais p
natural join genero g
where fn_calcular_idade(data_nascimento) >= 18
order by Idade, nome_proprio, apelido;


-- Q2.1
-- Listagem de perguntas por idioma
select id_pergunta 'ID Pergunta', pergunta Pergunta,
data_entrada 'Data Entrada', ifnull(ultima_atualizacao, 'Nenhuma atualizacao realizada') 'Ultima Atualizacao',
p.idioma 'Codigo Idioma', i.idioma Idioma,
c.id_categoria 'ID Categoria', categoria 'Categoria'
from pergunta p 
-- natural join categoria c
left join categoria c on c.id_categoria = p.id_categoria
inner join idioma i on p.idioma = i.codigo_iso
where p.idioma = 'EN'
order by id_pergunta;

-- Q2.2
-- Listagem de perguntas que já foram atualizadas
select id_pergunta 'ID Pergunta', pergunta Pergunta,
data_entrada 'Data Entrada', ultima_atualizacao 'Ultima Atualizacao',
p.idioma 'Codigo Idioma', i.idioma Idioma,
c.id_categoria 'ID Categoria', categoria 'Categoria'
from pergunta p 
	left join categoria c on c.id_categoria = p.id_categoria
inner join idioma i on p.idioma = i.codigo_iso
where ultima_atualizacao is not null
order by id_pergunta;

-- Q2.3
-- Listagem de perguntas que possuem respostas, apenas respostas ativas
select id_pergunta 'ID Pergunta', pergunta Pergunta,
data_entrada 'Data Entrada', ifnull(ultima_atualizacao, 'Nenhuma atualizacao realizada') 'Ultima Atualizacao',
p.idioma 'Codigo Idioma', i.idioma Idioma,
c.id_categoria 'ID Categoria', categoria 'Categoria'
from pergunta p 
left join categoria c on c.id_categoria = p.id_categoria
inner join idioma i on p.idioma = i.codigo_iso
natural join resposta_responde_pergunta 
natural join resposta 
natural join aprova a 
order by id_pergunta;


-- Q3.1
-- Listagem de respostas aprovadas
select id_resposta 'ID Resposta', resposta 'Resposta'
from resposta
natural join aprova
order by 1;

-- Q3.2
-- Listagem de respostas que estão em inglês (aprovadas ou não)
select id_resposta 'ID Resposta', resposta 'Resposta'
from resposta
natural join resposta_responde_pergunta
natural join pergunta p
where p.idioma = 'EN'
order by 1;

-- Q3.3
-- Listagem de respostas que possuem pelo menos 2 tags
select count_tag.count as 'Nº Tags',
r.resposta AS 'Resposta',
r.id_resposta as 'ID Resposta'
from resposta r
natural join resposta_responde_pergunta
inner join (
    select rpt.id_resposta, count(*) as count
    from resposta_possui_tag rpt
    group by rpt.id_resposta
    having count(*) > 2
)count_tag on count_tag.id_resposta = r.id_resposta
order by count_tag.count desc, 1;


-- Q4.1
-- Listagem de sessões que ainda não terminaram (ativas)
select id_sessao 'ID Sessao', token 'Token', id_user 'ID User',
concat(nome_proprio, " ", apelido) 'Nome Completo',
ip 'IP', inicio 'Inicio', id_dispositivo 'ID Dispositivo', tipo 'Dispositivo'
from sessao
natural join `user`
natural join tipo_dispositivo
where fim is null
order by 1;

-- Q4.2
-- Listagem de sessões realizadas num smart phone
select id_sessao 'ID Sessao', token 'Token', id_user 'ID User',
concat(nome_proprio, " ", apelido) 'Nome Completo',
ip 'IP', inicio 'Inicio', id_dispositivo 'ID Dispositivo', tipo 'Dispositivo'
from sessao
natural join `user`
natural join tipo_dispositivo
where id_dispositivo = 3
order by 1;

-- Q4.3
-- Listagem de sessões que já terminaram (fechadas)
select id_sessao 'ID Sessao', token 'Token', id_user 'ID User',
concat(nome_proprio, " ", apelido) 'Nome Completo',
ip 'IP', inicio 'Inicio', fim Fim,
id_dispositivo 'ID Dispositivo', tipo 'Dispositivo'
from sessao
natural join `user`
natural join tipo_dispositivo
where fim is not null
order by 1;

-- Q4.4
-- Listagem de sessões até ao final de 2022
select id_sessao 'ID Sessao', token 'Token', id_user 'ID User',
concat(nome_proprio, " ", apelido) 'Nome Completo',
ip 'IP', inicio 'Inicio', ifnull(fim, 'A decorrer') Fim,
id_dispositivo 'ID Dispositivo', tipo 'Dispositivo'
from sessao
natural join `user`
natural join tipo_dispositivo
where year(fim) <= 2022
order by 1;


-- Q5
-- Lista de sessões de cada utilizador ordenadas por duração (desc)
select id_sessao 'ID Sessao', token 'Token', id_user 'ID User',
concat(nome_proprio, " ", apelido) 'Nome Completo',
ip 'IP', inicio 'Inicio', ifnull(fim, 'A decorrer') Fim,
timediff(ifnull(fim, now()), inicio) 'Duracao',
id_dispositivo 'ID Dispositivo', tipo 'Dispositivo'
from sessao
natural join `user`
natural join tipo_dispositivo
order by timediff(ifnull(fim, now()), inicio) desc, 1;


-- Q6
-- Lista das questões que não foram pesquisadas no ano atual (Não mostra a data, mas mostra as perguntas corretas, reparar na pergunta 14)
select id_pergunta 'ID Pergunta', pergunta Pergunta,
data_entrada 'Data Entrada', ifnull(ultima_atualizacao, 'Nenhuma atualizacao realizada') 'Ultima Atualizacao',
p.idioma 'Codigo Idioma', i.idioma Idioma,
c.id_categoria 'ID Categoria', categoria 'Categoria'
from pergunta p 
left join categoria c on c.id_categoria = p.id_categoria
inner join idioma i on p.idioma = i.codigo_iso
where id_pergunta in (
	select p.id_pergunta
    -- , pergunta, data_pesquisa
	from pergunta p
	left join pergunta_pesquisada ppp on p.id_pergunta = ppp.id_pergunta
	left join pesquisa pes on pes.id_pesquisa = ppp.id_pesquisa
	where year(data_pesquisa) <> year(now()) 
	or data_pesquisa is null
	order by 1
)
order by 1;


-- Q7.1
-- Lista, organizada por categoria/subcategoria, das questões;
select c.id_categoria 'ID Categoria', categoria 'Categoria',
id_pergunta 'ID Pergunta', pergunta Pergunta,
data_entrada 'Data Entrada', ifnull(ultima_atualizacao, 'Nenhuma atualizacao realizada') 'Ultima Atualizacao',
p.idioma 'Codigo Idioma', i.idioma Idioma
from pergunta p 
natural join categoria c
inner join idioma i on p.idioma = i.codigo_iso
order by c.id_categoria, id_pergunta;
	

-- Q7.2
-- Lista de todas as subcategorias
select c.id_categoria 'ID Subcategoria', c.categoria 'Subcategoria', scc.categoria 'ID Categoria', c2.categoria 'Categoria'
from categoria c
left join sub_cat_cat scc on scc.sub_categoria = c.id_categoria
left join categoria c2 on scc.categoria = c2.id_categoria
where c2.categoria is not null
order by 2, 4;


-- Q7.3
-- Lista de todas as categorias sem superior hierárquico
select id_categoria 'ID Categoria', categoria 'Categoria'
from categoria
where id_categoria not in (
	select sub_categoria from sub_cat_cat
)
order by 1, 2;


-- Q8
-- Lista com o número médio, mínimo, máximo e desvio padrão das pesquisas por tipo, segundo, pelo menos, 2 critérios:
select avg(contagem.numero) 'Nº Medio', max(contagem.numero) as 'Nº Maximo', 
min(contagem.numero) as 'Nº Minimo', stddev(contagem.numero) as 'Desvio Padrão'
from (
  select count(*) as numero
  from pesquisa
  group by id_tipo
)contagem;


-- Q8.1
-- Lista com o número médio, mínimo, máximo e desvio padrão das pesquisas por tipo que obtiveram resposta 
select avg(contagem.numero) 'Nº Medio', max(contagem.numero) as 'Nº Maximo', 
min(contagem.numero) as 'Nº Minimo', stddev(contagem.numero) as 'Desvio Padrão'
from (
  select count(*) as numero
  from pesquisa pes
  natural join resposta_obtida
  group by id_tipo
)contagem;


-- Q8.2
-- Lista com o número médio, mínimo, máximo e desvio padrão das pesquisas por tipo com o idioma portuês
select avg(contagem.numero) 'Nº Medio', max(contagem.numero) as 'Nº Maximo', 
min(contagem.numero) as 'Nº Minimo', stddev(contagem.numero) as 'Desvio Padrão'
from (
  select count(*) as numero
  from pesquisa pes
  where idioma = 'PT'
  group by id_tipo
)contagem;


-- Q8.3
-- Lista com o número médio, mínimo, máximo e desvio padrão das pesquisas por tipo cujo conteúdo possui mais do que uma palavra
select avg(contagem.numero) 'Nº Medio', max(contagem.numero) as 'Nº Maximo', 
min(contagem.numero) as 'Nº Minimo', stddev(contagem.numero) as 'Desvio Padrão'
from (
  select count(*) as numero
  from pesquisa pes
  where conteudo like "% %"
  group by id_tipo
)contagem;

-- Q8.4
-- Lista com o número médio, mínimo, máximo e desvio padrão das pesquisas por tipo cuja sessão permanece ativa
select avg(contagem.numero) 'Nº Medio', max(contagem.numero) as 'Nº Maximo', 
min(contagem.numero) as 'Nº Minimo', stddev(contagem.numero) as 'Desvio Padrão'
from (
  select count(id_pesquisa) as numero
  from pesquisa pes
  left join sessao s on s.id_sessao = pes.id_sessao
  where fim is NULL
  group by id_tipo
)contagem;



-- Q9
-- Lista com o número médio, mínimo, máximo e desvio padrão da classificação das respostas por categoria de questão
select categoria Categoria, avg(pontuacao) 'Nº Medio', max(pontuacao) as 'Nº Maximo', 
min(pontuacao) as 'Nº Minimo', stddev(pontuacao) as 'Desvio Padrão'
from pesquisa pes
natural join resposta_obtida
natural join avaliacao
natural join resposta
natural join resposta_responde_pergunta
natural join pergunta
natural join categoria
group by Categoria;


-- Q10
-- Lista de questões cujo número total de respostas associadas (aprovadas) é superior a 4
select count(*) 'Nº Respostas', id_pergunta 'ID Pergunta', pergunta Pergunta,
data_entrada 'Data Entrada', ifnull(ultima_atualizacao, 'Nenhuma atualizacao realizada') 'Ultima Atualizacao',
p.idioma 'Codigo Idioma', i.idioma Idioma,
c.id_categoria 'ID Categoria', categoria 'Categoria'
from pergunta p 
-- natural join categoria c
left join categoria c on c.id_categoria = p.id_categoria
inner join idioma i on p.idioma = i.codigo_iso
natural join resposta_responde_pergunta
where id_pergunta in (
	select p.id_pergunta
    from pergunta p 
    natural join resposta_responde_pergunta 
    natural join aprova
    group by p.id_pergunta
    having count(*) > 4 
)
group by id_pergunta, pergunta, data_entrada, 
ifnull(ultima_atualizacao, 'Nenhuma atualizacao realizada'),
p.idioma, i.idioma, c.id_categoria, categoria
order by 1 desc, 2;


-- Q11
-- Lista dos 5 utilizadores com mais pesquisas
select count(*) 'Nº Pesquisas', u.id_user 'ID Utilizador', concat(nome_proprio, " ", apelido) 'Nome Completo',
email 'Email', `data_nascimento` 'Data Nascimento', 
fn_calcular_idade(data_nascimento) 'Idade',
`password` 'Password', p.codigo_iso 'Codigo ISO', pais 'Pais',
g.codigo_genero 'Codigo Genero', genero 'Genero' 
from `user` u
natural join pais p
natural join genero g
left join sessao s on s.id_user = u.id_user
left join pesquisa pes on pes.id_sessao = s.id_sessao
group by u.id_user, concat(nome_proprio, " ", apelido), email, 
DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), data_nascimento)), '%Y') + 0 , 
`password`, p.codigo_iso, pais, g.codigo_genero, genero
order by count(*) desc, nome_proprio, apelido
limit 5;


-- Q12
-- Consulta adicional recorrendo a, pelo menos, 3 tabelas;
-- Lista de respostas por pergunta que obteve uma pontuação negativa (< 5)
select distinct p.id_pergunta 'ID Pergunta', pergunta Pergunta,
r.id_resposta 'ID Resposta', resposta Resposta,
a.pontuacao 'Pontuacao'
from pergunta p
natural join resposta_responde_pergunta rrp
natural join resposta r
inner join resposta_obtida ro on ro.id_resposta = r.id_resposta
inner join avaliacao a on ro.id_resposta = a.id_resposta
where a.pontuacao < 5
order by Pontuacao;


-- Q13
-- Consulta adicional recorrendo a, pelo menos, 3 tabelas que inclua WHERE e HAVING
-- Lista de utilizadores que pertençam aos países que possuem pelo menos 2 numeros de telefone ativos associados
select id_user 'ID Utilizador', concat(nome_proprio, " ", apelido) 'Nome Completo',
email 'Email', `data_nascimento` 'Data Nascimento', 
fn_calcular_idade(data_nascimento) 'Idade',
`password` 'Password', p.codigo_iso 'Codigo ISO', pais 'Pais',
g.codigo_genero 'Codigo Genero', genero 'Genero' from `user`
natural join pais p
natural join genero g
where p.codigo_iso in 
(
	select p.codigo_iso
    from pais p
    natural join telefone 
    where ativo = 1
    group by p.codigo_iso
    having count(*) >= 2
)
order by id_user, nome_proprio, apelido;


-- Q14
-- Consulta adicional usando descrições de dados existentes num relacionamento recursivo
-- Pesquisa, por nível, da hierarquia de todas as categorias
select id_categoria 'ID Categoria', categoria Categoria, 0 Nivel
from categoria
where id_categoria not in (
	select sub_categoria from sub_cat_cat
)

union all

select id_categoria 'ID Categoria', categoria Categoria, 1 Nivel
from categoria
where id_categoria in (
	select sub_categoria from sub_cat_cat
)

union all

select id_categoria 'ID Categoria', categoria Categoria, 2 Nivel
from categoria
where id_categoria in (
	select sub_categoria 
    from sub_cat_cat 
    where sub_categoria not in (
		select categoria from sub_cat_cat
    )
)
order by Nivel, 1;



















