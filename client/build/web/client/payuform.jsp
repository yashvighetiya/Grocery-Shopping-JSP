<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>

<%!
    public boolean empty(String s) {
        if (s == null || s.trim().equals("")) {
            return true;
        } else {
            return false;
        }
    }
%>
<%!
    public String hashCal(String type, String str) {
        byte[] hashseq = str.getBytes();
        StringBuffer hexString = new StringBuffer();
        try {
            MessageDigest algorithm = MessageDigest.getInstance(type);
            algorithm.reset();
            algorithm.update(hashseq);
            byte messageDigest[] = algorithm.digest();

            for (int i = 0; i < messageDigest.length; i++) {
                String hex = Integer.toHexString(0xFF & messageDigest[i]);
                if (hex.length() == 1) {
                    hexString.append("0");
                }
                hexString.append(hex);
            }

        } catch (NoSuchAlgorithmException nsae) {
        }

        return hexString.toString();

    }
%>
<%
    String merchant_key = "1qnGeZBD";
    String salt = "TCXU2ZJSKP";
    String action1 = "";
    String base_url = "https://sandboxsecure.payu.in";
    int error = 0;
    String hashString = "";

    Enumeration paramNames = request.getParameterNames();
    Map<String, String> params = new HashMap<String, String>();
    while (paramNames.hasMoreElements()) {
        String paramName = (String) paramNames.nextElement();

        String paramValue = request.getParameter(paramName);

        params.put(paramName, paramValue);
    }
    String txnid = "";
    if (empty(params.get("txnid"))) {
        Random rand = new Random();
        String rndm = Integer.toString(rand.nextInt()) + (System.currentTimeMillis() / 1000L);
        txnid = hashCal("SHA-256", rndm).substring(0, 20);
    } else {
        txnid = params.get("txnid");
    }
    //udf2 = txnid;
    String txn = "abcd";
    String hash = "";
    String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
    if (empty(params.get("hash")) && params.size() > 0) {
        if (empty(params.get("key"))
                || empty(params.get("txnid"))
                || empty(params.get("amount"))
                || empty(params.get("firstname"))
                || empty(params.get("email"))
                || empty(params.get("phone"))
                || empty(params.get("productinfo"))
                || empty(params.get("surl"))
                || empty(params.get("furl"))
                || empty(params.get("service_provider"))) {
            error = 1;
        } else {
            String[] hashVarSeq = hashSequence.split("\\|");

            for (String part : hashVarSeq) {
                hashString = (empty(params.get(part))) ? hashString.concat("") : hashString.concat(params.get(part));
                hashString = hashString.concat("|");
            }
            hashString = hashString.concat(salt);

            hash = hashCal("SHA-512", hashString);
            action1 = base_url.concat("/_payment");
        }
    } else if (!empty(params.get("hash"))) {
        hash = params.get("hash");
        action1 = base_url.concat("/_payment");
    }


%>
<html>
    <style>
        td,tr
        {
            font-size: 22px;
        }
        input[type=submit]
        {
            font-size: 30px;
        }
        input
        {
            font-size: 20px;
        }
    </style>
    <script>
        var hash = '<%= hash%>';
        function submitPayuForm() {

            if (hash == '')
                return;

            var payuForm = document.forms.payuForm;
            payuForm.submit();
        }
    </script>

    <body onload="submitPayuForm();">

      <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
        <sql:query dataSource="${db}" var="order_master">
                SELECT * FROM `order_master` WHERE `invoice_no`='${invoice}';  
                  </sql:query>
    <center>

        <form action="<%= action1%>" method="post" name="payuForm">
            <input type="hidden" name="key" value="<%= merchant_key%>" />
            <input type="hidden" name="hash" value="<%= hash%>"/>
            <input type="hidden" name="txnid" value="<%= txnid%>" />
            <input type="hidden" name="udf2" value="<%= txnid%>" />
            <input type="hidden" name="service_provider" value="payu_paisa" />
            <table>
                <tr>
                   
                </tr>
                <tr>
                    <td>Amount: </td>
                    <td><input name="amount" readonly="" value="${order_master.rows[0].grand_total}" required=""/></td>
                </tr>
                <tr>
                    <td>First Name: </td>
                    <td><input name="firstname" readonly="" id="firstname" value="${order_master.rows[0].user_name}" required=""/></td>
                </tr>            
                <tr>
                    <td>Email: </td>
                    <td><input name="email" readonly="" id="email" value="${order_master.rows[0].user_email}" required=""/></td>
                </tr>
                <tr>
                    <td>Phone: </td>
                    <td><input name="phone" readonly="" value="${order_master.rows[0].phone_no}" required=""/></td>
                </tr>
                <tr>
                   
                    <td colspan="3"><input name="productinfo" hidden="" value="<%= (empty(params.get("productinfo"))) ? "xvdg" : params.get("productinfo")%>" size="64" /></td>
                </tr>
                <tr>
                    
                    <td colspan="3"><input name="surl" hidden="" value="<%= (empty(params.get("surl"))) ? "http://localhost:8080/gambo/client/order_placed.jsp" : params.get("surl")%>" size="64" /></td>
                </tr>
                <tr>
                  
                    <td colspan="3"><input name="furl" hidden="" value="<%= (empty(params.get("furl"))) ? "http://localhost:8080/gambo/client/failure.jsp" : params.get("furl")%>" size="64" /></td>
                </tr>
                <tr>
                                  </tr>
                <tr>             
                  
                    <td><input name="curl"  hidden="" value="http://localhost:8080/gambo/client/cancel.jsp" size="64" /></td>
                </tr>


                <tr>
                    <% if (empty(hash)) { %>
                    <td colspan="4"><center><input type="submit" value="Submit" />  </center></td>
                        <% }%>
              
                </tr>
            </table>
        </form>
    </center>

    </body>
</html>