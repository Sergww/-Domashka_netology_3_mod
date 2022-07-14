CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) UNIQUE
);

CREATE TABLE IF NOT EXISTS Musicians (
	id SERIAL PRIMARY KEY,
	nickname VARCHAR(80) UNIQUE
);

CREATE TABLE IF NOT EXISTS GenreMusician (
	genre_id integer references Genres(id),
	musician_id integer references Musicians(id),
	constraint pk primary key (genre_id, musician_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
    year_release INTEGER CHECK (year_release>1900)
);

CREATE TABLE IF NOT EXISTS MusicianAlbum (
	musician_id integer references Musicians(id),
	album_id integer references Albums(id),
	constraint pk2 primary key (musician_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
	duration INTEGER NOT null,
	album_id INTEGER NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Compilation (
	id SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
    year_release INTEGER CHECK (year_release>1900)
);

CREATE TABLE IF NOT EXISTS TrackCompilation (
	compilation_id INTEGER REFERENCES Compilation(id),
	track_id integer references Track(id),
	constraint pk3 primary key (compilation_id, track_id)
);