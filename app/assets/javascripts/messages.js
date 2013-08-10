//for messages

k=0;

$(window).load(function(){
$(".animateHeight").bind("click", function(e){
   
    var myDiv = $(this);
    var div_class = myDiv.attr("id");
    
    if(k==0) {
		k++;
        $("." + div_class).fadeIn();
		$(".chatbox" + div_class).animateAuto("height", 1000); 
         
    }
   	else {
		k--;
        $(".chatbox" + div_class).animate({"height":"50px"}, 1000);    
		$("." + div_class).fadeOut();
   	}
});

jQuery.fn.animateAuto = function(prop, speed, callback){
    var elem, height, width;
    return this.each(function(i, el){

        el = jQuery(el), elem = el.clone().css({"height":"auto","width":"auto"}).appendTo("body");
        height = elem.css("height"),
        width = elem.css("width"),
        elem.remove();
        
        if(prop === "height")
            el.animate({"height":height}, speed, callback);
        else if(prop === "width")
            el.animate({"width":width}, speed, callback);  
        else if(prop === "both")
            el.animate({"width":width,"height":height}, speed, callback);
    });  
}


});