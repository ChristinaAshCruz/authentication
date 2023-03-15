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
    <title>Project Name here</title>
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
    <div class="d-flex p-3 mb-2 border-bottom border-4 border-dark">
      <h1 class="p-0 m-0">Welcome!</h1>
    </div>
    <div class="p-4 row gx-4" id="main-body">
      <div class="col">
        <div class="card p-3">
          <h1 class="mb-0">Register</h1>
          <hr />
          <form:form
            action="/user/new"
            class="mt-2"
            method="POST"
            modelAttribute="newUser"
          >
            <div class="d-flex mb-3 align-items-center">
              <form:label
                for="userName"
                path="userName"
                class="form-label col-2"
                >Username:</form:label
              >
              <form:input
                type="text"
                class="form-control"
                path="userName"
                name="userName"
              />
              <form:errors path="userName"></form:errors>
            </div>
            <div class="d-flex mb-3 align-items-center">
              <form:label for="email" path="email" class="form-label col-2"
                >Email:</form:label
              >
              <form:input
                type="text"
                class="form-control"
                path="email"
                name="email"
              />
              <form:errors path="email"></form:errors>
            </div>
            <div class="d-flex mb-3 align-items-center">
              <form:label
                for="password"
                path="password"
                class="form-label col-2"
                >Password:</form:label
              >
              <form:input
                type="password"
                class="form-control"
                path="password"
                name="password"
              />
              <form:errors path="password"></form:errors>
            </div>
            <div class="d-flex mb-3 align-items-center">
              <form:label for="confirm" path="confirm" class="form-label col-2"
                >Confirm Password:</form:label
              >
              <form:input
                type="password"
                class="form-control"
                path="confirm"
                name="confirm"
              />
              <form:errors path="confirm"></form:errors>
            </div>
            <div class="d-flex justify-content-end">
              <button class="btn btn-primary px-4">Register</button>
            </div>
          </form:form>
        </div>
      </div>
      <div class="col">
        <div class="card p-3">
          <h1 class="mb-0">Login</h1>
          <hr />
          <form:form
            action="/login/new"
            method="POST"
            modelAttribute="newLogin"
            class="mt-2"
          >
            <div class="d-flex mb-3 align-items-center">
              <form:label for="email" path="email" class="form-label col-2"
                >Email:</form:label
              >
              <form:input
                type="text"
                class="form-control"
                path="email"
                name="email"
              />
              <form:errors path="email"></form:errors>
            </div>
            <div class="d-flex mb-3 align-items-center">
              <form:label
                for="password"
                path="password"
                class="form-label col-2"
                >Password:</form:label
              >
              <form:input
                type="password"
                class="form-control"
                path="password"
                name="password"
              />
              <form:errors path="password"></form:errors>
            </div>
            <div class="d-flex justify-content-end">
              <button class="btn btn-primary px-4">Login</button>
            </div>
          </form:form>
        </div>
      </div>
    </div>
  </body>
</html>
