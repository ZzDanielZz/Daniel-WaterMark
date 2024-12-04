addEventListener("message", ({data}) => {
    switch (data["action"]) {
        case "update":
            $(".main").fadeIn(450);
            $(".plyId").html(data["id"]);
            $(".plys").html(data["players"]);
            if (data["steamProfilePicture"]) {
                $("#playerSteamProfilePic").attr("src", data["steamProfilePicture"]);
            }

            if (data["displayLogo"]) {
                $("#serverLogo").show();
                $("#serverLogoImg").attr("src", data["serverLogo"]);
            } else {
                $("#serverLogo").hide();
            }

            $("#serverNameText").html(data["serverName"]);
            break;
        case "close":
            $(".main").fadeOut(450);
            break;
    }
});
