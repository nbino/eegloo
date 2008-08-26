var mInt = null, startScroll;

function na() {
	return;
}

function onscroll(e) {
	if (mInt)
		clearInterval(mInt);
	else
		startScroll = document.documentElement.scrollTop;

	mInt = setInterval("moveDiv()", 300);
}

function getScrollY(){
	if(window.pageYOffset){
		var num = window.pageYOffset;
	}else if(document.documentElement && document.documentElement.scrollTop){
		var num = document.documentElement.scrollTop;
	}else{
		var num = document.body.scrollTop;
	}
	return num;
}

function moveDiv() {
	var num = getScrollY();	
	if(startScroll==num){
		clearInterval(mInt);
		mInt = null;
		doMmove(num);		
	}	
	
	startScroll = num;
}

function getPosition( oLink ) {
	if( oLink.offsetParent ) {
		  var posX = null, posY = null;
		for( posX = 0, posY = 0; oLink.offsetParent; oLink = oLink.offsetParent ) {
  			posX += oLink.offsetLeft;
  			posY += oLink.offsetTop;
		}
	
		return [ posX, posY ];
	}
	
	return [ oLink.x, oLink.y ];
}

function doMmove(num) {
	var scrollBox = document.getElementById('mapouter');
	var mapTop = getPosition($('rightbar'));
	if(num>(mapTop[1]-4))
		new Effect.Move(scrollBox,{x:0, y: (num-(mapTop[1]-4)), mode: 'absolute'});				
	else
		new Effect.Move(scrollBox,{x:0, y: 0, mode: 'absolute'});			
}