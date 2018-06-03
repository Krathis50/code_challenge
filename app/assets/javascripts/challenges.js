// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {
    $("#usrSubmit").on("click",function(){
        $.ajax({
            url: "getoutput",
            type: "GET",
            datatype: 'json',
            success: function(usrdata) {
                console.log("hey i worked.");
                $("#usrOutput").val(usrdata);
                console.log(usrdata);
                    document.getElementById("usrSubmit").disabled = false;
            },
            error: function(usrdata) {
               alert("error");
               console.log(usrdata);
               var data = $.parseJSON(usrdata);
               console.log(data.status);

            }
        });
    });
    $(document).on("ajaxComplete", function(event, xhr, settings) {
        var csrf_param = xhr.getResponseHeader('X-CSRF-Param');
        var csrf_token = xhr.getResponseHeader('X-CSRF-Token');
      
        if (csrf_param) {
          $('meta[name="csrf-param"]').attr('content', csrf_param);
        }
        if (csrf_token) {
          $('meta[name="csrf-token"]').attr('content', csrf_token);
        }
      });
});
