<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<%
    String xmlText = "<tag>&value</tag>";
    request.setAttribute("xmlText", xmlText);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL Function Demo</title>
</head>
<body>
<h2>JSTL Functions in Tomcat 11 (Jakarta)</h2>

<c:set var="text" value="Hello, JSTL Functions!"/>
<c:set var="csv" value="apple,banana,cherry"/>
<c:set var="arr" value="${fn:split(csv, ',')}"/>

<ul>
    <li>contains: ${fn:contains(text, 'JSTL')}</li>
    <li>containsIgnoreCase: ${fn:containsIgnoreCase(text, 'jstl')}</li>
    <li>endsWith: ${fn:endsWith(text, '!')}</li>
    <li>escapeXml: ${fn:escapeXml(xmlText)}</li>
    <li>indexOf: ${fn:indexOf(text, 'JSTL')}</li>
    <li>join: ${fn:join(arr, ' | ')}</li>
    <li>length(text): ${fn:length(text)}</li>
    <li>length(array): ${fn:length(arr)}</li>
    <li>replace: ${fn:replace(text, 'Functions', 'Tags')}</li>
    <li>startsWith: ${fn:startsWith(text, 'Hello')}</li>
    <li>substring(7,11): ${fn:substring(text, 7, 11)}</li>
    <li>toLowerCase: ${fn:toLowerCase('AbC')}</li>
    <li>toUpperCase: ${fn:toUpperCase('AbC')}</li>
    <li>trim: ${fn:trim('  spaces  ')}</li>
</ul>
</body>
</html>
