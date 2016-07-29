

var loadPageJS = function() {


  // Check if header is present, if it is load js for pages with a header
  if ($(".header").length > 0) { pagesWithHeaderMobile(); }
  if ($(".id-page ").length > 0) { identifyPage(); }

  // JavaScript specific to pages with a header on mobile devices
  function pagesWithHeaderMobile() {
    // Show page information/instructions on icon click
    $(".header-page-icon").on("click", toggleOverlays);
    $(".menu-btn").on("click", toggleOverlays);
    $(".prevent-click").on("click", toggleOverlays);

    var lastOverlay;
    function toggleOverlays() {
      if ($(".menu").is(":animated") || $(".info-drop-down").is(":animated")) {
        return;
      }
      $(".will-blur").toggleClass("blur");
      $(".prevent-click").toggleClass("visible");

      var overlay;
      var animatePos = {};
      if ($(this).hasClass("prevent-click")) {
        checkWhichOverlay(lastOverlay);
      } else checkWhichOverlay($(this));

      function checkWhichOverlay(currentOverlay) {
        if (currentOverlay.hasClass("menu-btn")) {
          overlay = $(".menu");
          animatePos.left = parseInt(overlay.css("left")) === 0 ?
            overlay.outerWidth() * -1 : 0;
        } else if (currentOverlay.hasClass("header-page-icon")) {
          overlay = $(".info-drop-down");
          animatePos.top = parseInt(overlay.css("top")) === 0 ?
            overlay.outerHeight() * -1 : 0;
        }
      }

      overlay.animate(animatePos, {duration: 500});
      lastOverlay = $(this);
    }

    console.log("loaded js for pages with mobile header");
  }

  // JavaScript specific to the identify page
  function identifyPage() {
    var flipper = $(".next-arrow");

    flipper.on("click", flipCard);

    function flipCard() {
      $(".card").toggleClass("flipped");
      $(".back").toggleClass("hidden-back");

      console.log("FLIPPED!");
    }

    console.log("loaded js for id page");
  }


  // Wait until window is loaded and then attach resize event, this prevents
  //  resize issues that occur during the page load
  $(window).on("load", function() {

    // Handle info drop down position on window resize
    $(window).on("resize", function() {

      // Check if header is present and return if not
      if ($(".header").length < 1) { return; }

      $(".info-drop-down").css("top", $(".info-drop-down").outerHeight() * -1);
      $(".menu").css("left", $(".menu").outerWidth() * -1);
      $(".will-blur").removeClass("blur");
      $(".prevent-click").removeClass("visible");
    });
  });
};

$(document).on("turbolinks:load", loadPageJS);
