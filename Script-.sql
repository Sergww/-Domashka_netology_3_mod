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
    year_release date NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	compilation_id INTEGER NOT NULL REFERENCES Compilation(id),
	album_id INTEGER NOT NULL REFERENCES Albums(id),
	title VARCHAR(60) NOT NULL,
	duration INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Compilation (
	id SERIAL PRIMARY KEY,
	title VARCHAR(40) NOT NULL,
    year_release date NOT NULL
);

alter TABLE Genres 
	drop column musician_id;

alter TABLE Genres 
	drop column musician_id;

INSERT INTO Genres(name) 
VALUES('rock music');

DELETE FROM  Genres
WHERE id = 2;

INSERT INTO Genres(id, name) 
VALUES(2, 'rock and roll');

INSERT INTO Genres(name) 
VALUES('pop music');

INSERT INTO Genres(name) 
VALUES('rap music');

INSERT INTO Genres(name) 
VALUES('jazz');

INSERT INTO Genres(name) 
VALUES('chanson ');

INSERT INTO musicians (genres_id, nickname) 
VALUES(1, 'Roxette');

INSERT INTO musicians (genres_id, nickname) 
VALUES(3, 'Roxette');

INSERT INTO musicians (genres_id, nickname) 
VALUES(1, 'The Beatles');

INSERT INTO musicians (genres_id, nickname) 
VALUES(2, 'The Beatles');

INSERT INTO musicians (genres_id, nickname) 
VALUES(4, 'Мальчишник');

INSERT INTO musicians (genres_id, nickname) 
VALUES(5, 'Louis Armstrong');

INSERT INTO musicians (genres_id, nickname) 
VALUES(6, 'Круг');

INSERT INTO musicians (genres_id, nickname) 
VALUES(3, 'Madonna');

INSERT INTO musicians (genres_id, nickname) 
VALUES(6, '?dith Piaf');


-- SELECT * FROM Genres;

--DELETE FROM  Genres
--WHERE id = 2;

