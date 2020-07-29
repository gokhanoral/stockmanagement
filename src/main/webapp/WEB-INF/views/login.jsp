<%@ taglib prefix="header" tagdir="/WEB-INF/tags/header" %>
<%@page contentType="text/html;charset=ISO-8859-9" pageEncoding="ISO-8859-9" %>
<!DOCTYPE html>
<html>
<head>
    <header:header/>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="templates/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- Theme style -->
    <link href="/templates/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
    <!-- iCheck -->
    <link href="/templates/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css"/>
    <title>Giriþ Yap</title>
    <base href="/"/>
</head>
<body class="login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>Stok Yönetimi</b></a>
    </div><!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Giriþ Yap</p>
        <form action="/login" method="post" name="f">
            <input type="hidden" value="${_csrf.token}" name="_csrf"/>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="Kullanýcý Adý" name="username"/>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="Þifre" name="password"/>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Giriþ Yap</button>
                </div><!-- /.col -->
            </div>
        </form>
    </div>
</div><!-- /.login-box -->

<!-- jQuery 2.1.3 -->
<script src="/templates/plugins/jQuery/jQuery-2.1.3.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/templates/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- iCheck -->
<script src="/templates/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
</body>
</html>