/**
 * 
 */
function dateToString(d){
	var y=d.getFullYear();
	  
    var m=d.getMonth()+1;
  
    var d=d.getDate();
   
   
    if(m.toString().length==1)
    	m="0"+m;
    if(d.toString().length==1)
    	d="0"+d;
   return y+"-"+m+"-"+d; 
}




function date(){
	
		
	
	var now=new Date();
	
	now=now.valueOf();
	
    var min=now+2*24*60*60*1000;
    var max=now+7*24*60*60*1000;
    var d=new Date(min);
    var minDate=dateToString(d);
    document.getElementById("Wdate").min=minDate;
    
    var d=new Date(max);
    
    var maxDate=dateToString(d);
    
    document.getElementById("Wdate").max=maxDate;

	
}
