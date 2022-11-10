document.addEventListener('turbolinks:load',function() {
    const control = document.querySelectorAll('#badge_rule_type')
    if (control){
        for (let i = 0; i < control.length; i++)
            control[i].addEventListener('change', fillRuleDescription)
    }
})
function fillRuleDescription(){
    const rule_type =  document.querySelectorAll('#badge_rule_type')[0]
    const rule_description =  document.querySelectorAll('#rule_description')[0]
    rule_description.value = rule_type[rule_type.selectedIndex].textContent
}
