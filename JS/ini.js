$(function(){
var pop = function(){
	$('#screen').css({"display": "block", opacity: 0.8, "width":$(document).width(),"height":$(document).height()});
	$('#box').css({"display": "block"}).click(function(){});
}

var hideWindow = function(){
	$('#box').css({"display": "block"}).click(function(){$(this).css("display", "none");$('#screen').css("display", "none")});
}

$('#button').click(pop);
$('#loginButton').click(pop);
$('#close').click(hideWindow);

$(window).resize(function(){
	$('#box').css("display") == 'block'?pop.call($('#button')):"";
});
});
