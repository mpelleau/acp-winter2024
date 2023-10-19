$(document).ready(function() {
	$(".programme-jour").click(function() {

        $(".days")
            .find(".active")
            .removeClass("active");
        $(this).addClass("active");
        var id = $(this).text();
        console.log(id);


        $(".programme")
            .find(".show")
            .removeClass("show")
            .addClass("hide");
        
        $("div[id='"+id+"']").removeClass("hide").addClass("show");
    });

    $("td a").click(function() {
        var day = $(this).attr("name");
        $(".days")
            .find(".active")
            .removeClass("active");
        $(".programme-jour[name='"+day+"']").addClass("active");

        $(".programme")
            .find(".show")
            .removeClass("show")
            .addClass("hide");
        
        $("div[id='"+day+"']").removeClass("hide").addClass("show");
    });
});
