
function server_searchUser(id){
	
	
	   var id=id;
	   var number=document.getElementById("search_text").value;
    	   $.ajax({
               type: 'POST',
               url: 'search_user',//在php中全局定义url，方便使用thinkphp的U方法
                data: {p:id,number:number},
  			 

//               ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
               dataType: "json",
               success: function (msg) {
            	   
				   $("#user_7").replaceWith('<div id="user_8">'+msg.content+'</div>');
				 
					  	  preview.style.display="none";
				   console.log(msg.content);
            	   console.log("数据交互");
            	
            	   
               },
               error: function (msg) {
            	   
            	   
            	   
            	   
                   console.log("数据交互失败");
               }
           });
    	
     }     
    