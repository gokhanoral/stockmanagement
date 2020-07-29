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
                Ürünler
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
                                <a href="${pageContext.request.contextPath}/products/add" class="btn btn-block btn-success btn-lg">Ürün Ekle</a>
                            </div>
                            </security:authorize>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Ürün Kodu</th>
                                    <th>Ürün Adý</th>
                                    <th>Birim</th>
                                    <th>Alýþ Fiyatý</th>
                                    <th>Satýþ Fiyatý</th>
                                    <th>Marka</th>
                                    <th>Açýklama</th>
                                    <security:authorize access="hasRole('ROLE_ADMIN')">
                                        <th>Ýþlem</th>
                                    </security:authorize>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${productList}" var="product">
                                    <tr>
                                        <td>${product.id}</td>
                                        <td>${product.code}</td>
                                        <td>${product.name}</td>
                                        <td>${product.unit}</td>
                                        <td>
                                            <c:if test="${not empty product.purchasePrice}">
                                                ${product.purchasePrice} TL
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${not empty product.salePrice}">
                                                ${product.salePrice} TL
                                            </c:if>
                                        </td>
                                        <td>${product.brand}</td>
                                        <td>${product.description}</td>
                                        <security:authorize access="hasRole('ROLE_ADMIN')">
                                            <td>
                                                <div class="btn-group">
                                                    <a href="/products/edit/${product.id}" type="button" class="btn btn-success"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                    <a href="/products/delete/${product.id}" type="button" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></a>
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