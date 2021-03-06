var btnsfx1;
var btnsfx2;
var btnsfx3;
var btnsfx4;
var endCard;
var theme;

if (localStorage.getObj("sound") == "false") {
  $(".togglediv").addClass("hidden");
} else {
  btnsfx1 = new Audio("../resources/btnsfx1.ogg");
  btnsfx2 = new Audio("../resources/btnsfx2.ogg");
  btnsfx3 = new Audio("../resources/btnsfx3.ogg");
  btnsfx4 = new Audio("../resources/btnsfx4.ogg");
  endCard = new Audio("../resources/endCard.ogg");
  theme = new Audio("../resources/" + mission + ".ogg");
}

$(window).on("load", function () {
  $("#ButtonFour").addClass("disabled");
  $(".replydiv").hide();
  text();
});

$("#toggle").on("click", function (e) {
  if (theme.paused) {
    theme.play();
    theme.addEventListener("timeupdate", function () {
      var buffer = 0.44;
      if (this.currentTime > this.duration - buffer) {
        this.currentTime = 0;
        this.play();
      }
    });
    $("#toggle").html("<img src='../resources/pause.svg' alt='Pause'>");
  } else {
    theme.pause();
    $("#toggle").html("<img src='../resources/play.svg' alt='Play'>");
  }
});

function text() {
  $("#scenario-text").html(scenarios[count].scenario);
  $("#ButtonOne").html(scenarios[count].answer1);
  $("#ButtonTwo").html(scenarios[count].answer2);
  $("#ButtonThree").html(scenarios[count].answer3);
  switch (undefined) {
    case scenarios[count].answer1:
      $("#ButtonOne").hide();
      break;
    case scenarios[count].answer2:
      $("#ButtonTwo").hide();
      break;
    case scenarios[count].answer3:
      $("#ButtonThree").hide();
      break;
  }
  if (!scenarios[count].answer1 && !scenarios[count].answer2 && !scenarios[count].answer3) {
    $("#ButtonFour").removeClass("disabled");
    $(".replydiv, .buttondiv").hide();
    $("nav").addClass("glow");
  } else {
    $("#ButtonFour").addClass("disabled");
  }
}

//Replies
function reply1() {
  if (scenarios[count].reply1) {
    $("#reply-text").html(scenarios[count].reply1);
    $(".replydiv").show();
  }
  $("#ButtonFour").removeClass("disabled");
  $("#ButtonTwo, #ButtonThree").addClass("disabled");
  if (scenarios[count].skipto1) {
    count = scenarios[count].skipto1 - 2;
  }
  if (localStorage.getObj("sound") == true) {
    btnsfx1.play();
  }
  $("nav").addClass("glow");
}

function reply2() {
  if (scenarios[count].reply2) {
    $("#reply-text").html(scenarios[count].reply2);
    $(".replydiv").show();
  }
  $("#ButtonFour").removeClass("disabled");
  $("#ButtonOne, #ButtonThree").addClass("disabled");
  if (scenarios[count].skipto2) {
    count = scenarios[count].skipto2 - 2;
  }
  if (localStorage.getObj("sound") == true) {
    btnsfx2.play();
  }
  $("nav").addClass("glow");
}

function reply3() {
  if (scenarios[count].reply3) {
    $("#reply-text").html(scenarios[count].reply3);
    $(".replydiv").show();
  }
  $("#ButtonFour").removeClass("disabled");
  $("#ButtonOne, #ButtonTwo").addClass("disabled");
  if (scenarios[count].skipto3) {
    count = scenarios[count].skipto3 - 2;
  }
  if (localStorage.getObj("sound") == true) {
    btnsfx3.play();
  }
  $("nav").addClass("glow");
}

//Next scenario
function nextScenario(mission) {
  document.activeElement.blur()
  $("nav").removeClass("glow");
  $("#ButtonOne, #ButtonTwo, #ButtonThree").removeClass("disabled").show();
  if (quit == true) {
    if (mission == 5) {
      endingcounter5();
    } else {
      endingcounter();
    }
    $(".flexmain").hide();
    if (localStorage.getObj("sound") == true) {
      endCard.play();
    }
  }
  if (scenarios.length > count + 1) {
    count++;
  }
  $(".replydiv").hide();
  $(".buttondiv").show();
  quit = scenarios[count].quit;
  text();
  if (localStorage.getObj("sound") == true) {
    btnsfx4.play();
  }
}

//Ending Counter
function endingcounter() {
  switch (Object.keys(scenarios[count]).pop()) {
    case "ending1":
      if (endings[0] == 0) {
        endings[0] = 1;
      }
      break;
    case "ending2":
      if (endings[1] == 0) {
        endings[1] = 1;
      }
      break;
    case "ending3":
      if (endings[2] == 0) {
        endings[2] = 1;
      }
      break;
    case "ending4":
      if (endings[3] == 0) {
        endings[3] = 1;
      }
      break;
    case "ending5":
      if (endings[4] == 0) {
        endings[4] = 1;
      }
      break;
    case "ending6":
      if (endings[5] == 0) {
        endings[5] = 1;
      }
      break;
    case "ending7":
      if (endings[6] == 0) {
        endings[6] = 1;
      }
      break;
    case "ending8":
      if (endings[7] == 0) {
        endings[7] = 1;
      }
      break;
    case "ending9":
      if (endings[8] == 0) {
        endings[8] = 1;
      }
      break;
    case "ending10":
      if (endings[9] == 0) {
        endings[9] = 1;
      }
      break;
  }
  $("div#EndCard").removeClass("hidden");
  save();
}
