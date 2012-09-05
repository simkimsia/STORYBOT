function fixLayout()
{
	var cont = document.getElementById("wrapper");
	var contHeight = cont.offsetHeight;
	
	wHeight = window.innerHeight;	

	if (document.all && !window.opera) {
		wHeight = document.documentElement.clientHeight;
	}

	if (contHeight < wHeight)
	{
		cont.style.marginTop = (wHeight - contHeight) / 2 + "px";
	}
	else
	{
		cont.style.marginTop = "0px";
	}

}
if (window.addEventListener){
	window.addEventListener("resize", fixLayout, false);
	window.addEventListener("load", fixLayout, false);
}
else if (window.attachEvent){
	window.attachEvent("onresize", fixLayout);
	window.attachEvent("onload", fixLayout);
}