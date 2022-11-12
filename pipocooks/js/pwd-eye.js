function password_show_hide(pwd, eye_show, eye_hide) {
    var x = document.getElementById(pwd);
    var show_eye = document.getElementById(eye_show);
    var hide_eye = document.getElementById(eye_hide);
    hide_eye.classList.remove("d-none");
    if (x.type === "password") {
        x.type = "text";
        show_eye.style.display = "none";
        hide_eye.style.display = "block";
    } else {
        x.type = "password";
        show_eye.style.display = "block";
        hide_eye.style.display = "none";
    }
}