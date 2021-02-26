# :house: LHInfo

#### *임대단지, 분양임대 공고문, 청약센터 공고문 정보를 제공하는 서비스*

![image](https://user-images.githubusercontent.com/52819764/109245359-aa394300-7823-11eb-8be9-b8c216eb9e49.png)



![image](https://user-images.githubusercontent.com/52819764/109246962-7875ab80-7826-11eb-9e8c-4f9dfbc3d60d.png)



![image](https://user-images.githubusercontent.com/52819764/109247014-8cb9a880-7826-11eb-930e-515b9e0d2e06.png)



![image](https://user-images.githubusercontent.com/52819764/109247349-1cf7ed80-7827-11eb-8033-527029e1388a.png)



:point_right: [분양임대 정보 제공 서비스 - LHInfo](http://3.36.122.179/)



---



### :computer: 사용 기술

- ###### Backend

  ![](https://img.shields.io/badge/Java-1.11-beige) ![](https://img.shields.io/badge/Spring-5.2.9.RELEASE-beige) ![](https://img.shields.io/badge/Maven-3.8.0-beige) ![](https://img.shields.io/badge/Tomcat-8.5.61-beige) ![](https://img.shields.io/badge/Mysql-8.0-beige) ![](https://img.shields.io/badge/MyBatis-3.5.6-beige) ![](https://img.shields.io/badge/Intellij-2020.3-beige)

- ###### Frontend

  ![](https://img.shields.io/badge/Servlet&Jsp-_-brown) ![](https://img.shields.io/badge/Javascript-_-brown) ![](https://img.shields.io/badge/jQuery-3.5.1-brown) ![](https://img.shields.io/badge/HTML&CSS-_-brown) ![](https://img.shields.io/badge/Chart.js-_-brown) ![](https://img.shields.io/badge/Pagination.js-2.1.5-brown) ![](https://img.shields.io/badge/Bootstrap-3.4.1-brown) ![](https://img.shields.io/badge/Fontawesome-_-brown)

- ###### API

  ![](https://img.shields.io/badge/KakaoMapsAPI-Kakao-black) ![](https://img.shields.io/badge/임대주택단지조회API-공공데이터포털-black) ![](https://img.shields.io/badge/분양임대공고문조회API-공공데이터포털-black) ![](https://img.shields.io/badge/분양임대공고별상세정보조회API-공공데이터포털-black) ![](https://img.shields.io/badge/청약센터공지사항목록조회API-공공데이터포털-black) ![](https://img.shields.io/badge/소상공인진흥공단상가(상권)정보API-공공데이터포털-black) 



---



### :electric_plug: 배포 환경

![](https://img.shields.io/badge/AWS_EC2-_-purple) ![](https://img.shields.io/badge/Ubuntu-20.04-purple) ![](https://img.shields.io/badge/NginX-_-purple) ![](https://img.shields.io/badge/Tomcat-8.5.63-purple) ![](https://img.shields.io/badge/Java-1.11-purple) ![](https://img.shields.io/badge/Docker-_-purple) ![](https://img.shields.io/badge/MySQL-latest-purple)



---



### :speech_balloon: Commit 규칙

- ##### initial | 내용

  파일을 처음 생성한 경우

- ##### update | 내용

  파일의 내용을 수정했을 경우

- ##### fix | 내용

  파일의 내용을 수정했으나, 기능적인 부분이 아닌 주석, 불필요한 코드 등 코드 정리의 목적일 경우


---


### :open_file_folder: 파일 구조

```bash
+---main
|   +---java
|   |   \---project
|   |       \---personal
|   |           \---lhinfo
|   |               +---controller
|   |               |       AccountController.java
|   |               |       HomeController.java
|   |               |       LeaseComplexController.java
|   |               |       LHNoticeController.java
|   |               |       SubLeaseNoticeController.java
|   |               |       
|   |               +---dao
|   |               |       AccountDao.java
|   |               |       AccountDaoImpl.java
|   |               |       TypeDao.java
|   |               |       TypeDaoImpl.java
|   |               |       
|   |               +---dto
|   |               |   |   AccountFindPwdDto.java
|   |               |   |   AccountInfoDto.java
|   |               |   |   AccountSigninDto.java
|   |               |   |   AccountSignupDto.java
|   |               |   |   AccountUpdatePwdDto.java
|   |               |   |   LeaseComplexDto.java
|   |               |   |   LeaseComplexTypeDto.java
|   |               |   |   LHNoticeDto.java
|   |               |   |   LHNoticeSearchDto.java
|   |               |   |   SubLeaseNoticeDetailDto.java
|   |               |   |   SubLeaseNoticeDetailSearchDto.java
|   |               |   |   SubLeaseNoticeDetailStoreDto.java
|   |               |   |   SubLeaseNoticeDto.java
|   |               |   |   SubLeaseNoticeSearchDto.java
|   |               |   |   
|   |               |   \---SubLeaseNoticeDetail
|   |               |           dsAhflInfo.java
|   |               |           dsAhflInfoNm.java
|   |               |           dsCtrtPlc.java
|   |               |           dsCtrtPlcNm.java
|   |               |           dsEtcInfo.java
|   |               |           dsEtcInfoNm.java
|   |               |           dsEtcList.java
|   |               |           dsEtcListNm.java
|   |               |           dsSbd.java
|   |               |           dsSbdAhfl.java
|   |               |           dsSbdAhflNm.java
|   |               |           dsSbdDong.java
|   |               |           dsSbdDongAhfl.java
|   |               |           dsSbdDongAhflNm.java
|   |               |           dsSbdDongNm.java
|   |               |           dsSbdNm.java
|   |               |           dsSplScdl.java
|   |               |           dsSplScdl01.java
|   |               |           dsSplScdl01Nm.java
|   |               |           dsSplScdl02.java
|   |               |           dsSplScdl02Nm.java
|   |               |           dsSplScdlNm.java
|   |               |           resHeader.java
|   |               |           
|   |               +---entity
|   |               |       Account.java
|   |               |       Location.java
|   |               |       NoticeStatusType.java
|   |               |       NoticeType.java
|   |               |       SupplyType.java
|   |               |       
|   |               +---interceptor
|   |               |       LoginInterceptor.java
|   |               |       
|   |               \---service
|   |                       AccountService.java
|   |                       AccountServiceImpl.java
|   |                       LeaseComplexService.java
|   |                       LeaseComplexServiceImpl.java
|   |                       LHNoticeService.java
|   |                       LHNoticeServiceImpl.java
|   |                       SubLeaseNoticeService.java
|   |                       SubLeaseNoticeServiceImpl.java
|   |                       TypeService.java
|   |                       TypeServiceImpl.java
|   |                       
|   +---resources
|   |   |   log4j.xml
|   |   |   
|   |   +---META-INF
|   |   \---mybatis
|   |           mybatis-config.xml
|   |           mybatis-mapper.xml
|   |           
|   \---webapp
|       +---resources
|       |   |   favicon.ico
|       |   |   main.css
|       |   |   main.html
|       |   |   
|       |   \---img
|       |           jack-prommel-T2wAe8qXy4w-unsplash.jpg
|       |           jack-prommel-T2wAe8qXy4w-unsplash_cut.jpg
|       |           jack-prommel-T2wAe8qXy4w-unsplash_opacity.jpg
|       |           lichtraum-1560788_1920.jpg
|       |           
|       \---WEB-INF
|           |   web.xml
|           |   
|           +---classes
|           +---spring
|           |   |   root-context.xml
|           |   |   
|           |   \---appServlet
|           |           servlet-context.xml
|           |           
|           \---views
|                   error.jsp
|                   footer.jsp
|                   header.jsp
|                   home.jsp
|                   leaseComplex.jsp
|                   lhNoticeList.jsp
|                   open.jsp
|                   subLeaseNoticeDetail.jsp
|                   subLeaseNoticeList.jsp
|                   
\---test
    +---java
    |   \---project
    |       \---personal
    |           \---lhinfo
    \---resources
            log4j.xml
```

