document.addEventListener('turbolinks:load',function() {
    const control = document.querySelectorAll('.timer')[0]
    if (control){
        startTimer(control)
    }
})

function startTimer(control){
    let time_to_pass = parseInt(control.innerText)
    printTime(control, time_to_pass)
    let timer = setInterval(function () {
        if (time_to_pass <= 0) {
            clearInterval(timer)
            location.reload()
        } else {
            printTime(control, time_to_pass)
        }
        time_to_pass = time_to_pass - 1
    }, 1000)
}

function printTime(control, time_to_pass){
    let seconds = time_to_pass%60 // Получаем секунды
    let minutes = time_to_pass/60%60 // Получаем минуты
    let hours = time_to_pass/60/60%60 // Получаем часы
    let strTimer = `${String(Math.trunc(hours)).padStart(2, '0')}:${String(Math.trunc(minutes)).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`
    control.innerText = strTimer
}
