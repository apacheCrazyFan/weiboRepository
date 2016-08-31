function compileAndClose(compId,compId1,id,height,compId2,compId3){
		var comp=$(compId);
		var comp1=$(compId1);
		
		var comp2=$(compId2);
		var comp2_1=$(compId2+"1");
		var comp3=$(compId3);
		var comp3_1=$(compId3+"1");
		
		var temp= comp2_1.is(":visible");//是否可见 

		var temp1= comp3_1.is(":visible");//是否可见 

 
		if(id==1){
			comp.hide();
			comp1.show();	
			if(temp){
				comp2_1.hide();
				comp2.show();	
			}
			if(temp1){
				comp3_1.hide();
				comp3.show();
			}
			
		}else if(id==2){
			comp.show();
			comp1.hide();
		}
		
		if(height==2){$("#wrap").height(800);}
		if(height==3){$("#wrap").height(700);}
		if(height==0){$("#wrap").height(550);}
		
	}