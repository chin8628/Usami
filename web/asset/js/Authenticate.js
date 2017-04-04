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
    var username = userIn.value;
    
    if(username.length >= 8) {
        
        var http = new XMLHttpRequest();
        var url = "../CheckUsername";
        http.open("POST", url, true);

        http.setRequestHeader("Content-type", "application/json; charset=utf-8");
        http.setRequestHeader("Content-length", 0);
        http.setRequestHeader("Connection", "close");
        http.setRequestHeader("username", username);

        http.onreadystatechange = function() {
            if(http.readyState == 4 && http.status == 200) {
                var result = http.responseText;
                if(result === "error") {
                    userInDiv.classList.remove("has-success");
                    userInDiv.classList.add("has-error");
                    usernameCorrect = false;
                    check();
                    
                } else {
                    userInDiv.classList.remove("has-error");
                    userInDiv.classList.add("has-success");
                    usernameCorrect = true;
                    check();
                }
                
            }
        }
        
        http.send(null);
    
    } else {
            userInDiv.classList.remove("has-error");
            userInDiv.classList.remove("has-success");
            usernameCorrect = false;
            check();
    }
});

//Email
document.getElementById("emailIn").addEventListener("input", function(){ 
    
    var emailIn = document.getElementById("emailIn");
    var userInDiv = document.getElementById("emailInDiv");
    var email = emailIn.value;
    
    if(email.length >= 10) {
        
        var http = new XMLHttpRequest();
        var url = "../CheckEmail";
        http.open("POST", url, true);

        http.setRequestHeader("Content-type", "application/json; charset=utf-8");
        http.setRequestHeader("Content-length", 0);
        http.setRequestHeader("Connection", "close");
        http.setRequestHeader("email", email);
        http.setRequestHeader("selected", "email");

        http.onreadystatechange = function() {
            if(http.readyState == 4 && http.status == 200) {
                var result = http.responseText;
                if(result === "error") {
                    userInDiv.classList.remove("has-success");
                    userInDiv.classList.add("has-error");
                    emailCorrect = false;
                    check();
                    
                } else {
                    userInDiv.classList.remove("has-error");
                    userInDiv.classList.add("has-success");
                    emailCorrect = true;
                    check();
                }
            }
        }
        
        http.send(null);
    
    } else {
            userInDiv.classList.remove("has-error");
            userInDiv.classList.remove("has-success");
            emailCorrect = false;
            check();
    }
});

// Password
document.getElementById("passIn").addEventListener("input", function(){ 
    
    password = passIn.value;
    repassword = repassIn.value;
    
    if (password.length >= 10) {
        if (password === repassword) {
            passInDiv.classList.remove("has-error");
            passInDiv.classList.add("has-success");
            repassInDiv.classList.remove("has-error");
            repassInDiv.classList.add("has-success");
            
        } else {
            passInDiv.classList.remove("has-success");
            passInDiv.classList.add("has-error");
            repassInDiv.classList.remove("has-success");
            repassInDiv.classList.add("has-error");
        }
        
    } else {
            passInDiv.classList.remove("has-error");
            passInDiv.classList.remove("has-success");
            repassInDiv.classList.remove("has-error");
            repassInDiv.classList.remove("has-success");
        }
});

// Re Password
document.getElementById("repassIn").addEventListener("input", function(){ 
    
    password = passIn.value;
    repassword = repassIn.value;

    if (repassword.length >= 10) {
        if (password === repassword) {
            passInDiv.classList.remove("has-error");
            passInDiv.classList.add("has-success");
            repassInDiv.classList.remove("has-error");
            repassInDiv.classList.add("has-success");
        } else {
            passInDiv.classList.remove("has-success");
            passInDiv.classList.add("has-error");
            repassInDiv.classList.remove("has-success");
            repassInDiv.classList.add("has-error");
        }
        
    } else {
            passInDiv.classList.remove("has-error");
            passInDiv.classList.remove("has-success");
            repassInDiv.classList.remove("has-error");
            repassInDiv.classList.remove("has-success");
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



