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
                Depo Listesi
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
                                <a href="<c:url value="/warehouses/add"/>" class="btn btn-block btn-success btn-lg">Depo Ekle</a>
                            </div>
                            </security:authorize>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Depo Kodu</th>
                                    <th>Depo Adý</th>
                                    <th>Adres</th>
                                    <th>Açýklama</th>
                                    <security:authorize access="hasRole('ROLE_ADMIN')">
                                        <th>Ýþlem</th>
                                    </security:authorize>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${warehouseList}" var="warehouse">
                                    <tr>
                                        <td>${warehouse.id}</td>
                                        <td>${warehouse.code}</td>
                                        <td>${warehouse.name}</td>
                                        <td>${warehouse.address}</td>
                                        <td>${warehouse.description}</td>
                                        <security:authorize access="hasRole('ROLE_ADMIN')">
                                            <td>
                                                <div class="btn-group">
                                                    <a href="/warehouses/edit/${warehouse.id}" type="button" class="btn btn-success"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                    <a href="/warehouses/delete/${warehouse.id}" type="button" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></a>
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