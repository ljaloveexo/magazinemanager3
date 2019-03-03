function login() { 

    var portals = document.getElementsByName("portal"); 

    for(var i = 0; i < portals.length; i++) { 

        if(portals[i].checked) { 

            if(portals[i].value === "student") { 

                location.href = "userloginsuccess.jsp"; 

            } 

            else if(portals[i].value === "administer") { 

                location.href = "adminsterloginsuccess.jsp"; 

            } 

        } 

    } 

} 

