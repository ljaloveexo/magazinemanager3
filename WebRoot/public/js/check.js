
/*检查表单为空*/
function check(){
	
	
	var inputs=document.getElementsByTagName("input");
	var image=document.getElementById("img");
    console.log(image);
	for(var i=0;i<3;i++){
		if(inputs[i].value==""){
			 
			 alert("表单不能为空！");
			 image.src=image.src+'?'+Math.random();
			
			 event.preventDefault();
			 
			 return false;
	}
		 
	}
 
         
	var flag=false;
	var radios=form1.login;
	for(var i=0;i<radios.length;i++){
		if(radios[i].checked==true){
			flag=true;
		}
	}
	
	if(flag==false){
	    alert("未选择任何类型！");
	    image.src=image.src+'?'+Math.random();
	    event.preventDefault();
	    
	   
	    return false;
}
	var data=$("#form-login").serializeArray();
	console.log(data);

	var json_data={};
	for(var i=0;i<data.length;i++){
		var key=data[i].name;

		json_data[key]=data[i].value;
		
	}
	
	console.log(json_data);
	var inputStr = data[2].value.toUpperCase();
	var type=data[3].value;
	 $.ajax({
         type: 'POST',
         url:'user/checkLogin?inputStr='+inputStr+'&type='+type,//在php中全局定义url，方便使用thinkphp的U方法

		 data:json_data,

//         ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
         dataType: "json",
         success: function (data) {
         
         if(type=='user'){

			 alert(3);
        	 self.location.href='user/infoUserFind';
         }
			 if(type=="admin"){
				 alert(4);
				 self.location.href='admin/classroominfoAdminShow';
			 }
         if(data=='-1'){
        	 alert('验证码错误！');
        	 image.src=image.src+'?'+Math.random();
         }
         if(data=='0'){
        	 console.log(data);	
        	 alert('用户名或密码错误！');
        	 image.src=image.src+'?'+Math.random();
         }
         },
         error: function (data) {
             console.log("数据交互失败");
         }
     });
 }


	
	

var logina=document.getElementById("logina");
var text=logina.innerHTML;
var object=document.getElementById("reset");
function reset_view(){
	console.log("1");
	
	var radio= $('input:radio[name="login"]:checked').val();
	  console.log(radio);
		    	if(radio=="user"){
					
					
					logina.innerHTML="";		    		
					logina.innerHTML=object.innerHTML;
		    		
					console.log(2);
				}
				if(radio=="admin"){
					logina.innerHTML="";
					logina.innerHTML=object.innerHTML;
					var tr=document.getElementById("reset_tbody");
					console.log(tr);
					var childs = tr.children; 
					
					var text=childs[0].children[0].childNodes[0];
					console.log(text);
					text.data='用户名:';
					for(var i =3; i >= 2; i--) { 
						
						tr.removeChild(childs[i]); 
						}
					
					
					
					
				}
				if(radio==null){
					alert("你未选择任何类型！");
				}
}
 
 function change(){
	   
		logina.innerHTML=text;
		
		var image=document.getElementById("img");
		image.src=image.src+'?'+Math.random();
		
 }


