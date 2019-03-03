/**
 * 
 */
function serverAdmin(pageNow){
	var keywords=document.getElementById("search_text").value;
	keywords=encodeURI(keywords);
	console.log(keywords);
	   $.ajax({
         type: 'GET',
         url: url,//在php中全局定义url，方便使用thinkphp的U方法
          data: {pageNow:pageNow,keywords:keywords},
		 

//         ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
		   dataType:'html',

//       ajax要求json对象或json字符串才能传输,json_data只是json字符串而已

		   success: function (msg) {
			   preview.style.display="none";

			   $("#server").html(msg);

			   console.log(info_page.innerHTML);




		   },
		   error: function (msg) {




			   console.log(msg);
		   }
	   });
	
}


function serverOperate(id){
	
	 var id=id;
	
	   $.ajax({
        type: 'POST',
        url: 'orderoperationFindAll',//在php中全局定义url，方便使用thinkphp的U方法
         data: {p:id},
		 

//        ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
        dataType: "json",
        success: function (msg) {
     	      if(msg.content==0){
     	    	 $("#server").replaceWith('<img style="margin-top:50px;" src="/classroomorder_ThinkPHP/Public/images/tip.png" /><p>没有找到任何结果！</p>');
     	    	 var search=document.getElementById("search");
     	 	   var button_1=document.getElementById("button_1");
     	 	   var button_2=document.getElementById("button_2");
     	 	   	 search.style.cssText="margin-left: 20px;position: absolute;display: block;border: none;background-color: #444;color: #fff;border-radius: 3px;width: 136px;height: 30px;text-align: center;opacity:0.2";
     	 	   	 search.setAttribute("onclick","javascript:return false");
     	 	   	 button_1.style.cssText="height:31px;width: 77px;font-size: 13px;border-radius: 8px;background-color: rgb(56, 59, 66); color: white;  font-weight: bold;display: inline-block;margin-left: 20px;opacity:0.2";
     	 	   	 button_1.setAttribute("onclick","javascript:return false");
     	 		 button_2.style.cssText="height:31px;width: 77px;font-size: 13px;border-radius: 8px;background-color: rgb(56, 59, 66); color: white;  font-weight: bold;display: inline-block;margin-left: 20px;opacity:0.2";
     	 		 button_2.setAttribute("onclick","javascript:return false");
     	 		 console.log(2);
     	      }
     	      else{
     	    	  $("#server").replaceWith('<div id="user_11">'+msg.content+'</div>');
     	      
			 
				  	  preview.style.display="none";
     	  
     	      }
     	   
        },
        error: function (msg) {
     	   
     	   
     	   
     	   
            console.log("数据交互失败");
        }
    });
	   
	  
	     
}
function serverRecord(pageNow){
   console.log(pageNow);


	$.ajax({
		type: 'GET',
		url: 'admin/orderrecordAdmin',//在php中全局定义url，方便使用thinkphp的U方法
		data:{pageNow:pageNow},
		dataType:'html',

//       ajax要求json对象或json字符串才能传输,json_data只是json字符串而已

		success: function (msg) {
			preview.style.display="none";

			$("#server").html(msg);

			console.log(info_page.innerHTML);




		},
		error: function (msg) {




			console.log(msg);
		}
	});
	  
   	
	

}

