# 서울어때

### 중앙HTA 파이널프로젝트 1조    
  
  
## 🍇 프로젝트 소개 Description

### Spring MVC 방식의 개발 실습을 위한 웹사이트 구현 프로젝트

- 프로젝트 주제  
  위치 기반 숙소예약 및 맛집 추천 서비스를 제공하는 웹사이트 개발
- 선정 이유  
숙소검색과 예약 서비스를 제공하는 여기어때 사이트를 벤치마킹하여, 숙소-객실선택-예약-결제와 같은 여러 단계의 DB 액세스 로직, 그리고 위치 기반의 다양한 조회 기능 등을 Spring MVC 개발 방식으로 구현해보고자 함
![image](https://user-images.githubusercontent.com/97426362/187479205-354292b9-7775-4518-a211-2531d23ee1df.png)

## 📅 개발 기간 Development Period
### 2022.07.27 ~ 2022.08.25

1. 레퍼런스 선정, 화면 및 업무 흐름 분석
2. 데이터베이스 설계
3. 관련 페이지 및 클래스 디렉토리 정리
4. 각자 담당한 화면 및 기능 구현
5. 전체 기능 테스트 및 오류 수정
    
## 💻 개발 환경 Development Environment
- OS :  Window 10 64bit
- Framework : Spring Boot
- Build : Maven
- WAS : Apache Tomcat 9.0
- IDE : Eclipse 2021-12 (4.22.0)
- Language : Java 17.0.2
- DB : Oracle 21c EE (JDBC : ojdbc 8), myBatis
- Browser Support : Chrome
- HTML , CSS, Javascript with BootStrap 5.2.0, jQuery
- Version Management : Git, Github  


## 📔 DB 설계 Database design
![image](https://user-images.githubusercontent.com/97426362/187114993-b5d59e9f-dd31-47bc-b3ce-10301fe798cb.png)

* DB 사용 시 유의사항  
  * id: nc
  *  pwd: zxcv1234
  * 테이블, 시퀀스 생성 및 필수 데이터 임포트:  

## 👥 담당 기능 Team Roles
- 김주완 : 관리자 기능
- 안재용 : 숙소 예약 및 결제 기능, 맛집 및 리뷰 일부 기능
- 유도영 : 숙소 관련 기능, 맛집을 포함한 검색/상세조회 기능, 내 찜목록 관리
- 이예석 : 사용자 기능
- 이형진 : 문의 및 리뷰 관련 기능

## 🔗 Used API
- kakao 우편번호 서비스
- kakao 지도 서비스
- kakao 로그인 서비스
- 아임포트 결제 연동 서비스(카카오페이, 이니시스, 토스)
- Google Charts
- daterangepicker(MIT)
- 그 외 라이브러리  
  bootswatch, jQuery UI, moment.js
  
## 👀 Preview  
담당한 기능 시연 GIF(숙소/맛집 검색 및 조회, 찜하기, 통합검색)
- 숙소를 여러가지 조건으로 검색하고 상세정보 조회하기
![숙소검색-sm](https://user-images.githubusercontent.com/97426362/187493854-426cbcb4-7aca-4764-8791-aadcf81c6b85.gif)
- 추천 맛집과 최신 리뷰 조회, 통합검색과 연계하여 맛집 검색하기
![맛집검색-sm](https://user-images.githubusercontent.com/97426362/187493666-86c59411-dd62-4570-9293-07b1eaa0e65a.gif)
- 통합검색 : 숙소, 맛집 상세조회 페이지와 연계하여 숙소/맛집/찜목록을 지도에서 가까운 순으로 조회하기
![통합검색-sm](https://user-images.githubusercontent.com/97426362/187493460-31b4bc4b-d321-4704-bf30-48877ef52d5e.gif)

  
