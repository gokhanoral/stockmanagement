<%@page contentType="text/html;charset=ISO-8859-9" pageEncoding="ISO-8859-9" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<template:page>
    <!-- Right side column. Contains the navbar and content of the page -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Kullanýcýlar
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <security:authorize access="hasRole('ROLE_ADMIN')">
                            <div style="float:right">
                                <a href="${pageContext.request.contextPath}/users/add" class="btn btn-block btn-success btn-lg">Kullanýcý Ekle</a>
                            </div>
                            </security:authorize>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Kullanýcý Adý</th>
                                    <th>Ad Soyad</th>
                                    <th>Email</th>
                                    <security:authorize access="hasRole('ROLE_ADMIN')">
                                        <th>Ýþlem</th>
                                    </security:authorize>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${userList}" var="user">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.userName}</td>
                                        <td>${user.name}</td>
                                        <td>${user.email}</td>
                                        <security:authorize access="hasRole('ROLE_ADMIN')">
                                            <td>
                                                <div class="btn-group">
                                                    <a href="/users/edit/${user.id}" type="button" class="btn btn-success"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                    <a href="/users/delete/${user.id}" type="button" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                                </div>
                                            </td>
                                        </security:authorize>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
</template:page>