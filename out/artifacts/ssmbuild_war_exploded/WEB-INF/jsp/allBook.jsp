<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示页面</title>
    <%--BootStrap美化界面--%>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12" column>
            <div class="page-header">
                <h1>
                    <small>书籍列表 —— 显示所有数据</small>
                </h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${PageContext.request.contextPath}/book/toAddPage">新增书籍</a>
                <a class="btn btn-primary" href="${PageContext.request.contextPath}/book/allBook">显示全部书籍</a>
            </div>
            <div class="col-md-1 column"></div>
            <div class="col-md-7 column">
                <%--查询书籍--%>
                <form action="${pageContext.request.contextPath}/book/queryBookByName" method="post" style="float: right" class="form-inline">
                    <span style="color: red;font-weight: bold">${error}</span>
                    <input class="form-control" name="queryBookName" type="text" placeholder="请输入要查询的书籍名称">
                    <input type="submit" value="查询" class="btn btn-primary" style="float: right">
                </form>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12" colum>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                    <th>操作</th>
                </tr>
                </thead>
                <%--书籍从数据库中查询出来，从这个list中遍历出来：foreach--%>
                <tbody>
                <c:forEach var="books" items="${list}">
                <tr>
                    <td>${books.bookID}</td>
                    <td>${books.bookName}</td>
                    <td>${books.bookCounts}</td>
                    <td>${books.detail}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/book/toUpdatePage?id=${books.bookID}">修改</a>
                        &nbsp; | &nbsp;
                        <a href="${pageContext.request.contextPath}/book/deleteBook/${books.bookID}">删除</a>
                    </td>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