function infoAdmin(id){
	
	 var id=id;
	   $.ajax({
        type: 'POST',
        url: 'adminfindAll',//在php中全局定义url，方便使用thinkphp的U方法
         data: {p:id},
		 

//        ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
        dataType: "json",
        success: function (msg) {
     	   
			   $("#server").replaceWith('<div id="user_11">'+msg.content+'</div>');
			 
				  	  preview.style.display="none";
     	   console.log("数据交互");
     	
     	   
        },
        error: function (msg) {
     	   
     	   
     	   
     	   
            console.log("数据交互失败");
        }
    });
	
}
function infoUser(id){
	
	 var id=id;
	   $.ajax({
       type: 'POST',
       url: 'userfindAll',//在php中全局定义url，方便使用thinkphp的U方法
        data: {p:id},
		 

//       ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
       dataType: "json",
       success: function (msg) {
    	   
			   $("#server").replaceWith('<div id="user_11">'+msg.content+'</div>');
			 
				  	  preview.style.display="none";
    	   console.log("数据交互");
    	
    	   
       },
       error: function (msg) {
    	   
    	   
    	   
    	   
           console.log("数据交互失败");
       }
   });
	
}
function userAdd(id){
	
	 var id=id;

	 var account=$("#account").val();
     
	 var name=$("#name").val();

	 var academy=$("#academy").val();
	 var major=$("#major").val();
	 var tel=$("#tel").val();
	 var mail=$("#mail").val();
	 if(account==""||name==""||academy==""||major==""||tel==""||mail==""){
		 alert("你输入的信息不完整！");
		 return false;
	 }
	   $.ajax({
      type: 'POST',
      url: 'isadduserinfo',//在php中全局定义url，方便使用thinkphp的U方法
       data: {p:id,account:account,name:name,academy:academy,major:major,tel:tel,mail:mail},
		 

//      ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
      dataType: "json",
      success: function (msg) {
      	if(msg.content==2){
      		alert("该用户已存在！");
      	}
   	   
      	else{
      		alert("添加成功！");
      		$("#user_11").replaceWith('<div id="user_10">'+msg.content+'</div>');
//      		   var preview=document.getElementById("preview");
//			 
//				  	  preview.style.display="none";
   	   console.log("数据交互");
   	
      	}  
      },
      error: function (msg) {
   	   
   	   
   	   
   	   
          console.log("数据交互失败");
      }
  });
}
function admimAdd(id){
	
	 var id=id;

	 var account=$("#account").val();
     var password=$("#password").val();
	 var name=$("#name").val();
	 var tel=$("#tel").val();
	 var mail=$("#mail").val();
	 if(account==""||password==""||name==""||tel==""||mail==""){
		 alert("你输入的信息不完整！");
		 return false;
	 }
	   $.ajax({
     type: 'POST',
     url: 'isaddadmininfo',//在php中全局定义url，方便使用thinkphp的U方法
      data: {p:id,account:account,name:name,password:password,tel:tel,mail:mail},
		 

//     ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
     dataType: "json",
     success: function (msg) {
     	if(msg.content==2){
     		alert("该管理员已存在！");
     	}
  	   
     	else{
     		alert("添加成功！");
     		$("#user_11").replaceWith('<div id="user_10">'+msg.content+'</div>');
//     		   var preview=document.getElementById("preview");
//			 
//				  	  preview.style.display="none";
  	   console.log("数据交互");
  	
     	}  
     },
     error: function (msg) {
  	   
  	   
  	   
  	   
         console.log("数据交互失败");
     }
 });
}
















function user_searchAdmin(pageNow){

	   var keywords=document.getElementById("search_text").value;
	   
  	   $.ajax({
             type: 'GET',
             url: 'admin/userManageAdmin',//在php中全局定义url，方便使用thinkphp的U方法
              data: {pageNow:pageNow,keywords:keywords},
			 

//             ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
             dataType: "json",
             success: function (msg) {
				 preview.style.display="none";
				 $("#server").html(msg);
          	   console.log("数据交互");
          	
          	   
             },
             error: function (msg) {

                 console.log(msg);
             }
         });
  	
   }

function admin_searchAdmin(id){
 	
	   
	   var id=id;
	   var number=document.getElementById("search_text").value;
	   console.log(number);
	   $.ajax({
          type: 'POST',
          url: 'admin_searchAdmin',//在php中全局定义url，方便使用thinkphp的U方法
           data: {p:id,account:number},
			 

//          ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
          dataType: "json",
          success: function (msg) {
       	   
				   $("#user_11").replaceWith('<div id="user_8">'+msg.content+'</div>');
				 
					  	  preview.style.display="none";
				   
       	   console.log("数据交互");
       	
       	   
          },
          error: function (msg) {
       	   
       	   
       	   
       	   
              console.log("数据交互失败");
          }
      });
	
}






