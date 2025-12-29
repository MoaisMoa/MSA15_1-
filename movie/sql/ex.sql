DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS movie_genre;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS movie;
CREATE TABLE movie (
    movie_id INT AUTO_INCREMENT,
    title VARCHAR(300) NOT NULL,
    sub_title VARCHAR(300),
    director VARCHAR(150),
    actor VARCHAR(500),
    country VARCHAR(100),
    release_date DATE,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    img_path VARCHAR(1000),
    detail_img_path VARCHAR(200),
    play_time INT,
    CONSTRAINT pk_movie PRIMARY KEY (movie_id)
);

CREATE TABLE users (
	no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id VARCHAR(64) NOT NULL UNIQUE,
	username VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NULL,
	birth VARCHAR(100) NULL,
	tel   VARCHAR(100) NULL,
	created_at TIMESTAMP NOT NULL DEFAULT now(),
	updated_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE review (
    review_id INT AUTO_INCREMENT,
    content TEXT NOT NULL,
    rating DECIMAL(3,1),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME,
    movie_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT pk_review PRIMARY KEY (review_id),
    CONSTRAINT fk_review_movie FOREIGN KEY (movie_id)
        REFERENCES movie (movie_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id)
        REFERENCES users (no)
        ON DELETE CASCADE
);

CREATE TABLE movie_genre (
    movie_id INT NOT NULL,
    genre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_movie_genre PRIMARY KEY (movie_id, genre),
    CONSTRAINT fk_genre_movie FOREIGN KEY (movie_id)
        REFERENCES movie (movie_id)
        ON DELETE CASCADE
);

ALTER TABLE review
ADD CONSTRAINT uk_review_user_movie UNIQUE (user_id, movie_id);

SELECT * FROM MOVIE;
SELECT * FROM USERS;
