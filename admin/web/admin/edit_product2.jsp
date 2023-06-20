<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${product_id == null}">
    <c:set var="toast_message" scope="session" value="Select Product to edit"/>

    <c:redirect url="products.jsp"/>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>


<%File file;

    File file1;
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    ServletContext context = pageContext.getServletContext();
    String filePath = context.getInitParameter("file-product-client-upload");
    String filePath1 = context.getInitParameter("file-product-admin-upload");

    // Verify the content type
    String contentType = request.getContentType();

    if ((contentType.indexOf("multipart/form-data") >= 0)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);

        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>JSP File upload</title>");
            out.println("</head>");
            out.println("<body>");

            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();

                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));

                        file1 = new File(filePath1
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));

                        file1 = new File(filePath1
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file1);
                    fi.write(file);
                    out.println("Uploaded Filename: " + filePath
                            + fileName + "<br>");
                    out.println("Uploaded Filename: " + filePath1
                            + fileName + "<br>");
                    String img_path = filePath.replace('\\', '/') + fileName;
                    String image_path = img_path.replace("C:/xampp/htdocs/gambo/web/client/", "");
                    out.println("<br> replace : " + image_path);
                    out.println("<br> old :  " + img_path);
                    pageContext.setAttribute("product_imagepath", image_path);
                }
            }
            out.println("</body>");
            out.println("</html>");
        } catch (Exception ex) {
            System.out.println(ex);
        }
    } else {
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet upload</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<p>No file uploaded</p>");
        out.println("</body>");
        out.println("</html>");
    }

%>
   <c:catch var="exception">
            <sql:update dataSource="${db}" var="edit_product">
                UPDATE `gambo_products` SET `product_image`='${product_imagepath}' WHERE `product_id`='${product_id}'
            </sql:update>
                
                <c:remove var="product_id"/>
            <c:if test="${edit_product == 1}">
                <c:set var="toast_message" scope="session" value="Product is Edited"/>
            </c:if>
        </c:catch>
  
<c:if test="${exception != null}">
                 <c:set var="toast_message" scope="session" value="Opps! some error occured while Editing product"/>
            </c:if>
<c:redirect url="products.jsp"/>