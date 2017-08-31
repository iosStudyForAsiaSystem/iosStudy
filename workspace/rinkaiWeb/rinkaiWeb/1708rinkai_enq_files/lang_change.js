
function select_lang_change(dollar_this){

    var set_lang = "";
    //set_lang = $(this).attr("id");
    set_lang = dollar_this.attr("id");
    localStorage.setItem("language", set_lang );
    $("#slp").hide();

    if( localStorage.getItem("ls_tnum") == null ){
        $("#pkanri").show();
    }else{
        $("#p0").show();
    }

    var sdl = "";		//set_default_language 表示言語設定
    sdl = localStorage.getItem("language");

    var tit_obj = {"ja":"japanese(日本語)","en":"english(英語)","ch_t":"中文繁體(中国語：繁体字)","ch_s":"中文简体(中国語：簡体字)","ko":"한국어(韓国語)"};
    $("#tit_str").text( tit_obj[sdl] );

    //alert(lang_data[sdl][0].fs1_txt);

    function language_set(q_str, lp_no){
        for(i=1;i<=lp_no;i++){
            //$("#"+ q_str + i +"tt").text(lang_data[sdl][0][q_str + i +"txt"]);
            $("#"+ q_str + i +"tt").html(lang_data[sdl][0][q_str + i +"txt"]);
        }
    }
    
    if( sdl != "ja" ){
        $("#title_tt").html(lang_data[sdl][0]["title_txt"]);
        $("#end_tt").html(lang_data[sdl][0]["end_txt"]);
        
        //Q1
        language_set('q1_', 6);
        //Q2
        language_set('q2_', 14);
        //Q3
        language_set('q3_', 17);
        //Q3sub
        for(i=18;i<=21;i++){
            if(i == 18){
                $("#q3_"+ i +"tt").html(lang_data[sdl][0]["q3_"+ i +"txt"]);
            }else{
                $(".q3_"+ i +"tt").html(lang_data[sdl][0]["q3_"+ i +"txt"]);
            }
        }
        //Q4
        language_set('q4_', 9);
        //Q5
        language_set('q5_', 7);
        //Q6
        language_set('q6_', 12);
        //Q7-1
        language_set('q7_1_', 16);
        //Q7-2
        //language_set('q7_2_', 51);
        for(i=1;i<=6;i++){
            if(i == 3 || i == 6){
                $(".q7_2_"+ i +"tt").html(lang_data[sdl][0]["q7_2_"+ i +"txt"]);
            }
            $("#q7_2_"+ i +"tt").html(lang_data[sdl][0]["q7_2_"+ i +"txt"]);
        }
        
        for(i=7;i<=60;i++){
            if(i >= 31 || i <= 60){
                $("#q7_2_"+ i +"tt").html(lang_data[sdl][0]["q7_2_"+ i +"txt"]);
            }
            $(".q7_2_"+ i +"tt").html(lang_data[sdl][0]["q7_2_"+ i +"txt"]);
        }
        
        for(i=61;i<=75;i++){
            $(".q7_2_"+ i +"tt").html(lang_data[sdl][0]["q7_2_"+ i +"txt"]);
        }
        //Q8
        language_set('q8_', 3);
        //Q9
        language_set('q9_', 13);
        //Q10
        language_set('q10_', 18);
        //Q10-2
        language_set('q10_2_', 2);
        //Q11
        language_set('q11_', 8);
        //Q12
        language_set('q12_', 8);
        //Q13
        language_set('q13_', 15);
    }

}
