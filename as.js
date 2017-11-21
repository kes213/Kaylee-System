window.addEventListener('DOMContentLoaded',init,false);



function init() {

    alert ('Did the script load? Yes. Yes it did.');

    var buttons = document.getElementsByTagName("button");

    var button = buttons[0];

    button.addEventListener('click',show_hide,false);

    }



function show_hide() {

    var p = document.getElementById("paragraphToToggle");

    if (p.style.display == "none") {

        p.style.display = "block";

    } else {

        p.style.display = "none";

    }

}

// This is a comment

// For a detailed explanation, please see:

// http://dh.obdurodon.org/javascript-assignment-01-answers.xhtml 