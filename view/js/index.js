$(document).ready(function () {
    //@naresh action dynamic childs
    var next = 0;
    $("#add-more").click(function(e){
        e.preventDefault();
         $("#question-id").append('<br><br><div class="form-group">'+
            '<label class="col-md-2 control-label" for="action_question">Question</label>'+
            '<div class="col-md-5">'+
            '<input id="action_question" name="question[]" type="text" placeholder="" class="form-control input-md">'+
            '</div></div>');  
    });

    // $("#remove-more").on("click", function() {  
    //             $("#question-id").children().last().remove();  
    // }); 

});
