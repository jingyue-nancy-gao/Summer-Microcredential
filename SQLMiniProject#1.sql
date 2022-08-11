-------------------------
-- SQL Mini Project #1 --
-------------------------

CREATE TABLE videos (
    ID serial PRIMARY KEY,
    video_id int,
    video_title VARCHAR(255) NOT NULL,
    length_in_minutes int,
    url VARCHAR(255) NOT NULL
);


INSERT INTO videos (video_id, video_title, length_in_minutes, url) 
VALUES
(081101, 'Best of Debussy / Soothing, Relaxing Classical Music / Extended', 138, 'https://www.youtube.com/watch?v=T3AuplcGNyo&t=156s'),
(081102, 'J.S. Bach: Complete Partitas', 145, 'https://www.youtube.com/watch?v=XiG8AGn5Qz8'),
(081103, 'YUNDI LI Chopin Nocturnes Op.9 No.1, 2 & Op.48 No.1', 15, 'https://www.youtube.com/watch?v=4obAjW07-tg'),
(081104, 'Heifetz Institute - SoHyun Ko, 12 | Sarasate: Zigeunerweisen, Op. 20', 10, 'https://www.youtube.com/watch?v=kmV2hj-I7Xo'),
(081105, 'We Play Our Fans’ Musical Compositions (Ep. 1)', 14, 'https://www.youtube.com/watch?v=D-x1vIxi7dU');


CREATE TABLE reviewers (
    ID serial PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    rating int,
    short_text_review VARCHAR(255) NOT NULL,
    video_id int
);


INSERT INTO reviewers (user_name, rating, short_text_review, video_id) 
VALUES
('Donald Moody', 4, 'My daughter played these for me. She kept me in a relaxed state of bliss.', 081101),
('Nek Nosnaws', 5, 'It feels like dreaming! So good!', 081101),
('Brian Russick', 4, 'He plays Op.9 No.1 in B flat minor beautifully and the rest are well done too.', 081103),
('Jeff Soule', 5, 'It’s a wonderful rendition. Period.', 081103),
('TraverseIce', 5, 'the first piece ("the sacrilegious piece) actually sounded pretty cool and lively', 081105),
('ali', 5, 'as someone who cannot play an instrument, this is genuinely mind blowing. These are beautiful!!!!!!!!!!', 081105),
('Bish Whitaker', 5, 'Whoever composed the Mirror duet is a genius', 081105);


SELECT *
FROM videos
LEFT JOIN reviewers
ON videos.video_id = reviewers.video_id


