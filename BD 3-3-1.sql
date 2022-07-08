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

INSERT INTO musicians (nickname) 
VALUES('Oxxxymiron');

INSERT INTO musicians (nickname) 
VALUES('Louis Armstrong');

INSERT INTO musicians (nickname)  
VALUES('Михаил Круг');

INSERT INTO musicians (nickname)  
VALUES('Madonna');

INSERT INTO musicians (nickname) 
VALUES('Edith Piaf');

INSERT INTO musicians (nickname) 
VALUES('Elvis Presley');


INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES(1, 1);

INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES(1, 3);

INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES(2, 1);

INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES(2, 2);

INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES(3, 4);

INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES(4, 5);

INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES(5, 6);

INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES(6, 3);

INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES(7, 6);

INSERT INTO GenreMusician (musician_id, genre_id) 
VALUES(8, 2);


INSERT INTO albums (title, year_release) 
VALUES('Good Karma', 2018);

INSERT INTO albums (title, year_release) 
VALUES('Welcome to My World', 1977);

INSERT INTO albums (title, year_release) 
VALUES('Help!', 1965);

INSERT INTO albums (title, year_release) 
VALUES('Красота и Уродство', 2021);

INSERT INTO albums (title, year_release) 
VALUES('Louis Armstrong and His Friends', 1971);

INSERT INTO albums (title, year_release)  
VALUES('Мадам', 1998);

INSERT INTO albums (title, year_release) 
VALUES('Зеленый прокурор (Светочка)', 1996);

INSERT INTO albums (title, year_release) 
VALUES('Erotica', 1992);

INSERT INTO albums (title, year_release) 
VALUES('A I"Olympia', 1962);


INSERT INTO MusicianAlbum (musician_id, album_id) 
VALUES(1, 1);

INSERT INTO MusicianAlbum (musician_id, album_id) 
VALUES(2, 3);

INSERT INTO MusicianAlbum (musician_id, album_id) 
VALUES(8, 2);

INSERT INTO MusicianAlbum (musician_id, album_id) 
VALUES(3, 4);

INSERT INTO MusicianAlbum (musician_id, album_id) 
VALUES(4, 5);

INSERT INTO MusicianAlbum (musician_id, album_id) 
VALUES(5, 6);

INSERT INTO MusicianAlbum (musician_id, album_id) 
VALUES(5, 7);

INSERT INTO MusicianAlbum (musician_id, album_id) 
VALUES(6, 8);

INSERT INTO MusicianAlbum (musician_id, album_id) 
VALUES(7, 9);


INSERT INTO Compilation (title, year_release)
values ('Best', 2018);

INSERT INTO Compilation (title, year_release)
values ('The Complete Elvis Presley Masters', 2010);

INSERT INTO Compilation (title, year_release)
values ('Anthology 1', 1995);

INSERT INTO Compilation (title, year_release)
values ('Смутное время, 2022);

INSERT INTO Compilation (title, year_release)
values ('The Complete Louis Armstrong Columbia', 2021);

INSERT INTO Compilation (title, year_release)  
values ('Легенды русского шансона. Том 1', 1999);  

INSERT INTO Compilation (title, year_release)
values ('Ветер северный. Сборник русского шансона', 2009);

INSERT INTO Compilation (title, year_release)
values ('The Immaculate Collection', 1990);

INSERT INTO Compilation (title, year_release)
values ('Celebration', 2009);  

INSERT INTO Compilation (title, year_release)
values ('The Very Best Of', 2020);



INSERT INTO Track (title, duration, album_id)
values ('It Just Happens', 226, 1);

INSERT INTO Track (title, duration, album_id)
values ('From a Distance', 210, 1);

INSERT INTO Track (title, duration, album_id)
values ('Gentle On My Mind', 204, 2);

INSERT INTO Track (title, duration, album_id)
values ('For The Good Times', 188, 2);

INSERT INTO Track (title, duration, album_id)
values ('Ticket to Ride', 182, 3);

INSERT INTO Track (title, duration, album_id)
values ('Yesterday', 123, 3);

INSERT INTO Track (title, duration, album_id)
values ('Мы все умрём', 166, 4);

INSERT INTO Track (title, duration, album_id)
values ('Агент', 215, 4);

INSERT INTO Track (title, duration, album_id)
values ('My One and Only Love', 199, 5);

INSERT INTO Track (title, duration, album_id)
values ('Boy from New Orleans', 237, 5);

INSERT INTO Track (title, duration, album_id)
values ('Владимирский централ', 267, 6);

INSERT INTO Track (title, duration, album_id)
values ('Милый мой город', 235, 7);

INSERT INTO Track (title, duration, album_id)
values ('Erotica', 270, 8);

INSERT INTO Track (title, duration, album_id)
values ('Justify My Love', 294, 8);

INSERT INTO Track (title, duration, album_id)
values ('Non, je ne regrette rien', 142, 9);

INSERT INTO Track (title, duration, album_id)
values ('Milord', 270, 9);


INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(1, 1);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(2, 1);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(3, 2);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(4, 2);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(5, 3);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(6, 3);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(7, 4);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(8, 4);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(9, 5);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(10, 5);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(11, 6);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(11, 7);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(12, 7);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(13, 9);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(14, 8);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(14, 9);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(15, 10);

INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES(16, 10);
