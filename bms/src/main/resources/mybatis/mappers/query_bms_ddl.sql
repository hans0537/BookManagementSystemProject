DROP TABLE T_GOODS_DETAIL_IMAGE;
DROP TABLE T_SHOPPING_ORDER;
DROP TABLE T_SHOPPING_GOODS;
DROP TABLE T_SHOPPING_MEMBER;

DROP SEQUENCE ORDER_SEQ_NUM;
DROP SEQUENCE SEQ_GOODS_ID;
DROP SEQUENCE SEQ_IMAGE_ID;


CREATE SEQUENCE ORDER_SEQ_NUM
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 5000
    MINVALUE 1
    NOCYCLE 
    CACHE 20; 


CREATE SEQUENCE SEQ_GOODS_ID
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 5000
    MINVALUE 1
    NOCYCLE 
    CACHE 20; 
    
    
CREATE SEQUENCE SEQ_IMAGE_ID
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 5000
    MINVALUE 1
    NOCYCLE 
    CACHE 20; 


CREATE TABLE T_SHOPPING_MEMBER(
    MEMBER_ID 			VARCHAR2(20),
    MEMBER_PW 			VARCHAR2(1000),
	MEMBER_NAME 		VARCHAR2(50),
	MEMBER_GENDER 		VARCHAR2(10),
	MEMBER_BIRTH_Y 		VARCHAR2(20),
	MEMBER_BIRTH_M 		VARCHAR2(20),
	MEMBER_BIRTH_D 		VARCHAR2(20),
	MEMBER_BIRTH_GN 	VARCHAR2(20),
	TEL1 				VARCHAR2(20),
    TEL2 				VARCHAR2(20),
	TEL3 				VARCHAR2(20),
	HP1 				VARCHAR2(20),
	HP2 				VARCHAR2(20),
	HP3 				VARCHAR2(20),
	SMSSTS_YN 			VARCHAR2(20),
	EMAIL1 				VARCHAR2(20),
	EMAIL2 				VARCHAR2(20),
	EMAILSTS_YN 		VARCHAR2(20),
	ZIPCODE 			VARCHAR2(20),
	ROADADDRESS 		VARCHAR2(500),
	JIBUNADDRESS 		VARCHAR2(500),
	NAMUJIADDRESS 		VARCHAR2(500),
	JOIN_DATE 			DATE,
	DEL_YN 				VARCHAR2(20),
    CONSTRAINT MEMBER_PK_MEMBER_ID PRIMARY KEY (MEMBER_ID)
);

CREATE TABLE T_SHOPPING_GOODS(
    GOODS_ID 				NUMBER(20),
    GOODS_TITLE 			VARCHAR2(50),
    GOODS_WRITER 			VARCHAR2(50),
	GOODS_PRICE 			NUMBER(10),
	GOODS_PUBLISHER 		VARCHAR2(50),
	GOODS_SORT 				VARCHAR2(50),
	GOODS_SALES_PRICE 		NUMBER(10),
	GOODS_POINT 			NUMBER(10),
	GOODS_PUBLISHED_DATE 	DATE,
	GOODS_TOTAL_PAGE 		NUMBER(5),
	GOODS_ISBN 				VARCHAR2(20),
	GOODS_DELIVERY_PRICE 	VARCHAR2(5),
	GOODS_DELIVERY_DATE 	DATE,
	GOODS_STATUS 			VARCHAR2(50),
	GOODS_WRITER_INTRO 		CLOB,
	GOODS_CONTENTS_ORDER 	CLOB,
	GOODS_INTRO 			CLOB,
	GOODS_PUBLISHER_COMMENT CLOB,
	GOODS_RECOMMENDATION 	CLOB,
	GOODS_CREDATE 			DATE,
	GOODS_DELYN 			VARCHAR2(20),
	GOODS_CNT				NUMBER(5),
	GOODS_LIKE				NUMBER(5),
    CONSTRAINT GOODS_PK_GOODS_ID PRIMARY KEY (GOODS_ID)
);


