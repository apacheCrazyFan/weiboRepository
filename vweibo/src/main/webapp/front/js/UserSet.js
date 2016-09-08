function panelOpen(infoId){
	for(var i=1;i<=5;i++){
		$('#perInfo_panel'+i).hide();	
		$('#perInfo'+i).show();
	}	
	$('#perInfo'+infoId).hide();
	$('#perInfo_panel'+infoId).show();
	
	if(infoId==4){
		$('#wrap').css('height','800px');
	}else if(infoId==5){
		$('#wrap').css('height','700px');
	}else{
		$('#wrap').css('height','550px');
	}
}

function panelClose(infoId){
	$('#perInfo_panel'+infoId).hide();
	$('#perInfo'+infoId).show();	
	$('#wrap').css('height','550px');
}
