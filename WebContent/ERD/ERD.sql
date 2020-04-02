SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */
DROP TABLE IF EXISTS BOOK;
DROP TABLE IF EXISTS REPLY;
DROP TABLE IF EXISTS COMMENT;
DROP TABLE IF EXISTS DESIGNER;
DROP TABLE IF EXISTS SERVICE;
DROP TABLE IF EXISTS SHOP;
DROP TABLE IF EXISTS USER;


/* Create Tables */
CREATE TABLE BOOK
(
	bo_uid int NOT NULL AUTO_INCREMENT,
	bo_service varchar(80) NOT NULL,
	bo_stat int NOT NULL DEFAULT 1,CHECK(bo_stat>=1 and bo_stat<=3),
	bo_time datetime NOT NULL default now(),
	bo_comment varchar(80),
	use_uid int,
	sh_uid int,
	PRIMARY KEY (bo_uid)
);


CREATE TABLE COMMENT
(
	co_uid int NOT NULL AUTO_INCREMENT,
	co_star int NOT NULL,
	co_content text NOT NULL,
	co_name varchar(40) NOT NULL,
	co_regdate datetime NOT NULL DEFAULT now(),
	use_uid int,
	sh_uid int,
	co_title varchar(20) NOT NULL,
	PRIMARY KEY (co_uid)
);


CREATE TABLE DESIGNER
(
	de_uid int NOT NULL AUTO_INCREMENT,
	de_name varchar(40),
	de_position varchar(20),
	de_career int default 0,
	de_major varchar(40),
	de_picture varchar(400) NOT NULL default '0',
	sh_uid int,
	PRIMARY KEY (de_uid)
);


CREATE TABLE REPLY
(
	re_uid int NOT NULL AUTO_INCREMENT,
	re_content text NOT NULL,
	co_uid int,
	re_regdate datetime NOT NULL DEFAULT now(),
	PRIMARY KEY (re_uid)
);


CREATE TABLE SERVICE
(
	ser_uid int NOT NULL AUTO_INCREMENT,
	ser_name varchar(40),
	ser_price int default 0,
	ser_time int default 0,
	sh_uid int NOT NULL,
	PRIMARY KEY (ser_uid)
);


CREATE TABLE SHOP
(
	sh_uid int NOT NULL AUTO_INCREMENT,
	sh_id varchar(40) NOT NULL,
	sh_pw varchar(15) NOT NULL,
	sh_no_id double NOT NULL,
	sh_name varchar(20) NOT NULL,
	sh_telephone varchar(30) NOT NULL,
	sh_location varchar(80),
	sh_location_d varchar(40),
	sh_location_lat varchar(40),
	sh_location_lng varchar(40),
	sh_hello varchar(200),
	sh_picture1 varchar(400) default '0',
	sh_picture2 varchar(400) default '0',
	sh_picture3 varchar(400) default '0',
	sh_starttime int DEFAULT 9,
	sh_endtime int DEFAULT 21,
	num_identify int DEFAULT 2,
	-- 별점
	sh_star double COMMENT '별점',
	PRIMARY KEY (sh_uid),
	UNIQUE (sh_id),
	UNIQUE (sh_no_id)
);


CREATE TABLE USER
(
	use_id varchar(40) NOT NULL,
	use_uid int NOT NULL AUTO_INCREMENT,
	use_pw varchar(15) NOT NULL,
	use_name varchar(40) NOT NULL,
	use_phoneNum varchar(11) NOT NULL,
	num_identify int DEFAULT 1,
	PRIMARY KEY (use_uid),
	UNIQUE (use_id),
	UNIQUE (use_phoneNum)
);



/* Create Foreign Keys */

