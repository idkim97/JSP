# JSP Bulletin WebPage

> JSP 개발환경에 기반하여 JDK, Eclipse, Tomcat을 활용해 게시판 기능을 가진 웹페이지 입니다.

## 사용 예제
**[ 메인페이지 ]**
<p align="left">
<img src="https://github.com/idkim97/idkim97.github.io/blob/master/img/jsp1.png?raw=true">
</p>

**[ 회원가입 ]**
<p align="left">
<img src="https://github.com/idkim97/idkim97.github.io/blob/master/img/jsp3.png?raw=true">
</p>

**[ 로그인 ]**
<p align="left">
<img src="https://github.com/idkim97/idkim97.github.io/blob/master/img/jsp4.png?raw=true">
</p>

**[ 글쓰기 페이지 ]**
<p align="left">
<img src="https://github.com/idkim97/idkim97.github.io/blob/master/img/jsp2.png?raw=true">
</p>

## 설치 방법
**개발환경**

> JAVA 버전 : JDK1.8.0  
> 서버 : Tomcat 8.5.14  
> Eclipse IDE for Enterprise and Web Developers - 2021.12  
> DB : MySQL 5.7.18  

**개발 환경이 모두 갖춰진 뒤에는 로컬 환경에서 바로 실행 가능합니다!**


## 설명
- **게시판 웹 페이지 :** **JSP**를 활용한 간단한 게시판 웹페이지를 제작해봤습니다. **MYSQL**을 이용해 DB를 처리했고 디자인 템플릿으로는 **부트스트랩**을 사용했습니다. **회원가입, 로그인** 기능이 구현되었고 회원정보에 기반하여 게시판에 게시글을 작성할 수 있습니다. 또한 게시글에 대한 **수정, 삭제**도 가능합니다!
- **보안** :  **Cross-site scripting** 공격에 대한 대비 장치가 마련되어 있습니다! **SQL Injection**에 대한 방어로 **Prepared Statement** 구문을 사용했습니다!
- **로컬 환경** : 본인의 로컬환경에서 실행 할 수 있습니다. 서버를 열고 https:// localhost:8080 에 접속하면 웹페이지를 바로 확인할 수 있습니다.

## 보안
**크로스 사이트 스크립팅 공격 보안**
```html
<tbody>
	<tr>
		<td style = "width : 20%;">글 제목</td>
		<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
			</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><%= bbs.getUserID() %></td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13)+"시"+bbs.getBbsDate().substring(14,16)+"분" %></td>
				</tr>
				<tr>
					<td>내용</td>
						<td colspan="2" style="min-height: 200px;  text-align  : Left;"><%= bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
				</tr>	
</tbody>		
```
특수문자를 따로 처리하는 코드를 삽입하여 크로스 사이트 스크립팅 공격에 대한 대비를 함.

<br><br><br>

**SQL Injection 공격에 대한 보안**

```java
// 회원가입 정보 가져오기
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
		
	}
```
**Prepared Statement** 구문을 사용하여 바인딩 변수를 사용한 SQL 공격 쿼리를 입력할지라도 SQL인젝션 공격에 안전하게 구현함!
