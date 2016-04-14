$(document).ready(function(){
	
    var max_fields      = 10;
    var wrapper         = $("#skillform");
    var add_button      = $(".add_field_button");
    var x = 1;




$(add_button).click(function(e){
        e.preventDefault();
        console.log("clicked")
        if(x < max_fields){
            x++;
            $(wrapper).append('<div><input type="text" name="skills[]" id="skills_"/><a href="#" class="remove_field">Remove</a></div>');
        }
    });


	$(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    });

})