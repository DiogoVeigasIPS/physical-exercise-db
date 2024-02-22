use muscle_building;

-- SP1
-- criar uma sessão a um utilizador gerando um token
drop procedure if exists sp_criar_sessao;
delimiter //
create procedure sp_criar_sessao(
	out token varchar(255),
	in id_user int, 
	in ip varchar(45),
	in id_dispositivo int, 
    in inicio timestamp, 
	in fim timestamp
)
begin
    
	-- Gerar o token
	set token = uuid();
    
    -- Inserir os dados da sessão na tabela de sessões
    insert into sessao (id_user, ip, id_dispositivo, token, inicio, fim)
    values (id_user, ip, id_dispositivo, token, ifnull(inicio, current_timestamp), fim);

	-- Retornar o token gerado
    select token as 'Token Gerado';
    
end //
delimiter;


-- SP2
-- Clonar uma sessão de um utilizador através do id de uma sessão
drop procedure if exists sp_clonar_sessao;
delimiter //
create procedure sp_clonar_sessao(
    in id_sessao int,
    out novo_token varchar(255)
)
begin
    declare token_original varchar(255);

    -- Receive original token
    select token into token_original from sessao s where s.id_sessao = id_sessao;

    SET novo_token = CONCAT('TEMP ', token_original);

    -- Insert new cloned session
    insert into sessao (id_user, ip, id_dispositivo, inicio, fim, token)
    select id_user, ip, id_dispositivo, current_timestamp, NULL, novo_token
    from sessao s where s.id_sessao = id_sessao;

    -- Return new token
    select novo_token as 'Token Temporario';
    
end //
delimiter ;

-- SP3
-- Terminar uma sessão de um utilizador através do id de uma sessão
drop procedure if exists sp_terminar_sessao;
delimiter //
create procedure sp_terminar_sessao(
	in id_sessao int,
	out fim_sessao timestamp
)
begin
	declare fim_sessao timestamp;
	set fim_sessao = current_timestamp;
        
    update sessao s
    set fim = fim_sessao
    where s.id_sessao = id_sessao;
        
	-- devolver novo token
	select fim_sessao as 'Fim Sessao';
    
end //
delimiter ;


-- FN1
-- Função que recebe como argumento uma palavra e conta o nº de respostas que contêm essa palavra
drop function if exists fn_pesquisar_palavra;
delimiter //
create function fn_pesquisar_palavra(word varchar(30))
returns int
DETERMINISTIC
begin
	declare num_respostas int;
	
	select count(*) into num_respostas
	from (
		select id_resposta 
		from resposta 
        -- desta maneira, é possível utilizar a palavra recebida
		where resposta like concat('%', word, '%')
	)T;

  return num_respostas;
end //
delimiter ;

-- FN2
-- Função recebe uma data e calcula a idade até à data atual
drop function if exists fn_calcular_idade;
delimiter //
create function fn_calcular_idade(data_nascimento date)
returns int
DETERMINISTIC
begin
	declare idade int;

	set idade = DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), data_nascimento)), '%Y') + 0;

  return idade;
end //
delimiter ;











