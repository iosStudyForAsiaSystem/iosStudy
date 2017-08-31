
function navi_online(){
    
    if( navigator.onLine == true ){

        $("#tas_div").show();
        $("#gif").hide();

    }else{

        $("#tas_div").hide();
        $("#gif").hide();

    }
    
}


function appcache_init() {
    //イベントを監視
    window.applicationCache.addEventListener("cached", function () {
        //alert("Cached!");
        $("#tas").text("OK");
        $("#gif").hide();
    }, false);
    window.applicationCache.addEventListener("noupdate", function () {
        //alert("Noupdate!");
        $("#tas").text("Cached!");
    }, false);
    window.applicationCache.addEventListener("progress", function () {
        //alert("Progress!");
        $("#tas").text("now loading");
        $("#gif").show();
    }, false);
    window.applicationCache.addEventListener("error", function () {
        //alert("Error!");
        $("#tas").text("Error!");
       }, false);
    window.applicationCache.addEventListener("checking", function () {
        //alert("Checking!");
    }, false);
    window.applicationCache.addEventListener("downloading", function () {
        //alert("Downloading!");
    }, false);
}
