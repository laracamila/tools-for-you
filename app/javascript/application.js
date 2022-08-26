// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import "stimulus"

//= require flatpickr

document.addEventListener('DOMContentLoaded', function() {
  flatpickr('.your-selector');
})
