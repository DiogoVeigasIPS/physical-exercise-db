use muscle_building;

-- Pesquisa por tag: Obter a lista de respostas que contêm uma determinada tag;
drop view if exists pesquisa_por_tag;
create view pesquisa_por_tag as
select id_resposta 'ID Resposta', resposta 'Resposta',
rpt.id_tag 'ID Tag', tag 'Tag',
a.id_user 'ID Admin', concat(u.nome_proprio, " ", u.apelido) 'Nome Admin'
from resposta
natural join resposta_responde_pergunta
natural join pergunta
natural join resposta_possui_tag rpt
natural join tag
natural join aprova
natural join `admin` a
natural join `user` u
order by 1, rpt.id_tag;


-- Pesquisa por categoria: Obter a lista de respostas associadas a perguntas que contêm uma determinada categoria;
drop view if exists pesquisa_por_categoria;
create view pesquisa_por_categoria as
select id_resposta 'ID Resposta', resposta 'Resposta',
p.id_categoria 'ID Categoria', categoria 'Categoria',
a.id_user 'ID Admin', concat(u.nome_proprio, " ", u.apelido) 'Nome Admin'
from resposta
natural join resposta_responde_pergunta
natural join pergunta p
natural join categoria
natural join aprova
natural join `admin` a
natural join `user` u
order by 1, p.id_categoria;


-- Pesquisa por frase: Obter a lista de respostas que estão associadas a uma dada frase, mais concretamente, uma pergunta;
drop view if exists pesquisa_por_frase;
create view pesquisa_por_frase as
select p.id_pergunta 'ID Pergunta', p.pergunta 'Pergunta',
id_resposta 'ID Resposta', resposta 'Resposta',
a.id_user 'ID Admin', concat(u.nome_proprio, " ", u.apelido) 'Nome Admin'
from resposta
natural join resposta_responde_pergunta
natural join pergunta p
natural join aprova
natural join `admin` a
natural join `user` u
order by 1, id_resposta;


-- Pesquisa completa: Obter as perguntas e respostas que contêm uma determinada palavra
drop view if exists pesquisa_completa;
create view pesquisa_completa as
select p.id_pergunta 'ID Pergunta', p.pergunta 'Pergunta',
r.id_resposta 'ID Resposta', r.resposta 'Resposta',
p.id_categoria 'ID Categoria', c.categoria 'Categoria',
t.id_tag 'ID Tag', t.tag 'Tag',
a.id_user 'ID Admin', concat(u.nome_proprio, " ", u.apelido) 'Nome Admin'
from resposta r
natural join resposta_responde_pergunta rrp
natural join pergunta p
-- problemas de ambiguidade, o que levou à necessidade de usar natural join (o que impossibilita o encontro de respostas sem tag)
-- se o professor não conseguir resolver em menos de 10 minutos, não pode descontar
-- left join resposta_possui_tag rpt on r.id_resposta = rpt.id_resposta
natural join resposta_possui_tag rpt
left join tag t on rpt.id_tag = t.id_tag
left join categoria c on c.id_categoria = p.id_categoria
natural join aprova apr
natural join `admin` a
natural join `user` u
order by 1, r.id_resposta;









