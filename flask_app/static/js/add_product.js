var todos_calses = document.querySelectorAll('.haceralgo')
document.getElementById("category_id").addEventListener("change", function(){
    var e = document.getElementById("category_id");
    var selected = e.options[e.selectedIndex].text;
    todos_calses.forEach((cadai, i) =>{
        todos_calses[i].hidden = true
    })
        
    var tenecesito = selected+"seleccion"
    document.getElementById(tenecesito).hidden = false
    console.log(document.getElementById(tenecesito))


});



