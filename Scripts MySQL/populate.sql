use muscle_building;

-- codigo_iso_pais, nome, codigo_telefone
insert ignore into pais values 
('PT', 'Portugal', 351),
('BR', 'Brasil', 55),
('US', 'Estados Unidos', 1),
('UK', 'Reino Unido', 44),
('DE', 'Alemanha', 49),
('FR', 'França', 33),
('ES', 'Espanha', 34),
('IT', 'Itália', 39),
('CA', 'Canadá', 1),
('JP', 'Japão', 81),
('AU', 'Austrália', 61),
('MX', 'México', 52),
('CN', 'China', 86),
('IN', 'Índia', 91),
('RU', 'Rússia', 7),
('AR', 'Argentina', 54),
('CO', 'Colômbia', 57),
('CL', 'Chile', 56),
('SE', 'Suécia', 46),
('NO', 'Noruega', 47);

-- Generos *************************************************************
insert ignore into genero values ('M', 'Masculino'), ('F', 'Feminino'), ('?', 'Outro');

-- Utilizadores *****************************************************************************************************
insert ignore INTO `user` (email, data_nascimento, `password`, nome_proprio, apelido, codigo_iso, codigo_genero) VALUES 
("diogo@gmail.com", "2003-11-20", "diogo123", "Diogo", "Veigas", 'PT', 'M'),
("maria@gmail.com", "2016-09-12", "maria456", "Maria", "Silva", 'BR', 'F'),
("john@gmail.com", "1988-05-03", "john789", "John", "Smith", 'US', 'M'),
("julia@gmail.com", "1992-03-18", "julia321", "Julia", "Johnson", 'UK', 'F'),
("carlos@gmail.com", "1985-07-25", "carlos987", "Carlos", "Garcia", 'ES', 'M'),
("lisa@gmail.com", "1990-11-02", "lisa654", "Lisa", "Miller", 'US', 'F'),
("mario@gmail.com", "1998-09-08", "mario123", "Mário", "Santos", 'PT', 'M'),
("ana@gmail.com", "1994-06-15", "ana456", "Ana", "Pereira", 'PT', 'F'),
("filipe@gmail.com", "1999-02-20", "gaivota222", "Filipe", "Passarinho", 'US', 'M'),
("sara@gmail.com", "1991-04-07", "sara321", "Sara", "Robinson", 'UK', 'F'),
("pedro@gmail.com", "1987-12-12", "pedro987", "Pedro", "Oliveira", 'PT', 'M'),
("emily@gmail.com", "1996-08-19", "emily654", "Emily", "Clark", 'US', 'F'),
("ricardo@gmail.com", "1993-10-01", "ricardo123", "Ricardo", "Costa", 'PT', 'M'),
("jessica@gmail.com", "1989-03-28", "jessica456", "Jessica", "Allen", 'US', 'F'),
("daniel@gmail.com", "1997-07-09", "daniel789", "Daniel", "Young", 'UK', 'M'),
("laura@gmail.com", "1992-05-15", "laura321", "Laura", "Turner", 'US', 'F'),
("rodrigo@gmail.com", "1986-11-23", "rodrigo987", "Rodrigo", "Fernandes", 'PT', 'M'),
("natalie@gmail.com", "1990-09-02", "natalie654", "Natalie", "Cook", 'UK', 'F'),
("gabriel@gmail.com", "1998-01-13", "gabriel123", "Gabriel", "Martins", 'PT', 'M'),
("victoria@gmail.com", "1994-07-21", "victoria456", "Victoria", "Wright", 'FR', 'F'),
("robert@gmail.com", "1993-06-09", "robert789", "Robert", "Davis", 'PT', 'M'),
("isabel@gmail.com", "1991-02-17", "isabel321", "Isabel", "Gomes", 'PT', 'F'),
("alex@gmail.com", "1997-10-24", "alex987", "Alex", "Johnson", 'ES', 'M'),
("carolina@gmail.com", "1995-08-07", "carolina654", "Carolina", "Ferreira", 'ES', 'F'),
("matthew@gmail.com", "1992-04-14", "matthew123", "Matthew", "Wilson", 'ES', 'M'),
("julia456@gmail.com", "1990-12-21", "julia456", "Julia", "Silva", 'BR', 'F'),
("david@gmail.com", "1988-09-28", "david789", "David", "Brown", 'US', 'M'),
("beatriz@gmail.com", "1994-05-05", "beatriz321", "Beatriz", "Andrade", 'PT', 'F'),
("james@gmail.com", "1996-11-12", "james987", "James", "Taylor", 'UK', 'M'),
("marta@gmail.com", "1993-09-19", "marta654", "Marta", "Almeida", 'PT', 'F');

-- Telefones ainda nao ativos*****************************************************************************************************
insert ignore INTO telefone (numero, codigo_iso, id_user) VALUES
(965822101, 'PT', 1),
(965541232, 'IN', 2),
(987654321, 'US', 3),
(123456789, 'BR', 4),
(998877665, 'ES', 5),
(112233445, 'DE', 6),
(5566778899, 'FR', 7),
(3344556677, 'IT', 8),
(999888777, 'CA', 9),
(1122334455, 'JP', 10),
(6677889900, 'AU', 11),
(1122334455, 'MX', 12),
(9988776655, 'CN', 13),
(1122334455, 'IN', 15),
(7788990011, 'RU', 16);

