let inputName = document.querySelector(".saluda");
let buttonSaluda = document.querySelector(".boton");

buttonSaluda.addEventListener("click",function(event){
    alert("Hola " + inputName.value);
})
