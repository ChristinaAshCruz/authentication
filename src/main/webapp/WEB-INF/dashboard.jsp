<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- change to match your file/naming structure -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Climate+Crisis&family=Roboto+Mono:wght@500;600&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <div
      class="d-flex justify-content-between align-items-baseline p-3 mb-2 border-bottom border-4 border-dark"
    >
      <h1>
        Hello,
        <c:out value="${user.userName}"></c:out>
        !
      </h1>
      <span>
        <a href="/logout" class="btn btn-primary">Logout</a>
      </span>
    </div>
    <div class="p-4 row gx-4" id="main-body">
      <div class="col">
        <div class="card p-3">
          <p>This is your dashboard! Nothing to see here yet.</p>
        </div>
      </div>
    </div>
  </body>
</html>
