CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS Musicians (
	id SERIAL PRIMARY KEY,
	nickname VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS GenreMusician (
	genre_id integer references Genres(id),
	musician_id integer references Musicians(id),
	constraint pk primary key (genre_id, musicianst_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
    year_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS MusicianAlbum (
	musician_id INTEGER REFERENCES Musicians(id),
	album_id integer references Albums(id),
	constraint pk primary key (genre_id, musicianst_id)
);

CREATE TABLE IF NOT EXISTS Compilation (
	id SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
    year_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Albums(id),
	title VARCHAR(80) NOT NULL,
	duration INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS TrackCompilation (
	compilation_id INTEGER REFERENCES Compilation(id),
	track_id integer references Track(id),
	constraint pk primary key (compilation_id, track_id)
);

INSERT INTO Genres(name) 
VALUES('rock music');

INSERT INTO Genres(name) 
VALUES('rock and roll');

INSERT INTO Genres(name) 
VALUES('pop music');

INSERT INTO Genres(name) 
VALUES('rap music');

INSERT INTO Genres(name) 
VALUES('jazz');

INSERT INTO Genres(name) 
VALUES('chanson');



INSERT INTO musicians (nickname) 
VALUES('Roxette');

INSERT INTO musicians (nickname) 
VALUES('The Beatles');

INSERT INTO musicians (genres_id, nickname) 
VALUES(2, 'The Beatles');

INSERT INTO musicians (genres_id, nickname) 
VALUES(4, 'Oxxxymiron');

INSERT INTO musicians (genres_id, nickname) 
VALUES(5, 'Louis Armstrong');

INSERT INTO musicians (genres_id, nickname) 
VALUES(6, 'Круг');

INSERT INTO musicians (genres_id, nickname) 
VALUES(3, 'Madonna');

INSERT INTO musicians (genres_id, nickname)
VALUES(6, 'Edith Piaf');

INSERT INTO musicians (genres_id, nickname)
VALUES(2, 'Elvis Presley');



INSERT INTO albums (musicians_id, title, year_release) 
VALUES(1, 'Good Karma', 2018);

INSERT INTO albums (musicians_id, title, year_release) 
VALUES(10, 'Welcome to My World', 1977);

INSERT INTO albums (musicians_id, title, year_release) 
VALUES(3, 'Help!', 1965);

INSERT INTO albums (musicians_id, title, year_release) 
VALUES(5, 'Красота и Уродство', 2021);

INSERT INTO albums (musicians_id, title, year_release) 
VALUES(6, 'Louis Armstrong and His Friends', 1971);

INSERT INTO albums (musicians_id, title, year_release) 
VALUES(7, 'Мадам', 1998);

INSERT INTO albums (musicians_id, title, year_release) 
VALUES(7, 'Зеленый прокурор (Светочка)', 1996);





INSERT INTO Compilation (title, year_release)
values ('Best', 2018);

INSERT INTO Compilation (title, year_release)
values ('The Complete Elvis Presley Masters', 2010);

INSERT INTO Compilation (title, year_release)
values ('Anthology 1', 1995);

INSERT INTO Compilation (title, year_release)
values ('Смутное время', 2022);

INSERT INTO Compilation (title, year_release)
values ('The Complete Louis Armstrong Columbia', 2021);

INSERT INTO Compilation (title, year_release)  
values ('Легенды русского шансона. Том 1', 1999);

INSERT INTO Compilation (title, year_release)
values ('Ветер северный. Сборник русского шансона', 2009);






INSERT INTO Track (compilation_id, album_id, title, duration)
values (1, 1, 'It Just Happens', 226);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (1, 1, 'From a Distance', 210);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (2, 2, 'Gentle On My Mind', 204);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (2, 2, 'For The Good Times', 188);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (3, 3, 'Ticket to Ride', 182);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (3, 3, 'Yesterday', 123);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (4, 4, 'Мы все умрём', 166);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (4, 4, 'Агент', 215);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (5, 5, 'My One and Only Love', 199);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (5, 5, 'Boy from New Orleans', 237);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (6, 6, 'Владимирский централ', 267);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (7, 6, 'Владимирский централ', 267);

INSERT INTO Track (compilation_id, album_id, title, duration)
values (7, 7, 'Милый мой город', 235);


INSERT INTO Track (compilation_id, album_id, title, duration)
values (, , '', );



--SELECT * FROM Genres;
--
--DELETE FROM  Genres
--WHERE id = 4;

--alter table compilation
--	alter column title set data type text