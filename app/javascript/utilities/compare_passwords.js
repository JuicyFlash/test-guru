document.addEventListener('turbolinks:load',function() {
    var control = document.querySelectorAll('.pass_confirmation')
    if (control){
        for (var i = 0; i < control.length; i++)
        control[i].addEventListener('input', comparePasswords)
    }
})
function comparePasswords(){
    var pass =  document.getElementsByName('user[password]')[0]
    var passConfirm =  document.getElementsByName('user[password_confirmation]')[0]

    if (pass?.value.length == 0 && passConfirm.value.length == 0){
        pass.className='form-control'
        passConfirm.className='form-control'
        return
    }
    if (pass?.value == passConfirm?.value){
        pass.className='form-control border-success'
        passConfirm.className='form-control border-success'
    }
    else {
        pass.className='form-control is-invalid'
        passConfirm.className='form-control is-invalid'
    }

}

