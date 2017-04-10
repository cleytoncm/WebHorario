CREATE DATABASE IF NOT EXISTS webHorario;
USE webHorario;

CREATE TABLE instituicoes(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	cep CHAR(8) NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	CONSTRAINT PRIMARY KEY(id)
);

CREATE TABLE cargos(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	CONSTRAINT PRIMARY KEY(id)
);

CREATE TABLE funcionarios(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	sexo ENUM('M', 'F') NOT NULL,
	cpf VARCHAR(20) NOT NULL,
	data_nascimento DATE NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	foto VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	remember_token CHAR(100),	
	CONSTRAINT PRIMARY KEY(id)
);

CREATE TABLE telefones(
	id INT NOT NULL AUTO_INCREMENT,
	numero VARCHAR(30) NOT NULL,
	funcionario_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(id),
	CONSTRAINT FOREIGN KEY(funcionario_id)
	REFERENCES funcionarios(id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE cargos_funcionarios(
	cargo_id INT NOT NULL,
	funcionario_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(cargo_id, funcionario_id),
	CONSTRAINT FOREIGN KEY(cargo_id)
	REFERENCES cargos(id)
	ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY(funcionario_id)
	REFERENCES funcionarios(id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE turnos(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	CONSTRAINT PRIMARY KEY(id)
);

CREATE TABLE horarios(
	id INT NOT NULL AUTO_INCREMENT,
	inicio TIME NOT NULL,
	fim TIME NOT NULL,
	CONSTRAINT PRIMARY KEY(id)
);

CREATE TABLE turnos_horarios(
	turno_id INT NOT NULL,
	horario_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(turno_id, horario_id),
	CONSTRAINT FOREIGN KEY(turno_id)
	REFERENCES turnos(id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY(horario_id)
	REFERENCES horarios(id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE cursos(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	sigla CHAR(5) NOT NULL,
	turno_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(id),
	CONSTRAINT FOREIGN KEY(turno_id)
	REFERENCES turnos(id)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE disciplinas(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	sigla CHAR(5) NOT NULL,
	aulasSemanais INT NOT NULL,
	CONSTRAINT PRIMARY KEY(id)
);

CREATE TABLE tiposSala(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	CONSTRAINT PRIMARY KEY(id)
);

CREATE TABLE disciplinas_tiposSala(
	disciplina_id INT NOT NULL,
	tipoSala_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(disciplina_id, tipoSala_id),
	CONSTRAINT FOREIGN KEY(disciplina_id)
	REFERENCES disciplinas(id),
	ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY(tipoSala_id)
	REFERENCES tiposSala(id)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE semestres(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	inicio DATE NOT NULL,
	fim DATE NOT NULL,
	CONSTRAINT PRIMARY KEY(id)
);

CREATE TABLE disciplinas_semestres(
	semestre_id INT NOT NULL,
	disciplina_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(semestre_id, disciplina_id),
	CONSTRAINT FOREIGN KEY(semestre_id)
	REFERENCES semestre(id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY(disciplina_id)
	REFERENCES disciplinas(id)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE cursos_disciplinas(
	curso_id INT NOT NULL,
	disciplina_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(curso_id, disciplina_id),
	CONSTRAINT FOREIGN KEY(curso_id)
	REFERENCES cursos(id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY(disciplina_id)
	REFERENCES disciplinas(id)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE cursos_funcionarios(
	curso_id INT NOT NULL,
	funcionario_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY(curso_id, funcionario_id),
	CONSTRAINT FOREIGN KEY(curso_id)
	REFERENCES cursos(id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY(funcionario_id)
	REFERENCES funcionarios(id)
	ON DELETE RESTRICT ON UPDATE CASCADE
);



