CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musicians (
	id SERIAL PRIMARY KEY,
	genres_id INTEGER NOT NULL REFERENCES Genres(id),
	nickname VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	musicians_id INTEGER NOT NULL REFERENCES Musicians(id),
	title VARCHAR(60) NOT NULL,
    year_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Compilation (
	id SERIAL PRIMARY KEY,
	title VARCHAR(40) NOT NULL,
    year_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	compilation_id INTEGER NOT NULL REFERENCES Compilation(id),
	album_id INTEGER NOT NULL REFERENCES Albums(id),
	title VARCHAR(60) NOT NULL,
	duration INTEGER NOT NULL
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



INSERT INTO musicians (genres_id, nickname) 
VALUES(1, 'Roxette');

INSERT INTO musicians (genres_id, nickname) 
VALUES(3, 'Roxette');

INSERT INTO musicians (genres_id, nickname) 
VALUES(1, 'The Beatles');

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



INSERT INTO Compilation (title, year_release)
values ('Best', 2018);

INSERT INTO Compilation (title, year_release)
values ('The Complete Elvis Presley Masters', 2010);

INSERT INTO Compilation (title, year_release)
values ('Anthology 1', 1995);

INSERT INTO Compilation (title, year_release)
values ('Смутное время', 2022);





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








