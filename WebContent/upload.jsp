<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.configure.*,com.storage.StockData" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="Bootstrap4CDN.jsp" %>
<link rel="stylesheet" href="./css/home_style.css">
<script type="text/javascript">
    $(window).on('load', function() {
        $('#Insert').modal('show');
    });
</script>
<title>Insert title here</title>
<jsp:useBean id="obj" class="com.bean.StockBean"/>
<jsp:setProperty property="*" name="obj"/>
<%
    StockData.setStockDetail(obj);
%>

</head>
<body>
<!-- Model1 -->

           <div class="modal fade" id="Insert">
               <div class="modal-dialog ">
                  <div class="modal-content">
                  
                     <!-- Modal Header -->
                      <div class="modal-header">
                           <h3 class="modal-title">Add Image</h3>
                           
                           <a href="admin_home.jsp" onclick="pop.close();">&times;</a>
                     </div>
        
                     <!-- Modal body -->
                     <div class="modal-body">
                           <form action="imgupload" method="post" enctype="multipart/form-data">
                                 <div class="form-group">
                                  <div class="row">
                                     <label  class="col-md-4 control-label">Add Image</label>
                                     <div class="col-md-7">
                                         <input type="file" name="img_file" class="form-control">
                                     </div>
                                  </div>
                             </div><br>
                              <div class="form-group">
                                 <!-- Button -->                                        
                                 <div class="col-md-12 text-center">
                                       <input type="submit" id="btn-signup" class="btn btn-success btn-block"  value="Submit">
                           
                                 </div>
                             </div>
                           </form>               
                    </div>
        
                  </div>
               </div>
           </div>
</body>
</html>