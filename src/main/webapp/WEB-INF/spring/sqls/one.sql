DROP TABLE MEMBER;--
DROP TABLE CLASS;--
DROP TABLE PRODUCT;--
DROP TABLE BOARD;--
DROP TABLE FILE_TABLE;--
DROP TABLE PAYMENT;--
DROP TABLE BASKET;--
DROP TABLE EVENT;--
DROP TABLE REVIEW;--
DROP TABLE CHATTING;--
DROP TABLE ROOM;--
DROP TABLE DETAIL;

DROP SEQUENCE CLASS_NO_SEQ;
DROP SEQUENCE PRODUCT_NO_SEQ;
DROP SEQUENCE BOARD_NO_SEQ;
DROP SEQUENCE BOARD_NOTICE_NO_SEQ;
DROP SEQUENCE BOARD_QNA_NO_SEQ;
DROP SEQUENCE BOARD_GROUPNO_SEQ;
DROP SEQUENCE FILE_NUM_SEQ;
DROP SEQUENCE PAYMENT_NO_SEQ;
DROP SEQUENCE BASKET_NO_SEQ;
DROP SEQUENCE EVENT_NO_SEQ;
DROP SEQUENCE REVIEW_NO_SEQ;
DROP SEQUENCE CHATTING_NO_SEQ;
DROP SEQUENCE ROOM_NO_SEQ;
DROP SEQUENCE DETAIL_NO_SEQ;

CREATE SEQUENCE CLASS_NO_SEQ;
CREATE SEQUENCE PRODUCT_NO_SEQ;
CREATE SEQUENCE BOARD_NO_SEQ;
CREATE SEQUENCE BOARD_NOTICE_NO_SEQ;
CREATE SEQUENCE BOARD_QNA_NO_SEQ;
CREATE SEQUENCE BOARD_GROUPNO_SEQ;
CREATE SEQUENCE FILE_NUM_SEQ;
CREATE SEQUENCE PAYMENT_NO_SEQ;
CREATE SEQUENCE BASKET_NO_SEQ;
CREATE SEQUENCE EVENT_NO_SEQ;
CREATE SEQUENCE REVIEW_NO_SEQ;
CREATE SEQUENCE CHATTING_NO_SEQ;
CREATE SEQUENCE ROOM_NO_SEQ;
CREATE SEQUENCE DETAIL_NO_SEQ;


select *  from member;
CREATE TABLE MEMBER (
	MEMBER_ID	VARCHAR2(500)	PRIMARY KEY,
	MEMBER_PW	VARCHAR2(500)	NOT NULL,
	MEMBER_NAME	VARCHAR2(500)	NOT NULL,
	MEMBER_NICNAME	VARCHAR2(1000)  NOT NULL,
	MEMBER_EMAIL	VARCHAR2(1000)	NOT NULL,
	MEMBER_PHONE	VARCHAR2(100)	NOT NULL,
	MEMBER_ADDR	VARCHAR2(2000)	NOT NULL,
	MEMBER_IP	VARCHAR2(100)	NOT NULL,
	MEMBER_GRADE	VARCHAR2(100)	NOT NULL,
	MEMBER_JOIN	VARCHAR2(2)	NOT NULL,
	MEMBER_NOTIFY	VARCHAR2(2)	NOT NULL,
	MEMBER_FACE	VARCHAR2(2)	NOT NULL,
	MEMBER_AUTO	VARCHAR2(2)	NOT NULL,
	
	CONSTRAINT MEMBER_GRADE_CK CHECK (MEMBER_GRADE IN ('관리자','일반회원','강사회원')),
	CONSTRAINT MEMBER_JOIN_CK CHECK (MEMBER_JOIN IN ('Y','N')),
	CONSTRAINT MEMBER_NOTIFY_CK CHECK (MEMBER_NOTIFY IN ('Y','N')),
	CONSTRAINT MEMBER_FACE_CK CHECK (MEMBER_FACE IN ('Y','N')),
	CONSTRAINT MEMBER_AUTO_CK CHECK (MEMBER_AUTO IN ('Y','N'))
);

