DROP DATABASE IF EXISTS SpotifyClone;

create database SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
  PLANO_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  PLANO VARCHAR(20),
  VALOR_PLANO INT
);

CREATE TABLE usuario(
  USUARIO_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  USUARIO VARCHAR(50),
  IDADE INT,
  PLANO_ID INT,
  FOREIGN KEY(PLANO_ID) REFERENCES plano(PLANO_ID)
);

CREATE TABLE cancoes(
  CANCOES_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  CANCOES VARCHAR(100)
);

CREATE TABLE historico(
  HISTORICO_DE_REPRODUCOES_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  CANCOES_ID INT,
  USUARIO_ID INT,
  FOREIGN KEY(CANCOES_ID) REFERENCES cancoes(CANCOES_ID),
  FOREIGN KEY(USUARIO_ID) REFERENCES usuario(USUARIO_ID)
);

CREATE TABLE album(
  ALBUM_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NAME_ALBUM VARCHAR(100)
);

CREATE TABLE artista(
  ARTISTA_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NOME_ARTISTA VARCHAR(100)
);

CREATE TABLE cancoes_album_artista(
  CANCOES_ID INT,
  ALBUM_ID INT,
    ARTISTA_ID INT,
    FOREIGN KEY(CANCOES_ID) REFERENCES cancoes(CANCOES_ID),
    FOREIGN KEY(ALBUM_ID) REFERENCES album(ALBUM_ID),
    FOREIGN KEY(ARTISTA_ID) REFERENCES artista(ARTISTA_ID)
);

CREATE TABLE seguindo_artista(
    ARTISTA_ID INT,
    USUARIO_ID INT,
    FOREIGN KEY(ARTISTA_ID) REFERENCES artista(ARTISTA_ID),
    FOREIGN KEY(USUARIO_ID) REFERENCES usuario(USUARIO_ID)
);

INSERT INTO plano (PLANO, VALOR_PLANO)
VALUES
('gratuito', 0),
('familiar',	7.99),
('universitário', 5.99);

INSERT INTO usuario (USUARIO, IDADE, PLANO_ID)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO cancoes (CANCOES_ID, CANCOES)
VALUES
(1, "Soul For Us"),
(2, "Reflections Of Magic"),
(3, "Dance With Her Own"),
(4, "Troubles Of My Inner Fire"),
(5, "Time Fireworks"),
(6, "Magic Circus"),
(7, "Honey, So Do I"),
(8, "Sweetie, Let's Go Wild"),
(9, "She Knows"),
(10, "Fantasy For Me"),
(11, "Celebration Of More"),
(12, "Rock His Everything"),
(13, "Home Forever"),
(14, "Diamond Power"),
(15, "Honey, Let's Be Silly"),
(16, "Thang Of Thunder"),
(17, "Words Of Her Life"),
(18, "Without My Streets");

INSERT INTO historico (CANCOES_ID, USUARIO_ID)
VALUES
(1, 1),
(6, 1),
(14, 1),
(13, 2),
(17, 2),
(4, 3),
(16, 3),
(3, 4),
(18, 4),
(11, 4);

INSERT INTO album (ALBUM_ID, NAME_ALBUM)
VALUES
(1, 'Envious'),
(2, 'Exuberant'),
(3, 'Hallowed Steam'),
(4, 'Incandescent'),
(5, 'Temporary Culture');

INSERT INTO artista (ARTISTA_ID, NOME_ARTISTA)
VALUES
(1, 'Walter Phoenix'),
(2, 'Freedie Shannon'),
(3, 'Lance Day'),
(4, 'Peter Strong');

INSERT INTO cancoes_album_artista(CANCOES_ID, ALBUM_ID, ARTISTA_ID)
VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 2, 1),
(5, 2, 1),
(6, 3, 4),
(7, 3, 4),
(8, 3, 4),
(9, 3, 4),
(10, 4, 3),
(11, 4, 3),
(12, 4, 3),
(13, 4, 3),
(14, 4, 3),
(15, 4, 3),
(16, 5, 2),
(17, 5, 2),
(18, 5, 2);

INSERT INTO seguindo_artista (ARTISTA_ID, USUARIO_ID)
VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(3, 2),
(4, 3),
(1, 3),
(2, 4);
