/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var usernameCorrect = false;
var emailCorrect = false;
var password = "1";
var repassword = "2";

var signupButton = document.getElementById("signUpButton");

var passIn = document.getElementById("passIn");
var passInDiv = document.getElementById("passInDiv");
    
var repassIn = document.getElementById("repassIn");
var repassInDiv = document.getElementById("repassInDiv");

// Username
document.getElementById("userIn").addEventListener("input", function(){ 
    
    var userIn = document.getElementById("userIn");
    var userInDiv = document.getElementById("userInDiv");
    var usSpan = document.getElementById("usSpan");
    var username = userIn.value;
    
    if(username.length >= 5) {
        
        var http = new XMLHttpRequest();
        var url = "../CheckUsername";
        http.open("POST", url, true);

        http.setRequestHeader("Content-type", "application/json; charset=utf-8");
        http.setRequestHeader("username", username);

        http.onreadystatechange = function() {
            if(http.readyState == 4 && http.status == 200) {
                var result = http.responseText;
                if(result === "error") {
                    userInDiv.classList.remove("has-success");
                    userInDiv.classList.add("has-error");
                    usSpan.classList.remove("glyphicon-user");
                    usSpan.classList.remove("glyphicon-ok");
                    usSpan.classList.add("glyphicon-remove");
                    usernameCorrect = false;
                    check();
                    
                } else {
                    userInDiv.classList.remove("has-error");
                    userInDiv.classList.add("has-success");
                    usSpan.classList.remove("glyphicon-user");
                    usSpan.classList.remove("glyphicon-remove");
                    usSpan.classList.add("glyphicon-ok");
                    usernameCorrect = true;
                    check();
                }
                
            }
        }
        
        http.send(null);
    
    } else {
            userInDiv.classList.remove("has-error");
            userInDiv.classList.remove("has-success");
            usSpan.classList.add("glyphicon-user");
            usSpan.classList.remove("glyphicon-ok");
            usSpan.classList.remove("glyphicon-remove");
            usernameCorrect = false;
            check();
    }
});

//Email
document.getElementById("emailIn").addEventListener("input", function(){ 
    
    var emailIn = document.getElementById("emailIn");
    var userInDiv = document.getElementById("emailInDiv");
    var emSpan = document.getElementById("emSpan");
    var email = emailIn.value;
    
    if(email.length >= 10) {
        
        var http = new XMLHttpRequest();
        var url = "../CheckEmail";
        http.open("POST", url, true);

        http.setRequestHeader("Content-type", "application/json; charset=utf-8");
        http.setRequestHeader("email", email);

        http.onreadystatechange = function() {
            if(http.readyState == 4 && http.status == 200) {
                var result = http.responseText;
                if(result === "error") {
                    userInDiv.classList.remove("has-success");
                    userInDiv.classList.add("has-error");
                    emSpan.classList.remove("glyphicon-envelope");
                    emSpan.classList.remove("glyphicon-ok");
                    emSpan.classList.add("glyphicon-remove");
                    emailCorrect = false;
                    check();
                    
                } else {
                    userInDiv.classList.remove("has-error");
                    userInDiv.classList.add("has-success");
                    emSpan.classList.remove("glyphicon-envelope");
                    emSpan.classList.remove("glyphicon-remove");
                    emSpan.classList.add("glyphicon-ok");
                    emailCorrect = true;
                    check();
                }
            }
        }
        
        http.send(null);
    
    } else {
            userInDiv.classList.remove("has-error");
            userInDiv.classList.remove("has-success");
            emSpan.classList.remove("glyphicon-remove");
            emSpan.classList.remove("glyphicon-ok");
            emSpan.classList.add("glyphicon-envelope");
            emailCorrect = false;
            check();
    }
});

