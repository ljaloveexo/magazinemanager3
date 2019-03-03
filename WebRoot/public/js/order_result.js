 function order_result(){
	var date=document.getElementById("Wdate").value;
	var time=document.getElementById("time").value;
	
	
	var sel=document.getElementById("selectNumber");
	var index = sel.selectedIndex;
	var number = sel.options[index].text;
	 var address =sel.options[index].dataset["value"];
	 console.log(number);
	var reason=document.getElementById("reason").value;
    var data={"number":number,"address":address,"date":date,"time":time,"reason":reason};
    data=JSON.stringify(data);
	 console.log(data);
	 var url='user/order?number='+number+'&address='+address+'&orderdate='+date+'&time='+time+'&reason='+reason;
	 console.log(date);
     url=encodeURI(encodeURI(url));
	 $.ajax({
             type:'POST',
             url:url,//在php中全局定义url，方便使用thinkphp的U方法

//             ajax要求json对象或json字符串才能传输,json_data只是json字符串而已

             
             success: function (data) {
//            	 var data=eval("("+data+")");
            	
            	
				if(data==1){
					
					alert("预订成功！");
					
				}
				if(data==-1){
					alert("预订失败！");
					
				}
				if(data==0){
					alert("已被预订！");
					
				}
				location.reload(true);
             },
            
             error: function (data) {
            	 

            	 alert(c);
                 console.log("数据交互失败");
             }
             
         });
	  
	
 
 }
 


	













	