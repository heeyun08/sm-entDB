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
    (1, '카리나', '2000년 04월 11일'),
    (2, '지젤', '2000년 10월 30일'),
    (3, '윈터', '2001년 01월 01일'),
    (4, '닝닝', '2002년 10월 23일');

# 레드벨벳 멤버
INSERT INTO `member` (mid, mname, birthday) VALUES
    (5, '아이린', '1991년 03월 29일'),
    (6, '슬기', '1994년 02월 10일'),
    (7, '웬디', '1994년 02월 21일'),
    (8, '조이', '1996년 09월 03일'),
    (9, '예리', '1999년 03월 05일');
    
INSERT INTO `team_has_member` (team_id, member_id) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4),
    (2, 5), (2, 6), (2, 7), (2, 8), (2, 9);
    
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
    
# 에스파 이미지
INSERT INTO `image` (id, member_id, filename, description) VALUES
    (null, 1, 'Karina.png', '에스파의 리더 카리나'),
    (null, 2, 'Giselle.png', '에스파의 보컬 지젤'),
    (null, 3, 'Winter.png', '에스파의 메인 보컬 윈터'),
    (null, 4, 'Ning.png', '에스파의 보컬 닝닝');
  