-- Telefones já ativos *************************************************************************************
insert ignore into telefone (numero, codigo_iso, id_user, ativo) values 
(989965523, 'PT', 17, 1),
(998877265, 'ES', 18, 1),
(112263445, 'DE', 19, 1),
(5566778829, 'FR', 20, 1),
(926563256, 'PT', 21, 1),
(936569256, 'PT', 22, 1),
(946573256, 'ES', 23, 1),
(956564256, 'ES', 24, 1),
(966553256, 'ES', 25, 1),
(3344516677, 'IT', 26, 1);

-- Admin *****************************************************************************************************
insert ignore into `admin` (id_user) select id_user from `user` where email = 'diogo@gmail.com';

insert ignore into `admin` (id_user) values (9); -- Filipe

insert ignore into chefia values (9, 1); -- Diogo chefe de Filipe

-- Categorias *****************************************************************************************************
insert ignore into categoria (categoria) values 
("Musculação e Treinamento de Força"),
("Nutrição para o Desenvolvimento Muscular"),
("Saúde e Bem-estar na Construção Muscular");

insert ignore into categoria (categoria) values("Levantamento de Peso"),
("Halteres"),
("Barras"),
("Kettlebells"),
("Máquinas");

insert ignore into sub_cat_cat values (4, 1),
(5, 4),
(6, 4),
(7, 4),
(8, 4);

insert ignore into categoria (categoria) values("Exercícios com Peso Corporal"),
("Flexões"),
("Agachamentos"),
("Elevações"),
("Abdominais");

insert ignore into sub_cat_cat values (9, 1),
(10, 9),
(11, 9),
(12, 9),
(13, 9);

insert ignore into categoria (categoria) values("Treinamento com Resistência"),
("Bandas Elásticas");

insert ignore into sub_cat_cat values (14, 1),
(15, 14);

insert ignore into categoria (categoria) values ("Receitas"),
("Bulking"),
("Cutting");

insert ignore into sub_cat_cat values (16, 2),
(17, 16),
(18, 16);

insert ignore into categoria (categoria) values ("Macronutrientes"),
("Proteína"),
("Carboidratos");

insert ignore into categoria (categoria) values ('Outros');

insert ignore into sub_cat_cat values (19, 2),
(20, 19),
(21, 19);

insert ignore into categoria (categoria) values
("Musculação"),
("Calistenia"),
("Atletismo"),
("Cardio"),
("Levantamento do Peso Olímpico"),
("CrossFit"),
("Treino de Resistência Muscular Localizada"),
("Treino de Alta Intensidade"),
("Treino de Circuito"),
("Treino de Musculação Iniciante"),
("Treino de Musculação Avançado"),
("Treino de Alongamentos"),
("Treino de Musculação em Casa"),
("Treino de Musculação com pesos Livres"),
("Treino de Musculação com Máquinas"),
("Treino de Musculação Feminina"),
("Treino de Musculação para Idosos"),
("Treino de Corpo Todo"),
("Treino de Fisiculturismo"),
("Treino de Força Funcional"),
("Treino de Hipertrofia"),
("Treino de Força"),
("Treino de Definição Muscular"),
("Treino de Explosão"),
("Treino de Bíceps"),
("Treino de Tríceps"),
("Treino de Deltoide Posterior"),
("Treino de Deltoide Lateral"),
("Treino de Deltoide Anterior"),
("Treino de Perna"),
("Treino de Ombros"),
("Treino de Glúteos"),
("Treino de Lombar"),
("Treino de Dorsal"),
("Treino de Peito"),
("Treino de Abdominais"),
("Treino de Gémeos"),
("Treino de Braços"),
("Treino de Costas"),
("Treino de Antebraço");

insert ignore into sub_cat_cat values (46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1), 
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1);

insert ignore into sub_cat_cat values ( 4, 42),
(5, 42),
(6, 42),
(7, 42),
(8, 42);

insert ignore into sub_cat_cat values ( 46, 42),
(47, 42),
(48, 42),
(49, 42),
(50, 42),
(51, 42),
(52, 42),
(53, 42),
(54, 42), 
(55, 42),
(56, 42),
(57, 42),
(58, 42),
(59, 42),
(60, 42),
(61, 42);

insert ignore into sub_cat_cat values ( 46, 43),
(47, 43),
(48, 43),
(49, 43),
(50, 43),
(51, 43),
(52, 43),
(53, 43),
(54, 43), 
(55, 43),
(56, 43),
(57, 43),
(58, 43),
(59, 43),
(60, 43),
(61, 43);

insert ignore into sub_cat_cat values ( 46, 44),
(47, 44),
(48, 44),
(49, 44),
(50, 44),
(51, 44),
(52, 44),
(53, 44),
(54, 44), 
(55, 44),
(56, 44),
(57, 44),
(58, 44),
(59, 44),
(60, 44),
(61, 44);

insert ignore into sub_cat_cat values ( 46, 45),
(47, 45),
(48, 45),
(49, 45),
(50, 45),
(51, 45),
(52, 45),
(53, 45),
(54, 45), 
(55, 45),
(56, 45),
(57, 45),
(58, 45),
(59, 45),
(60, 45),
(61, 45);

