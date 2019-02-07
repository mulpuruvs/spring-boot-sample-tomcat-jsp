<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
	<c:url value="/resources/text.txt" var="url"/>
	<spring:url value="/resources/text.txt" htmlEscape="true" var="springUrl" />
	<!--Spring URL: ${springUrl} at ${time}
	<br>
	JSTL URL: ${url}
	<br>
	Message: ${message}-->
	
	<h2>Monitoring Metrics at ${time}</h2>

	<table>
	  <tr>
	    <th>SNO</th>
	    <th>Metric Name</th>
	   </tr>
	  <tr>
	    <td>1</td>
	    <td>Deployment Frequency</td>
	  </tr>
	  <tr>
	    <td>2</td>
	    <td>Automated test pass %</td>
	  </tr>
	  <tr>
	    <td>3</td>
	    <td>Application performance</td>
	  </tr>

	</table>
</body>

</html>
