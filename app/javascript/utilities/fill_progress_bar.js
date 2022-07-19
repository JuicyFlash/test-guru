document.addEventListener('turbolinks:load',function() {
 var progressBar = document.querySelector('.progress-bar')
 var progress = document.querySelector('.questions_params')

 if (progressBar && progress) {
  progress = progress.dataset.currentQuestionNumber
  fill(progress, progressBar)
 }

})

function fill(progress, element){
 barElements = element.querySelectorAll('.bar-element')
 var i = 0
 while (i < progress) {
  barElements[i].classList.add('filled')
  i++
 }
}
