/**
 * 
 */
 function search_admin(){
	  
	  var search_text=document.getElementById("search_text");
	  search_text.style.display="block";
	 var search_btn=document.getElementById("search_btn");
	  search_btn.style.display="block";
		  console.log(search_btn);
  }

 function roominfo_searchAdmin(pageNow){

 	   var keywords=document.getElementById("search_text").value;

 	   console.log(number);
     	   $.ajax({
                type: 'GET',

                url: 'admin/userManageAdmin',//在php中全局定义url，方便使用thinkphp的U方法
                 data: {pageNow:pageNow,keywords:encodeURI(keywords)},

//                ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
                dataType: "html",
                success: function (msg) {
                    preview.style.display="none";
 				   $("#server").html(msg);
 				 

 				   
             	   console.log("数据交互");
             	
             	   
                },
                error: function (msg) {
             	   
             	   
             	   
             	   
                    console.log("数据交互失败");
                }
            });
     	
      }     
 