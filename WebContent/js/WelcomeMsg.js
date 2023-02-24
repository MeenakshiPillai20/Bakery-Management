/**
 * 
 */
function welcomeMsg()
{
     var val=document.getElementById("id1").value;
     if(window.confirm(val+" your Signup process is Successfully completed....."))
    	 {
    	    window.location.href="login.jsp";
    	 }
}