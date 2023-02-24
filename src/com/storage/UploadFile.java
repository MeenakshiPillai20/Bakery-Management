package com.storage;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



/**
 * Servlet implementation class UploadFile
 */
@WebServlet("/UploadFile")
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY="C:\\Users\\Admin\\eclipse-workspace3\\Moms_Bakery\\WebContent\\upload_img";
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		
		if(ServletFileUpload.isMultipartContent(request))
		{	try
		    {
			     List<FileItem> al= new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			     for(FileItem item: al)
			     {
			    	 if(!item.isFormField())
			    	 {  
			    		 
			    			 
			    			 int id = StockData.getImageId();
				    		 item.write(new File(UPLOAD_DIRECTORY+File.separator+id+".jpg"));
				    		 
				    		 StockData.setImage(UPLOAD_DIRECTORY+File.separator+id+".jpg",id);
			    			 
			    
			    	 }
			     }
			     
		    }
		    catch(Exception e)
		    {
		    	e.printStackTrace();
		    	request.setAttribute("message", "File Uploaded Failed due to "+e); 	
		    }	
		}
		else
		{
			request.setAttribute("message", "Sorry! task not done"); 
		}
		
		response.sendRedirect("admin_home.jsp");
		
		
	}

}
