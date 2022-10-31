document.addEventListener('turbolinks:load',function() {
    var control = document.querySelectorAll('#badge_rule_type')
    if (control){
        for (var i = 0; i < control.length; i++)
            control[i].addEventListener('change', fillRuleDescription)
    }
})
function fillRuleDescription(){
    var rule_type =  document.querySelectorAll('#badge_rule_type')[0]
    var rule_description =  document.querySelectorAll('#rule_description')[0]
    rule_description.value = rule_type[rule_type.selectedIndex].textContent
}
