

 var sec=5; 

 

 

 

function showSecond(){ 

 

 

if(sec<1){ 

 

 

 

location='../../../userquery.jsp';

 

 

 

return; 

 

 

} 

 

 

document.getElementById('secs').innerText=sec; 

 

 

sec--; 

 

 

setTimeout("showSecond()",1000); 

 

} 

 

  









