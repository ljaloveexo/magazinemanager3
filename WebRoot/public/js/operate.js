var btn=document.getElementsByName("operate");
function admin(data){
	  if(data.value=="提交"){
		  data.value=$("#disagree_reason").val();
		  console.log(data.value);

	  }

	   var checkbox=document.getElementsByName("test");
	   var arr=[];
	   for (var  i in checkbox){
		   if(checkbox[i].checked){
			   arr.push(checkbox[i].value)
		   }

	   }
       if(arr.length==0){
		   alert("未进行任何操作！");

		   return false;
	   }
       if(arr.length==1){
		   var id=arr.join("");
	   }
	else {
		   id=arr.join(",");
	   }



	   $.ajax({
		   type: 'POST',
		   url:'admin/operateAdmin',//在php中全局定义url，方便使用thinkphp的U方法
		   data: {id:id,result:data.value},


//       ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
		   dataType: "html",
		   success: function (msg) {
			   console.log(msg);
			   alert("处理成功！");
			   $("#server").html(msg);
		   },
		   error: function (msg) {



			   console.log("失败");
			   console.log(msg);
		   }
	   });


   }


   function user(){
	   alert("修改成功！");
   }
   function deleteUser(id){


		   $.ajax({
			   type: 'POST',
			   url: 'user/deleteOrder',//在php中全局定义url，方便使用thinkphp的U方法
			   data: {id:id},

//	          ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
			   dataType: "html",
			   success: function (msg) {
				   alert("删除成功！");
				   $("#server").html(msg);
			   },

			   error:function(msg){
				   console.log(msg);
			   }
		   });


   }
   function update(data){


	   console.log(data);
	   var td=data.parentNode;
	   console.log(td);
	   var tr=td.parentNode;
	   console.log(tr);
	   var obj=tr.cells;
	   console.log(obj);
	   var address=document.getElementsByClassName("address_info");
	   console.log(address);
	   //for(var i=0;i<address.length;i++){
		//   if(address[i].value==obj){
		//
		//   }
	   //}

	   var result="";


		var tr=td.parentNode;
		var obj=tr.getElementsByTagName("td");

		var image=obj[7].getElementsByClassName("image"); 
		var text=new Array();
		console.log(image);
		  for(var i=0;i<3;i++){

			  text[0]=obj[2].innerHTML;
			  text[1]=obj[3].innerHTML;
			  text[2]=obj[5].innerHTML;
		  }
		  var number=obj[0].innerHTML;
		  var data_2=obj[3].innerHTML;
		    console.log(data_2);

	        	  for(var j=0;j<obj.length-1;j++){
	        		    data=obj[0].innerHTML;
	        		   
	        			obj[0].innerHTML=msg;
	        			obj[2].innerHTML='<input type="date" name="date" class="Wdate" id="Wdate" />';
obj[3].innerHTML='<select name="time" id="time" style="width: 100px; height: 25px"> <option value="1-2节">1--2 节</option><option value="3-4节">3--4 节</option><option value="noon">中 午</option><option value="5-6节">5--6 节</option><option value="7-8节">7--8 节</option><option value="9-11节">9--11 节</option></select>';
	        			obj[5].innerHTML='<input type="text" id="reason" class="edit" value="">';
	        		  }
	        		  var edits=document.getElementsByClassName("edit");
	        		  
	        				edits[0].setAttribute("value",text[2]);
	        		  
	        		  var data=document.getElementById("hidden").value;

	        		  var options=document.getElementById("selectNumber").options;
	        		  for(var i=0;i<options.length;i++){
	        		 	if(options[i].text==data){
	        		  		options[i].setAttribute("selected","selected");
	        		 		console.log(options[i].selected);
	        		 		break;
	        		 	}
	        		 
	        		  }
	        		 

	        		  var options=document.getElementById("time").options;
	        		  for(var i=0;i<options.length;i++){
	        		 	if(options[i].value==data_2){
	        		  		options[i].setAttribute("selected","selected");
	        		 		
	        		 		break;
	        		 	}
	        		 
	        		  }
	        		  image[0].src='/classroomorder_ThinkPHP/Public/images/complete.png';
	        		  image[0].setAttribute("onclick","update_User(this);");
	       	var element_2=document.createElement('script');
	       	element_2.innerHTML='$(".bckguser").ready(function(){date();});';
	        document.body.appendChild(element_2);
	        $("#Wdate").val(text[0]);

	  
	
   }
   
   function show_sub(data){
	     var value=$("#selectNumber").val();
	     
	     var td=data.parentNode;
	     var tr=td.parentNode;
	     
	     var address=tr.getElementsByTagName("p");
	     
		 address[0].innerHTML=value;
		 
	 }
   
   