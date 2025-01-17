<%@ page
   contentType="text/html ; charset=UTF-8"
   pageEncoding="UTF-8"
   import="ttc.bean.ArticleBean"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>チャット</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<link href="/TeraNavi/css/chat.css" rel="stylesheet" type="text/css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>
<body>
    <%-- ヘッダー部分のHTMLを読み込み --%>
    <div id="header">
    	<jsp:include page="/WEB-INF/jsp/header.jsp"/>
	</div>
	<div id="header_image">
		<img src="${result.community.headerPath}" width="100%" height="400px" />
		<div id="header_icon">
			<img id="icon_image" src="${result.community.iconPath}">
		</div>
		<h2 id="comunity_title">チャットルーム</p>
	</div>
    <div id="chat_room">
        <div class="container-fluid">
			<div class="wrapper">
                   <!-- 自分 -->
                <c:forEach var="ch" items="${result.chat}">
                    <c:choose>
                        <c:when test="${empty ch.body}">
                        </c:when>
                        <c:when test="${sessionScope.loginUser.id eq ch.userId}">
                            <div class="row">
                                <div class="col-md-5"></div>
                                <div class="col-md-1"></div>
                                <div class="col-md-6">
                                    <div class="box">
                                        <p class="content">
                                            <c:out value="${ch.body}"/><br>
                                        </p>
                                    </div>
                                    <p class="Mydate"><c:out value="${ch.date}" /><p>
                                    <img class="account" src="${sessionScope.loginUser.iconPath}">
                                    <p class="Myusername"><c:out value="${ch.userName}"/></p>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row">
                                <div class="col-md-6">
                                     <div class="other_box">
                                         <p class="other_content">
                                             <c:out value="${ch.body}"/><br>
                                         </p>
                                      </div>
                                      <p class="date"><c:out value="${ch.date}" /><p>
                                      <img class="other_account" src="${sessionScope.loginUser.iconPath}">
                                      <p class="username"><c:out value="${ch.userName}"/></p>
                                 </div>
                                 <div class="col-md-1"></div>
                                 <div class="col-md-5"></div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
			</div>
		</div>
	</div>
		<div id="forms">
                <div id="camera_space">
                    <span><img id="camera_logo" src="/TeraNavi/img/camera.png" width="41.6px" height="41.6px"></span>
                </div>
                <textarea id="chatBody" name="chatBody"></textarea>
				<input type="hidden" name="topicId" value="${result.chat[0].fkTopicId}">
				<input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
				<input type="hidden" name="communityId" value="${result.community.id}">
                <div id="submit_button">
            		<button id="chatwrite" type="button" name="button">送信</button>
            	</div>
        </div>
    </div>
    <div id="footer">
    	<jsp:include page="/WEB-INF/jsp/footer.jsp"/>
	</div>
    <script src="/TeraNavi/js/script.js"></script>
</body>
</html>
