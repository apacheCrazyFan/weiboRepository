function openFile() 
{ 
	document.getElementById("myPhotoFile").click();  
} 
function openCommonFile() 
{ 
	document.getElementById("myCommonFile").click();  
}
function changeUpWay(){

	var right=document.getElementById("right");
	var right1=document.getElementById("right1");

	if(right.style.display!="none"){
		right.style.display="none";	
		right1.style.display="block";
	}else{
		right.style.display="block";	
		right1.style.display="none";
	}	
}