ALTER TABLE REPLY
	ADD FOREIGN KEY (co_uid)
	REFERENCES COMMENT (co_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE BOOK
	ADD FOREIGN KEY (sh_uid)
	REFERENCES SHOP (sh_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE COMMENT
	ADD FOREIGN KEY (sh_uid)
	REFERENCES SHOP (sh_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE DESIGNER
	ADD FOREIGN KEY (sh_uid)
	REFERENCES SHOP (sh_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE SERVICE
	ADD FOREIGN KEY (sh_uid)
	REFERENCES SHOP (sh_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE BOOK
	ADD FOREIGN KEY (use_uid)
	REFERENCES USER (use_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE COMMENT
	ADD FOREIGN KEY (use_uid)
	REFERENCES USER (use_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



/***** 샘플데이터 *****/

insert into USER (use_id,use_pw,use_name,use_phoneNum) values 
('userId01','1234','임민교','01011111111'),
('userId02','1234','최현진','01022222222'),
('userId03','1234','오다현','01033333333'),
('userId04','1234','강경근','01044444444'),
('userId05','1234','고정민','01055555555');


insert into SHOP (sh_id,sh_pw,sh_no_id,sh_name,sh_telephone,sh_location,
sh_location_lat,sh_location_lng,sh_hello,sh_starttime,sh_endtime) values 
('shopId01','1234',1111111111,'헤네시스미용실','01022222222','빅토리아아일랜드',
37.490239,126.91232,'최선을 다하는 헤네시스 미용실입니다.',9,19),
('shopId02','1234',2222222222,'커닝시티미용실','010-1111-1111','빅토리아아일랜드',
37.590259,126.41632,'최선을 다하는 커닝시티 미용실입니다.',9,22),
('shopId03','1234',3333333333,'페리온미용실','010-1112-2234','빅토리아아일랜드',
37.590289,126.81632,'최선을 다하는 페리온 미용실입니다.',9,22),
('shopId04','1234',4444444444,'슬리피우드미용실','010-3333-3333','빅토리아아일랜드',
37.49049,126.93632,'최선을 다하는 슬리피우드 미용실입니다.',9,20),
('shopId05','1234',5555555555,'엘리니아미용실','010-4444-4444','빅토리아아일랜드',
37.440279,126.99632,'최선을 다하는 엘리니아 미용실입니다.',9,21),
('shopId06','1234',6666666666,'테스트1','010-4444-4444','빅토리아아일랜드',
37.424279,126.98732,'최선을 다하는 테스트1 미용실입니다.',9,21),
('shopId07','1234',7777777777,'테스트2','010-4444-4444','빅토리아아일랜드',
37.488279,126.98632,'최선을 다하는 테스트2 미용실입니다.',9,21),
('shopId08','1234',8888888888,'테스트3','010-4444-4444','빅토리아아일랜드',
37.478279,126.98332,'최선을 다하는 테스트3 미용실입니다.',9,21)
;

UPDATE SHOP SET
sh_picture1 = 'sh1.jpg',
sh_picture2 = 'sh2.jpg',
sh_picture3 = 'sh3.png'
where sh_uid = 1;

insert into COMMENT (co_star,co_content,co_name,co_title,use_uid,sh_uid) values 
('3','민교 머리잘랐다 ~','임민교','헤네시스 미용실 - 컷트',1,1),
('3','민교 머리잘랐다 ~','임민교','헤네시스 미용실 - 컷트',1,1),
('3','민교 머리잘랐다 ~','임민교','헤네시스 미용실 - 컷트',1,1),
('3','민교 머리잘랐다 ~','임민교','헤네시스 미용실 - 컷트',1,1),
('3','민교 머리잘랐다 ~','임민교','헤네시스 미용실 - 컷트',1,1),
('1','현진형탈모와라','임민교','엘리니아 미용실 - 파마',1,1),
('2','민교 머리잘랐다 ~','임민교','헤네시스 미용실 - 컷트',1,1),
('5','현진형탈모와라','임민교','엘리니아 미용실 - 파마',1,1),
('4','민교 머리 두번자른다','임민교','커닝시티 미용실 - 컷트',1,2),
('1','탈모두번와라','임민교','코잼노가다 미용실 - 파마',2,2),
('5','민교 머리 염색한다','임민교','페리온 미용실 - 염색',2,3),
('3','민교멘탈나갔다','임민교','뭐로하지 미용실 - 파마',1,3),
('5','민교 머리 볶았다ㅏㅏ','임민교','슬리피우드 미용실 - 파마',2,4),
('4','민교 머리 풤~햇다','임민교','이름정하기싫다 미용실 - 파마',1,4)
;

UPDATE shop set sh_star=(select ROUND(avg(co_star),2) 
from comment where sh_uid=1) where sh_uid = 1;
UPDATE shop set sh_star=(select ROUND(avg(co_star),2) 
from comment where sh_uid=2) where sh_uid = 2;
UPDATE shop set sh_star=(select ROUND(avg(co_star),2) 
from comment where sh_uid=3) where sh_uid = 3;
UPDATE shop set sh_star=(select ROUND(avg(co_star),2) 
from comment where sh_uid=4) where sh_uid = 4;

INSERT INTO DESIGNER
(de_name,de_position,de_career,de_major,sh_uid)
VALUES('김염색', '점장', 20, '염색', 1),
('박커트','디자이너', 10, '커트', 1),
('이파마','디자이너', 8, '파마', 1);


INSERT INTO SERVICE
(ser_name,ser_price,ser_time,sh_uid)
VALUES('염색', 50000, 2, 1),
('파마', 80000, 3, 1),
('컷트', 30000, 1, 1);


insert into book ( bo_service,bo_stat,bo_comment,use_uid,sh_uid,bo_time)
values
('test01_service',1,'취소사유01',1, 1,'2020-01-16 18:00:00'),
('test02_service',1, '취소사유02',1, 2,'2020-01-16 18:00:00'),
('test03_service',1, '취소사유02',1, 2,'2020-01-16 18:00:00'),
('test04_service',1, '취소사유02',1, 2,'2020-01-16 18:00:00'),
('test05_service',2, '취소사유02',1, 2,'2020-01-16 18:00:00'),
('test06_service',2, '취소사유02',1, 2,'2020-01-16 18:00:00'),
('test07_service',2, '취소사유02',1, 2,'2020-01-16 18:00:00'),
('test08_service',2, '취소사유02',1, 2,'2020-01-16 18:00:00'),
('test09_service',3, '취소사유02',1, 2,'2020-01-16 18:00:00'),
('test10_service',3, '취소사유02',1, 2,'2020-01-16 18:00:00'),
('test11_service',3, '취소사유02',1, 2,'2020-01-16 18:00:00'),
('test12_service',3, '취소사유02',1, 2,'2020-01-16 18:00:00')
;
insert into book ( bo_service,bo_stat,bo_comment,use_uid,sh_uid)
values
('test01_service',1,'취소사유01',1, 1),
('test02_service',1, '취소사유02',1, 2),
('test03_service',1, '취소사유02',1, 2),
('test04_service',1, '취소사유02',1, 2),
('test05_service',2, '취소사유02',1, 2),
('test06_service',2, '취소사유02',1, 2),
('test07_service',2, '취소사유02',1, 2),
('test08_service',2, '취소사유02',1, 2),
('test09_service',3, '취소사유02',1, 2),
('test10_service',3, '취소사유02',1, 2),
('test11_service',3, '취소사유02',1, 2),
('test12_service',3, '취소사유02',1, 2)
;
insert into book ( bo_service,bo_stat,bo_comment,use_uid,sh_uid,bo_time)
values
('test01_service',1,'취소사유01',1, 1,'2020-01-16 20:00:00'),
('test02_service',1, '취소사유02',1, 2,'2020-01-16 20:00:00'),
('test03_service',1, '취소사유02',1, 2,'2020-01-16 20:00:00'),
('test04_service',1, '취소사유02',1, 2,'2020-01-16 20:00:00'),
('test05_service',2, '취소사유02',1, 2,'2020-01-16 20:00:00'),
('test06_service',2, '취소사유02',1, 2,'2020-01-16 20:00:00'),
('test07_service',2, '취소사유02',1, 2,'2020-01-16 20:00:00'),
('test08_service',2, '취소사유02',1, 2,'2020-01-16 20:00:00'),
('test09_service',3, '취소사유02',1, 2,'2020-01-16 20:00:00'),
('test10_service',3, '취소사유02',1, 2,'2020-01-16 20:00:00'),
('test11_service',3, '취소사유02',1, 2,'2020-01-16 20:00:00'),
('test12_service',3, '취소사유02',1, 2,'2020-01-16 20:00:00')
;

/*페이징 위해서 코멘트양 늘리기*/
INSERT INTO comment(use_uid,sh_uid,co_name,co_title, co_star, co_content)
SELECT use_uid,sh_uid,co_name,co_title, co_star, co_content from comment;

INSERT INTO comment(use_uid,sh_uid,co_name,co_title, co_star, co_content)
SELECT use_uid,sh_uid,co_name,co_title, co_star, co_content from comment;

INSERT INTO comment(use_uid,sh_uid,co_name,co_title, co_star, co_content)
SELECT use_uid,sh_uid,co_name,co_title, co_star, co_content from comment;

INSERT INTO comment(use_uid,sh_uid,co_name,co_title, co_star, co_content)
SELECT use_uid,sh_uid,co_name,co_title, co_star, co_content from comment;