function saveInfo() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password-text").value;

    document.cookie = "username=" + username + "; path=/LiLyLaneStore/";
    document.cookie = "password=" + password + "; path=/LiLyLaneStore/";
}

getCookiedata();

function getCookie(name) {
    const cookies = document.cookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
        const cookie = cookies[i].trim();
        if (cookie.indexOf(name) === 0) {
            return cookie.substring(name.length + 1);
        }
    }
    return undefined;
}

function getCookiedata() {
    var user = getCookie('username');
    var password = getCookie('password');
    if(user && password){    
    document.getElementById('username').value=user;
    document.getElementById('password-text').value=password;
    }
}



