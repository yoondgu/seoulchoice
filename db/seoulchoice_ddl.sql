--------------------------------------------------------
--  파일이 생성됨 - 수요일-8월-31-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ACCO_COMMON_FACILITIES
--------------------------------------------------------

  CREATE TABLE "ACCO_COMMON_FACILITIES" 
   (	"ACCO_ID" NUMBER(6,0), 
	"CO_FACILITY_ID" CHAR(8)
   ) 

   COMMENT ON COLUMN "ACCO_COMMON_FACILITIES"."CO_FACILITY_ID" IS 'COFA_001'
--------------------------------------------------------
--  DDL for Table ACCO_DETAIL_IMAGES
--------------------------------------------------------

  CREATE TABLE "ACCO_DETAIL_IMAGES" 
   (	"ACCO_ID" NUMBER(6,0), 
	"IMAGE_FILE_NAME" VARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table ACCO_ROOM_DETAIL_IMAGES
--------------------------------------------------------

  CREATE TABLE "ACCO_ROOM_DETAIL_IMAGES" 
   (	"ROOM_NO" NUMBER(6,0), 
	"ROOM_IMAGE_FILE_NAME" VARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table ACCO_ROOM_FACILITIES
--------------------------------------------------------

  CREATE TABLE "ACCO_ROOM_FACILITIES" 
   (	"ROOM_NO" NUMBER(6,0), 
	"RO_FACILITY_ID" CHAR(8)
   ) 

   COMMENT ON COLUMN "ACCO_ROOM_FACILITIES"."RO_FACILITY_ID" IS 'ROFA_001'
--------------------------------------------------------
--  DDL for Table ACCO_ROOMS
--------------------------------------------------------

  CREATE TABLE "ACCO_ROOMS" 
   (	"ROOM_NO" NUMBER(6,0), 
	"ROOM_NAME" VARCHAR2(255), 
	"ROOM_NUMBERS" NUMBER(5,0), 
	"ROOM_CAPACITY" NUMBER(2,0), 
	"ROOM_DAY_PRICE" NUMBER(10,0), 
	"ROOM_DESCRIPTION" VARCHAR2(4000), 
	"ACCO_ID" NUMBER(6,0), 
	"ROOM_THUMBNAIL_IMAGE" VARCHAR2(255)
   )
--------------------------------------------------------
--  DDL for Table ACCO_TAGS
--------------------------------------------------------

  CREATE TABLE "ACCO_TAGS" 
   (	"ACCO_ID" NUMBER(6,0), 
	"ACCO_TAG" VARCHAR2(30)
   )
--------------------------------------------------------
--  DDL for Table ACCO_TYPE_COFA
--------------------------------------------------------

  CREATE TABLE "ACCO_TYPE_COFA" 
   (	"ACCO_TYPE_ID" CHAR(8), 
	"CO_FACILITY_ID" CHAR(8)
   )
--------------------------------------------------------
--  DDL for Table ACCO_TYPES
--------------------------------------------------------

  CREATE TABLE "ACCO_TYPES" 
   (	"ACCO_ID" NUMBER(6,0), 
	"ACCO_TYPE_ID" CHAR(8)
   ) 

   COMMENT ON COLUMN "ACCO_TYPES"."ACCO_TYPE_ID" IS 'TYPE_001 형식으로 INSERT 예정'
--------------------------------------------------------
--  DDL for Table ACCOMMODATION_TYPES
--------------------------------------------------------

  CREATE TABLE "ACCOMMODATION_TYPES" 
   (	"ACCO_TYPE_ID" CHAR(8), 
	"ACCO_TYPE_NAME" VARCHAR2(30)
   ) 

   COMMENT ON COLUMN "ACCOMMODATION_TYPES"."ACCO_TYPE_ID" IS 'TYPE_001 형식으로 INSERT 예정'
--------------------------------------------------------
--  DDL for Table ACCOMMODATIONS
--------------------------------------------------------

  CREATE TABLE "ACCOMMODATIONS" 
   (	"ACCO_ID" NUMBER(6,0), 
	"ACCO_NAME" VARCHAR2(100), 
	"ACCO_DISTRICT" VARCHAR2(100), 
	"ACCO_ADDRESS" VARCHAR2(255), 
	"ACCO_LATITUDE" VARCHAR2(50), 
	"ACCO_LONGITUDE" VARCHAR2(50), 
	"ACCO_THUMBNAIL_IMAGE" VARCHAR2(255), 
	"ACCO_REVIEW_RATE" NUMBER(2,1) DEFAULT 0, 
	"ACCO_REVIEW_COUNT" NUMBER(5,0) DEFAULT 0, 
	"ACCO_LIKE_COUNT" NUMBER(5,0) DEFAULT 0, 
	"ACCO_CREATED_DATE" DATE DEFAULT SYSDATE, 
	"ACCO_UPDATED_DATE" DATE, 
	"ACCO_DELETED" CHAR(1) DEFAULT 'N', 
	"CITY_ID" CHAR(8), 
	"ACCO_INTRODUCE_COMMENT" CLOB, 
	"ACCO_DETAIL_DESCRIPTION" CLOB
   ) 

   COMMENT ON COLUMN "ACCOMMODATIONS"."CITY_ID" IS 'CITY_001 형식으로 INSERT 예정'
--------------------------------------------------------
--  DDL for Table CITIES
--------------------------------------------------------

  CREATE TABLE "CITIES" 
   (	"CITY_ID" CHAR(8), 
	"CITY_NAME" VARCHAR2(100), 
	"CITY_LATITUDE" VARCHAR2(50), 
	"CITY_LONGITUDE" VARCHAR2(50)
   ) 

   COMMENT ON COLUMN "CITIES"."CITY_ID" IS 'CITY_001 형식으로 INSERT 예정'
--------------------------------------------------------
--  DDL for Table COMMON_FACILITIES
--------------------------------------------------------

  CREATE TABLE "COMMON_FACILITIES" 
   (	"CO_FACILITY_ID" CHAR(8), 
	"CO_FACILITY_NAME" VARCHAR2(30), 
	"CO_FACILITY_ICON_NAME" VARCHAR2(255) DEFAULT 'ic_facility_common_default.png'
   ) 

   COMMENT ON COLUMN "COMMON_FACILITIES"."CO_FACILITY_ID" IS 'COFA_001'
--------------------------------------------------------
--  DDL for Table PAYMENT
--------------------------------------------------------

  CREATE TABLE "PAYMENT" 
   (	"PAYMENT_ID" VARCHAR2(100), 
	"PAYMENT_STATUS" VARCHAR2(255) DEFAULT '예약완료', 
	"PAYMENT_TOTAL_PRICE" NUMBER(8,0), 
	"RESERVATION_ID" VARCHAR2(20)
   )
--------------------------------------------------------
--  DDL for Table QA
--------------------------------------------------------

  CREATE TABLE "QA" 
   (	"QA_NO" NUMBER, 
	"USER_NO" NUMBER(6,0), 
	"QA_CONTENT" VARCHAR2(2000), 
	"QA_TITLE" VARCHAR2(255), 
	"QA_CREATED_DATE" DATE DEFAULT SYSDATE, 
	"QA_IMAGE" VARCHAR2(100), 
	"QA_ANSWER_STATUS" CHAR(1) DEFAULT 'N'
   ) 

   COMMENT ON COLUMN "QA"."QA_NO" IS 'QA 번호입니다'
--------------------------------------------------------
--  DDL for Table RESERVATION
--------------------------------------------------------

  CREATE TABLE "RESERVATION" 
   (	"RESERVATION_ID" NVARCHAR2(100), 
	"RESERVATION_CHECK_IN" DATE, 
	"RESERVATION_CHECK_OUT" DATE, 
	"USER_NO" NUMBER(6,0), 
	"ROOM_NO" NUMBER(6,0), 
	"ACCO_ID" NUMBER(6,0), 
	"RESERVATION_NAME" VARCHAR2(20), 
	"RESERVATION_TEL" VARCHAR2(20)
   )
--------------------------------------------------------
--  DDL for Table RESTAURANT
--------------------------------------------------------

  CREATE TABLE "RESTAURANT" 
   (	"RESTAURANT_NO" NUMBER(6,0), 
	"RESTAURANT_NAME" VARCHAR2(100), 
	"RESTAURANT_LOCATION" VARCHAR2(255), 
	"RESTAURANT_IMGNAME" VARCHAR2(100), 
	"RESTAURANT_TEL" VARCHAR2(20), 
	"RESTAURANT_LIKE_COUNT" NUMBER(6,0) DEFAULT 0, 
	"RESTAURANT_REVIEW_COUNT" NUMBER(6,0) DEFAULT 0, 
	"RESTAURANT_REVIEW_POINT" NUMBER(2,1) DEFAULT 0, 
	"RESTAURANT_CREATED_DATE" DATE DEFAULT SYSDATE, 
	"RESTAURANT_UPDATE_DATE" DATE, 
	"RESTAURANT_LATITUD" VARCHAR2(50), 
	"RESTAURANT_LONGITUDE" VARCHAR2(50), 
	"RESTAURANT_DELETE" CHAR(1) DEFAULT 'N', 
	"CITY_ID" CHAR(8), 
	"RESTAURANT_OPENING" VARCHAR2(100), 
	"RESTAURANT_BREAK_TIME" VARCHAR2(100), 
	"RESTAURANT_CLOSE" VARCHAR2(100), 
	"RESTAURANT_DISTRICT" VARCHAR2(100)
   ) 

   COMMENT ON COLUMN "RESTAURANT"."RESTAURANT_NO" IS '음식점 고유번호'
   COMMENT ON COLUMN "RESTAURANT"."RESTAURANT_LOCATION" IS '음식점 위치 입니다'
   COMMENT ON COLUMN "RESTAURANT"."RESTAURANT_IMGNAME" IS '음식점 사진 이름 입니다'
   COMMENT ON COLUMN "RESTAURANT"."CITY_ID" IS 'CITY_001 형식으로 INSERT 예정'
--------------------------------------------------------
--  DDL for Table RESTAURANT_CAT
--------------------------------------------------------

  CREATE TABLE "RESTAURANT_CAT" 
   (	"RESTAURANT_NO" NUMBER(6,0), 
	"RESTAURANT_CAT_ID" VARCHAR2(100)
   ) 

   COMMENT ON COLUMN "RESTAURANT_CAT"."RESTAURANT_NO" IS '음식점 고유번호'
--------------------------------------------------------
--  DDL for Table RESTAURANT_CAT_NAME
--------------------------------------------------------

  CREATE TABLE "RESTAURANT_CAT_NAME" 
   (	"RESTAURANT_CAT_ID" VARCHAR2(100), 
	"RESTAURANT_CAT_NAME" VARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table RESTAURANT_MENU
--------------------------------------------------------

  CREATE TABLE "RESTAURANT_MENU" 
   (	"RESTAURANT_NO" NUMBER(6,0), 
	"RESTAURANT_MENU_NAME" VARCHAR2(100), 
	"RESTAURANT_PRICE" NUMBER(6,0)
   ) 

   COMMENT ON COLUMN "RESTAURANT_MENU"."RESTAURANT_NO" IS '음식점 고유번호'
--------------------------------------------------------
--  DDL for Table RESTAURANT_TAG
--------------------------------------------------------

  CREATE TABLE "RESTAURANT_TAG" 
   (	"RESTAURANT_NO" NUMBER(6,0), 
	"RESTAURANT_TAG" VARCHAR2(100)
   ) 

   COMMENT ON COLUMN "RESTAURANT_TAG"."RESTAURANT_NO" IS '음식점 고유번호'
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "REVIEW" 
   (	"REVIEW_NO" NUMBER, 
	"USER_NO" NUMBER(6,0), 
	"RESTAURANT_NO" NUMBER(6,0), 
	"ACCO_ID" NUMBER(6,0), 
	"REVIEW_TITLE" VARCHAR2(255), 
	"REVIEW_CONTENT" VARCHAR2(2000), 
	"REVIEW_LIKE_COUNT" NUMBER(6,0) DEFAULT 0, 
	"REVIEW_CREATED_DATE" DATE DEFAULT SYSDATE, 
	"REVIEW_UPDATED_DATE" DATE DEFAULT SYSDATE, 
	"REVIEW_DELETED" CHAR(1) DEFAULT 'N', 
	"REVIEW_IMAGE" VARCHAR2(100), 
	"REVIEW_POINT" NUMBER(6,0), 
	"ROOM_NO" NUMBER(6,0)
   ) 

   COMMENT ON COLUMN "REVIEW"."RESTAURANT_NO" IS '음식점 고유번호'
--------------------------------------------------------
--  DDL for Table REVIEW_ACCO_TAG
--------------------------------------------------------

  CREATE TABLE "REVIEW_ACCO_TAG" 
   (	"REVIEW_NO" NUMBER, 
	"REVIEW_ACCO_TAG" VARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table REVIEW_RESTAURANT_TAG
--------------------------------------------------------

  CREATE TABLE "REVIEW_RESTAURANT_TAG" 
   (	"REVIEW_NO" NUMBER, 
	"REVIEW_TAG" VARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table ROOM_FACILITIES
--------------------------------------------------------

  CREATE TABLE "ROOM_FACILITIES" 
   (	"RO_FACILITY_ID" CHAR(8), 
	"RO_FACILITY_NAME" VARCHAR2(30), 
	"RO_FACILITY_ICON_NAME" VARCHAR2(255) DEFAULT 'ic_facility_room_default.png'
   ) 

   COMMENT ON COLUMN "ROOM_FACILITIES"."RO_FACILITY_ID" IS 'ROFA_001'
--------------------------------------------------------
--  DDL for Table USER_ACCOMMODATION_LIKES
--------------------------------------------------------

  CREATE TABLE "USER_ACCOMMODATION_LIKES" 
   (	"USER_NO" NUMBER(6,0), 
	"ACCO_ID" NUMBER(6,0)
   )
--------------------------------------------------------
--  DDL for Table USER_CATEGORIES
--------------------------------------------------------

  CREATE TABLE "USER_CATEGORIES" 
   (	"CATEGORY_ID" CHAR(7), 
	"CATEGORY_NAME" VARCHAR2(100)
   )
--------------------------------------------------------
--  DDL for Table USER_RESTAURANT_LIKES
--------------------------------------------------------

  CREATE TABLE "USER_RESTAURANT_LIKES" 
   (	"USER_NO" NUMBER(6,0), 
	"RESTAURANT_NO" NUMBER(6,0)
   ) 

   COMMENT ON COLUMN "USER_RESTAURANT_LIKES"."RESTAURANT_NO" IS '음식점 고유번호'
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "USERS" 
   (	"USER_NO" NUMBER(6,0), 
	"USER_ID" VARCHAR2(100), 
	"USER_PASSWORD" VARCHAR2(20), 
	"USER_NICKNAME" VARCHAR2(100) DEFAULT '기본닉네임', 
	"USER_NAME" VARCHAR2(100), 
	"USER_EMAIL" VARCHAR2(255), 
	"USER_TEL" VARCHAR2(20), 
	"USER_ADDRESS" VARCHAR2(255), 
	"USER_AUTHORITY" CHAR(1) DEFAULT 'U', 
	"USER_LOGIN_TYPE" VARCHAR2(8), 
	"USER_DISABLED" CHAR(1) DEFAULT 'N', 
	"USER_UPDATED_DATE" DATE, 
	"USER_CREATED_DATE" DATE DEFAULT SYSDATE
   )
--------------------------------------------------------
--  DDL for Index PK_ACCO_ROOMS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ACCO_ROOMS" ON "ACCO_ROOMS" ("ROOM_NO")
--------------------------------------------------------
--  DDL for Index PK_ACCOMMODATION_TYPES
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ACCOMMODATION_TYPES" ON "ACCOMMODATION_TYPES" ("ACCO_TYPE_ID")
--------------------------------------------------------
--  DDL for Index PK_ACCOMMODATIONS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ACCOMMODATIONS" ON "ACCOMMODATIONS" ("ACCO_ID")
--------------------------------------------------------
--  DDL for Index PK_CITIES
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CITIES" ON "CITIES" ("CITY_ID")
--------------------------------------------------------
--  DDL for Index PK_COMMON_FACILITIES
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_COMMON_FACILITIES" ON "COMMON_FACILITIES" ("CO_FACILITY_ID")
--------------------------------------------------------
--  DDL for Index PK_PAYMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PAYMENT" ON "PAYMENT" ("PAYMENT_ID")
--------------------------------------------------------
--  DDL for Index PK_QA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_QA" ON "QA" ("QA_NO")
--------------------------------------------------------
--  DDL for Index PK_RESERVATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_RESERVATION" ON "RESERVATION" ("RESERVATION_ID")
--------------------------------------------------------
--  DDL for Index PK_RESTAURANT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_RESTAURANT" ON "RESTAURANT" ("RESTAURANT_NO")
--------------------------------------------------------
--  DDL for Index SYS_C008920
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C008920" ON "RESTAURANT_CAT_NAME" ("RESTAURANT_CAT_ID")
--------------------------------------------------------
--  DDL for Index PK_REVIEW
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_REVIEW" ON "REVIEW" ("REVIEW_NO")
--------------------------------------------------------
--  DDL for Index PK_ROOM_FACILITIES
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ROOM_FACILITIES" ON "ROOM_FACILITIES" ("RO_FACILITY_ID")
--------------------------------------------------------
--  DDL for Index PK_USERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_USERS" ON "USERS" ("USER_NO")
--------------------------------------------------------
--  Constraints for Table ACCO_COMMON_FACILITIES
--------------------------------------------------------

  ALTER TABLE "ACCO_COMMON_FACILITIES" MODIFY ("ACCO_ID" NOT NULL ENABLE)
  ALTER TABLE "ACCO_COMMON_FACILITIES" MODIFY ("CO_FACILITY_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ACCO_DETAIL_IMAGES
--------------------------------------------------------

  ALTER TABLE "ACCO_DETAIL_IMAGES" MODIFY ("IMAGE_FILE_NAME" NOT NULL ENABLE)
  ALTER TABLE "ACCO_DETAIL_IMAGES" MODIFY ("ACCO_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ACCO_ROOM_DETAIL_IMAGES
--------------------------------------------------------

  ALTER TABLE "ACCO_ROOM_DETAIL_IMAGES" MODIFY ("ROOM_NO" NOT NULL ENABLE)
  ALTER TABLE "ACCO_ROOM_DETAIL_IMAGES" MODIFY ("ROOM_IMAGE_FILE_NAME" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ACCO_ROOM_FACILITIES
--------------------------------------------------------

  ALTER TABLE "ACCO_ROOM_FACILITIES" MODIFY ("ROOM_NO" NOT NULL ENABLE)
  ALTER TABLE "ACCO_ROOM_FACILITIES" MODIFY ("RO_FACILITY_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ACCO_ROOMS
--------------------------------------------------------

  ALTER TABLE "ACCO_ROOMS" MODIFY ("ROOM_NO" NOT NULL ENABLE)
  ALTER TABLE "ACCO_ROOMS" MODIFY ("ROOM_NAME" NOT NULL ENABLE)
  ALTER TABLE "ACCO_ROOMS" MODIFY ("ROOM_NUMBERS" NOT NULL ENABLE)
  ALTER TABLE "ACCO_ROOMS" MODIFY ("ROOM_CAPACITY" NOT NULL ENABLE)
  ALTER TABLE "ACCO_ROOMS" MODIFY ("ROOM_DAY_PRICE" NOT NULL ENABLE)
  ALTER TABLE "ACCO_ROOMS" MODIFY ("ACCO_ID" NOT NULL ENABLE)
  ALTER TABLE "ACCO_ROOMS" ADD CONSTRAINT "PK_ACCO_ROOMS" PRIMARY KEY ("ROOM_NO")
  USING INDEX  ENABLE
  ALTER TABLE "ACCO_ROOMS" MODIFY ("ROOM_THUMBNAIL_IMAGE" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ACCO_TAGS
--------------------------------------------------------

  ALTER TABLE "ACCO_TAGS" MODIFY ("ACCO_ID" NOT NULL ENABLE)
  ALTER TABLE "ACCO_TAGS" MODIFY ("ACCO_TAG" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ACCO_TYPE_COFA
--------------------------------------------------------

  ALTER TABLE "ACCO_TYPE_COFA" MODIFY ("ACCO_TYPE_ID" NOT NULL ENABLE)
  ALTER TABLE "ACCO_TYPE_COFA" MODIFY ("CO_FACILITY_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ACCO_TYPES
--------------------------------------------------------

  ALTER TABLE "ACCO_TYPES" MODIFY ("ACCO_ID" NOT NULL ENABLE)
  ALTER TABLE "ACCO_TYPES" MODIFY ("ACCO_TYPE_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ACCOMMODATION_TYPES
--------------------------------------------------------

  ALTER TABLE "ACCOMMODATION_TYPES" MODIFY ("ACCO_TYPE_ID" NOT NULL ENABLE)
  ALTER TABLE "ACCOMMODATION_TYPES" MODIFY ("ACCO_TYPE_NAME" NOT NULL ENABLE)
  ALTER TABLE "ACCOMMODATION_TYPES" ADD CONSTRAINT "PK_ACCOMMODATION_TYPES" PRIMARY KEY ("ACCO_TYPE_ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table ACCOMMODATIONS
--------------------------------------------------------

  ALTER TABLE "ACCOMMODATIONS" MODIFY ("ACCO_ID" NOT NULL ENABLE)
  ALTER TABLE "ACCOMMODATIONS" MODIFY ("ACCO_NAME" NOT NULL ENABLE)
  ALTER TABLE "ACCOMMODATIONS" MODIFY ("ACCO_DISTRICT" NOT NULL ENABLE)
  ALTER TABLE "ACCOMMODATIONS" MODIFY ("ACCO_ADDRESS" NOT NULL ENABLE)
  ALTER TABLE "ACCOMMODATIONS" MODIFY ("ACCO_LATITUDE" NOT NULL ENABLE)
  ALTER TABLE "ACCOMMODATIONS" MODIFY ("ACCO_LONGITUDE" NOT NULL ENABLE)
  ALTER TABLE "ACCOMMODATIONS" MODIFY ("ACCO_THUMBNAIL_IMAGE" NOT NULL ENABLE)
  ALTER TABLE "ACCOMMODATIONS" MODIFY ("CITY_ID" NOT NULL ENABLE)
  ALTER TABLE "ACCOMMODATIONS" ADD CONSTRAINT "PK_ACCOMMODATIONS" PRIMARY KEY ("ACCO_ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table CITIES
--------------------------------------------------------

  ALTER TABLE "CITIES" MODIFY ("CITY_ID" NOT NULL ENABLE)
  ALTER TABLE "CITIES" MODIFY ("CITY_NAME" NOT NULL ENABLE)
  ALTER TABLE "CITIES" ADD CONSTRAINT "PK_CITIES" PRIMARY KEY ("CITY_ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table COMMON_FACILITIES
--------------------------------------------------------

  ALTER TABLE "COMMON_FACILITIES" MODIFY ("CO_FACILITY_ID" NOT NULL ENABLE)
  ALTER TABLE "COMMON_FACILITIES" MODIFY ("CO_FACILITY_NAME" NOT NULL ENABLE)
  ALTER TABLE "COMMON_FACILITIES" ADD CONSTRAINT "PK_COMMON_FACILITIES" PRIMARY KEY ("CO_FACILITY_ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table PAYMENT
--------------------------------------------------------

  ALTER TABLE "PAYMENT" MODIFY ("PAYMENT_ID" NOT NULL ENABLE)
  ALTER TABLE "PAYMENT" MODIFY ("PAYMENT_TOTAL_PRICE" NOT NULL ENABLE)
  ALTER TABLE "PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY ("PAYMENT_ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table QA
--------------------------------------------------------

  ALTER TABLE "QA" MODIFY ("QA_NO" NOT NULL ENABLE)
  ALTER TABLE "QA" MODIFY ("USER_NO" NOT NULL ENABLE)
  ALTER TABLE "QA" MODIFY ("QA_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "QA" MODIFY ("QA_TITLE" NOT NULL ENABLE)
  ALTER TABLE "QA" ADD CONSTRAINT "PK_QA" PRIMARY KEY ("QA_NO")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table RESERVATION
--------------------------------------------------------

  ALTER TABLE "RESERVATION" MODIFY ("RESERVATION_ID" NOT NULL ENABLE)
  ALTER TABLE "RESERVATION" MODIFY ("RESERVATION_CHECK_IN" NOT NULL ENABLE)
  ALTER TABLE "RESERVATION" MODIFY ("RESERVATION_CHECK_OUT" NOT NULL ENABLE)
  ALTER TABLE "RESERVATION" MODIFY ("USER_NO" NOT NULL ENABLE)
  ALTER TABLE "RESERVATION" MODIFY ("ROOM_NO" NOT NULL ENABLE)
  ALTER TABLE "RESERVATION" MODIFY ("ACCO_ID" NOT NULL ENABLE)
  ALTER TABLE "RESERVATION" ADD CONSTRAINT "PK_RESERVATION" PRIMARY KEY ("RESERVATION_ID")
  USING INDEX  ENABLE
  ALTER TABLE "RESERVATION" MODIFY ("RESERVATION_NAME" NOT NULL ENABLE)
  ALTER TABLE "RESERVATION" MODIFY ("RESERVATION_TEL" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table RESTAURANT
--------------------------------------------------------

  ALTER TABLE "RESTAURANT" MODIFY ("RESTAURANT_NO" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" MODIFY ("RESTAURANT_NAME" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" MODIFY ("RESTAURANT_LOCATION" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" MODIFY ("RESTAURANT_IMGNAME" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" MODIFY ("RESTAURANT_TEL" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" MODIFY ("RESTAURANT_CREATED_DATE" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" MODIFY ("RESTAURANT_LATITUD" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" MODIFY ("RESTAURANT_LONGITUDE" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" MODIFY ("RESTAURANT_DELETE" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" MODIFY ("CITY_ID" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" MODIFY ("RESTAURANT_OPENING" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT" ADD CONSTRAINT "PK_RESTAURANT" PRIMARY KEY ("RESTAURANT_NO")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table RESTAURANT_CAT
--------------------------------------------------------

  ALTER TABLE "RESTAURANT_CAT" MODIFY ("RESTAURANT_NO" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT_CAT" MODIFY ("RESTAURANT_CAT_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table RESTAURANT_CAT_NAME
--------------------------------------------------------

  ALTER TABLE "RESTAURANT_CAT_NAME" MODIFY ("RESTAURANT_CAT_NAME" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT_CAT_NAME" ADD PRIMARY KEY ("RESTAURANT_CAT_ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table RESTAURANT_MENU
--------------------------------------------------------

  ALTER TABLE "RESTAURANT_MENU" MODIFY ("RESTAURANT_NO" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT_MENU" MODIFY ("RESTAURANT_MENU_NAME" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT_MENU" MODIFY ("RESTAURANT_PRICE" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table RESTAURANT_TAG
--------------------------------------------------------

  ALTER TABLE "RESTAURANT_TAG" MODIFY ("RESTAURANT_NO" NOT NULL ENABLE)
  ALTER TABLE "RESTAURANT_TAG" MODIFY ("RESTAURANT_TAG" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "REVIEW" MODIFY ("REVIEW_NO" NOT NULL ENABLE)
  ALTER TABLE "REVIEW" MODIFY ("USER_NO" NOT NULL ENABLE)
  ALTER TABLE "REVIEW" MODIFY ("REVIEW_CONTENT" NOT NULL ENABLE)
  ALTER TABLE "REVIEW" MODIFY ("REVIEW_POINT" NOT NULL ENABLE)
  ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("REVIEW_NO")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table REVIEW_ACCO_TAG
--------------------------------------------------------

  ALTER TABLE "REVIEW_ACCO_TAG" MODIFY ("REVIEW_NO" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table REVIEW_RESTAURANT_TAG
--------------------------------------------------------

  ALTER TABLE "REVIEW_RESTAURANT_TAG" MODIFY ("REVIEW_NO" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ROOM_FACILITIES
--------------------------------------------------------

  ALTER TABLE "ROOM_FACILITIES" MODIFY ("RO_FACILITY_ID" NOT NULL ENABLE)
  ALTER TABLE "ROOM_FACILITIES" MODIFY ("RO_FACILITY_NAME" NOT NULL ENABLE)
  ALTER TABLE "ROOM_FACILITIES" ADD CONSTRAINT "PK_ROOM_FACILITIES" PRIMARY KEY ("RO_FACILITY_ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table USER_ACCOMMODATION_LIKES
--------------------------------------------------------

  ALTER TABLE "USER_ACCOMMODATION_LIKES" MODIFY ("USER_NO" NOT NULL ENABLE)
  ALTER TABLE "USER_ACCOMMODATION_LIKES" MODIFY ("ACCO_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table USER_RESTAURANT_LIKES
--------------------------------------------------------

  ALTER TABLE "USER_RESTAURANT_LIKES" MODIFY ("USER_NO" NOT NULL ENABLE)
  ALTER TABLE "USER_RESTAURANT_LIKES" MODIFY ("RESTAURANT_NO" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "USERS" MODIFY ("USER_NO" NOT NULL ENABLE)
  ALTER TABLE "USERS" ADD CONSTRAINT "PK_USERS" PRIMARY KEY ("USER_NO")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ACCO_COMMON_FACILITIES
--------------------------------------------------------

  ALTER TABLE "ACCO_COMMON_FACILITIES" ADD CONSTRAINT "FK_ACCOMMODATIONS_TO_ACCO_COMMON_FACILITIES_1" FOREIGN KEY ("ACCO_ID")
	  REFERENCES "ACCOMMODATIONS" ("ACCO_ID") ENABLE
  ALTER TABLE "ACCO_COMMON_FACILITIES" ADD CONSTRAINT "FK_COMMON_FACILITIES_TO_ACCO_COMMON_FACILITIES_1" FOREIGN KEY ("CO_FACILITY_ID")
	  REFERENCES "COMMON_FACILITIES" ("CO_FACILITY_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ACCO_DETAIL_IMAGES
--------------------------------------------------------

  ALTER TABLE "ACCO_DETAIL_IMAGES" ADD CONSTRAINT "FK_DETAIL_IMAGES" FOREIGN KEY ("ACCO_ID")
	  REFERENCES "ACCOMMODATIONS" ("ACCO_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ACCO_ROOM_DETAIL_IMAGES
--------------------------------------------------------

  ALTER TABLE "ACCO_ROOM_DETAIL_IMAGES" ADD CONSTRAINT "FK_ROOM_IMAGES" FOREIGN KEY ("ROOM_NO")
	  REFERENCES "ACCO_ROOMS" ("ROOM_NO") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ACCO_ROOM_FACILITIES
--------------------------------------------------------

  ALTER TABLE "ACCO_ROOM_FACILITIES" ADD CONSTRAINT "FK_ACCO_ROOMS_TO_ACCO_ROOM_FACILITIES_1" FOREIGN KEY ("ROOM_NO")
	  REFERENCES "ACCO_ROOMS" ("ROOM_NO") ENABLE
  ALTER TABLE "ACCO_ROOM_FACILITIES" ADD CONSTRAINT "FK_ROOM_FACILITIES_TO_ACCO_ROOM_FACILITIES_1" FOREIGN KEY ("RO_FACILITY_ID")
	  REFERENCES "ROOM_FACILITIES" ("RO_FACILITY_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ACCO_ROOMS
--------------------------------------------------------

  ALTER TABLE "ACCO_ROOMS" ADD CONSTRAINT "FK_ACCOMMODATIONS_TO_ACCO_ROOMS_1" FOREIGN KEY ("ACCO_ID")
	  REFERENCES "ACCOMMODATIONS" ("ACCO_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ACCO_TAGS
--------------------------------------------------------

  ALTER TABLE "ACCO_TAGS" ADD CONSTRAINT "FK_ACCOMMODATIONS_TO_ACCO_TAGS_1" FOREIGN KEY ("ACCO_ID")
	  REFERENCES "ACCOMMODATIONS" ("ACCO_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ACCO_TYPE_COFA
--------------------------------------------------------

  ALTER TABLE "ACCO_TYPE_COFA" ADD FOREIGN KEY ("ACCO_TYPE_ID")
	  REFERENCES "ACCOMMODATION_TYPES" ("ACCO_TYPE_ID") ENABLE
  ALTER TABLE "ACCO_TYPE_COFA" ADD FOREIGN KEY ("CO_FACILITY_ID")
	  REFERENCES "COMMON_FACILITIES" ("CO_FACILITY_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ACCO_TYPES
--------------------------------------------------------

  ALTER TABLE "ACCO_TYPES" ADD CONSTRAINT "FK_ACCOMMODATIONS_TO_ACCO_TYPES_1" FOREIGN KEY ("ACCO_ID")
	  REFERENCES "ACCOMMODATIONS" ("ACCO_ID") ENABLE
  ALTER TABLE "ACCO_TYPES" ADD CONSTRAINT "FK_ACCOMMODATION_TYPES_TO_ACCO_TYPES_1" FOREIGN KEY ("ACCO_TYPE_ID")
	  REFERENCES "ACCOMMODATION_TYPES" ("ACCO_TYPE_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ACCOMMODATIONS
--------------------------------------------------------

  ALTER TABLE "ACCOMMODATIONS" ADD CONSTRAINT "FK_CITIES_TO_ACCOMMODATIONS_1" FOREIGN KEY ("CITY_ID")
	  REFERENCES "CITIES" ("CITY_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table QA
--------------------------------------------------------

  ALTER TABLE "QA" ADD CONSTRAINT "FK_USERS_TO_QA_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "USERS" ("USER_NO") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table RESERVATION
--------------------------------------------------------

  ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_USERS_TO_RESERVATION_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "USERS" ("USER_NO") ENABLE
  ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_ACCO_ROOMS_TO_RESERVATION_1" FOREIGN KEY ("ROOM_NO")
	  REFERENCES "ACCO_ROOMS" ("ROOM_NO") ENABLE
  ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_ACCOMMODATIONS_TO_RESERVATION_1" FOREIGN KEY ("ACCO_ID")
	  REFERENCES "ACCOMMODATIONS" ("ACCO_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table RESTAURANT
--------------------------------------------------------

  ALTER TABLE "RESTAURANT" ADD CONSTRAINT "FK_CITIES_TO_RESTAURANT_1" FOREIGN KEY ("CITY_ID")
	  REFERENCES "CITIES" ("CITY_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table RESTAURANT_CAT
--------------------------------------------------------

  ALTER TABLE "RESTAURANT_CAT" ADD CONSTRAINT "FK_RESTAURANT_TO_RESTAURANT_CAT_1" FOREIGN KEY ("RESTAURANT_NO")
	  REFERENCES "RESTAURANT" ("RESTAURANT_NO") ENABLE
  ALTER TABLE "RESTAURANT_CAT" ADD FOREIGN KEY ("RESTAURANT_CAT_ID")
	  REFERENCES "RESTAURANT_CAT_NAME" ("RESTAURANT_CAT_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table RESTAURANT_MENU
--------------------------------------------------------

  ALTER TABLE "RESTAURANT_MENU" ADD CONSTRAINT "FK_RESTAURANT_TO_RESTAURANT_MENU_1" FOREIGN KEY ("RESTAURANT_NO")
	  REFERENCES "RESTAURANT" ("RESTAURANT_NO") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table RESTAURANT_TAG
--------------------------------------------------------

  ALTER TABLE "RESTAURANT_TAG" ADD CONSTRAINT "FK_RESTAURANT_TO_RESTAURANT_TAG_1" FOREIGN KEY ("RESTAURANT_NO")
	  REFERENCES "RESTAURANT" ("RESTAURANT_NO") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_USERS_TO_REVIEW_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "USERS" ("USER_NO") ENABLE
  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_RESTAURANT_TO_REVIEW_1" FOREIGN KEY ("RESTAURANT_NO")
	  REFERENCES "RESTAURANT" ("RESTAURANT_NO") ENABLE
  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_ACCOMMODATIONS_TO_REVIEW_1" FOREIGN KEY ("ACCO_ID")
	  REFERENCES "ACCOMMODATIONS" ("ACCO_ID") ENABLE
  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_ACCO_ROOMS_TO_REVEIW" FOREIGN KEY ("ROOM_NO")
	  REFERENCES "ACCO_ROOMS" ("ROOM_NO") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table REVIEW_ACCO_TAG
--------------------------------------------------------

  ALTER TABLE "REVIEW_ACCO_TAG" ADD CONSTRAINT "FK_REVIEW_TO_REVIEW_ACCO_TAG_1" FOREIGN KEY ("REVIEW_NO")
	  REFERENCES "REVIEW" ("REVIEW_NO") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table REVIEW_RESTAURANT_TAG
--------------------------------------------------------

  ALTER TABLE "REVIEW_RESTAURANT_TAG" ADD CONSTRAINT "FK_REVIEW_TO_REVIEW_RESTAURANT_TAG_1" FOREIGN KEY ("REVIEW_NO")
	  REFERENCES "REVIEW" ("REVIEW_NO") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table USER_ACCOMMODATION_LIKES
--------------------------------------------------------

  ALTER TABLE "USER_ACCOMMODATION_LIKES" ADD CONSTRAINT "FK_USERS_TO_USER_ACCOMMODATION_LIKES_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "USERS" ("USER_NO") ENABLE
  ALTER TABLE "USER_ACCOMMODATION_LIKES" ADD CONSTRAINT "FK_ACCOMMODATIONS_TO_USER_ACCOMMODATION_LIKES_1" FOREIGN KEY ("ACCO_ID")
	  REFERENCES "ACCOMMODATIONS" ("ACCO_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table USER_RESTAURANT_LIKES
--------------------------------------------------------

  ALTER TABLE "USER_RESTAURANT_LIKES" ADD CONSTRAINT "FK_USERS_TO_USER_RESTAURANT_LIKES_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "USERS" ("USER_NO") ENABLE
  ALTER TABLE "USER_RESTAURANT_LIKES" ADD CONSTRAINT "FK_RESTAURANT_TO_USER_RESTAURANT_LIKES_1" FOREIGN KEY ("RESTAURANT_NO")
	  REFERENCES "RESTAURANT" ("RESTAURANT_NO") ENABLE