insert ignore into sub_cat_cat values (42, 22),
(43, 22),
(44, 22);

insert ignore into sub_cat_cat values (42, 23),
(43, 23),
(44, 23);

insert ignore into sub_cat_cat values (9, 23),
(10, 23),
(11, 23),
(12, 23),
(13, 23),
(15, 23);

insert ignore into sub_cat_cat values (45, 24);

insert ignore into sub_cat_cat values (51,24),
(53, 24),
(57, 24),
(58, 24);

insert ignore into sub_cat_cat values (43,25),
(44, 25),
(45, 25);

insert ignore into sub_cat_cat values (43,26),
(44, 26),
(45, 26);

insert ignore into sub_cat_cat values (43,27),
(44, 27);

insert ignore into sub_cat_cat values (43,28),
(44, 28),
(45, 28);

insert ignore into sub_cat_cat values (43,29),
(44, 29);

insert ignore into sub_cat_cat values (42,30),
(43, 30),
(44, 30);

insert ignore into sub_cat_cat values (42,31),
(43, 31),
(44, 31);

insert ignore into sub_cat_cat values ( 46, 33),
(47, 33),
(48, 33),
(49, 33),
(50, 33),
(51, 33),
(52, 33),
(53, 33),
(54, 33), 
(55, 33),
(56, 33),
(57, 33),
(58, 33),
(59, 33),
(60, 33),
(61, 33);

insert ignore into sub_cat_cat values (42,34),
(43, 34),
(44, 34);

insert ignore into sub_cat_cat values (42,35),
(43, 35),
(44, 35);

insert ignore into sub_cat_cat values (42,36),
(43, 36),
(44, 36);

insert ignore into sub_cat_cat values (42,37),
(43, 37),
(44, 37);

insert ignore into sub_cat_cat values (43, 38);

insert ignore into sub_cat_cat values (42,39),
(43, 39),
(44, 39);

insert ignore into sub_cat_cat values (9,39),
(10, 39),
(11, 39),
(12,39),
(13, 39),
(15, 39);

insert ignore into sub_cat_cat values (42, 40),
(43, 40),
(44, 40);

insert ignore into sub_cat_cat values (43, 41);

-- Idiomas *****************************************************************************************************
insert ignore INTO idioma (codigo_iso, idioma) VALUES
('EN', 'Inglês'),
('PT', 'Português'),
('ES', 'Espanhol'),
('FR', 'Francês'),
('DE', 'Alemão'),
('IT', 'Italiano'),
('RU', 'Russo'),
('JP', 'Japonês'),
('CN', 'Chinês'),
('AR', 'Árabe');

-- Perguntas *****************************************************************************************************
insert ignore into pergunta (pergunta, idioma, id_categoria, data_entrada, ultima_atualizacao) values
('Quais são os principais benefícios do treinamento de desenvolvimento muscular?', 'PT', 1, 
TIMESTAMP('2019-01-01', '06:00:00'), DATE_SUB(NOW(), INTERVAL 5 DAY));

