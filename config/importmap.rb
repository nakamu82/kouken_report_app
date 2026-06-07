# Pin npm packages by running ./bin/importmap
#pin "application"

pin "application", preload: true

pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin "controllers", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
