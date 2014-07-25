$(function() {
  $("#investors th a, #investors .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#investors_search input").keyup(function() {
    $.get($("#investors_search").attr("action"), $("#investors_search").serialize(), null, "script");
    return false;
  });
});






