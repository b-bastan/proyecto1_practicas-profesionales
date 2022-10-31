function showPhoto() {
    document.getElementById("modif-profile-photo").style.display = "flex";
    document.getElementById("modif-photo-on").style.display = "block";
    document.getElementById("modif-photo-off").style.display = "none";
    if (document.getElementById("modif-profile-photo").style.display == "flex") {
        hidePassChange();
    }
}

function hidePhoto() {
    document.getElementById("modif-profile-photo").style.display = "none";
    document.getElementById("modif-photo-on").style.display = "none";
    document.getElementById("modif-photo-off").style.display = "block";
}

function showPassChange() {
    document.getElementById("modif-pass-box").style.display = "flex";
    document.getElementById("modif-pass-on").style.display = "block";
    document.getElementById("modif-pass-off").style.display = "none";
    if (document.getElementById("modif-profile-photo").style.display == "flex") {
        hidePhoto();
    }
}

function hidePassChange() {
    document.getElementById("modif-pass-box").style.display = "none";
    document.getElementById("modif-pass-on").style.display = "none";
    document.getElementById("modif-pass-off").style.display = "block";
}