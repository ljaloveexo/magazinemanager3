/**
 * 
 */
function roominfoAdd(){
	

//	 var number=document.getElementsByTagName("input")[0];
	 var number=$("#number").val();
//	 var address=document.getElementsByTagName("input")[1];
	 var address=$("#address").val();
//	 var capacity=document.getElementsByTagName("input")[2];
	 var capacity=$("#capacity").val();
	var configuration=$("#configuration").val();
	 if(number==""||address==""||capacity==""||configuration==""){
		 alert("你输入的信息不完整！");
		 return false;
	 }
	   $.ajax({
       type: 'POST',
       url: 'admin/isAddClassRoomInfo',//在php中全局定义url，方便使用thinkphp的U方法
        data: {number:number,address:address,capacity:capacity,configuration:configuration},
		 

//       ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
       dataType: "html",
       success: function (msg) {
		   console.log(msg);
       	if(msg==0){
       		alert("该教室已存在！");
       	}

       	else{
       		alert("添加成功！");

				  	  //preview.style.display="none";
			$("#server").html(msg);
    	   console.log(msg);
    	
       	}
       },
       error: function (msg) {



		   console.log("失败");
           console.log(msg);
       }
   });
	
}