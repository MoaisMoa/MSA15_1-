-- ==========================
-- 영화 샘플 데이터 INSERT
-- ==========================

-- 외래키 체크 잠시 OFF
SET FOREIGN_KEY_CHECKS = 0;

-- 영화 장르 테이블 초기화
TRUNCATE TABLE movie_genre;

-- 영화 테이블 초기화
TRUNCATE TABLE movie;

-- 외래키 체크 다시 ON
SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO movie (movie_id, title, sub_title, director, actor, country, release_date, description, img_path, play_time)
VALUES
(1, '인터스텔라', 'Interstellar', '크리스토퍼 놀란', '매튜 맥커너히, 앤 해서웨이, 마이클 케인, 제시카 차스테인', '미국,영국', '2014-11-06', '세계 각국의 정부와 경제가 완전히 붕괴된 미래가 다가온다. 지난 20세기에 범한 잘못이 전 세계적인 식량 부족을 불러왔고, NASA도 해체되었다. 이때 시공간에 불가사의한 틈이 열리고, 남은 자들에게는 이 곳을 탐험해 인류를 구해야 하는 임무가 지워진다. 사랑하는 가족들을 뒤로 한 채 인류라는 더 큰 가족을 위해, 그들은 이제 희망을 찾아 우주로 간다. 그리고 우린 답을 찾을 것이다. 늘 그랬듯이…', '/static/img/movie/인터스텔라.jpg', 169),
(5, '서울의 봄', 'Spring in Seoul', '홍길동', '배우1, 배우2', '한국', '2020-05-01', '서울의 봄을 배경으로 한 감성 드라마', '/static/img/movie/서울의봄.jpg', 120),
(8, '야당', 'The Opposition', '김감독', '배우A, 배우B', '한국', '2019-09-10', '정치적 긴장을 다룬 사회 드라마', '/static/img/movie/야당.jpg', 135),
(15, '한산', 'Hansan', '김한산', '배우X, 배우Y', '한국', '2022-07-27', '임진왜란을 배경으로 한 전쟁 액션 영화', '/static/img/movie/한산.jpg', 138);

-- ==========================
-- 영화 장르 INSERT
-- ==========================

INSERT INTO movie_genre (movie_id, genre)
VALUES
(1, 'SF'),
(5, '드라마'),
(8, '사회/정치'),
(15, '역사/전쟁');

-- ==========================
-- detail_img_path 업데이트
-- ==========================

UPDATE movie
SET detail_img_path = '인터스텔라세로.jpg'
WHERE movie_id = 1;

UPDATE movie
SET detail_img_path = '서울의봄세로.jpg'
WHERE movie_id = 5;

UPDATE movie
SET detail_img_path = '야당세로.jpg'
WHERE movie_id = 8;

UPDATE movie
SET detail_img_path = '한산세로.jpg'
WHERE movie_id = 15;