CREATE TABLE CLASS (
	CLASS_NO	NUMBER	PRIMARY KEY,
	CLASS_TITLE	VARCHAR2(1000) 	NOT NULL,
	CLASS_DESC	VARCHAR2(4000)	NOT NULL,
	CLASS_LOC	VARCHAR2(1000)	NOT NULL,
	CLASS_CATEGORY	VARCHAR2(500)	NOT NULL,
	CLASS_MEMBER_NUM	NUMBER	NOT NULL,
	CLASS_PRICE	NUMBER	NOT NULL,
	CLASS_SALE	NUMBER  NOT NULL,
	MEMBER_ID	VARCHAR2(500)	NOT NULL,
	
	CONSTRAINT CLASS_SALE_CK CHECK(CLASS_SALE BETWEEN 0 AND 100),
	CONSTRAINT CLASS_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
	
);
CREATE TABLE  PRODUCT  (
	 PRODUCT_NO 	NUMBER	PRIMARY KEY,
	 PRODUCT_NAME 	VARCHAR2(500)	NOT NULL,
	 PRODUCT_CATEGORY 	VARCHAR2(500)	NOT NULL,
	 PRODUCT_PRICE 	NUMBER	NOT NULL,
	 PRODUCT_DESC 	VARCHAR2(2000)	NOT NULL,
	 PRODUCT_LOC 	VARCHAR2(1000)	NOT NULL,
	 PRODUCT_DEL 	VARCHAR2(200)	NOT NULL,
	 PRODUCT_SALE 	NUMBER  NOT NULL,
	 
	 CONSTRAINT PRODUCT_SALE_CK CHECK(PRODUCT_SALE BETWEEN 0 AND 100)
);

CREATE TABLE  BOARD  (
	 BOARD_NO 	NUMBER	PRIMARY KEY,
	 BOARD_NOTICE_NO 	NUMBER	,
	 BOARD_QNA_NO 	NUMBER	,
	 BOARD_TITLE 	VARCHAR2(500)	NOT NULL,
	 BOARD_CONTENT 	VARCHAR2(2000)	NOT NULL,
	 BOARD_DATE 	DATE  NOT NULL,
	 BOARD_READCOUNT 	NUMBER 	NOT NULL,
	 BOARD_GROUPNO 	NUMBER	NOT NULL,
	 BOARD_GROUPSEQ 	NUMBER	NOT NULL,
	 BOARD_TITLETAB 	NUMBER	NOT NULL,
	 BOARD_DELFLAG 	VARCHAR2(2)	NOT NULL,
	 BOARD_CATEGORY 	VARCHAR2(2)	NOT NULL,
	 BOARD_PW 	VARCHAR2(100)	,
	 MEMBER_ID 	VARCHAR2(500)	NOT NULL,
	 
	 CONSTRAINT BOARD_DELFLAG_CK CHECK (BOARD_DELFLAG IN ('Y','N')),
	 CONSTRAINT BOARD_CATEGORY_CK CHECK (BOARD_CATEGORY IN ('Q','N')),
	 CONSTRAINT BOARD_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
	 
);
select * from payment
CREATE TABLE  FILE_TABLE  (
	 FILE_NUM 	NUMBER	PRIMARY KEY,
	 FILE_PATH 	VARCHAR2(300)	NOT NULL,
	 FILE_ORI_NAME 	VARCHAR2(50)	NOT NULL,
	 FILE_NEW_NAME 	VARCHAR2(50)	NOT NULL,
	 FILE_TYPE 	VARCHAR2(10)	NOT NULL,
	 FILE_DATE 	DATE 	,
	 FILE_SIZE 	VARCHAR2(40)	NOT NULL,
	 MEMBER_ID 	VARCHAR2(500)	 ,
	 PRODUCT_NO 	NUMBER	 ,
	 CLASS_NO 	NUMBER	 ,
	 REVIEW_NO 	NUMBER	 ,
	 EVENT_NO 	NUMBER	,
	 
	 CONSTRAINT FILE_TABLE_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
	 CONSTRAINT FILE_TABLE_PRODUCT_NO_FK FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO) ON DELETE CASCADE,
	 CONSTRAINT FILE_TABLE_CLASS_NO_FK FOREIGN KEY (CLASS_NO) REFERENCES CLASS (CLASS_NO) ON DELETE CASCADE,
	 CONSTRAINT FILE_TABLE_REVIEW_NO_FK FOREIGN KEY (REVIEW_NO) REFERENCES REVIEW (REVIEW_NO) ON DELETE CASCADE,
	 CONSTRAINT FILE_TABLE_EVENT_NO_FK FOREIGN KEY (EVENT_NO) REFERENCES EVENT (EVENT_NO) ON DELETE CASCADE
	 
);

CREATE TABLE  PAYMENT  (
	 PAYMENT_NO 	NUMBER	PRIMARY KEY,
	 PAYMENT_NUM 	NUMBER	NOT NULL,
	 PAYMENT_PRICE 	NUMBER	NOT NULL,
	 PAYMENT_DATE 	DATE 	NOT NULL,
	 PAYMENT_DEL 	VARCHAR2(50) 	NULL,
	 PAYMENT_UID VARCHAR2(100) NOT NULL,
	 MEMBER_ID 	VARCHAR2(500)	NOT NULL,
	 PRODUCT_NO 	NUMBER	 ,
	 BASKET_GROUP 	NUMBER	 ,
	 CLASS_NO 	NUMBER	 ,
	 
	 
	 CONSTRAINT PAYMENT_DEL_CK CHECK (PAYMENT_DEL IN ('결제완료','배송준비중','배송중','배송완료')),
	 CONSTRAINT PAYMENT_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
	 CONSTRAINT PAYMENT_PRODUCT_NO_FK FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO) ON DELETE CASCADE,
	 CONSTRAINT PAYMENT_CLASS_NO_FK FOREIGN KEY (CLASS_NO) REFERENCES CLASS (CLASS_NO) ON DELETE CASCADE
	 
);

