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
  `position` VARCHAR(255) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
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
    (1, 'æspa', 4, '2020년 11월 17일', '카리나', 'MY'),
    (2, 'Red Velvet', 5, '2014년 08월 01일', '아이린', 'ReVeluv'),
    (3, 'EXO', 9, '2012년 04월 08일', '수호', 'EXO-L'),
    (4, 'f(x)', 4, '2009년 09월 05일', '빅토리아', 'me(you)'),
    (5, 'SHINee', 5, '2008년 05월 25일', '온유', 'SHINee WORLD');
    
# 에스파 멤버
INSERT INTO `member` (mid, mname, birthday, position) VALUES
    (1, '카리나', '2000. 04. 11', '리더, 보컬, 댄서, 래퍼'),
    (2, '지젤', '2000. 10. 30', '보컬, 래퍼, 댄서'),
    (3, '윈터', '2001. 01. 01', '메인댄서, 리드래퍼, 서브보컬'),
    (4, '닝닝', '2002. 10. 23', '보컬, 랩, 댄스');

# 레드벨벳 멤버
INSERT INTO `member` (mid, mname, birthday, position) VALUES
    (5, '아이린', '1991. 03. 29', '리더, 센터, 메인래퍼, 서브보컬, 리드댄서'),
    (6, '슬기', '1994. 02. 10', '메인댄서, 리드보컬'),
    (7, '웬디', '1994. 02. 21', '메인보컬'),
    (8, '조이', '1996. 09. 03', '리드래퍼, 서브보컬'),
    (9, '예리', '1999. 03. 05', '서브래퍼, 서브보컬');
    
# 엑소 멤버
INSERT INTO `member` (mid, mname, birthday, position) VALUES
    (10, '시우민', '1990. 03. 26', '서브보컬, 서브래퍼'),
    (11, '수호', '1991. 05. 22', '리더, 리드보컬'),
    (12, '레이', '1991. 10. 07', '메인댄서, 서브보컬'),
    (13, '백현', '1992. 05. 06', '메인보컬'),
    (14, '첸', '1992. 09. 21', '메인보컬'),
    (15, '찬열', '1992. 11. 27', '메인래퍼, 서브보컬'),
    (16, '디오', '1993. 01. 12', '메인보컬'),
    (17, '카이', '1994. 01. 14', '센터, 메인댄서, 서브보컬, 서브래퍼'),
    (18, '세훈', '1994. 04. 12', '리드래퍼, 리드댄서');
  
# 에프엑스 멤버
INSERT INTO `member` (mid, mname, birthday, position) VALUES
    (19, '빅토리아', '1987. 02. 02', '리더, 메인댄서, 서브보컬'),
    (20, '엠버', '1992. 09. 18', '메인래퍼, 서브보컬'),
    (21, '루나', '1993. 08. 12', '메인보컬, 리드댄서'),
    (22, '크리스탈', '1994. 10. 24', '센터, 리드보컬');
  
# 샤이니 멤버
INSERT INTO `member` (mid, mname, birthday, position) VALUES
    (23, '온유', '1989. 12. 14', '리더, 리드보컬'),
    (24, '종현', '1990. 04. 08', '메인보컬'),
    (25, '키', '1991. 09. 23', '보컬, 리드래퍼, 리드댄서'),
    (26, '민호', '1991. 12. 09', '메인래퍼, 보컬'),
    (27, '태민', '1993. 07. 18', '메인댄서, 보컬');
    
INSERT INTO `team_has_member` (team_id, member_id) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4),
    (2, 5), (2, 6), (2, 7), (2, 8), (2, 9),
    (3, 10), (3, 11), (3, 12), (3, 13), (3, 14),
    (3, 15), (3, 16), (3, 17), (3, 18),
    (4, 19), (4, 20), (4, 21), (4, 22),
    (5, 23), (5, 24), (5, 25), (5, 26), (5, 27);
    
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
    
