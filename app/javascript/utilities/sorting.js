document.addEventListener('turbolinks:load',function() {
    var control = document.querySelector('.sort-by-title')
    if (control){
        control.addEventListener('click', sortByTitle)
    }
})

function sortByTitle() {
    var itemsList = document.querySelector('.items-list')
    var items = document.querySelectorAll('.list-group')
    var sortedItems = []
    for (var i = 0; i< items.length; i++)
    {
        sortedItems.push(items[i])
    }
   if (this.querySelector('.octicon-arrow-up').classList.contains('hide')){
        sortedItems.sort(compareItemsAsc)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    }
    else {
        sortedItems.sort(compareItemsDesc)
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
        this.querySelector('.octicon-arrow-up').classList.add('hide')
    }


    var sortedItemsList = document.createElement('div')
    sortedItemsList.classList.add('col-7', 'items-list')

    for (var i = 0; i < sortedItems.length; i++){
        sortedItemsList.appendChild(sortedItems[i])
    }
    itemsList.parentNode.replaceChild(sortedItemsList,itemsList)

}

function compareItemsAsc(item1, item2) {
    var testTitle1 = item1.innerText.split('\n',1)[0]
    var testTitle2 = item2.innerText.split('\n',1)[0]
    if (testTitle1 < testTitle2) {return -1}
    if (testTitle1 > testTitle2) {return 1}
    return 0
}

function compareItemsDesc(item1, item2) {
    var testTitle1 = item1.innerText.split('\n',1)[0]
    var testTitle2 = item2.innerText.split('\n',1)[0]
    if (testTitle1 < testTitle2) {return 1}
    if (testTitle1 > testTitle2) {return -1}
    return 0
}