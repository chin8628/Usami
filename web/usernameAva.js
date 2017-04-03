/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

document.getElementById("userIn").addEventListener("input", function(){ 
    
    var userIn = document.getElementById("userIn");
    var userInDiv = document.getElementById("userInDiv");
    var username = userIn.value;
    var signupButton = document.getElementById("signUpButton")
    
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
                    signupButton.setAttribute("disabled", "disabled");
                    
                } else {
                    userInDiv.classList.remove("has-error");
                    userInDiv.classList.add("has-success");
                    signupButton.removeAttribute("disabled");
                }
                
            }
        }
        
        http.send(null);
    
    } else {
            userInDiv.classList.remove("has-error");
            userInDiv.classList.remove("has-success");
            signupButton.setAttribute("disabled", "disabled");
    }
    

});