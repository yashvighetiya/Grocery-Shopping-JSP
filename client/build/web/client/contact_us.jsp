<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>


<jsp:include page="header.jsp"/>


<div class="wrapper">
<div class="gambo-Breadcrumb">
<div class="container">
<div class="row">
<div class="col-md-12">
<nav aria-label="breadcrumb">
<ol class="breadcrumb">
<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
<li class="breadcrumb-item active" aria-current="page">Contact Us</li>
</ol>
</nav>
</div>
</div>
</div>
</div>
<div class="all-product-grid">
<div class="container">
<div class="row">
<div class="col-lg-6 col-md-6">
<div class="panel-group accordion" id="accordion0">
    <%----%>
    <h2>Cities that we Deliver</h2>
    <sql:query dataSource="${db}" var="city_for_delivery">
        SELECT * FROM `city`
          </sql:query>
          <c:forEach items="${city_for_delivery.rows}" var="city_list">
<div class="panel panel-default">
<div class="panel-heading" id="headingOne">
<div class="panel-title">
<a class="collapsed" data-toggle="collapse" data-target="#collapseOne" href="#" aria-expanded="false" aria-controls="collapseOne">
<i class="uil uil-location-point chck_icon"></i>${city_list.city}
</a>
</div>
</div>
<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion0" style="">
</div>
</div>
          </c:forEach>
<%----%>
</div>
</div>
<div class="col-lg-6 col-md-6">
<div class="contact-title">
<h2>Submit customer service request</h2>
<p>If you have a question about our service or have an issue to report, please send a request and we will get back to you as soon as possible.</p>
</div>
<div class="contact-form">
    <form method="post">
<div class="form-group mt-1">
<label class="control-label">Full Name*</label>
<div class="ui search focus">
<div class="ui left icon input swdh11 swdh19">
<input class="prompt srch_explore" type="text" name="sendername" id="sendername" required="" placeholder="Your Full">
</div>
</div>
</div>
<div class="form-group mt-1">
<label class="control-label">Email Address*</label>
<div class="ui search focus">
<div class="ui left icon input swdh11 swdh19">
<input class="prompt srch_explore" type="email" name="e1" id="emailaddress" required="" placeholder="Your Email Address">
</div>
</div>
</div>
<div class="form-group mt-1">
<label class="control-label">Subject*</label>
<div class="ui search focus">
<div class="ui left icon input swdh11 swdh19">
<input class="prompt srch_explore" type="text" name="sendersubject" id="sendersubject" required="" placeholder="Subject">
</div>
</div>
</div>
<div class="form-group mt-1">
<div class="field">
<label class="control-label">Message*</label>
<textarea rows="2" class="form-control" id="sendermessage" name="sendermessage" required="" placeholder="Write Message"></textarea>
</div>
</div>
    <button class="next-btn16 hover-btn mt-3" type="submit" data-btntext-sending="Sending..." name="submit_request" value="submitrequest">Submit Request</button>
</form>
<%-- customer service request now java code start--%>


<c:if test="${param.submit_request.equals('submitrequest')}">
    
    <sql:update dataSource="${db}">
        insert into contact_us(user_name,user_email,user_subject,user_message) values("${param.sendername}","${param.e1}","${param.sendersubject}","${param.sendermessage}");
    </sql:update>
</c:if>
    
    
<%-- customer service request now java code ends--%>
</div>
</div>
</div>
</div>
</div>
</div>


<jsp:include page="footer.jsp"/>