


    function d_show()
    {
		var login = document.getElementById('logining');
        logining.style.display = "block";
        overing.style.display = "block";
    }
    function d_hide()
    {
		var over = document.getElementById('overing');
        logining.style.display = "none";
        overing.style.display = "none";
    }
  
   function selectAll(){
   
		   var checkboxs=GetAllChecked();
		   for(var i=0;i<checkboxs.length;i++){
			   
		  
				   console.log(checkboxs);
				   checkboxs[i].checked=true;
		   }		   

	   }
	function selectNot(){
		 var checkboxs=GetAllChecked();
		   for(var i=0;i<checkboxs.length;i++){
				   console.log(checkboxs);
				   checkboxs[i].checked=false;
					   
					   
				   
			   }
		   }
	  
	
	   
   
   
   
   
   function GetAllChecked(){
	   var obj=document.getElementById("server");
	   var inputs=obj.getElementsByTagName("input");
	   var checkboxs=new Array();
	   var index=0;
	   for(var i=0;i<inputs.length;i++)
	   if(inputs[i].type=="checkbox"){
		   checkboxs[index]=inputs[i];
		   index++;
	   }
	  return  checkboxs;
   }
  
   
	   