// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require popper
//= require bootstrap
//= require bootstrap

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"

import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "utilities/sorting"
import "utilities/compare_passwords"
import "utilities/form_inline"
import "utilities/fill_progress_bar"


Rails.start()
Turbolinks.start()
ActiveStorage.start()
