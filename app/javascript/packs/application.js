// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import jQuery from "jquery"
import feather from "feather-icons"
import Chart from "chart.js/auto"
import dayjs from "dayjs"
import "dayjs/locale/id"
import "channels"
import "stylesheets/application"

dayjs.locale('id')

global.$ = jQuery
global.jQuery = jQuery
global.window.jQuery = jQuery
global.feather = feather
global.bootstrap = require("bootstrap")
global.Chart = Chart
global.dayjs = dayjs

Rails.start()
Turbolinks.start()
ActiveStorage.start()
