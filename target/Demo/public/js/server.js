
function server(pageNow){
	var keywords= document.getElementById("search_text").value;
	keywords=encodeURI(keywords);
		$.ajax({
			type: 'GET',
			url:'user/orderResultUser',//在php中全局定义url，方便使用thinkphp的U方法
            data:{pageNow:pageNow,keywords:keywords},
//               ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
            dataType:'html',
			success: function (msg) {
                console.log('号');
                preview.style.display="none";
				$("#server").html(msg);



				if(document.getElementsByClassName("6")==null){
					var info_page=document.getElementById("info_page");
					//info_page.innerHTML='<img style="margin-top:50px;position: absolute;margin-left: 400px;" src="/classroomorder_ThinkPHP/Public/images/tip.png">';
					//console.log($("#info_page").innerHTML);
				}
				else{


					var b=document.getElementsByClassName("6");
					console.log(b);
					var td=new Array();
//        			    console.log(rs[i]);$(".6").size()
					for(var i=0;i<b.length;i++){
						if(b[i].innerHTML!="待处理"){
							td[i]=b[i];
							console.log(td[i]);
						}
					}
					var rs=new Array();
					for(var i=0;i<td.length;i++){
						rs[i]=td[i].parentNode;
						console.log(rs[i]);
					}

					var images=new Array();
					for(var i=0;i<rs.length;i++){
//        			   images[i]=rs[i].getElementById("image2");
						images[i]=rs[i].childNodes[17].children[1];
						images[i].setAttribute("onclick","return: false;");
						images[i].setAttribute("style","opacity:0.3");
						console.log(images[i]);
					}
					var images=document.getElementsByClassName("image");

				}

			},
			error: function (msg) {

				console.log(msg);


				console.log("数据交互失败");
			}
		});

     }     




function update_User(data){
    var hidden_2=data.parentNode;
  
	var date=document.getElementById("Wdate").value;
	var time=document.getElementById("time").value;
    var address=document.getElementsByTagName("p");
    var address=address[1].innerHTML;
    
	var sel=document.getElementById("selectNumber");
	var index = sel.selectedIndex;
	var number = sel.options[index].innerHTML;
   
   
	var reason=document.getElementById("reason").value;
	var id=hidden_2.previousElementSibling.value;
	  console.log(id);
//	console
	var data={};
	data['date']=date;
	data['time']=time;	  
	data['number']=number;
	
	
	data['reason']=reason;

	var data=JSON.stringify(data);
	var flag="";

	console.log(data);
	
	  $.ajax({
             type:'POST',
             url: 'update_User',//在php中全局定义url，方便使用thinkphp的U方法;
             data:{"date":date,"time":time,"number":number,"reason":reason,"address":address,"id":id},
//             ajax要求json对象或json字符串才能传输,json_data只是json字符串而已
             dataType: "json",
             
             success: function (data) {
            	 
				if(data['result']=='1'){
					
					alert("修改成功！");
					
				}
				if(data['result']=='0'){
					alert("预订失败！");
					
				}
				if(data['result']=='-1'){
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
    