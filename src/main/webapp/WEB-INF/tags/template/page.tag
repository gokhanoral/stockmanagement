<%@ taglib prefix="header" tagdir="/WEB-INF/tags/header" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/footer" %>
<%@ attribute name="title" required="false" rtexprvalue="true" %>

<html>
    <head>
        <header:header/>
        <title>${title}</title>
    </head>
    <body>
        <div class="wrapper">
            <header:mainHeader/>
            <header:sidebar/>
            <jsp:doBody/>
            <footer:footer/>
        </div>
    </body>
    <header:script/>
</html>