CREATE TABLE  BASKET  (
	 BASKET_NO 	NUMBER	PRIMARY KEY,
	 BASKET_NUM 	NUMBER	NOT NULL,
	 BASKET_PRICE 	NUMBER	NOT NULL,
	 BASKET_GROUP   NUMBER  NOT NULL,
	 PRODUCT_NO 	NUMBER	NOT NULL,
	 MEMBER_ID 	VARCHAR2(500)	NOT NULL,
	 
	 CONSTRAINT BASKET_PRODUCT_NO_FK FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO) ON DELETE CASCADE,
	 CONSTRAINT BASKET_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
	 
);

CREATE TABLE  EVENT  (
	 EVENT_NO 	NUMBER	PRIMARY KEY,
	 EVENT_TITLE 	VARCHAR2(500)	NOT NULL,
	 EVENT_DESC 	VARCHAR2(4000)	NOT NULL,
	 EVENT_START 	DATE	NOT NULL,
	 EVNET_END 	DATE	NOT NULL,
	 EVENT_NOTI 	VARCHAR2(2)	NOT NULL,
	 MEMBER_ID 	VARCHAR2(500)	NOT NULL,
	 CLASS_NO 	NUMBER	 ,
	 PRODUCT_NO 	NUMBER	 ,
	 
	 CONSTRAINT EVENT_NOTI_CK CHECK (EVENT_NOTI IN('Y','N')),
	 CONSTRAINT EVENT_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE,
	 CONSTRAINT EVENT_CLASS_NO_FK FOREIGN KEY (CLASS_NO) REFERENCES CLASS (CLASS_NO) ON DELETE CASCADE,
	 CONSTRAINT EVENT_PRODUCT_NO_FK FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO) ON DELETE CASCADE
); 


CREATE TABLE  REVIEW  (
	 REVIEW_NO 	NUMBER	PRIMARY KEY,
	 REVIEW_TITLE 	VARCHAR2(1000)	NOT NULL,
	 REVIEW_RATE 	NUMBER	NOT NULL,
	 REVIEW_DATE 	DATE 	NOT NULL,
	 REVIEW_CONTENT 	VARCHAR2(4000)	NOT NULL,
	 PRODUCT_NO 	NUMBER	,
	 CLASS_NO 	NUMBER	,
	 MEMBER_ID 	VARCHAR2(500)	NOT NULL,
	 
	 CONSTRAINT REVIEW_PRODUCT_NO_FK FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO) ON DELETE CASCADE,
	 CONSTRAINT REVIEW_CLASS_NO_FK FOREIGN KEY (CLASS_NO) REFERENCES CLASS (CLASS_NO) ON DELETE CASCADE,
	 CONSTRAINT REVIEW_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);



CREATE TABLE  CHATTING (
	 CHATTING_NO 	NUMBER	PRIMARY KEY,
	 CHATTING_CONTENT 	VARCHAR2(2000)	,
	 CHATTING_DATE 	DATE	,
	 ROOM_NO 	NUMBER	NOT NULL,
	 MEMBER_ID  VARCHAR2(500) NOT NULL,
	 CONSTRAINT CHATTING_ROOM_NO_FK FOREIGN KEY (ROOM_NO) REFERENCES ROOM (ROOM_NO) ON DELETE CASCADE,
	 CONSTRAINT CHATTING_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);


CREATE TABLE  ROOM  (
	 ROOM_NO 	NUMBER	PRIMARY KEY,
	 MEMBER_ID 	VARCHAR2(500)	NOT NULL,
	 CONSULT_ID 	VARCHAR2(500)	NOT NULL,
	 ROOM_CONTENT 	VARCHAR2(500)	,
	 ROOM_DATE 	DATE	,
	 CONSTRAINT ROOM_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID) ON DELETE CASCADE
);



CREATE TABLE  DETAIL  (
	 DETAIL_NO 	NUMBER	NOT NULL PRIMARY KEY,
	 DETAIL_DATE 	DATE	NOT NULL,
	 DETAIL_MEMBER_NUM 	NUMBER	NOT NULL,
	 CLASS_NO 	NUMBER	NOT NULL,
	 
	 CONSTRAINT DETAIL_CLASS_NO_FK FOREIGN KEY (CLASS_NO) REFERENCES CLASS (CLASS_NO) ON DELETE CASCADE
);
