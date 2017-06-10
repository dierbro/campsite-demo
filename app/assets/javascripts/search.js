$( document ).on('ready', function() {
  $("input#child-search").on("keyup", function(){
    $.ajax({
      type: "GET",
      dataType: "script",
      url: $(this).data("search-url"), 
      data: { q: $(this).val() }
    });
  })
})

