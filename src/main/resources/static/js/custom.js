document.addEventListener("DOMContentLoaded", function(){
    /////// Prevent closing from click inside dropdown
    document.querySelectorAll('.dropdown-menu').forEach(function(element){
        element.addEventListener('click', function (e) {
            e.stopPropagation();
        });
    })
});
// DOMContentLoaded  end

$(document).ready(function(){

    $("input[type='radio']").click(function(){
        let rating = $("input[type='radio']:checked").val();
    });
});