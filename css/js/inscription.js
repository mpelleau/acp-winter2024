$(document).ready(function() {
    $("#adresse").on('change keyup paste', function() {  
        if(this.value.length){
            $("#comp_div").show();
        } else {
            $("#comp_div").hide();
        }
    });

    $("#inscription").submit(function () {
        var lname = $.trim($("#lname").val());
        var fname = $.trim($("#fname").val());
        var email = $.trim($("#replyto").val());
        var institution = $.trim($("#institution").val());
        var adresse = $.trim($("#adresse").val());
        var comp = $.trim($("#comp").val());
        var fonction = $("#fonction").val();
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        var isbot = $.trim($("#gotcha").val());

        var valid = true;
        if (isbot === '') {
            if (lname === '') {
                $('#lname_err').removeClass("hide").addClass("show");
                valid = false;
            } else {
                $('#lname_err').removeClass("show").addClass("hide");
            }
            if (fname === '') {
                $('#fname_err').removeClass("hide").addClass("show");
                valid = false;
            } else {
                $('#fname_err').removeClass("show").addClass("hide");
            }
            if (email === '') {
                $('#replyto_err').removeClass("hide").addClass("show");
                valid = false;
            } else if (!emailReg.test(email)) {
                $('#replyto_err').removeClass("show").addClass("hide");
                $('#replyto_err2').removeClass("hide").addClass("show");
                valid = false;
            } else {
                $('#replyto_err').removeClass("show").addClass("hide");
            }
            if (institution === '') {
                $('#institution_err').removeClass("hide").addClass("show");
                valid = false;
            } else {
                $('#institution_err').removeClass("show").addClass("hide");
            }
        }

        if (valid && isbot === '') {
            $("div[class='form-group']").removeClass("show").addClass("hide");
            firstmessage = false;
            sendmessage = "<html>Bonjour " + fname + " " + lname + ",<br><br>Votre inscription aux JFPC 2021 a bien été prise en compte.<br>"
            if (adresse != '') {
                sendmessage += "<br>Vous avez donné l'adresse de livraison suivante :<br>" + adresse.replaceAll(/(\r\n|\n|\r)/gm, "<br>"); + "<br>";
                if (comp != '') {
                    sendmessage += "<br><br>Ainsi que le complément d'adresse suivant :<br>" + comp.replaceAll(/(\r\n|\n|\r)/gm, "<br>"); + "<br>";
                }
            }
            sendmessage += "<br><br>Votre demande sera traitée dans les meilleurs délais.<br>Les informations de connexions se trouvent ici : https://www.i3s.unice.fr/jfpc_2021/connexions/<br><br><br>À tout bientôt,<br>L'équipe des JFPC<br></html>";
            header = "Prénom,Nom,Email,Institution,Fonction,Adresse,Complément\n";
            datamessage = "\"" + fname + "\",\"" + lname + "\",\"" + email + "\",\"" + institution + "\"," + fonction + ",\"" + adresse + "\",\"" + comp + "\"\n";
            Email.send({
                SecureToken : "0c6ae271-b4ef-4ee5-ac71-85be7d0bf7ba",
                To : email,
                From : " jfpc2021@i3s.unice.fr",
                Subject : "[JFPC 2021] Confirmation d'inscription",
                Body : sendmessage
            }).then(
                message => {
                    if (message === "OK") {
                        firstmessage = true;
                    }
                }
            );

            $.ajax({
                url: '../css/js/inscription.php',
                type: 'POST',
                data: {data:datamessage, header:header},
                success: function(data) {
                    $("div[id='success']").removeClass("hide").addClass("show");
                },
                error: function () {
                    $("div[id='success']").removeClass("show").addClass("hide");
                }
            });
        }

        return false;
    });
});