function update_roominfo(data){
	   var image=document.getElementsByClassName("image"); 
	  
	    var result="";
		var td=data.parentNode;
		var tr=td.parentNode;
		var obj=tr.getElementsByTagName("td");
		var text=new Array();
		console.log(obj);
		  for(var i=0;i<3;i++){
			  text[i]=obj[i].innerHTML;
  			obj[i].innerHTML='<input type="text" id="reason" class="edit" value="">';
  		 
  		  var edits=document.getElementsByClassName("edit");
  		  
  				edits[i].setAttribute("value",text[i]);
		  }
		  image[0].src='/classroomorder_ThinkPHP/Public/images/complete.png';
		  image[0].setAttribute("onclick","updateinfo_admin();");
		  
}


function updateinfo_admin(){
	var edits=document.getElementsByClassName("edit");
	var number=edits[0].value;
	
	var address=edits[1].value;
	var capacity=edits[2].value;
	var id=$("#hidden_3").val();
	  $.ajax({
             type:'POST',
             url: 'updateinfo_Admin',//在php中全局定义url，方便使用thinkphp的U方法;
             data:{"number":number,"address":address,"capacity":capacity,"id":id},
//             ajax要求json对象或json字符串才能传输,json_data只是json字符串而已 "configuration":configuration,
             dataType: "json",
             
             success: function (data) {
            	 
				if(data['result']=='1'){
					
					alert("修改成功！");
					
				}
//				if(data['result']=='0'){
//					alert("预订失败！");
//					
//				}
//				if(data['result']=='-1'){
//					alert("已被预订！");
//					
//				}
				location.reload(true);
             },
            
             error: function (data) {
            	 

            	 alert(c);
                 console.log("数据交互失败");
             }
             
         });
	  
	
 
 }

function updateUserinfo_admin(data){
	   var image=document.getElementsByClassName("image"); 
	  
	    var result="";
		var td=data.parentNode;
		var tr=td.parentNode;
		var obj=tr.getElementsByTagName("td");
		var text=new Array();
		console.log(obj);
		  for(var i=0;i<6;i++){
			  text[i]=obj[i].innerHTML;
			obj[i].innerHTML='<input type="text" id="reason" class="edit" value="">';
		 
		  var edits=document.getElementsByClassName("edit");
		  
				edits[i].setAttribute("value",text[i]);
		  }
		  image[0].src='/classroomorder_ThinkPHP/Public/images/complete.png';
		  image[0].setAttribute("onclick","updateUserinfoShow_admin();");
		  edits[0].setAttribute("readOnly","readonly");
		  edits[0].style.cssText='background-color:grey;opacity:0.4';
}


function updateUserinfoShow_admin(){
	var edits=document.getElementsByClassName("edit");
	var account=edits[0].value;
	var name=edits[1].value;
	var academy=edits[2].value;
	var major=edits[3].value;
	var tel=edits[4].value;
	var mail=edits[5].value;
	var id=$("#hidden_4").val();
	  $.ajax({
          type:'POST',
          url: 'updateUserinfoShow_admin',//在php中全局定义url，方便使用thinkphp的U方法;
          data:{"account":account,"name":name,"academy":academy,"major":major,"tel":tel,"mail":mail,"id":id},
//          ajax要求json对象或json字符串才能传输,json_data只是json字符串而已 "configuration":configuration,
          dataType: "json",
          
          success: function (data) {
         	 
				if(data['result']=='1'){
					
					alert("修改成功！");
					
				}
//				if(data['result']=='0'){
//					alert("预订失败！");
//					
//				}
//				if(data['result']=='-1'){
//					alert("已被预订！");
//					
//				}
				location.reload(true);
          },
         
          error: function (data) {
         	 

         	 alert(c);
              console.log("数据交互失败");
          }
          
      });
	  
	

}
 


	













	