# 에프엑스 음반
INSERT INTO `records` (id, title, team_id) VALUES
    (null, '라차타(LA chA TA)', 4),
    (null, 'Chu~♡', 4),
    (null, 'NU ABO', 4),
    (null, '피노키오', 4),
    (null, 'Hot Summer', 4),
    (null, 'Electric Shock', 4),
    (null, '첫 사랑니', 4),
    (null, 'Red Light', 4),
    (null, '4 Walls', 4),
    (null, 'All Mine', 4);
    
# 샤이니 음반
INSERT INTO `records` (id, title, team_id) VALUES
    (null, '누난 너무 예뻐(Replay)', 5),
    (null, '산소같은 너', 5),
    (null, '아.미.고', 5),
    (null, '줄리엣', 5),
    (null, 'Ring Ding Dong', 5),
    (null, 'LUCIFER', 5),
    (null, 'Hello', 5),
    (null, 'Sherlock.셜록(Clue+Note)', 5),
    (null, 'Why So Serious?', 5),
    (null, '너와 나의 거리', 5),
    (null, 'Everybody', 5),
    (null, 'View', 5),
    (null, 'Married To The Music', 5),
    (null, '1 of 1', 5),
    (null, '데리러 가(Good Evening)', 5),
    (null, 'I Want You', 5),
    (null, '네가 남겨둔 말(Our Page)', 5),
    (null, '셀 수 없는(Countless)', 5),
    (null, "Don't Call Me", 5),
    (null, 'Atlantis', 5);
    
# 에스파 이미지
INSERT INTO `image` (id, member_id, filename, description) VALUES
    (null, 1, 'Karina.png', '에스파 카리나'),
    (null, 2, 'Giselle.png', '에스파 지젤'),
    (null, 3, 'Winter.png', '에스파 윈터'),
    (null, 4, 'Ning.png', '에스파 닝닝');
    
# 레드벨벳 이미지
INSERT INTO `image` (id, member_id, filename, description) VALUES
    (null, 5, 'Irene.png', '레드벨벳 아이린'),
    (null, 6, 'Seulgi.png', '레드벨벳 슬기'),
    (null, 7, 'Wendy.png', '레드벨벳 웬디'),
    (null, 8, 'Joy.png', '레드벨벳 조이'),
    (null, 9, 'Yeri.png', '레드벨벳 예리');
    
# 엑소 이미지
INSERT INTO `image` (id, member_id, filename, description) VALUES
    (null, 10, 'Xiumin.png', '엑소 시우민'),
    (null, 11, 'Suho.png', '엑소 수호'),
    (null, 12, 'Lay.png', '엑소 레이'),
    (null, 13, 'Baekhyun.png', '엑소 백현'),
    (null, 14, 'Chen.jpg', '엑소 첸'),
    (null, 15, 'Chanyeol.png', '엑소 찬열'),
    (null, 16, 'DO.png', '엑소 디오'),
    (null, 17, 'Kai.png', '엑소 카이'),
    (null, 18, 'Sehun.png', '엑소 세훈');
    
# 에프엑스 이미지
INSERT INTO `image` (id, member_id, filename, description) VALUES
    (null, 19, 'Victoria.png', '에프엑스 빅토리아'),
    (null, 20, 'Amber.png', '에프엑스 엠버'),
    (null, 21, 'Luna.png', '에프엑스 루나'),
    (null, 22, 'Crystal.png', '에프엑스 크리스탈');
    
# 샤이니 이미지
INSERT INTO `image` (id, member_id, filename, description) VALUES
    (null, 23, 'Onew.png', '샤이니 온유'),
    (null, 24, 'Jonghyun.png', '샤이니 종현'),
    (null, 25, 'Key.png', '샤이니 키'),
    (null, 26, 'Minho.png', '샤이니 민호'),
    (null, 27, 'Taemin.png', '샤이니 태민');
  