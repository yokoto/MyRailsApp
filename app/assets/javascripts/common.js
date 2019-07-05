$(document).on("turbolinks:load", function() {
  $("li.nav-item.dropdown a").on("click", function(e){
    e.preventDefault();
    $("ul.drop-menu").toggleClass("open")
  })
});