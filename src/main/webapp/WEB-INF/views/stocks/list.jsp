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
                Stoklar
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
                                    <a href="<c:url value="/stocks/add"/>" class="btn btn-block btn-success btn-lg">Stok Ekle</a>
                                </div>
                            </security:authorize>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Stok Kodu</th>
                                    <th>Ürün Kodu</th>
                                    <th>Ürün Adý</th>
                                    <th>Depo</th>
                                    <th>Adet</th>
                                    <security:authorize access="hasRole('ROLE_ADMIN')">
                                        <th>Ýþlem</th>
                                    </security:authorize>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${stockList}" var="stock">
                                    <tr>
                                        <td>${stock.id}</td>
                                        <td>${stock.code}</td>
                                        <td>${stock.product.code}</td>
                                        <td>${stock.product.name}</td>
                                        <td>${stock.warehouse.name}</td>
                                        <td>${stock.quantity}</td>
                                        <security:authorize access="hasRole('ROLE_ADMIN')">
                                            <td>
                                                <div class="btn-group">
                                                    <a href="/stocks/edit/${stock.id}" type="button" class="btn btn-success"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                    <a href="/stocks/delete/${stock.id}" type="button" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></a>
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