insert ignore INTO pergunta (pergunta, idioma, id_categoria, data_entrada) VALUES 
('Quais são os grupos musculares que podem ser trabalhados no treinamento de desenvolvimento muscular?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são os melhores exercícios para o desenvolvimento dos membros superiores?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são os melhores exercícios para o desenvolvimento dos membros inferiores?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Como elaborar um programa de treinamento eficiente para o desenvolvimento muscular?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Qual é a importância da alimentação adequada no processo de desenvolvimento muscular?', 'PT', 2, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são os principais erros a serem evitados ao realizar exercícios de desenvolvimento muscular?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Como prevenir lesões durante o treinamento de desenvolvimento muscular?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são as diferenças entre treinamento de força e treinamento de hipertrofia?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são os melhores métodos de treinamento para o desenvolvimento muscular?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são os suplementos alimentares recomendados para auxiliar no desenvolvimento muscular?', 'PT', 17, TIMESTAMP('2019-01-01', '06:00:00')),
('Qual é a importância do descanso e da recuperação muscular no processo de desenvolvimento?', 'PT', 3, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são os sinais de overtraining e como evitá-lo no treinamento de desenvolvimento muscular?', 'PT', 3, TIMESTAMP('2019-01-01', '06:00:00')),
('Como adaptar o treinamento de desenvolvimento muscular de acordo com o nível de condicionamento físico?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são as melhores técnicas de execução dos exercícios para maximizar o desenvolvimento muscular?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são os principais princípios do treinamento de desenvolvimento muscular?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Como monitorar e avaliar os progressos no treinamento de desenvolvimento muscular?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são os benefícios do treinamento de desenvolvimento muscular para a saúde óssea e postura?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são as estratégias para superar os momentos de estagnação no treinamento de desenvolvimento muscular?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Quais são os cuidados específicos para o treinamento de desenvolvimento muscular em diferentes faixas etárias?', 'PT', 3, TIMESTAMP('2019-01-01', '06:00:00')),
('Devo fazer flexões ou elevações para ficar mais forte?', 'PT', 9, TIMESTAMP('2019-01-01', '06:00:00')),
('How can I grow my biceps?', 'EN', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Obrigado!', 'PT', 22, TIMESTAMP('2019-01-01', '06:00:00')),
('Como é que me posso tornar mais forte mais rápido e sem esforço nenhum?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Como é que posso fortalecer os músculos do pescoço?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Qual é que é o melhor exercício de pernas?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),
('Maneira mais eficiente de treinar abdominais?', 'PT', 1, TIMESTAMP('2019-01-01', '06:00:00')),

('Quais são os benefícios da Musculação?', 'PT', 1, TIMESTAMP('2019-01-01', '19:00:00')),
('Qual a diferença entre o treino de força e o treino de resistência?', 'PT', 1, TIMESTAMP('2019-01-01', '19:00:00')),
('É possível desenvolver músculos apenas com calistenia/ treino com o peso do corpo?', 'PT', 24, TIMESTAMP('2019-01-01', '19:00:00')),
('Que exercícios fazer para treinar os Bíceps com pesos?', 'PT', 1, TIMESTAMP('2019-01-01', '19:00:00')),
('Que exercícios fazer para treinar os tríceps com pesos?', 'PT', 1, TIMESTAMP('2019-01-01', '19:00:00')),
('Como treinar os músculos dos ombros?', 'PT', 1, TIMESTAMP('2019-01-01', '19:00:00')),
('Quais são os melhores exercícios para desenvolver os músculos das pernas?', 'PT', 23, TIMESTAMP('2019-01-01', '19:00:00')),
('Como é que o treino de resistência muscular localizada difere da musculação tradicional?', 'PT', 23, TIMESTAMP('2019-01-01', '19:00:00')),
('Quais são os exercícios do treino de alta intensidade?', 'PT', 30, TIMESTAMP('2019-01-01', '19:00:00')),
('Como funciona o treino de circuito?', 'PT', 31, TIMESTAMP('2019-01-01', '19:00:00')),
('Quais são os benefícios de utilizar pesos livres no treino de musculação?', 'PT', 1, TIMESTAMP('2019-01-01', '19:00:00')),
('Quais são os exercícios mais eficazes para treinar os glúteos no ginásio?', 'PT', 1, TIMESTAMP('2019-01-01', '19:00:00')),
('Como o treino de hipertrofia difere do treino de força?', 'PT', 1, TIMESTAMP('2019-01-01', '19:00:00')),
('Quais são os benefícios de treinar cardio?', 'PT', 26, TIMESTAMP('2019-01-01', '19:00:00')),
('Como o treino de explosão pode ser incorporado aos diferentes tipos de treino?', 'PT', 1, TIMESTAMP('2019-01-01', '19:00:00')),
('Quais são os principais exercícios para desenvolver os músculos do peito?', 'PT', 1, TIMESTAMP('2019-01-01', '19:00:00')),
('Quais são os melhores exercícios para treinar os abdominais?', 'PT', 24, TIMESTAMP('2019-01-01', '19:00:00')),
('Quais são os benefícios do treino de musculação para idosos?', 'PT', 23, TIMESTAMP('2019-01-01', '19:00:00')),
('Quais são os principais exercícios para treinar os músculos das pernas em casa?', 'PT', 24, TIMESTAMP('2019-01-01', '19:00:00')),
('Como aplicar o treino de explosão ao treino de calistenia?', 'PT', 24, TIMESTAMP('2019-01-01', '19:00:00'));

-- Tags *****************************************************************************************************
insert ignore into tag (tag) values 
("Upper Body"),
("Lower Body"),
("Push"),
("Pull"),
("Leg"),
("6-pack"),
("Biceps"),
("Triceps"),
("Dorsais"),
("Peitorais"),
("Lombar"),
("Romboides"),
("Gémeo"),
("Tibial"),
("Gluteos"),
("Quadriceps"),
("Coxa"),
("Técnica"),
("Idade"),
("Saude"),
("Musculação"),
("Peso"),
("Peito Infeiror"),
("Peito Superior"),
("Trapézio"),
("Deltoide Lateral"),
("Deltoide Posterior"),
("Deltoide Anterior"),
("Antebraço");

-- Respostas *****************************************************************************************************
insert ignore INTO resposta (resposta) VALUES 
('O treinamento de desenvolvimento muscular proporciona diversos benefícios, tais como o aumento da força e resistência muscular, melhora da composição corporal, fortalecimento dos ossos, aumento do metabolismo e melhora da postura.'),
('No treinamento de desenvolvimento muscular, é possível trabalhar diversos grupos musculares, incluindo os músculos do peito, costas, ombros, braços, abdominais, glúteos, quadríceps, isquiotibiais e panturrilhas.'),
('Para o desenvolvimento dos membros superiores, alguns dos melhores exercícios são supino, remada, desenvolvimento militar, rosca direta e tríceps testa.'),
('Para o desenvolvimento dos membros inferiores, alguns dos melhores exercícios são agachamento, levantamento terra, avanço, flexão plantar e glúteo bridge.'),
('Um programa de treinamento eficiente para o desenvolvimento muscular deve incluir uma combinação adequada de exercícios para todos os grupos musculares, com progressão gradual de carga e volume, e períodos de descanso e recuperação adequados.'),
('A alimentação adequada desempenha um papel fundamental no processo de desenvolvimento muscular, fornecendo os nutrientes necessários para a síntese proteica, reparação muscular e energia para o treinamento.'),
('Ao realizar exercícios de desenvolvimento muscular, é importante evitar erros como postura inadequada, uso de cargas excessivas, falta de aquecimento e alongamento, realização de movimentos com amplitude incorreta e falta de variação nos exercícios.'),
('Para prevenir lesões durante o treinamento de desenvolvimento muscular, é importante adotar uma técnica correta de execução dos exercícios, realizar um aquecimento adequado, usar cargas e intensidades adequadas, respeitar os limites do corpo e dar atenção à recuperação muscular.'),
('O treinamento de força visa principalmente o aumento da força muscular, enquanto o treinamento de hipertrofia tem como objetivo o aumento do tamanho dos músculos. Embora haja sobreposição entre os dois tipos de treinamento, a abordagem e o foco podem ser diferentes.'),
('Existem diversos métodos de treinamento que podem ser eficazes para o desenvolvimento muscular, como o treinamento em circuito, treinamento com pesos livres, treinamento com máquinas, treinamento de alta intensidade, treinamento com superséries e treinamento com drop sets, entre outros.'),
('Alguns suplementos alimentares recomendados para auxiliar no desenvolvimento muscular incluem proteína em pó (whey protein), aminoácidos de cadeia ramificada (BCAAs), creatina, beta-alanina e suplementos pré-treino.'),
('O descanso e a recuperação muscular são essenciais para o processo de desenvolvimento, pois é durante esse período que ocorre a reparação e o crescimento dos músculos. O descanso adequado também ajuda a prevenir lesões e a evitar o overtraining.'),
('Sinais de overtraining incluem fadiga persistente, diminuição do desempenho, falta de motivação, irritabilidade, alterações no sono, lesões frequentes e dificuldade de recuperação. Para evitar o overtraining, é importante programar períodos de descanso e recuperação, variar a intensidade do treinamento e ouvir os sinais do corpo.'),
('O treinamento de desenvolvimento muscular pode ser adaptado de acordo com o nível de condicionamento físico, aumentando gradualmente a intensidade, volume e complexidade dos exercícios, conforme o indivíduo progride e ganha mais resistência e força.'),
('Para maximizar o desenvolvimento muscular, é importante executar os exercícios com a técnica correta, realizar a amplitude completa de movimento, controlar a velocidade de execução, usar cargas adequadas, variar os estímulos e manter o foco na conexão mente-músculo.'),
('Os principais princípios do treinamento de desenvolvimento muscular incluem sobrecarga progressiva, especificidade, variação, individualidade, reversibilidade, adaptação e recuperação.'),
('Para monitorar e avaliar os progressos no treinamento de desenvolvimento muscular, podem ser utilizados indicadores como aumento da carga nos exercícios, melhora do desempenho, mudanças na composição corporal, medidas de circunferência e avaliações físicas regulares.'),
('O treinamento de desenvolvimento muscular traz benefícios para a saúde óssea, ajudando a fortalecer os ossos e prevenir doenças como a osteoporose. Além disso, o desenvolvimento muscular adequado contribui para uma postura melhor, reduzindo o risco de dores e lesões relacionadas à má postura.'),
('Para superar os platôs de progresso no treinamento de desenvolvimento muscular, podem ser adotadas estratégias como aumentar a carga, variar os exercícios, modificar o volume e a intensidade do treinamento, utilizar técnicas avançadas de treinamento e buscar orientação de um profissional qualificado.'),
('O treinamento de desenvolvimento muscular em diferentes faixas etárias requer cuidados específicos, como adequar a intensidade e volume do treinamento de acordo com a capacidade física, respeitar os limites individuais, realizar um aquecimento e alongamento adequados, e estar atento a possíveis restrições de saúde e orientações médicas.'),

('Esses dois exercícios treinam grupos musculares diferentes, portanto, o melhor é encontrar um balanço entre os dois.'),
('As elevações fortalecem a região dorsal e bíceps.'),
('As flexões são um exercício que desenvolve os músculos peitorais, ombros e tríceps.'),

('For that, you must do predominantly exercises that consist of pulling.'),

('Não tem de quê! Se tiver mais alguma dúvida, não exite em perguntar!'),
('Não há problema!'),
('Qualquer coisa, é só perguntar!'),
('Pode ajuda o desenvolvedor ao doar um euro!'),
('Sempre que quiser, estou aqui para si!'),
('Já que gostou assim tanto, pode começar a pagar'),

('Agachamento é um exercício que permite treinar a parte inferior do corpo de maneira bastante equilibrada.'),
('Correr treina bastante as pernas e cordenação motora.'),
('Futebol, ao contrário do que pensam, não treina as pernas assim tão bem...'),
('Para treinar as pernas de maneira eficiente, não se deve esquecer de aquecer e alongar bem.'),
('Saltar pode ser um método efetivo para treinar pernas, no entanto, pode ser perigoso para as articulações. Por isso, deve ter cuidado com os exercícios que faz.'),

('Prancha é um exercício fácil de executar e eficiente, especialmente para iniciantes.'),
('Um core forte é essencial para executar a maioria dos exercícios físicos.'),
('O abdominal pode ser dividido em várias partes.'),
('O abdominal deve ser treinado regularmente.'),
('A zona abdominal é fundamental para um bom equilíbrio'),
('Sit-ups, um exercício em que se deita de barriga para cima, pernas fletidas a cerca de 45º graus e se eleva o corpo até chegar com as mão aos joelhos pode exercita a zona central do abdominal'),


('A musculação oferece uma série de benefícios, como o aumento da força, aumento da massa muscular, melhoria na composição corporal, fortalecimento da estrutura óssea, aumento do metabolismo e melhoria da postura.'),
('O treino de força envolve exercícios com cargas mais pesadas e menos repetições, visando o desenvolvimento da força muscular. Já o treino de resistência envolve exercícios com cargas mais leves e um maior número de repetições, focado em aumentar a resistência muscular.'),
('Sim, é possível desenvolver os músculos apenas treinando com o peso do corpo. Exercícios como flexões, agachamento, dips, elevações e muitas outras opções, podem ser bastantes eficazes para o desenvolvimento muscular.'),
('Existem vários exercícios, mas sendo os mais eficazes a rosca, a rosca martelo e a rosca com cabos.'),
('Existem vários exercícios, mas sendo os mais eficazes, mergulho(dips), supino fechado, extensões de tríceps com halteres.'),
('Os exercícios recomendados para treinar os músculos dos ombros são elevação lateral, elevação frontal e desenvolvimento Arnold.'),
('Os exercícios recomendados para treinar os músculos das pernas são o agachamento com peso, os lunges com peso e extensão da perna.'),
('O treino de resistência muscular localizada foca em exercícios específicos para fortalecer grupos musculares específicos, enquanto a musculação tradicional geralmente envolve um treino mais abrangente do corpo todo.'),
('Os princípios do treino de alta intensidade incluem realizar exercícios com a máxima intensidade e esforço, realizar intervalos curtos de descanso e utilizar técnicas como superséries e dropsets.'),
('O treino de circuito envolve a realização de uma série de exercícios em sequência, sem descanso entre eles. Geralmente, cada exercício é realizado por um determinado período de tempo ou número de repetições antes de passar para o próximo.'),
('O uso de pesos livres no treino de musculação ajuda a desenvolver a estabilização muscular, coordenação e equilíbrio. Além disso, permite uma maior variedade de movimentos e recruta músculos estabilizadores.'),
('Alguns dos exercícios mais eficazes para treinar os glúteos são o agachamento, o levantamento terra e a elevação pélvica.'),
('O treino de hipertrofia tem como objetivo principal o aumento do tamanho dos músculos, enquanto o treino de força visa principalmente o aumento da força muscular. Embora haja uma sobreposição entre os dois, as abordagens de treino podem ser diferentes.'),
('O treino de cardio ajuda a fortalecer o coração, a melhorar a circulação sanguínea e a aumentar a capacidade pulmonar.'),
('O treino de explosão pode ser incorporado a diferentes tipos de treinamento adicionando movimentos explosivos, como saltos, arremessos e levantamentos rápidos, para desenvolver a potência muscular e a velocidade de contração.'),
('Alguns dos principais exercícios para desenvolver os músculos do peito são o supino reto, o supino inclinado e a flexão.'),
('Os exercícios para treinar os abdominais são a prancha, a abdominal bicicleta e a elevação das pernas.'),
('O treino de musculação para idosos ajuda a aumentar a densidade óssea, melhorar a força muscular, manter a massa muscular e melhorar a postura e o equilíbrio.'),
('Bons exercícios para treinar as pernas em casa são o agachamento sumô, a elevação de quadril unilateral e a ponte de glúteo.'),
('No treino de calistenia, o treino de explosão pode ser aplicado através de movimentos explosivos, como saltos, flexões explosivas, agachamentos com salto e burpee, que ajudam a desenvolver a potência e explosividade muscular.');

-- id_resposta, id_tag
insert ignore into resposta_possui_tag values 
(1, 20),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(3, 4),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 2),
(5, 20),
(6, 20),
(7, 20),
(8, 20),
(9, 20),
(10, 20),
(11, 20),
(12, 20),
(13, 20),
(14, 20),
(15, 20),
(16, 20),
(17, 20),
(18, 20),
(19, 20),
(20, 20),
(21, 20),
(22, 20),
(22, 7),
(22, 10),
(23, 1),
(23, 3),
(23, 8),
(23, 10),
(31, 2),
(32, 2),
(34, 2),
(35, 2),
(36, 6),
(37, 6),
(38, 6),
(39, 6),
(40, 6),
(41, 6),
(42, 21),
(43, 22),
(44, 1),
(44, 2),
(45, 7),
(46, 3),
(46, 8),
(46, 10),
(47, 26),
(47, 27),
(47, 28),
(48, 2),
(48, 5),
(48, 13),
(48, 15),
(48, 16),
(48, 17),
(49, 18),
(50, 22),
(51, 20),
(52, 22),
(53, 15),
(54, 21),
(55, 20),
(56, 21),
(57, 1),
(57, 3),
(57, 12),
(58, 6),
(59, 19),
(60, 2),
(60, 5),
(60, 15),
(60, 16),
(60, 17),
(61, 18),
(61, 21);

-- id_user, id_resposta
insert ignore into aprova (id_user, id_resposta) values
(1, 1),
(1, 2),
(1, 5),
(1, 6),
-- (1, 7),
-- (1, 8),
-- (1, 9),
(1, 10),
-- (1, 11),
(9, 12), 
(9, 13), 
(9, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 20),
(1, 21),
(1, 22),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(9, 35),
(9, 36),
(9, 37),
(9, 38),
(9, 39),
(9, 40),
(1, 41),
(1, 42),
(1, 43),
(9, 44),
(9, 45),
(1, 46),
(1, 47),
(1, 48),
(9, 49),
(9, 50),
(9, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(9, 56),
(9, 57),
(9, 58),
(9, 59),
(1, 60),
(1, 61);

insert ignore into resposta_responde_pergunta (id_resposta, id_pergunta) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 21),
(23, 21),
(24, 22),
(25, 23),
(26, 23),
(27, 23),
(28, 23),
(29, 23),
(30, 23),
(6, 24),
(2, 25),
(31, 26),
(32, 26),
(33, 26),
(34, 26),
(35, 26),
(36, 27),
(37, 27),
(38, 27),
(39, 27),
(40, 27),
(42, 28),
(43, 29),
(44, 30),
(45, 31),
(46, 32),
(47, 33),
(48, 34),
(49, 35),
(50, 36),
(51, 37),
(52, 38),
(53, 39),
(54, 40),
(55, 41),
(56, 42),
(57, 43),
(58, 44),
(59, 45),
(60, 46),
(61, 47);

-- Dispositivos *****************************************************************************************************
insert ignore into tipo_dispositivo (tipo) values 
('Computador'), 
('Portátil'),
('Smartphone'),
('Tablet'),
('Smart TV'),
('Smart Watch');

-- Sessoes *****************************************************************************************************
insert ignore into sessao (token, id_user, ip, id_dispositivo) values
(uuid(), 1, '192.168.0.123', 1),
(uuid(), 2, '192.162.0.124', 4),
(uuid(), 3, '192.163.0.123', 2),
(uuid(), 4, '192.161.0.124', 6),
(uuid(), 5, '192.163.0.124', 2),
(uuid(), 6, '192.163.0.125', 2),
(uuid(), 7, '192.163.0.126', 2),
(uuid(), 8, '192.163.0.127', 4),
(uuid(), 9, '192.163.0.128', 5),
(uuid(), 10, '192.163.0.129', 5),
(uuid(), 11, '192.163.0.140', 5),
(uuid(), 12, '192.163.0.141', 2),
(uuid(), 13, '192.163.0.151', 4),
(uuid(), 14, '192.163.0.112', 3),
(uuid(), 19, '192.163.0.121', 2),
(uuid(), 20, '192.163.0.122', 3),
(uuid(), 21, '192.163.0.188', 2),
(uuid(), 22, '192.163.0.178', 3),
(uuid(), 23, '192.163.0.120', 4),
(uuid(), 24, '192.163.0.105', 2),
(uuid(), 25, '192.163.0.100', 4);

-- Historico, ja terminaram
insert ignore into sessao (token, id_user, ip, inicio, fim, id_dispositivo) values
(uuid(), 1, '192.165.0.123',DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY), 3),
(uuid(), 1, '192.165.0.123',DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY), 3),
(uuid(), 9, '192.165.0.123',DATE_SUB(NOW(), INTERVAL 17 minute), DATE_SUB(NOW(), INTERVAL 11 minute), 6),
(uuid(), 2, '192.165.0.123', TIMESTAMP('2021-05-04', '15:02:45'), TIMESTAMP('2021-05-04', '17:02:45'), 1),
(uuid(), 1, '192.165.0.123',TIMESTAMP('2021-11-30', '16:02:45'), TIMESTAMP('2021-11-30', '22:02:45'), 1),
(uuid(), 1, '192.165.0.123',TIMESTAMP('2022-12-30', '17:02:45'), TIMESTAMP('2022-12-30', '22:02:45'), 1);

-- Tipos de pesquisa
insert ignore into tipo_pesquisa values 
('P', 'Pergunta'),
('C', 'Categoria'),
('T', 'Tag'),
('L', 'Livre');

-- Pesquisas, respostas obtidas e avaliacoes *****************************************************************************************************
insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(1, 'Bicep', 'EN', 'T');
insert ignore into tag_pesquisada (id_pesquisa, id_tag) values (1, 7);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (1, 24);
insert ignore into avaliacao values (1, 24, 9);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(1, 'Como é que treino o joelho?', 'PT', 'P');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(1, 'Devo fazer flexões ou elevações para ficar mais forte?', 'PT', 'P');
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (3, 21);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (3, 22);
insert ignore into avaliacao values (3, 22, 10);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (3, 23);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (3, 24);
insert ignore into avaliacao values (3, 24, 7);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(1, 'Halteres', 'PT', 'C');
insert ignore into categoria_pesquisada (id_pesquisa, id_categoria) values (4, 5);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(1, 'Dedos', 'PT', 'T');


insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(9, 'Devo fazer flexões ou elevações para ficar mais forte?', 'PT', 'P');
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (5, 21);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (5, 22);
insert ignore into avaliacao values (5, 21, 0);
insert ignore into resposta_obtida (id_pesquisa, id_resposta)values (5, 23);
insert ignore into avaliacao values (5, 23, 2);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (5, 24);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(6, 'Que exercícios devo fazer?', 'PT', 'P');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(6, 'Como é que consigo braços enormes?', 'PT', 'P');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(5, 'Ficar muito tempo sentado treina as pernas?', 'PT', 'P');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(5, 'Ficar muito tempo sentado treina as pernas?', 'ES', 'P');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(2, 'Peitorais', 'PT', 'T');
insert ignore into tag_pesquisada (id_pesquisa, id_tag) values (10, 10);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (10, 23);
insert ignore into avaliacao values (10, 23, 5);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(3, 'Ovos', 'PT', 'T');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(16, 'Frango', 'PT', 'T');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(24, 'Crossfit', 'PT', 'C');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(22, 'Fisiculturismo', 'PT', 'T');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(22, 'Olimpíadas 2019', 'PT', 'C');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(7, 'Crescer grande e saudável', 'PT', 'L');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(23, 'How many protein should I eat?', 'EN', 'L');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(23, 'How can I grow my biceps?', 'EN', 'L');
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (18, 24);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(24, 'Treinar oblíquos no corrimão da escola faz mal?', 'PT', 'P');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(1, 'No outro dia parti o dedo do pé a saltar à corda, devo parar de saltar ou continuar?', 'PT', 'L');

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo, data_pesquisa) values
(25, 'Como é que me posso tornar mais forte mais rápido e sem esforço nenhum?', 'PT', 'P',
TIMESTAMP('2021-05-04', '16:08:42'));
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (21, 24);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo, data_pesquisa) VALUES 
(26, 'Como é que me posso tornar mais forte mais rápido e sem esforço nenhum?', 'PT', 'P',
TIMESTAMP('2021-11-30 21:58:59'));
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (22, 24);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo, data_pesquisa) VALUES 
(26, 'Como é que me posso tornar mais forte mais rápido e sem esforço nenhum?', 'PT', 'P', 
TIMESTAMP('2021-11-30 21:58:59'));
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (23, 24);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo, data_pesquisa) VALUES 
(27, 'Como é que posso fortalecer os músculos do pescoço?', 'PT', 'P', 
TIMESTAMP('2022-12-30', '18:02:45'));
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (24, 25);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo, data_pesquisa) VALUES 
(27, 'Como é que me posso tornar mais forte mais rápido e sem esforço nenhum?', 'PT', 'P', TIMESTAMP('2022-12-30', '18:08:45'));
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (25, 24);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo, data_pesquisa) VALUES 
(27, 'Como monitorar e avaliar os progressos no treinamento de desenvolvimento muscular?', 'PT', 'P', TIMESTAMP('2022-12-30', '18:08:45'));
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (26, 24);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (26, 31);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (26, 32);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (26, 33);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (26, 34);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (26, 35);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(1, 'Devo fazer flexões ou elevações para ficar mais forte?', 'PT', 'P');
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (27, 21);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (27, 22);
insert ignore into avaliacao (id_pesquisa, id_resposta, pontuacao) values (27, 22, 10);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (27, 23);
insert ignore into avaliacao (id_pesquisa, id_resposta, pontuacao) values (27, 23, 9);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (27, 24);
insert ignore into avaliacao (id_pesquisa, id_resposta, pontuacao) values (27, 24, 7);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(1, 'Devo fazer flexões ou elevações para ficar mais forte?', 'PT', 'P');
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (28, 21);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (28, 22);
insert ignore into avaliacao (id_pesquisa, id_resposta, pontuacao) values (28, 22, 10);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (28, 23);
insert ignore into avaliacao (id_pesquisa, id_resposta, pontuacao) values (28, 23, 9);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (28, 24);
insert ignore into avaliacao (id_pesquisa, id_resposta, pontuacao) values (28, 24, 7);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(1, 'Como adaptar o treinamento de desenvolvimento muscular de acordo com o nível de condicionamento físico?', 'PT', 'P');
insert ignore into pergunta_pesquisada (id_pesquisa, id_pergunta) values (29, 14);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (29, 14);
insert ignore into avaliacao (id_pesquisa, id_resposta, pontuacao) values (29, 14, 7);

insert ignore into pesquisa (id_sessao, conteudo, idioma, id_tipo) values
(1, 'Saúde e Bem-estar na Construção Muscular', 'PT', 'C');
insert ignore into categoria_pesquisada (id_pesquisa, id_categoria) values (30, 3);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (30, 12);
insert ignore into avaliacao (id_pesquisa, id_resposta, pontuacao) values (30, 12, 9);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (30, 13);
insert ignore into avaliacao (id_pesquisa, id_resposta, pontuacao) values (30, 13, 8);
insert ignore into resposta_obtida (id_pesquisa, id_resposta) values (30, 20);
insert ignore into avaliacao (id_pesquisa, id_resposta, pontuacao) values (30, 20, 3);