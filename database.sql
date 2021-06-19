grant all privileges on  *.* to 'root'@'%' identified by 'mysql1234';
delete from mysql.user where host="localhost" and user="root";
flush privileges;
select host,user,plugin,authentication_string from mysql.user;

#####
DROP DATABASE IF EXISTS `smentdb` ;

CREATE DATABASE IF NOT EXISTS `smentdb` 
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

USE `smentdb` ;

CREATE TABLE `team` (
  `tid` INT NOT NULL AUTO_INCREMENT,
  `tname` VARCHAR(45) NOT NULL,
  `members` INT NOT NULL,
  `debut` VARCHAR(45) NOT NULL,
  `leader` VARCHAR(45) NOT NULL,
  `fandom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `member` (
  `mid` INT NOT NULL AUTO_INCREMENT,
  `mname` VARCHAR(45) NOT NULL,
  `birthday` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;
  
CREATE TABLE `team_has_member` (
  `team_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  INDEX (`team_id`),
  FOREIGN KEY (`team_id`) REFERENCES `team` (`tid`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX (`member_id`),
  FOREIGN KEY (`member_id`) REFERENCES `member` (`mid`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `records` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `team_id` INT NOT NULL,
  PRIMARY KEY (`sid`),
  INDEX (`team_id`),
  FOREIGN KEY (`team_id`) REFERENCES `team` (`tid`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;
  
CREATE TABLE `image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `filename` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX (`member_id`),
  FOREIGN KEY (`member_id`) REFERENCES `member` (`mid`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;


###############################################

INSERT INTO `team` (tid, tname, members, debut, leader, fandom) VALUES
    (1, '에스파', 4, '2020년 11월 17일', '카리나', 'MY'),
    (2, '레드벨벳', 5, '2014년 08월 01일', '아이린', 'ReVeluv'),
    (3, '엑소', 9, '2012년 04월 08일', '수호', 'EXO-L'),
    (4, '샤이니', 5, '2008년 05월 25일', '온유', 'SHINee WORLD');
    
# 에스파 멤버
INSERT INTO `member` (mid, mname, birthday) VALUES
    (1, '카리나', '2000. 04. 11'),
    (2, '지젤', '2000. 10. 30'),
    (3, '윈터', '2001. 01. 01'),
    (4, '닝닝', '2002. 10. 23');

# 레드벨벳 멤버
INSERT INTO `member` (mid, mname, birthday) VALUES
    (5, '아이린', '1991. 03. 29'),
    (6, '슬기', '1994. 02. 10'),
    (7, '웬디', '1994. 02. 21'),
    (8, '조이', '1996. 09. 03'),
    (9, '예리', '1999. 03. 05');
    
# 엑소 멤버
INSERT INTO `member` (mid, mname, birthday) VALUES
    (10, '시우민', '1990. 03. 26'),
    (11, '수호', '1991. 05. 22'),
    (12, '레이', '1991. 10. 07'),
    (13, '백현', '1992. 05. 06'),
    (14, '첸', '1992. 09. 21'),
    (15, '찬열', '1992. 11. 27'),
    (16, '디오', '1993. 01. 12'),
    (17, '카이', '1994. 01. 14'),
    (18, '세훈', '1994. 04. 12');
    
# 샤이니 멤버
INSERT INTO `member` (mid, mname, birthday) VALUES
    (19, '온유', '1989. 12. 14'),
    (20, '종현', '1990. 04. 08'),
    (21, '키', '1991. 09. 23'),
    (22, '민호', '1991. 12. 09'),
    (23, '태민', '1993. 07. 18');
    
INSERT INTO `team_has_member` (team_id, member_id) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4),
    (2, 5), (2, 6), (2, 7), (2, 8), (2, 9),
    (3, 10), (3, 11), (3, 12), (3, 13), (3, 14),
    (3, 15), (3, 16), (3, 17), (3, 18),
    (4, 19), (4, 20), (4, 21), (4, 22), (4, 23);
    
# 에스파 음반
INSERT INTO `records` (id, title, team_id) VALUES
    (null, 'Black Mamba', 1),
    (null, 'Forever(약속)', 1),
    (null, 'Next Level', 1);
    
# 레드벨벳 음반
INSERT INTO `records` (id, title, team_id) VALUES
    (null, '행복(Happiness)', 2),
    (null, 'Be Natural', 2),
    (null, 'Automatic', 2),
    (null, 'Ice Cream Cake', 2),
    (null, 'Dumb Dumb', 2),
    (null, '7월 7일', 2),
    (null, 'Russian Roulette', 2),
    (null, 'Rookie', 2),
    (null, 'Would U', 2),
    (null, '빨간 맛', 2),
    (null, '환생(Rebirth)', 2),
    (null, 'Peek-A-Boo', 2),
    (null, 'Bad Boy', 2),
    (null, 'I Just', 2),
    (null, '#Cookie Jar', 2),
    (null, 'Power Up', 2),
    (null, 'RBB(Really Bad Boy)', 2),
    (null, 'SAPPY', 2),
    (null, '짐살라빔', 2),
    (null, '음파음파', 2),
    (null, 'Psycho', 2),
    (null, 'Milky Way', 2);
    
# 엑소 음반
INSERT INTO `records` (id, title, team_id) VALUES
    (null, 'WHAT IS LOVE', 3),
    (null, 'HISTORY', 3),
    (null, 'MAMA', 3),
    (null, '늑대와 미녀(Wolf)', 3),
    (null, '으르렁 (Growl)', 3),
    (null, '12월의 기적', 3),
    (null, '중독(Overdose)', 3),
    (null, 'CALL ME BABY', 3),
    (null, 'LOVE ME RIGHT', 3),
    (null, 'LIGHTSABER', 3),
    (null, 'Sing For You', 3),
    (null, 'Lucky One', 3),
    (null, 'Monster', 3),
    (null, 'Dancing King', 3),
    (null, 'Coming Over', 3),
    (null, 'For Life', 3),
    (null, 'Ko Ko Bop', 3),
    (null, 'Power', 3),
    (null, 'Electric Kiss', 3),
    (null, 'Universe', 3),
    (null, 'Tempo', 3),
    (null, 'Love Shot', 3),
    (null, 'Obsession', 3),
    (null, "Don't fight the feeling", 3);
    
# 샤이니 음반
INSERT INTO `records` (id, title, team_id) VALUES
    (null, '누난 너무 예뻐(Replay)', 4),
    (null, '산소같은 너', 4),
    (null, '아.미.고', 4),
    (null, '줄리엣', 4),
    (null, 'Ring Ding Dong', 4),
    (null, 'LUCIFER', 4),
    (null, 'Hello', 4),
    (null, 'Sherlock.셜록(Clue+Note)', 4),
    (null, 'Why So Serious?', 4),
    (null, '너와 나의 거리', 4),
    (null, 'Everybody', 4),
    (null, 'View', 4),
    (null, 'Married To The Music', 4),
    (null, '1 of 1', 4),
    (null, '데리러 가(Good Evening)', 4),
    (null, 'I Want You', 4),
    (null, '네가 남겨둔 말(Our Page)', 4),
    (null, '셀 수 없는(Countless)', 4),
    (null, "Don't Call Me", 4),
    (null, 'Atlantis', 4);
    
# 에스파 이미지
INSERT INTO `image` (id, member_id, filename, description) VALUES
    (null, 1, 'Karina.png', '에스파의 리더, 센터 카리나'),
    (null, 2, 'Giselle.png', '에스파의 올라운더 지젤'),
    (null, 3, 'Winter.png', '에스파의 올라운더 윈터'),
    (null, 4, 'Ning.png', '에스파의 올라운더 닝닝');
    
# 레드벨벳 이미지
INSERT INTO `image` (id, member_id, filename, description) VALUES
    (null, 5, 'Irene.png', '레드벨벳의 리더, 센터 아이린'),
    (null, 6, 'Seulgi.png', '레드벨벳의 메인댄서 슬기'),
    (null, 7, 'Wendy.png', '레드벨벳의 메인보컬 웬디'),
    (null, 8, 'Joy.png', '레드벨벳의 서브보컬 조이'),
    (null, 9, 'Yeri.png', '레드벨벳의 서브래퍼 예리');
    
# 엑소 이미지
INSERT INTO `image` (id, member_id, filename, description) VALUES
    (null, 10, 'Xiumin.png', '엑소의 서브보컬 시우민'),
    (null, 11, 'Suho.png', '엑소의 리더, 리드보컬 수호'),
    (null, 12, 'Lay.png', '엑소의 메인댄서 레이'),
    (null, 13, 'Baekhyun.png', '엑소의 메인보컬 백현'),
    (null, 14, 'Chen.png', '엑소의 메이보컬 첸'),
    (null, 15, 'Chanyeol.png', '엑소의 메인래퍼 찬열'),
    (null, 16, 'DO.png', '엑소의 메인보컬 디오'),
    (null, 17, 'Kai.png', '엑소의 센터, 메인댄서 카이'),
    (null, 18, 'Sehun.png', '엑소의 리드래퍼 세훈');
    
# 샤이니 이미지
INSERT INTO `image` (id, member_id, filename, description) VALUES
    (null, 19, 'Onew.png', '샤이니의 리더, 리드보컬 온유'),
    (null, 20, 'Jonghyun.png', '샤이니의 메인보컬 종현'),
    (null, 21, 'Key.png', '샤이니의 리드래퍼 키'),
    (null, 22, 'Minho.png', '샤이니의 메인래퍼 민호'),
    (null, 23, 'Taemin.png', '샤이니의 메인댄서 태민');
  