CREATE TABLE T_GOODS_DETAIL_IMAGE(
    IMAGE_ID	NUMBER(20),
    GOODS_ID 	NUMBER(20),
	FILE_NAME 	VARCHAR2(50),
    FILE_TYPE 	VARCHAR2(40),
    CONSTRAINT IMAGE_PK_IMAGE_ID PRIMARY KEY (IMAGE_ID),
    CONSTRAINT IMAGE_FK_GOODS_ID FOREIGN KEY (GOODS_ID)
    REFERENCES T_SHOPPING_GOODS (GOODS_ID)
);


CREATE TABLE T_SHOPPING_ORDER(
    ORDER_SEQ_NUM 		NUMBER(20),
	ORDER_ID 			NUMBER(20),
    MEMBER_ID 			VARCHAR2(50),
    GOODS_ID 			NUMBER(20),
    ORDERER_NAME 		VARCHAR2(50),
	GOODS_TITLE 		VARCHAR2(100),
	ORDER_GOODS_QTY 	NUMBER(5),
    GOODS_SALES_PRICE 	NUMBER(5),
    GOODS_FIILE_NAME    VARCHAR2(60),
	RECEIVER_NAME 		VARCHAR2(50),
	RECEIVER_HP1 		VARCHAR2(20),
	RECEIVER_HP2 		VARCHAR2(20),
	RECEIVER_HP3 		VARCHAR2(20),
	RECEIVER_TEL1 		VARCHAR2(20),
	RECEIVER_TEL2 		VARCHAR2(20),
	RECEIVER_TEL3 		VARCHAR2(20),
	DELIVERY_ADDRESS 	VARCHAR2(500),
    DELIVERY_METHOD 	VARCHAR2(40),
    DELIVERY_MESSAGE 	VARCHAR2(300),
	GIFT_WRAPPING 		VARCHAR2(20),
	PAY_METHOD 			VARCHAR2(200),
	CARD_COM_NAME 		VARCHAR2(50),
	CARD_PAY_MONTH 		VARCHAR2(20),
	PAY_ORDERER_HP_NUM 	VARCHAR2(50), 
    ORDERER_HP 			VARCHAR2(50),
    DELIVERY_STATE 		VARCHAR2(100),
    PAY_ORDER_TIME 		DATE,
    CONSTRAINT ORDER_PK_ORDER_ID PRIMARY KEY (ORDER_ID),
    CONSTRAINT ORDER_FK_MEMBER_ID FOREIGN KEY (MEMBER_ID)
    REFERENCES T_SHOPPING_MEMBER (MEMBER_ID),
    CONSTRAINT ORDER_FK_GOODS_ID FOREIGN KEY (GOODS_ID)
    REFERENCES T_SHOPPING_GOODS (GOODS_ID)
);

CREATE TABLE T_MEMBER_COMMENT(
	COMMENT_ID			NUMBER(20),
	MEMBER_ID 			VARCHAR2(50),
    GOODS_ID 			NUMBER(20),
	GOODS_COMMENT		CLOB,
	GOODS_STAR			NUMBER(5),
	CONSTRAINT COMMENT_PK_COMMENT_ID PRIMARY KEY (COMMENT_ID),
    CONSTRAINT COMMENT_FK_MEMBER_ID FOREIGN KEY (MEMBER_ID)
    REFERENCES T_SHOPPING_MEMBER (MEMBER_ID),
    CONSTRAINT COMMENT_FK_GOODS_ID FOREIGN KEY (GOODS_ID)
    REFERENCES T_SHOPPING_GOODS (GOODS_ID)
);

CREATE TABLE T_GOODS_LIKE(
	LIKE_ID				NUMBER(20),
	MEMBER_ID 			VARCHAR2(50),
    GOODS_ID 			NUMBER(20),
	GOODS_LIKE_YN		VARCHAR2(50),
	CONSTRAINT LIKE_PK_LIKE_ID PRIMARY KEY (LIKE_ID),
    CONSTRAINT LIKE_PK_MEMBER_ID FOREIGN KEY (MEMBER_ID)
    REFERENCES T_SHOPPING_MEMBER (MEMBER_ID),
    CONSTRAINT LIKE_PK_GOODS_ID FOREIGN KEY (GOODS_ID)
    REFERENCES T_SHOPPING_GOODS (GOODS_ID)
);
