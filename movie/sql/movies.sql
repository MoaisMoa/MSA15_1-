----
----
----INSERT INTO movie (title, sub_title, director, actor, country, release_date, description, img_path, play_time)
----VALUES
----('인터스텔라', 'Interstellar', '크리스토퍼 놀란', '매튜 맥커너히, 앤 해서웨이, 마이클 케인, 제시카 차스테인', '미국,영국', '2014-11-06', '세계 각국의 정부와 경제가 완전히 붕괴된 미래가 다가온다. 지난 20세기에 범한 잘못이 전 세계적인 식량 부족을 불러왔고, NASA도 해체되었다. 이때 시공간에 불가사의한 틈이 열리고, 남은 자들에게는 이 곳을 탐험해 인류를 구해야 하는 임무가 지워진다. 사랑하는 가족들을 뒤로 한 채 인류라는 더 큰 가족을 위해, 그들은 이제 희망을 찾아 우주로 간다. 그리고 우린 답을 찾을 것이다. 늘 그랬듯이…', '/img/인터스텔라.jpg', 169),

--INSERT INTO movie_genre (movie_id, genre)
--VALUES (1, 'SF'),


--ALTER TABLE movie
--ADD COLUMN detail_img_path VARCHAR(200);

--SELECT * FROM detail_img_path

--ALTER TABLE movie
--ADD COLUMN detail_img_path VARCHAR(200);

--SELECT movie_id, title, img_path, detail_img_path FROM movie WHERE movie_id = 1;

--UPDATE movie
--SET detail_img_path = '인터스텔라세로.jpg'
--WHERE movie_id = 1;
--
--UPDATE movie
--SET detail_img_path = '서울의봄세로.jpg'
--WHERE movie_id = 5;
--
--UPDATE movie
--SET detail_img_path = '야당세로.jpg'
--WHERE movie_id = 8;
--
--UPDATE movie
--SET detail_img_path = '한산세로.jpg'
--WHERE movie_id = 15;

--DESCRIBE movie;
SELECT movie_id, title, detail_img_path, img_path FROM movie WHERE movie_id = 1;


SELECT * FROM movie_genre