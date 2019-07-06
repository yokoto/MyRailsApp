$(document).on("turbolinks:load", function() {
  /* drop down menu */
  $("li.nav-item.dropdown span").on("click", function(e){
    $("ul.drop-menu").toggleClass("open");
  });
});