drop database if exists muscle_building;
create database if not exists muscle_building;
use muscle_building;

create table pais (
	codigo_iso varchar(2) primary key, 
	pais varchar(60) unique not null, 
	codigo_telefone int, -- Canada e EUA usam o mesmo codigo
	unique(codigo_telefone, pais)
);

create table genero (
	codigo_genero varchar(2) primary key, 
	genero varchar(20)
);

create table `user` (
	id_user int primary key auto_increment, 
	email varchar(50) unique not null, 
	data_nascimento date not null, 
	`password` varchar(30) not null, 
	nome_proprio varchar(20) not null, 
	apelido varchar(20) not null, 
	codigo_iso varchar(2), 
	codigo_genero varchar(2), 
	foreign key (codigo_iso) references pais(codigo_iso), 
	foreign key (codigo_genero) references genero(codigo_genero)
);

create table telefone (
	numero bigint not null, 
	codigo_iso varchar(2), -- por ser foreign key, a menos que um pais possua um codigo iso nulo, nao sera possivel ser nulo
	data_registo timestamp not null default CURRENT_TIMESTAMP, 
	ativo tinyint not null default 0, 
    id_user int not null,
	primary key(numero, codigo_iso), 
	foreign key (codigo_iso) references pais(codigo_iso),
    foreign key (id_user) references `user`(id_user)
);

create table `admin` (
	id_user int primary key, 
	data_promocao timestamp not null default CURRENT_TIMESTAMP, 
	foreign key (id_user) references `user`(id_user)
);

create table chefia (
	id_user int, 
	id_chefe int, 
	foreign key (id_user) references `user`(id_user), 
	foreign key (id_chefe) references `user`(id_user), 
	primary key(id_user, id_chefe), 
	check (id_user <> id_chefe)
);

create table resposta (
	id_resposta int primary key auto_increment, 
	resposta varchar(350) not null unique
    -- categoria, tag, resposta ou pergunta serão sempre únicas
    -- antes de inserir um novo registo, pode verifica-se se já existe
    -- caso exista, pode ser usado o existente
    -- caso não exista, deve-se criar um novo
);

create table aprova (
	id_user int, 
	id_resposta int, 
    descontinuada tinyint not null default 0,
	data_aprovacao timestamp default CURRENT_TIMESTAMP, 
	foreign key (id_user) references `admin`(id_user), 
	foreign key (id_resposta) references resposta(id_resposta), 
	primary key(id_resposta, id_user)
);

create table tag (
	id_tag int primary key auto_increment, 
	tag varchar(20) not null unique
);

create table resposta_possui_tag (
	id_resposta int, 
	id_tag int, 
	foreign key (id_resposta) references resposta(id_resposta), 
	foreign key (id_tag) references tag(id_tag), 
	primary key (id_resposta, id_tag)
);

create table categoria (
	id_categoria int primary key auto_increment, 
	categoria varchar(50) not null unique
);

create table sub_cat_cat (
	sub_categoria int, 
	categoria int, 
	foreign key (sub_categoria) references categoria(id_categoria), 
	foreign key (categoria) references categoria(id_categoria), 
	primary key(sub_categoria, categoria), 
	check (sub_categoria <> categoria)
);

create table idioma (
	codigo_iso varchar(2) primary key, 
	idioma varchar(40)
);

create table pergunta (
	id_pergunta int primary key auto_increment, 
	pergunta varchar(350) not null unique, 
	data_entrada timestamp not null default CURRENT_TIMESTAMP, 
	ultima_atualizacao timestamp null on update CURRENT_TIMESTAMP, 
	idioma varchar(2), 
	id_categoria int, 
	foreign key (idioma) references idioma(codigo_iso), 
	foreign key (id_categoria) references categoria(id_categoria)
);

create table resposta_responde_pergunta (
	id_resposta int, 
	id_pergunta int, 
	foreign key (id_resposta) references resposta(id_resposta), 
	foreign key (id_pergunta) references pergunta(id_pergunta), 
	primary key (id_resposta, id_pergunta)
);

create table tipo_dispositivo (
	id_dispositivo int primary key auto_increment, 
	tipo varchar(50) not null unique
);

create table sessao (
	id_sessao int primary key auto_increment,
	token varchar(255),
	id_user int, 
	ip varchar(45) not null, 
	inicio timestamp not null default CURRENT_TIMESTAMP, 
	fim timestamp default null, 
	id_dispositivo int, 
	foreign key (id_user) references user(id_user), 
	foreign key (id_dispositivo) references tipo_dispositivo(id_dispositivo)
    -- ainda que o token e id_user devessem ser primary key, dá muito trabalho incluir ambos na pesquisa
);

create table tipo_pesquisa(
	id_tipo char(1) primary key,
    tipo varchar(30) not null
);

create table pesquisa (
	id_pesquisa int primary key auto_increment, 
	id_sessao int,
	data_pesquisa timestamp not null default CURRENT_TIMESTAMP, 
	conteudo varchar(350) not null, 
	idioma varchar(2), 
    id_tipo char(1),
	foreign key (id_sessao) references sessao(id_sessao),
	foreign key (idioma) references idioma(codigo_iso),
    foreign key (id_tipo) references tipo_pesquisa(id_tipo)
);

create table tag_pesquisada (
	id_pesquisa int, 
	id_tag int, 
	foreign key (id_pesquisa) references pesquisa(id_pesquisa), 
	foreign key (id_tag) references tag(id_tag),
	primary key(id_pesquisa, id_tag)
);

create table categoria_pesquisada (
	id_pesquisa int, 
	id_categoria int, 
	foreign key (id_pesquisa) references pesquisa(id_pesquisa), 
	foreign key (id_categoria) references categoria(id_categoria),
    primary key(id_pesquisa, id_categoria)
);

create table pergunta_pesquisada (
	id_pesquisa int, 
	id_pergunta int, 
	foreign key (id_pesquisa) references pesquisa(id_pesquisa), 
	foreign key (id_pergunta) references pergunta(id_pergunta),
    primary key(id_pesquisa, id_pergunta)
);

create table resposta_obtida (
	id_pesquisa int, 
	id_resposta int, 
	data_obtida timestamp not null default current_timestamp, 
	foreign key (id_pesquisa) references pesquisa(id_pesquisa), 
	foreign key (id_resposta) references resposta(id_resposta), 
	primary key (id_pesquisa, id_resposta)
);

create table avaliacao (
	id_pesquisa int, 
	id_resposta int, 
	pontuacao int not null, 
    check (pontuacao >= 0 and pontuacao <= 10),
	foreign key (id_pesquisa) references pesquisa(id_pesquisa), 
	foreign key (id_resposta) references resposta(id_resposta), 
	primary key(id_pesquisa, id_resposta)
);