// Password
document.getElementById("passIn").addEventListener("input", function(){ 
    
    var psSpan = document.getElementById("psSpan");
    var rpSpan = document.getElementById("rpSpan");
    password = passIn.value;
    repassword = repassIn.value;
    
    if (password.length >= 8) {
        if (password === repassword) {
            passInDiv.classList.remove("has-error");
            passInDiv.classList.add("has-success");
            repassInDiv.classList.remove("has-error");
            repassInDiv.classList.add("has-success");
            psSpan.classList.remove("glyphicon-eye-close");
            psSpan.classList.remove("glyphicon-remove");
            psSpan.classList.add("glyphicon-ok");
            rpSpan.classList.remove("glyphicon-eye-close");
            rpSpan.classList.remove("glyphicon-remove");
            rpSpan.classList.add("glyphicon-ok");
            
        } else {
            passInDiv.classList.remove("has-success");
            passInDiv.classList.add("has-error");
            repassInDiv.classList.remove("has-success");
            repassInDiv.classList.add("has-error");
            psSpan.classList.remove("glyphicon-eye-close");
            psSpan.classList.remove("glyphicon-ok");
            psSpan.classList.add("glyphicon-remove");
            rpSpan.classList.remove("glyphicon-eye-close");
            rpSpan.classList.remove("glyphicon-ok");
            rpSpan.classList.add("glyphicon-remove");
        }
        
    } else {
            passInDiv.classList.remove("has-error");
            passInDiv.classList.remove("has-success");
            repassInDiv.classList.remove("has-error");
            repassInDiv.classList.remove("has-success");
            psSpan.classList.remove("glyphicon-ok");
            psSpan.classList.remove("glyphicon-remove");
            psSpan.classList.add("glyphicon-eye-close");
            rpSpan.classList.remove("glyphicon-ok");
            rpSpan.classList.remove("glyphicon-remove");
            rpSpan.classList.add("glyphicon-eye-close");
        }
});

// Re Password
document.getElementById("repassIn").addEventListener("input", function(){ 
    
    var psSpan = document.getElementById("psSpan");
    var rpSpan = document.getElementById("rpSpan");
    
    password = passIn.value;
    repassword = repassIn.value;

    if (repassword.length >= 8) {
        if (password === repassword) {
            passInDiv.classList.remove("has-error");
            passInDiv.classList.add("has-success");
            repassInDiv.classList.remove("has-error");
            repassInDiv.classList.add("has-success");
            psSpan.classList.remove("glyphicon-eye-close");
            psSpan.classList.remove("glyphicon-remove");
            psSpan.classList.add("glyphicon-ok");
            rpSpan.classList.remove("glyphicon-eye-close");
            rpSpan.classList.remove("glyphicon-remove");
            rpSpan.classList.add("glyphicon-ok");
        } else {
            passInDiv.classList.remove("has-success");
            passInDiv.classList.add("has-error");
            repassInDiv.classList.remove("has-success");
            repassInDiv.classList.add("has-error");
            psSpan.classList.remove("glyphicon-eye-close");
            psSpan.classList.remove("glyphicon-ok");
            psSpan.classList.add("glyphicon-remove");
            rpSpan.classList.remove("glyphicon-eye-close");
            rpSpan.classList.remove("glyphicon-ok");
            rpSpan.classList.add("glyphicon-remove");
        }
        
    } else {
            passInDiv.classList.remove("has-error");
            passInDiv.classList.remove("has-success");
            repassInDiv.classList.remove("has-error");
            repassInDiv.classList.remove("has-success");
            psSpan.classList.remove("glyphicon-ok");
            psSpan.classList.remove("glyphicon-remove");
            psSpan.classList.add("glyphicon-eye-close");
            rpSpan.classList.remove("glyphicon-ok");
            rpSpan.classList.remove("glyphicon-remove");
            rpSpan.classList.add("glyphicon-eye-close");
    }
    check();
    
});

function check() {
    if (usernameCorrect && emailCorrect && password === repassword) {
        signupButton.removeAttribute("disabled");
    } else {
        signupButton.setAttribute("disabled", "disabled");
    }
}



