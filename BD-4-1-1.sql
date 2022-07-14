INSERT INTO Genres(name) 
VALUES
	('rock music'),
	('rock and roll'),
	('pop music'),
	('rap music'),
	('jazz'),
	('chanson');


INSERT INTO musicians (nickname) 
VALUES
	('Roxette'),
	('The Beatles'),
	('Oxxxymiron'),
	('Louis Armstrong'),
	('Михаил Круг'),
	('Madonna'),
	('Edith Piaf'),
	('Elvis Presley'),
	('Emin'),
	('Артур Пирожков');


INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES
	(1, 1),
	(1, 3),
	(2, 1),
	(2, 2),
	(3, 4),
	(4, 5),
	(5, 6),
	(6, 3),
	(7, 6),
	(8, 2),
	(9, 3),
	(10, 3);


INSERT INTO albums (title, year_release) 
VALUES
	('Good Karma', 2018),
	('Welcome to My World', 1977),
	('Help!', 1965),
	('Красота и Уродство', 2021),
	('Louis Armstrong and His Friends', 1971),
	('Мадам', 1998),
	('Зеленый прокурор (Светочка)', 1996),
	('Erotica', 1992),
	('A I"Olympia', 1962),
	('Девочка моя', 2019),
	('Всё о любви', 2020),
	('Madame X', 2019);


INSERT INTO MusicianAlbum (musician_id, album_id) 
VALUES
	(1, 1),
	(2, 3),
	(8, 2),
	(3, 4),
	(4, 5),
	(5, 6),
	(5, 7),
	(6, 8),
	(7, 9),
	(9, 10),
	(10, 11),
	(6, 12);


INSERT INTO Compilation (title, year_release)
VALUES 
	('Best', 2018),
	('The Complete Elvis Presley Masters', 2010),
	('Anthology 1', 1995),
	('Смутное время', 2022),
	('The Complete Louis Armstrong Columbia', 2021),
	('Легенды русского шансона. Том 1', 1999),
	('Ветер северный. Сборник русского шансона', 2009),
	('The Immaculate Collection', 1990),
	('Celebration', 2009),
	('The Very Best Of', 2020);


INSERT INTO Track (title, duration, album_id)
VALUES 
	('It Just Happens', 226, 1),
	('From a Distance', 210, 1),
	('Gentle On My Mind', 204, 2),
	('For The Good Times', 188, 2),
	('Ticket to Ride', 182, 3),
	('Yesterday', 123, 3),
	('Мы все умрём', 166, 4),
	('Агент', 215, 4),
	('My One and Only Love', 199, 5),
	('Boy from New Orleans', 237, 5),
	('Владимирский централ', 267, 6),
	('Милый мой город', 235, 7),
	('Erotica', 270, 8),
	('Justify My Love', 294, 8),
	('Non, je ne regrette rien', 142, 9),
	('Milord', 270, 9),
	('Девочка моя', 166, 10),
	('Лирика', 199, 10),
	('Чужая', 196, 11),
	('Medellin', 298, 12);


INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 2),
	(5, 3),
	(6, 3),
	(7, 4),
	(8, 4),
	(9, 5),
	(10, 5),
	(11, 6),
	(11, 7),
	(12, 7),
	(13, 9),
	(14, 8),
	(14, 9),
	(15, 10),
	(16, 10);