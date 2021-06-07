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
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `members` INT NOT NULL,
  `debut` DATE NULL,
  `leader` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  `team_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX (`team_id`),
  FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

# CREATE TABLE `image` (
#   `id` INT NOT NULL AUTO_INCREMENT,
#   `gunpla_id` INT NOT NULL,
#   `filename` VARCHAR(255) NOT NULL,
#   `description` TEXT NULL,
#   PRIMARY KEY (`id`),
#   INDEX (`gunpla_id`),
#   FOREIGN KEY (`gunpla_id`) REFERENCES `gunpla` (`id`)
#     ON DELETE CASCADE ON UPDATE CASCADE
# ) ENGINE = InnoDB
#   DEFAULT CHARACTER SET utf8 
#   DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `song` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `url` TEXT NULL,
  `team_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX (`team_id`),
  FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

CREATE TABLE `award` (
  `id` INT NOT NULL,
  `description` TEXT,
  `team_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX (`team_id`),
  FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;


###############################################

INSERT INTO `team` VALUES
    (1, '에스파', 4, '2020-11-17', '카리나'),
    (2, '엑소', 9, '2012-01-30', '수호');
    
INSERT INTO `member` VALUES
    (1, '카리나', '2000-04-11', 1);
    
INSERT INTO `song` VALUES
    (1, 'Black Mamba', 'https://naver.com', 1);
    
INSERT INTO `award` VALUES
    (1, '제10회 가온차트 뮤직 어워즈 디지털음원부문 올해의 신인상', 1);
  