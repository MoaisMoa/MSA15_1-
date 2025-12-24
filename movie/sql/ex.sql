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
<<<<<<< HEAD
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    img_path VARCHAR(1000),
    play_time INT,
=======
<<<<<<< HEAD
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    img_path VARCHAR(1000),
    play_time INT,
=======
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    play_time INT,
    img_path TEXT,
    detail_img_path TEXT,
>>>>>>> branch 'Moa' of https://github.com/MoaisMoa/MSA15_1-.git
>>>>>>> branch 'main' of https://github.com/MoaisMoa/MSA15_1-.git
    CONSTRAINT pk_movie PRIMARY KEY (movie_id)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(10) DEFAULT 'USER',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    gender CHAR(1),
    email VARCHAR(150),
    user_img_path VARCHAR(100),
    CONSTRAINT pk_users PRIMARY KEY (user_id),
    CONSTRAINT uk_users_username UNIQUE (username),
    CONSTRAINT uk_users_email UNIQUE (email)
);

CREATE TABLE review (
    review_id INT AUTO_INCREMENT,
    content TEXT NOT NULL,
    rating DECIMAL(2,1),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME,
    movie_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT pk_review PRIMARY KEY (review_id),
    CONSTRAINT fk_review_movie FOREIGN KEY (movie_id)
        REFERENCES movie (movie_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id)
        REFERENCES users (user_id)
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
