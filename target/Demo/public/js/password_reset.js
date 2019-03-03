/**
 * 
 */
  function password_reset(){
//	  var account=document.getElementById("account");
	
      var result=$("form").serializeArray();
      var account=result[0].value;
     
     
      var name=result[1].value;
      var academy=result[2].value;
      var major=result[3].value;
      var tel=result[4].value;
      var mail=result[5].value;
      var password=result[6].value;
    
	  $.ajax({
          type: 'POST',
          url: 'Reset',//在php中全局定义url，方便使用thinkphp的U方法
           data: {account:account,name:name,academy:academy,major:major,tel:tel,mail:mail,password:password},
			 

//          ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
          dataType: "json",
          success: function (msg) {
       	    if(msg=="1"){
       	    	alert("密码重置成功！");
       	    	location.reload(true);
       	    }
       	    if(msg=="0"){
       	    	alert("信息不匹配，密码重置失败！");
       	    }
       	   console.log("数据交互");
       	    
       	
       	   
          },
          error: function (msg) {
       	   
        	  
        	 
     
       	   
       	   
              console.log("数据交互失败");
          }
      });
	  
	
  }
  
  function pwd_Get(){
	 
	
	 var inputs=document.getElementsByTagName("input");
	
	 var pwd=new Array();
	 for(var i=0;i<inputs.length;i++){
		 pwd[i]=inputs[i];
	 }
	 
      
	  console.log(pwd[6].type);
	  return pwd;
  }
	  function password_show(){
		  var pwd=pwd_Get();
		  var image=document.getElementById("image");
		  for(var i=0;i<pwd.length;i++){
				
		  if(pwd[i].type=password){
			  
			  pwd[i].setAttribute("type","text");
	     
			  image.style.cssText="opacity:1.0;position: absolute;margin-top: 213px;margin-left: 480px;width: 16px;height: 16px;";
			  image.setAttribute("onclick","password();");
			  
				 
		  }  
	  }
	  }
	  function password(){
		  var pwd=pwd_Get();
		  var image=document.getElementById("image");
		  for(var i=0;i<pwd.length;i++){	  
	   pwd[i].setAttribute("type","password");
		  image.style.cssText="opacity:0.4;position: absolute;margin-top: 213px;margin-left: 480px;width: 16px;height: 16px;";
		  image.setAttribute("onclick","password_show();");

		  
		  }  
	  }
   
  