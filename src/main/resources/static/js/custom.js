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
        rating.onclick = document.getElementById("rating_form").submit();



    });
});

var inputSteps = document.getElementById("inputsteps");
inputSteps.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
            inputSteps.value += '- '
        }
});

var inputIngredients = document.getElementById("inputIngredients");
inputIngredients.addEventListener("keyup", function(event) {
    if (event.keyCode === 13) {
        inputIngredients.value += '- '
    }
});