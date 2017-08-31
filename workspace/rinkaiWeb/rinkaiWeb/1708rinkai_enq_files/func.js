$(function(){

	//---------
	//非表示
	//---------
    
    
	//for(i=0;i<=3;i++){
    for(i=0;i<=4;i++){
		$("#p"+ i).hide();
	}
	$("#enq_go").hide();
    

	//ラジオ・チェック非表示
	$(":radio").hide();
	$(":checkbox").hide();

	//--end--
	$("#p_end").hide();

	//serverアップ　ボタン表示・非表示
	if( navigator.onLine == true ){

		$("#sr").show();

	}else{

		$("#sr").hide();

	}

	//--有効・無効票 初期設定--
    $("#test_fv0").prop("checked",true);
    //$("#swh1").find(".switch-on").css("background","#3399FF");
    $("#swh1").find(".switch-on").css("background","#81C784");

    //--on off スイッチタイプ--
    $("#swh1").find("div").hammer().on("tap", function(){

        if( $("#ans_chk_flg").val() != 1 ){
            if( $(this).attr("class") == "switch-on" ){
                $("#test_fv0").prop("checked",true);
                $("#swh1").find(".switch-on").css("background","#81C784");
                $("#swh1").find(".switch-off").css("background","#BDBDBD");
            }else if( $(this).attr("class") == "switch-off" ){
                $("#test_fv1").prop("checked",true);
                $("#swh1").find(".switch-on").css("background","#BDBDBD");
                $("#swh1").find(".switch-off").css("background","#81C784");
            }
        }

    });

	//調査日
	$("#fs1oa").val( se_time(1) );

	//管理の調査日表示
	$("#qday").text( se_time(1) );

	$("#bt_date").val( se_time(1) );

	//--閲覧フラグ初期化--
	$("#ans_chk_flg").val("");

	if( localStorage.length > 1 ){

		if( localStorage.getItem("ls_tnum") != null ){
			$("#tml").val( localStorage.getItem("ls_tnum") );
			$("#tml").prop("disabled",true);
		}
        
        if( localStorage.getItem("ls_spot") != null ){
			$("#survey_spot").val( localStorage.getItem("ls_spot") );
			$("#survey_spot").prop("disabled",true);
            //調査地点
            $("#fs2").val( localStorage.getItem("ls_spot") );
		}
        
        if( localStorage.getItem("ls_tnum") != null || localStorage.getItem("ls_spot") != null ){
            $("#config_save").attr("value","変更する");
        }

		if( $("#tml").val() == "" || $("#survey_spot").val() == "" ){
			$("#enq_go").hide();
		}else{
			$("#enq_go").show();
		}

	}else if(localStorage.length == 1){
		//+$("#pkanri").show();
		if( $("#tml").val() == "" || $("#survey_spot").val() == "" ){
			$("#enq_go").hide();
		}else{
			$("#enq_go").show();
		}
        
	}

	//設定保存（端末番号、調査地点）
	$("#config_save").click(function(){

		t_num_save_or_load();
		if( $("#tml").val() != "" && $("#survey_spot").val() != "" ){
			$("#enq_go").show();
		}else{
            $("#enq_go").hide();
        }

	});

	//有効無効ボタン
	$("body").on("click", ".sam", function(){

		var sp_num = 0;
		var s_b_id = "";
		var s_b_ary = "";
		var nny = "";
		var ex_strs = "";

		s_b_id = $(this).attr("id");
		s_b_id_ary = s_b_id.split("m");
		sp_num = $("#tr" + s_b_id_ary[1]).find("td").eq(0).text();
		nny = $("#tr" + s_b_id_ary[1]).find("td").eq(2).text();


		if( $(this).val() == "有効票" ){

			ex_strs = "サンプルNo：" + sp_num + "国籍：" + nny + "を無効票に変更しますがよろしいですか？";

		}else{

			ex_strs = "サンプルNo：" + sp_num + "国籍：" + nny + "を有効票に変更しますがよろしいですか？";

		}

		if( window.confirm(ex_strs) ){

			sample_save(s_b_id);

			if( $(this).val() == "有効票" ){

				$(this).val("無効票");
				$("#tr" + s_b_id_ary[1]).children("td").css("background-color", "#999999");

			}else{

				$(this).val("有効票");
				$("#tr" + s_b_id_ary[1]).children("td").css("background-color", "#ffffff");

			}

		}

		gbt();

	});

	//管理　修正済み項目
	$("body").on("click", ".chked", function(){

		var chked_id = $(this).attr("id");

		if( $(this).prop("checked") == true ){
			chk_save(chked_id,1);
		}else if( $(this).prop("checked") == false ){
			chk_save(chked_id,2);
		}

	});

	//国籍別獲得票数　表示
	$("#bt_chg").click(function(){
		gbt();
	});

	//管理画面　絞込み
	$("#k_data_chg").click(function(){

		kanri(2);

	});


	//レコード起こし
	$("#nextpg1").click(function(){

		var nxno = "";
		var nos = "";

		ERR_CHECK();
		if(ans_err == 0){

			if( $("#recode_f").val() == "" ){

				if( localStorage.getItem("data_no") > 0 ){

					nxno = Number( localStorage.getItem("data_no") ) + 1;
					localStorage.setItem("data_no",nxno);
					//書き込むkeyの指定
					localStorage.setItem("use_key", "recode" + nxno );

					nos = localStorage.getItem("data_no");
					localStorage.setItem("recode" + nos , "" );
					//alert("recode" + nos + "/" + ids_v);

				}else{

					localStorage.setItem("data_no",1);
					nos = localStorage.getItem("data_no");
					//書き込むkeyの指定
					localStorage.setItem("use_key", "recode" + nos );

					localStorage.setItem("recode" + nos , "" );
					//alert("recode" + nos );

				}

			}

			save_jizen();
			$("#recode_f").val("1");
			$("#p0").hide();
			$("#p1").show();
            //q3_sub
            if( localStorage.getItem("language") != "ja" ){
                $("#q3_sub").show();
            }else{
                $("#q3_sub").hide();
            }

		}

	});

	$("#kanri_op").click(function(){

		if( $("#ans_chk_flg").val() == 1 ){

			for(i=0;i<=3;i++){
				$("#p"+ i).hide();
			}
			$("#pkanri").show();
			kanri(1);
			if( $("#tml").val() != "" && $("#survey_spot").val() != "" ){
				$("#enq_go").show();
			}
			gbt();

		}else{

			$("#p0").hide();
			$("#pkanri").show();
			kanri(1);
			if( $("#tml").val() != "" && $("#survey_spot").val() != "" ){
				$("#enq_go").show();
			}
			gbt();

		}

	});

	$("#enq_go").click(function(){

		$("#pkanri").hide();
		$("#p0").show();
		scroll_up();

	});

	//タッチカラー
	$(".sele-b").hammer().on("tap", function(e){

		//alert( e.gesture.target.type );

		if( $("#ans_chk_flg").val() == "" ){

		if( $(e.target).prop("tagName") != "INPUT" && $(e.target).prop("tagName") != "SELECT" ){

			var t_obj = "";
			var t_name = "";
			var t_this = $(this);
			var t_tag = $(e.target).prop("tagName");
			var s_tag = $(this).prop("tagName");

			if( t_this.find("input").prop("type") == "radio" ){

				t_obj = t_this.find(":radio");

				if( t_obj.prop("disabled") != true ){

					t_obj.prop("checked","true");
					t_name = t_obj.prop("name");

					//言語の置き換えのspan対応とselect
					if( t_tag == "SPAN" || t_tag == "SELECT" || t_tag == "INPUT" ){
						$("input[name='"+t_name+"']").closest(s_tag).css("background","");
					}else{
						$("input[name='"+t_name+"']").closest(t_tag).css("background","");
					}

					if( t_obj.prop("checked") == true ){

						//t_this.css("background","#3399FF");
                        t_this.css("background","#81C784");

					}

				}

			}else if( t_this.find("input").prop("type") == "checkbox" ){

				t_obj = t_this.find(":checkbox");
				t_name = t_obj.prop("name");

				if( t_obj.prop("checked") == true ){

					t_obj.prop("checked","");
					t_this.css("background","");

				}else if( t_obj.prop("checked") == false ){

					if( t_obj.prop("disabled") == false ){
						t_obj.prop("checked","true");
						//t_this.css("background","#3399FF");
                        t_this.css("background","#81C784");
					}

				}

			}

		}

		}

	});


	//--管理画面の修正ボタン--
	$("body").on("click", ".rid", function(){

		r_v_id = $(this).attr("id");
		read_data(r_v_id);
		//修正フラグ
		//$("#ans_chk_flg").val("1");

		$("#pkanri").hide();
		//回答修正
		$("#p0").show();

		//修正表示
		var r_v_id_ary = r_v_id.split("_");
		var tid = r_v_id_ary[1];
		var jn_data = "";
		var obj = "";

		jn_data = localStorage.getItem( tid );
		obj = JSON.parse( jn_data );

		$("#syuuetu_disp").text( "サンプルNO "+ obj["sno"]+":修正中");
		$("#syuuetu_disp").show();

		//回答修正時間
		obj["date_correct"] = se_time(2);

		localStorage.setItem(tid, JSON.stringify(obj) );

	});

	//--管理画面の閲覧ボタン--
	$("body").on("click", ".browse", function(){

		r_v_id = $(this).attr("id");
		read_data(r_v_id);
		//閲覧フラグ
		$("#ans_chk_flg").val("1");

		$("#pkanri").hide();

		//回答閲覧
		for(i=0;i<=14;i++){
			$("#p"+ i).show();
		}
		$("#bk_a2").show();
		$(":input").prop("disabled","true");
		$("input[type='button']").css("display","none");
		//$("#kanri_op").show();
		//$("#kanri_op").prop("disabled","");

		//閲覧表示
		var r_v_id_ary = r_v_id.split("_");
		var tid = r_v_id_ary[1];
		var jn_data = "";
		var obj = "";

		jn_data = localStorage.getItem( tid );
		obj = JSON.parse( jn_data );

		$("#syuuetu_disp").text( "サンプルNO "+ obj["sno"]+":閲覧中");
		$("#syuuetu_disp").show();

	});



	//--nextボタン b から end--
	$("#nextpg2").click(function(){

		ERR_CHECK();
		if(ans_err == 0){
			save_p1();

			$("#p1").hide();
			$("#p2").show();
			scroll_up();
		}

	});

	$("#nextpg3").click(function(){

		ERR_CHECK();
		if(ans_err == 0){
			save_p2();
            $("#p2").hide();
			$("#p3").show();

			scroll_up();
		}

	});
    
    $("#nextpg4").click(function(){

		ERR_CHECK();
		if(ans_err == 0){
            save_p3(1);
            $("#p3").hide();
            $("#p4").show();
            scroll_up();
		}

	});

	$("#nextend").click(function(){

		ERR_CHECK();
		if(ans_err == 0){
            fin_f = fin_kakunin();
            if( fin_f == 1 ){
                save_p4();
                $("#p4").hide();
                $("#p_end").show();
                scroll_up();
            }
		}

	});

	//--backボタン--
	$("#backpg0").click(function(){

		save_p1();
		$("#p1").hide();
		$("#p0").show();

	});

	$("#backpg1").click(function(){

		save_p2();
		$("#p2").hide();
		$("#p1").show();

	});

	$("#backpg2").click(function(){

		save_p3();
		$("#p3").hide();
		$("#p2").show();

	});
    
    $("#backpg3").click(function(){

		$("#p4").hide();
		$("#p3").show();

	});


	//--終了ボタン--
	$("#time_up1").click(function(){

		kaku_f = end_kakunin();

		if( kaku_f == 1 ){

			save_p1();
			timeup_end(1);
			$("#p1").hide();
			$("#p_end").show();

		}

	});

	$("#time_up2").click(function(){

		kaku_f = end_kakunin();

		if( kaku_f == 1 ){

			save_p2();
			timeup_end(1);
			$("#p2").hide();
			$("#p_end").show();

		}

	});

	$("#time_up3").click(function(){

		kaku_f = end_kakunin();

		if( kaku_f == 1 ){

			save_p3();
			timeup_end(1);
			$("#p3").hide();
			$("#p_end").show();

		}

	});


	//--Q1--
	select_disa_ctm1();
    select_disa_ctm2();
    $("#q1a").change(function(){
        
        select_disa_ctm1();
        
    });
    
    $("#q1c").keyup(function(){
        
        select_disa_ctm2();
        
    });
    
    //--Q3--
    select_disa_ctm3();
    for(i=1;i<=2;i++){
		$("#lq3_1v"+ i).closest("div").hammer().on("tap", function(){

			select_disa_ctm3();

		});
	}

	//--Q4--
    select_disa_var1("lq4v8","q4oa");
	for(i=1;i<=8;i++){
        $("#lq4v"+ i).closest("div").hammer().on("tap", function(){
			select_disa_var1("lq4v8","q4oa");
		});
	}

    //--Q5--
    select_disa_ctm4();
    $("#q5oa").keyup(function(){
        select_disa_ctm4();
    });
    
    //--Q6--
    select_disa_ctm5();
    for(i=1;i<=2;i++){
        $("#lq6v"+ i).closest("div").hammer().on("tap", function(){
            select_disa_ctm5();
        });
    }
    
    //--Q7-1--
    select_disa_var1("lq7_1v15","q7_1oa");
	for(i=1;i<=15;i++){
        $("#lq7_1v"+ i).closest("div").hammer().on("tap", function(){
			select_disa_var1("lq7_1v15","q7_1oa");
		});
	}
    
    //--Q9--
    select_disa_var1("lq9_12","q9oa");
	for(i=1;i<=12;i++){
        $("#lq9_"+ i).closest("div").hammer().on("tap", function(){
			select_disa_var1("lq9_12","q9oa");
		});
	}
    
    //--Q10--
    select_disa_var1("lq10_16","q10oa");
	for(i=1;i<=16;i++){
        $("#lq10_"+ i).closest("div").hammer().on("tap", function(){
			select_disa_var1("lq10_16","q10oa");
		});
	}
    
    //--Q13--
    select_disa_var3("lq13_13","haita","lq13_14","q13oa");
    for(i=1;i<=14;i++){
        $("#lq13_"+ i).closest("div").hammer().on("tap", function(){
            select_disa_var3("lq13_13","haita","lq13_14","q13oa");
        });
    }

});

//------------------------------------------------
//設定（端末番号、調査地点等）　書き込み呼び出し
//------------------------------------------------
function t_num_save_or_load(){

	if( $("#config_save").attr("value") == "設定する" ){

		if( Number( $("#tml").val() ) > 0 ){
			localStorage.setItem("ls_tnum", $("#tml").val() );
		}
        
        if( Number( $("#survey_spot").val() ) > 0 ){
			localStorage.setItem("ls_spot", $("#survey_spot").val() );
            //事前入力欄の調査地点変更
            $("#fs2").val( $("#survey_spot").val() );
		}
        
        if( Number( $("#tml").val() ) > 0 || Number( $("#survey_spot").val() ) > 0 ){
            $("#config_save").attr("value","変更する");
            $("#tml").prop("disabled",true);
            $("#survey_spot").prop("disabled",true);
        }

	}else if( $("#config_save").attr("value") == "変更する" ){

		$("#tml").prop("disabled","");
        $("#survey_spot").prop("disabled","");
		$("#config_save").attr("value","設定する");

	}

}


//アドレスバーを隠す
function scroll_up() {

	setTimeout(scrollTo, 100, 0, 1);

}


//日時
function se_time(time_flg){

	var flg = time_flg;
	today = new Date();
	year = today.getFullYear();

	month = Number( today.getMonth() + 1 );
	if(month < 10){
		month = String("0" + month);
	}

	day = Number( today.getDate() );
	if(day < 10){
		day = String("0" + day);
	}

	hour = Number( today.getHours() );
	minut = Number( today.getMinutes() );
	if(minut < 10){
		minut = String("0" + minut);
	}

	if(flg == 1){
		target_date = year + "/" + month + "/" + day;
	}else if(flg == 2){
		target_date = year + "/" + month + "/" + day + " "+ hour + ":" + minut;
	}

	return target_date;

}

//ランダム文字列
function random(len, source) {

	result = "";
	var sourceLen = source.length;
	for (var i = 0; i < len; i++) {
		result += source.charAt(Math.floor(Math.random() * sourceLen));
	}

	result = "UK" + result;

	return result;

}


//----------------------------
//途中終了の確認　誤終了防止
//----------------------------
function end_kakunin(){

	var kaku_f = "";

	if( window.confirm("アンケートを終わらせる") ){
		kaku_f = 1;
	}else{
		kaku_f = "";
	}

	return kaku_f;

}

//----------------------------
//回答終了の確認　誤終了防止
//----------------------------
function fin_kakunin(){

	var fin_f = "";

	if( window.confirm("回答を確定します。\n回答の修正ができなくなりますが、よろしいですか？") ){
		fin_f = 1;
	}else{
		fin_f = "";
	}

	return fin_f;

}

//----------
//管理画面
//----------
function kanri(cflg){

	$("#load_kanri").nextAll().remove();

	var target_key = "";
	var jn_data = "";
	var obj = "";
	var kanri_ary = "";
	var sibori_ary = "";
	var sibori = "";
	var row_sno = "",row_q1 = "",row_q1a = "",row_q1c = "",row_day_date_end = "",row_date_correct = "",row_end_f = "",row_test_f = "",row_h3 = "",row_day_date_end = "",oth_kokuseki = "";
	var kokuseki_ary = new Array("","日本人","外国人","無回答");
	var t_ymd = "";
    var ym_flg = 0;


	if( cflg == 1 ){
		//今日のデータのみ表示
		t_ymd = se_time(1);
	}else if( cflg == 2 ){
		//絞り込み
		t_ymd = $("#sibo").val();
	}

	var recode_nums = localStorage.getItem("data_no");
	if(recode_nums > 0){

		for(i=1;i<=recode_nums;i++){

			target_key = "recode"+ i;
			jn_data = localStorage.getItem( "recode"+ i );
			obj = JSON.parse( jn_data );
			sibori_ary = obj["day_date_start"].split(" ");
			sibori = sibori_ary[0];
			if( sibori == t_ymd ){
				//null表示
				if( obj["sno"] == null || obj["sno"] == "" || obj["sno"] == undefined ){
					row_sno = "";
				}else{
					row_sno = obj["sno"];
				}

				if( obj["q1a"] == null || obj["q1a"] == "" || obj["q1a"] == undefined ){
					row_q1a = "";
				}else{
					row_q1a = obj["q1a"];
				}
                
                if( obj["q1c"] == null || obj["q1c"] == "" || obj["q1c"] == undefined ){
					row_q1c = "";
				}else{
					row_q1c = obj["q1c"];
				}

				if( obj["day_date_start"] == null || obj["day_date_start"] == "" || obj["day_date_start"] == undefined ){
					row_day_date_start = "";
				}else{
					row_day_date_start = obj["day_date_start"];
				}

				if( obj["day_date_end"] == null || obj["day_date_end"] == "" || obj["day_date_end"] == undefined ){
					row_day_date_end = "";
				}else{
					row_day_date_end = obj["day_date_end"];
				}

				if( obj["end_f"] == null || obj["end_f"] == "" || obj["end_f"] == undefined ){
					row_end_f = "";
				}else{
					row_end_f = obj["end_f"];
				}

				if( obj["test_f"] == null || obj["test_f"] == "" || obj["test_f"] == undefined ){
					row_test_f = "";
				}else{
					row_test_f = obj["test_f"];
				}

				//終了日時加工
				if(row_day_date_end != ""){
					var rdde_spt = obj["day_date_end"].split(" ");
					//row_day_date_end = rdde_spt[1] +"/"+ rdde_spt[2];
					row_day_date_end = rdde_spt[1];
				}

				var sy_time = "";
				if( row_day_date_start != "" && row_day_date_end != "" ){
					var rdds_spt = row_day_date_start.split(" ");
					var dds_t = rdds_spt[1].split(":");
					var dde_t = rdde_spt[1].split(":");
					sy_time = ( Number(dde_t[0]) * 60 + Number(dde_t[1]) ) - ( Number(dds_t[0]) * 60 + Number(dds_t[1]) );
				}

                if(row_q1a != ""){
                    row_q1 = 1;
                }else if(row_q1c != ""){
                    row_q1 = 2;
                }else{
                    row_q1 = 3;
                }
				kokuseki = kokuseki_ary[ row_q1 ];

                for(j=1;j<=14;j++){
                    if( obj["q13_"+ j] == j ){
                        ym_flg++;
                    }
                }
                
				if( obj["test_f"] == 1 || obj["test_f"] == 2 ){
					ts_f_btn_s = "無効票";
				}else{
                    if( ym_flg > 0 ){
                        ts_f_btn_s = "有効票";
                    }else{
                        ts_f_btn_s = "無効票";
                    }
				}

				if( i == 1 ){
					$("#load_kanri").after("<tr id=\"tr" + target_key + "\"><td class=\"td3\" style=\"height:60px;\">" + obj["sno"] + "</td><td class=\"td3\">" + kokuseki +"<br>"+ oth_kokuseki + "</td><td class=\"td3\">" + row_day_date_end + "</td><td class=\"td3\">" + ts_f_btn_s + "</td><td class=\"td3\">"+ sy_time +"分</td><td class=\"td3\">" + target_key + "</td></tr>");
				}else{
					$("#load_input_tbl").find("tr:last").after("<tr id=\"tr" + target_key + "\"><td class=\"td3\" style=\"height:60px;\">" + obj["sno"] + "</td><td class=\"td3\">" + kokuseki + "<br>"+ oth_kokuseki + "</td><td class=\"td3\">" + row_day_date_end + "</td><td class=\"td3\">" + ts_f_btn_s + "</td><td class=\"td3\">"+ sy_time +"分</td><td class=\"td3\">" + target_key + "</td></tr>");
				}

				//無効票色変更
				//if( obj["test_f"] == 1 || obj["test_f"] == 2 ){
                if( obj["test_f"] == 1 || obj["test_f"] == 2 || ym_flg == 0 ){

					$("#tr" + target_key).children("td").css("background-color", "#999999");

				}

			}

		}

	}

}

//------------
//データ保存
//------------

//undefを""に変換
function chg_undef(q_vv){

	if( q_vv == undefined ){
		q_vv = "";
	}
	return q_vv;

}

//有効・無効　保存
function sample_save(sb_id){

	var sample_valsa = {};
	var sid = "";
	var chk_id_val = 0;
	var gid = sb_id;
	var s_b_id_ary = "";
	var jn_data = "";
	var obj = "";


	s_b_id_ary = gid.split("m");

	if( $("#" + gid).val() == "有効票" ){

		chk_id_val = 1;

	}else if( $("#" + gid).val() == "無効票" ){

		chk_id_val = 0;

	}

	//ユニークID
	sid = s_b_id_ary[1];

	jn_data = localStorage.getItem( sid );
	obj = JSON.parse( jn_data );

	obj["test_f"] = chk_id_val;

	localStorage.setItem(sid, JSON.stringify(obj) );

}

//修正済み保存
function chk_save(chked_id,num){

	var spl_ob = chked_id.split("_");
	var cid = spl_ob[1];
	var tval = num;

	jn_data = localStorage.getItem( cid );
	obj = JSON.parse( jn_data );

	obj["chk_f"] = tval;

	localStorage.setItem(cid, JSON.stringify(obj) );

}

//国籍別獲得票数
function gbt(){

	var tgt_date = $("#bt_date").val();
	var kkk_ary = new Array(3);
	var recode_nums = localStorage.getItem("data_no");
	//var target_key = "";
	var jn_data = "";
	var obj = "";
	var sibori_ary = "";
	var sibori = "";
    var jp_or_oth = "";
    var sw_in_obj = "";
    var ym_flg = 0;


	for(i=1;i<=3;i++){
		kkk_ary[i] = 0;
	}


	if(recode_nums > 0){

		for(i=1;i<=recode_nums;i++){

			//target_key = "recode"+ i;
			jn_data = localStorage.getItem( "recode"+ i );
			obj = JSON.parse( jn_data );
			sibori_ary = obj["day_date_start"].split(" ");
			sibori = sibori_ary[0];
            
			if( sibori == tgt_date ){
                
                for(j=1;j<=14;j++){
                    if( obj["q13_"+ j] == j ){
                        ym_flg++;
                    }
                }
                
				//if( obj["test_f"] == "" || obj["test_f"] == null || obj["test_f"] == undefined ){
                if( obj["test_f"] == 0 && ym_flg > 0 ){
                    sw_in_obj = "";
                    if(obj["q1a"] != "" && obj["q1a"] != undefined ){
                        sw_in_obj = 1;
                    }else if(obj["q1c"] != "" && obj["q1c"] != undefined ){
                        sw_in_obj = 2;
                    }
                    
					switch( Number( sw_in_obj ) ){
						case 1: kkk_ary[1]++;//日本人
							break;
						case 2: kkk_ary[2]++;//外国人
							break;
						default :
							break;
					}

				}

			}

		}
        

		$("#jp").text(kkk_ary[1]);
		$("#foreigner").text(kkk_ary[2]);

		for(i=1;i<=2;i++){
			kkk_ary[3] = kkk_ary[3] + kkk_ary[i];
		}

		$("#ak").text(kkk_ary[3]);

	}

}

//事前
function save_jizen(){

	//新規・修正分岐
	if( $("#recode_f").val() == 1 ){

		var target_id = "";
		var jn_data = "";
		var obj = "";

		target_id = localStorage.getItem( "use_key" );
		jn_data = localStorage.getItem( target_id );
		obj = JSON.parse( jn_data );

		test_f_v = $("input[name='test_f']:checked").val();
		fs1oa_v = $("#fs1oa").val();
        fs2_v = $("#fs2").val();

		test_f_v = chg_undef(test_f_v);
		fs1oa_v = chg_undef(fs1oa_v);
        fs2_v = chg_undef(fs2_v);

		obj["test_f"] = test_f_v;
		obj["fs1oa"] = fs1oa_v;
        obj["fs2"] = fs2_v;


		localStorage.setItem(target_id, JSON.stringify(obj) );

	}else{

		//回答開始時間
		e_date = se_time();

		//ユニークＩＤ
		rid = random(10, "0123456789abcdefghjkmnpqrstuvwxyz");
		tnum_v = localStorage.getItem("ls_tnum");
        spot_v = localStorage.getItem("ls_spot");
		start_date = se_time(2);
		//end_date = e_date;

		var ren_num = 1;
		var jn_data = "";
		var obj = "";
		var sibori_ary = "";
		var sibori = "";
		var all_num = "";
		var md_num = "";


		//サンプルNo自動
		var recode_nums = localStorage.getItem("data_no");
		if( localStorage.getItem("recode1") != "" ){

			for(i=1;i<recode_nums;i++){

				jn_data = localStorage.getItem( "recode"+ i );
				obj = JSON.parse( jn_data );
				//今日のデータのみ表示
				sibori_ary = obj["day_date_start"].split(" ");
				sibori = sibori_ary[0];
				if( sibori == se_time(1) ){
					ren_num += 1;
				}

			}

			all_num = ren_num;

		}else{

			all_num = 1;

		}
		//サンプルNo日別連番
		if( all_num < 10 ){
			md_num = "0" + all_num;
		}else{
			md_num = String(all_num);
		}

		test_f_v = $("input[name='test_f']:checked").val();
		fs1oa_v = $("#fs1oa").val();
        fs2_v = $("#fs2").val();

		tnum_v = chg_undef(tnum_v);
        spot_v = chg_undef(spot_v);
		test_f_v = chg_undef(test_f_v);
		fs1oa_v = chg_undef(fs1oa_v);
        fs2_v = chg_undef(fs2_v);

		var uk = localStorage.getItem("use_key");
		rid = uk+"/"+rid;

		var d_list = {
			uid:rid,
			sno:md_num,
			tnum:tnum_v,
            survey_spot:spot_v,
			test_f:test_f_v,
			day_date_start:start_date,
			fs1oa:fs1oa_v,
            fs2:fs2_v
		}

		localStorage.setItem(uk, JSON.stringify(d_list) );
		//alert(uk);

	}

}

//途中終了
function timeup_end(timeup_f){

	var target_id = "";
	var jn_data = "";
	var obj = "";
	var tf = timeup_f;

	target_id = localStorage.getItem( "use_key" );
	jn_data = localStorage.getItem( target_id );
	obj = JSON.parse( jn_data );

	if( tf == 2 ){
		if( $("#revision_f").val() == "" ){
			obj["test_f"] = 1;
		}
	}

	obj["end_f"] = 9;

	if( $("#revision_f").val() != 1 ){
		obj["day_date_end"] = se_time(2);
	}


	localStorage.setItem(target_id, JSON.stringify(obj) );

}

//Class?
function ClassSave(page_obj){
	this.target_id = localStorage.getItem( "use_key" );
	this.jn_data = localStorage.getItem( this.target_id );
	this.obj = JSON.parse( this.jn_data );
	this.target_obj = page_obj;
}

ClassSave.prototype.method1 = function () {

	for(key in this.target_obj){
		if(this.target_obj[key] == 1){
			this.obj[key] = chg_undef( $("input[name='"+ key +"']:checked").val() );
		}else if(this.target_obj[key] == 2){
			this.obj[key] = chg_undef( $("#l"+ key +":checked").val() );
		}else if(this.target_obj[key] == 3){
			this.obj[key] = chg_undef( $("#"+ key).val() );
		}
	}

	localStorage.setItem(this.target_id, JSON.stringify(this.obj) );

};


function save_p1(){
	//var test_flg = "";
	var obj_kv = {"q1a":"3","q1b":"3","q1c":"3","q2a":"1","q2b":"1","q3_1":"1","q3_1aoa":"3","q3_1boa":"3","q3_1coa":"3","q3_2_1":"2","q3_2_2":"2","q3_2_3":"2","q3_2_4":"2","q3_2_5":"2","q3_2_6":"2","q3_3_1aoa":"3","q3_3_1boa":"3","q3_3_2aoa":"3","q3_3_2boa":"3","q3_3_3aoa":"3","q3_3_3boa":"3","q4":"1","q4oa":"3","q5oa":"3","q5_1":"2","q5_2":"2","q5_3":"2","q5_4":"2","q6":"1","q6aoa":"3","q6boa":"3","q6coa":"3","q6doa":"3"};
	var saves = new ClassSave(obj_kv);
	saves.method1();
}

function save_p2(){
	var obj_kv = {"q7_1":"1","q7_1oa":"3","q7_2ka1":"3","q7_2ka2":"3","q7_2ka3":"3","q7_2ka4":"3","q7_2ka5":"3","q7_2ka6":"3","q7_2ko1":"3","q7_2ko2":"3","q7_2ko3":"3","q7_2ko4":"3","q7_2ko5":"3","q7_2ko6":"3","q7_2ko7":"3","q7_2ko8":"3","q7_2aoa":"3","q7_2boa":"3"};
	var saves = new ClassSave(obj_kv);
	saves.method1();
}

function save_p3(p3_flg){
	var obj_kv = {"q8":"1",
        "q9_1":"2","q9_2":"2","q9_3":"2","q9_4":"2","q9_5":"2","q9_6":"2","q9_7":"2","q9_8":"2","q9_9":"2","q9_10":"2","q9_11":"2","q9_12":"2","q9oa":"3",
        "q10a_1":"2","q10a_2":"2","q10a_3":"2","q10b_1":"2","q10b_2":"2","q10b_3":"2","q10b_4":"2","q10b_5":"2","q10b_6":"2","q10b_7":"2","q10b_8":"2","q10b_9":"2","q10b_10":"2","q10b_11":"2","q10b_12":"2","q10_2oa":"3",
        "q11":"1","q12":"1",
        "q13_1":"2","q13_2":"2","q13_3":"2","q13_4":"2","q13_5":"2","q13_6":"2","q13_7":"2","q13_8":"2","q13_9":"2","q13_10":"2","q13_11":"2","q13_12":"2","q13_13":"2","q13_14":"2","q13oa":"3"};
	var saves = new ClassSave(obj_kv);
	saves.method1();
    
    /*
    if(p3_flg == 1){
		var target_id = localStorage.getItem( "use_key" );
		var jn_data = localStorage.getItem( target_id );
		var obj = JSON.parse( jn_data );

		obj["day_date_end"] = se_time(2);
		obj["end_f"] = 1;

		localStorage.setItem(target_id, JSON.stringify(obj) );
	}
    */
}

function save_p4(){
    var target_id = localStorage.getItem( "use_key" );
    var jn_data = localStorage.getItem( target_id );
    var obj = JSON.parse( jn_data );

    obj["day_date_end"] = se_time(2);
    obj["end_f"] = 1;

    localStorage.setItem(target_id, JSON.stringify(obj) );
}


//----------------
//データ呼び出し
//----------------
function read_data( r_v_id ){

	var read_id = "";
	var r_v_id_ary = r_v_id.split("_");
	read_id = r_v_id_ary[1];

	//alert(read_id);
	$("#recode_f").val("1");
	$("#revision_f").val("1");

	//管理画面ボタン非表示
	$("#kanri_op").hide();

	localStorage.setItem("use_key", read_id );

	var jn_data = "";
	var obj = "";

	jn_data = localStorage.getItem( read_id );
	obj = JSON.parse( jn_data );


	//テストフラグ　チェックボックス変更により修正
	if(obj["test_f"] == 1 || obj["test_f"] == 2){
		$("#test_fv1").prop("checked","true").closest("div").css("background-color","#3399FF");
		$("#test_fv0").closest("div").css("background-color","#f1f1f1");
		$("#read_ts_f_val").val("1");
	}else{
		$("#test_fv0").prop("checked","true").closest("div").css("background-color","#3399FF");
		$("#test_fv1").closest("div").css("background-color","#f1f1f1");
		$("#read_ts_f_val").val("");
	}

	$("#fs1oa").val( obj["fs1oa"] );
	$("#lq1v" + obj["q1"] ).click();
	$("#q1oa").val( obj["q1oa"] );
	$("#lq2v" + obj["q2"] ).click();
	$("#q3").val( obj["q3"] );
	$("#q4").val( obj["q4"] );
	$("#lq5v" + obj["q5"] ).click();
	$("#lq6v" + obj["q6"] ).click();
	$("#q6oa").val( obj["q6oa"] );
	$("#lq7v" + obj["q7"] ).click();


	$("#la3_" + obj["a3_1"] ).prop("checked",true);
	$("#la3_" + obj["a3_2"] ).prop("checked",true);

	$("#lb1v" + obj["b1"] ).click();
	$("#b1a").val( obj["b1a"] );
	$("#lb2_1v" + obj["b2_1"] ).click();
	if( obj["b2_1"] == 0 || obj["b2_1"] == "" ){
		$("#b2_1").css("background-color","#ff8c00");
	}else{
		$("#b2_1").css("background-color","");
	}

	$("#b2_1a").val( obj["b2_1a"] );
	select_disa_ctm4();

	$("#lb2_2v" + obj["b2_2"] ).click();

	if( obj["b2_2"] == 0 || obj["b2_2"] == "" ){
		$("#b2_2").css("background-color","#ff8c00");
	}else{
		$("#b2_2").css("background-color","");
	}
	$("#b2_2_1").val( obj["b2_2_1"] );

	$("#lb3v" + obj["b3"] ).click();
	$("#lb3av" + obj["b3a"] ).click();
	if( obj["b3"] == "undefined" || obj["b3"] == null || obj["b3"] == "" || obj["b3a"] == "undefined" || obj["b3a"] == null || obj["b3a"] == "" ){
		$("#b3").css("background-color","#ff8c00");
	}else{
		$("#b3").css("background-color","");
	}

	var c1_ecnt = 0;
	for(i=1;i<=6;i++){
		$("#lc1_" + obj["c1_"+ i] ).prop("checked",true);
		if( obj["c1_"+ i] == "undefined" || obj["c1_"+ i] == null || obj["c1_"+ i] == "" ){
			c1_ecnt++;
		}
	}
	if( c1_ecnt == 6 ){
		$("#c1").css("background-color","#ff8c00");
	}else{
		$("#c1").css("background-color","");
	}

	$("#lc2v" + obj["c2"] ).click();
	$("#lc3v" + obj["c3"] ).click();
	if( obj["c2"] == "undefined" || obj["c2"] == null || obj["c2"] == "" ){
		$("#c2").css("background-color","#ff8c00");
	}else{
		$("#c2").css("background-color","");
	}
	if( obj["c3"] == "undefined" || obj["c3"] == null || obj["c3"] == "" ){
		$("#c3").css("background-color","#ff8c00");
	}else{
		$("#c3").css("background-color","");
	}

	var c4_ecnt = 0;
	for(i=1;i<=18;i++){
		$("#lc4_" + obj["c4_"+i] ).prop("checked",true);
		if( obj["c4_"+ i] == "undefined" || obj["c4_"+ i] == null || obj["c4_"+ i] == "" ){
			c4_ecnt++;
		}
	}
	if( c4_ecnt == 18 ){
		$("#c4").css("background-color","#ff8c00");
	}else{
		$("#c4").css("background-color","");
	}

	var c5_ecnt = 0;
	for(i=1;i<=10;i++){
		$("#lc5_" + obj["c5_"+ i] ).prop("checked",true);
		if( obj["c5_"+ i] == "undefined" || obj["c5_"+ i] == null || obj["c5_"+ i] == "" ){
			c5_ecnt++;
		}
	}
	if( c5_ecnt == 10 ){
		$("#c5").css("background-color","#ff8c00");
	}else{
		$("#c5").css("background-color","");
	}

	$("#lc6v" + obj["c6"] ).click();
	if( obj["c6"] == "undefined" || obj["c6"] == null || obj["c6"] == "" ){
		$("#c6").css("background-color","#ff8c00");
	}else{
		$("#c6").css("background-color","");
	}

	$("#ld1v" + obj["d1"] ).click();
	if( obj["d1"] == "undefined" || obj["d1"] == null || obj["d1"] == "" ){
		$("#d1").css("background-color","#ff8c00");
	}else{
		$("#d1").css("background-color","");
	}

	$("#d1_1").val( obj["d1_1"] );

	$("#d1_1aoa").val( obj["d1_1aoa"] );

	$("#d1_1boa").val( obj["d1_1boa"] );
	if( $("#d1_1boa").val() == "" ){
		$("#d1_1boa").css("background-color","#ff8c00");
	}else{
		$("#d1_1boa").css("background-color","");
	}

	$("#ld1_1_" + obj["d1_1_1"] ).prop("checked",true);

	$("#d1_2").val( obj["d1_2"] );

	$("#d1_2aoa").val( obj["d1_2aoa"] );

	$("#d1_2boa").val( obj["d1_2boa"] );
	if( $("#d1_2boa").val() == "" ){
		$("#d1_2boa").css("background-color","#ff8c00");
	}else{
		$("#d1_2boa").css("background-color","");
	}

	$("#ld1_2_" + obj["d1_2_1"] ).prop("checked",true);

	$("#ld1_2_" + obj["d1_2_2"] ).prop("checked",true);

	$("#ld1_2_" + obj["d1_2_3"] ).prop("checked",true);

	$("#ld2v" + obj["d2"] ).click();
	if( obj["d2"] == "undefined" || obj["d2"] == null || obj["d2"] == "" ){
		$("#d2").css("background-color","#ff8c00");
	}else{
		$("#d2").css("background-color","");
	}

	$("#ld3v" + obj["d3"] ).click();
	if( obj["d3"] == "undefined" || obj["d3"] == null || obj["d3"] == "" ){
		$("#d3").css("background-color","#ff8c00");
	}else{
		$("#d3").css("background-color","");
	}

	for(i=1;i<=4;i++){
		$("#lff1_" + obj["ff1_"+ i] ).prop("checked","true");
	}

	for(i=1;i<=6;i++){
		$("#lff2a_" + obj["ff2a_"+ i] ).prop("checked","true");
	}

	for(i=1;i<=6;i++){
		$("#lff2b_" + obj["ff2b_"+ i] ).prop("checked","true");
	}

	for(i=1;i<=11;i++){
		$("#lff2c_" + obj["ff2c_"+ i] ).prop("checked","true");
	}

	$("#e4a").val( obj["e4a"] );

	$("#le4bv" + obj["e4b"] ).click();

	$("#e4c").val( obj["e4c"] );


	$("#e1_11").val( obj["e1_11"] );
	//修正ボタン押した後の訪問地用
	function houmon_set(h_set){

		var h_tar = h_set;
		var num = 0;
		m_val = $("#e1_"+ h_tar +"1").val();
		//alert(m_val);

		$("#e1_"+ h_tar +"2").children().remove();
		$("#e1_"+ h_tar +"3oa").val("");

		e1_select_chg(m_val);
		//alert( c5_sel_ary );
		num = e1_sel_ary.length - 1;

		//最大26
		for(i=0;i<=num;i++){

			t = i;
			$('#e1_'+ h_tar +'2').append('<option value="' + e1_code_ary[i] + '">' + e1_sel_ary[i] + '</option>');

		}
		//hmc5();

	}

	//houmon_set(1);
	//$("#e1_12").val( obj["e1_12"] );
	$("#e1_13oa").val( obj["e1_13oa"] );
	$("#e2_11").val( obj["e2_11"] );
	$("#e2_12oa").val( obj["e2_12oa"] );
	$("#e3_1").val( obj["e3_1"] );
	$("#e4_1").val( obj["e4_1"] );
	for(i=1;i<=15;i++){
		if( obj["e2_"+ i +"3"] == 1 ){
			$("#e2_"+ i +"3").prop("checked",true);
		}
	}


	$("#e1_21").val( obj["e1_21"] );
	houmon_set(2);
	$("#e1_22").val( obj["e1_22"] );
	$("#e1_23oa").val( obj["e1_23oa"] );
	$("#e2_21").val( obj["e2_21"] );
	$("#e2_22oa").val( obj["e2_22oa"] );
	$("#e3_2").val( obj["e3_2"] );
	$("#e4_2").val( obj["e4_2"] );

	$("#e1_31").val( obj["e1_31"] );
	houmon_set(3);
	$("#e1_32").val( obj["e1_32"] );
	$("#e1_33oa").val( obj["e1_33oa"] );
	$("#e2_31").val( obj["e2_31"] );
	$("#e2_32oa").val( obj["e2_32oa"] );
	$("#e3_3").val( obj["e3_3"] );
	$("#e4_3").val( obj["e4_3"] );

	$("#e1_41").val( obj["e1_41"] );
	houmon_set(4);
	$("#e1_42").val( obj["e1_42"] );
	$("#e1_43oa").val( obj["e1_43oa"] );
	$("#e2_41").val( obj["e2_41"] );
	$("#e2_42oa").val( obj["e2_42oa"] );
	$("#e3_4").val( obj["e3_4"] );
	$("#e4_4").val( obj["e4_4"] );

	$("#e1_51").val( obj["e1_51"] );
	houmon_set(5);
	$("#e1_52").val( obj["e1_52"] );
	$("#e1_53oa").val( obj["e1_53oa"] );
	$("#e2_51").val( obj["e2_51"] );
	$("#e2_52oa").val( obj["e2_52oa"] );
	$("#e3_5").val( obj["e3_5"] );
	$("#e4_5").val( obj["e4_5"] );

	$("#e1_61").val( obj["e1_61"] );
	houmon_set(6);
	$("#e1_62").val( obj["e1_62"] );
	$("#e1_63oa").val( obj["e1_63oa"] );
	$("#e2_61").val( obj["e2_61"] );
	$("#e2_62oa").val( obj["e2_62oa"] );
	$("#e3_6").val( obj["e3_6"] );
	$("#e4_6").val( obj["e4_6"] );

	$("#e1_71").val( obj["e1_71"] );
	houmon_set(7);
	$("#e1_72").val( obj["e1_72"] );
	$("#e1_73oa").val( obj["e1_73oa"] );
	$("#e2_71").val( obj["e2_71"] );
	$("#e2_72oa").val( obj["e2_72oa"] );
	$("#e3_7").val( obj["e3_7"] );
	$("#e4_7").val( obj["e4_7"] );

	$("#e1_81").val( obj["e1_81"] );
	houmon_set(8);
	$("#e1_82").val( obj["e1_82"] );
	$("#e1_83oa").val( obj["e1_83oa"] );
	$("#e2_81").val( obj["e2_81"] );
	$("#e2_82oa").val( obj["e2_82oa"] );
	$("#e3_8").val( obj["e3_8"] );
	$("#e4_8").val( obj["e4_8"] );

	$("#e1_91").val( obj["e1_91"] );
	houmon_set(9);
	$("#e1_92").val( obj["e1_92"] );
	$("#e1_93oa").val( obj["e1_93oa"] );
	$("#e2_91").val( obj["e2_91"] );
	$("#e2_92oa").val( obj["e2_92oa"] );
	$("#e3_9").val( obj["e3_9"] );
	$("#e4_9").val( obj["e4_9"] );

	$("#e1_101").val( obj["e1_101"] );
	houmon_set(10);
	$("#e1_102").val( obj["e1_102"] );
	$("#e1_103oa").val( obj["e1_103oa"] );
	$("#e2_101").val( obj["e2_101"] );
	$("#e2_102oa").val( obj["e2_102oa"] );
	$("#e3_10").val( obj["e3_10"] );
	$("#e4_10").val( obj["e4_10"] );

	$("#e1_111").val( obj["e1_111"] );
	houmon_set(11);
	$("#e1_112").val( obj["e1_112"] );
	$("#e1_113oa").val( obj["e1_113oa"] );
	$("#e2_111").val( obj["e2_111"] );
	$("#e2_112oa").val( obj["e2_112oa"] );
	$("#e3_11").val( obj["e3_11"] );
	$("#e4_11").val( obj["e4_11"] );

	$("#e1_121").val( obj["e1_121"] );
	houmon_set(12);
	$("#e1_122").val( obj["e1_122"] );
	$("#e1_123oa").val( obj["e1_123oa"] );
	$("#e2_121").val( obj["e2_121"] );
	$("#e2_122oa").val( obj["e2_122oa"] );
	$("#e3_12").val( obj["e3_12"] );
	$("#e4_12").val( obj["e4_12"] );

	$("#e1_131").val( obj["e1_131"] );
	houmon_set(13);
	$("#e1_132").val( obj["e1_132"] );
	$("#e1_133oa").val( obj["e1_133oa"] );
	$("#e2_131").val( obj["e2_131"] );
	$("#e2_132oa").val( obj["e2_132oa"] );
	$("#e3_13").val( obj["e3_13"] );
	$("#e4_13").val( obj["e4_13"] );

	$("#e1_141").val( obj["e1_141"] );
	houmon_set(14);
	$("#e1_142").val( obj["e1_142"] );
	$("#e1_143oa").val( obj["e1_143oa"] );
	$("#e2_141").val( obj["e2_141"] );
	$("#e2_142oa").val( obj["e2_142oa"] );
	$("#e3_14").val( obj["e3_14"] );
	$("#e4_14").val( obj["e4_14"] );

	$("#e1_151").val( obj["e1_151"] );
	houmon_set(15);
	$("#e1_152").val( obj["e1_152"] );
	$("#e1_153oa").val( obj["e1_153oa"] );
	$("#e2_151").val( obj["e2_151"] );
	$("#e2_152oa").val( obj["e2_152oa"] );
	$("#e3_15").val( obj["e3_15"] );
	$("#e4_15").val( obj["e4_15"] );


	$("#f1").val( obj["f1"] );

	$("#lf2_1v" + obj["f2_1"] ).click();

	$("#f2_2").val( obj["f2_2"] );


	var f3_ecnt;
	for(i=1;i<=26;i++){

		f3_ecnt = 0;
		$("#lf3_" + obj["f3_"+ i] ).click();
		$("#f3_"+ i +"oa").val( obj["f3_"+ i +"oa"] );
		if( obj["f3_"+ i] == null || obj["f3_"+ i] == "undefined" || obj["f3_"+ i] == "" ){
			f3_ecnt ++;
		}

		if( obj["f3_"+ i +"oa"] == null || obj["f3_"+ i +"oa"] == "" ){
			f3_ecnt ++;
		}

		if(f3_ecnt == 2){
			$("#f3_"+ i +"oa").css("background-color","#ff8c00");
			$("#lf3_"+ i).closest("td").css("background-color","#ff8c00");
		}else{
			$("#f3_"+ i +"oa").css("background-color","");
			$("#lf3_"+ i).closest("td").css("background-color","");
		}

	}


	$("#f3aoa").val( obj["f3aoa"] );
	if( obj["f3aoa"] == null || obj["f3aoa"] == "" ){
		$("#f3aoa").css("background-color","#ff8c00");
	}else{
		$("#f3aoa").css("background-color","");
	}

	$("#f3boa").val( obj["f3boa"] );
	if( obj["f3boa"] == null || obj["f3boa"] == "" ){
		$("#f3boa").css("background-color","#ff8c00");
	}else{
		$("#f3boa").css("background-color","");
	}

	$("#f3coa").val( obj["f3coa"] );
	if( obj["f3coa"] == null || obj["f3coa"] == "" ){
		$("#f3coa").css("background-color","#ff8c00");
	}else{
		$("#f3coa").css("background-color","");
	}

	$("#f3doa").val( obj["f3doa"] );
	if( obj["f3doa"] == null || obj["f3doa"] == "" ){
		$("#f3doa").css("background-color","#ff8c00");
	}else{
		$("#f3doa").css("background-color","");
	}


	var g1_ecnt = 0;
	for(i=1;i<=13;i++){
		$("#lg1_" + obj["g1_"+ i]).prop("checked","true");
		if( obj["g1_"+ i] == "undefined" || obj["g1_"+ i] == null || obj["g1_"+ i] == "" ){
			g1_ecnt++;
		}
	}
	if( g1_ecnt == 13 ){
		$("#g1").css("background-color","#ff8c00");
	}else{
		$("#g1").css("background-color","");
	}

	$("#g2a").val( obj["g2a"] );
	if( obj["g2a"] == null || obj["g2a"] == "" ){
		$("#g2a").css("background-color","#ff8c00");
	}else{
		$("#g2a").css("background-color","");
	}

	$("#g2b").val( obj["g2b"] );


	$("#lh1v" + obj["h1"] ).click();
	if( obj["h1"] == "undefined" || obj["h1"] == null || obj["h1"] == "" ){
		$("#h1").css("background-color","#ff8c00");
	}else{
		$("#h1").css("background-color","");
	}

	$("#lh2v" + obj["h2"] ).click();
	if( obj["h2"] == "undefined" || obj["h2"] == null || obj["h2"] == "" ){
		$("#h2").css("background-color","#ff8c00");
	}else{
		$("#h2").css("background-color","");
	}

	$("#lh3v" + obj["h3"] ).click();


	var j1_ecnt = 0;
	for(i=1;i<=23;i++){
		$("#lj1_" + obj["j1_"+ i] ).prop("checked","true");
		if( obj["j1_"+ i] == "undefined" || obj["j1_"+ i] == null ){
			j1_ecnt++;
		}
	}
	if( j1_ecnt == 23 ){
		$("#j1").css("background-color","#ff8c00");
	}else{
		$("#j1").css("background-color","");
	}

	$("#j1oa").val( obj["j1oa"] );

	var j2_ecnt = 0;
	for(i=1;i<=11;i++){
		$("#lj2_" + obj["j2_"+ i]).prop("checked","true");
		if( obj["j2_"+ i] == "undefined" || obj["j2_"+ i] == null ){
			j2_ecnt++;
		}
	}
	if( j2_ecnt == 11 ){
		$("#j2").css("background-color","#ff8c00");
	}else{
		$("#j2").css("background-color","");
	}

	var j3_ecnt = 0;
	for(i=1;i<=15;i++){
		$("#lj3_" + obj["j3_"+ i] ).prop("checked","true");
		if( obj["j3_"+ i] == "undefined" || obj["j3_"+ i] == null ){
			j3_ecnt++;
		}
	}
	if( j3_ecnt == 15 ){
		$("#j3").css("background-color","#ff8c00");
	}else{
		$("#j3").css("background-color","");
	}

	$("#j3oa").val( obj["j3oa"] );
	if( obj["j3_14"] == 14 ){
		if( obj["j3oa"] == null || obj["j3oa"] == "" ){
			$("#j3oa").css("background-color","#ff8c00");
		}
	}

	$("#j4aoa").val( obj["j4aoa"] );
	if( obj["j4aoa"] == null || obj["j4aoa"] == "" ){
		$("#j4aoa").css("background-color","#ff8c00");
	}else{
		$("#j4aoa").css("background-color","");
	}

	$("#j4boa").val( obj["j4boa"] );
	if( obj["j4boa"] == null || obj["j4boa"] == "" ){
		$("#j4boa").css("background-color","#ff8c00");
	}else{
		$("#j4boa").css("background-color","");
	}

	$("#j5aoa").val( obj["j5aoa"] );
	if( obj["j5aoa"] == null || obj["j5aoa"] == "" ){
		$("#j5aoa").css("background-color","#ff8c00");
	}else{
		$("#j5aoa").css("background-color","");
	}

	$("#j5boa").val( obj["j5boa"] );
	if( obj["j5boa"] == null || obj["j5boa"] == "" ){
		$("#j5boa").css("background-color","#ff8c00");
	}else{
		$("#j5boa").css("background-color","");
	}


	var j6_1a_ecnt = 0;
	var j6_1b_ecnt = 0;
	var j6_2a_ecnt = 0;
	var j6_3_ecnt = 0;
	for(i=1;i<=21;i++){
		$("#lj6_1a_"+ obj["j6_1a_"+ i] ).prop("checked","true");
		if( obj["j6_1a_"+ i] == "undefined" || obj["j6_1a_"+ i] == null ){
			j6_1a_ecnt++;
		}

		$("#lj6_1b_"+ obj["j6_1b_"+ i] ).prop("checked","true");
		if( obj["j6_1b_"+ i] == "undefined" || obj["j6_1b_"+ i] == null ){
			j6_1b_ecnt++;
		}

		$("#lj6_2a_"+ obj["j6_2a_"+ i] ).prop("checked","true");
		if( obj["j6_2a_"+ i] == "undefined" || obj["j6_2a_"+ i] == null ){
			j6_2a_ecnt++;
		}

		$("#lj6_3_"+ obj["j6_3_"+ i] ).prop("checked","true");
		if( obj["j6_3_"+ i] == "undefined" || obj["j6_3_"+ i] == null ){
			j6_3_ecnt++;
		}
	}
	if( j6_1a_ecnt == 21 ){
		$("#j6_1a").css("background-color","#ff8c00");
	}else{
		$("#j6_1a").css("background-color","#FFFFCC");
	}

	if( j6_1b_ecnt == 21 ){
		$("#j6_1b").css("background-color","#ff8c00");
	}

	if( j6_2a_ecnt == 21 ){
		$("#j6_2a").css("background-color","#ff8c00");
	}else{
		$("#j6_2a").css("background-color","#FFFFCC");
	}

	if( j6_3_ecnt == 21 ){
		$("#j6_3").css("background-color","#ff8c00");
	}else{
		$("#j6_3").css("background-color","#FFFFCC");
	}

	

	$("#j7a").val( obj["j7a"] );

	$("#j7b").val( obj["j7b"] );

	//--呼び出し色付け--
	$("#la2v" + obj["a2"] ).closest("td").css("background-color", "#3399FF");

	$("#la3v" + obj["a3"] ).closest("li").css("background-color", "#3399FF");

	for(i=1;i<=2;i++){

		if( obj["a3_"+ i] == i ){
			$("#la3_" + i).closest("li").css("background-color", "#3399FF");
		}

	}

	$("#lb1v" + obj["b1"] ).closest("td").css("background-color", "#3399FF");

	$("#lb2_1v" + obj["b2_1"] ).closest("td").css("background-color", "#3399FF");

	$("#lb2_2v" + obj["b2_2"] ).closest("td").css("background-color", "#3399FF");

	$("#lb3v" + obj["b3"] ).closest("td").css("background-color", "#3399FF");

	$("#lb3av" + obj["b3a"] ).closest("td").css("background-color", "#3399FF");

	for(i=1;i<=6;i++){

		if( obj["c1_"+ i] == i ){
			$("#lc1_" + i).closest("td").css("background-color", "#3399FF");
		}

	}

	$("#lc2v" + obj["c2"] ).closest("td").css("background-color", "#3399FF");

	$("#lc3v" + obj["c3"] ).closest("td").css("background-color", "#3399FF");

	for(i=1;i<=18;i++){

		if( obj["c4_"+ i] == i ){
			$("#lc4_" + i).closest("td").css("background-color", "#3399FF");

		}

	}

	for(i=1;i<=10;i++){

		if( obj["c5_"+ i] == i ){
			$("#lc5_" + i).closest("td").css("background-color", "#3399FF");
		}

	}

	$("#lc6v" + obj["c6"] ).closest("td").css("background-color", "#3399FF");

	$("#ld1v" + obj["d1"] ).closest("li").css("background-color", "#3399FF");

	if( obj["d1_1_1"] == 1 ){

		$("#ld1_1_1").closest("li").css("background-color", "#3399FF");

	}

	for(i=1;i<=3;i++){

		if( obj["d1_2_"+ i] == i ){
			$("#ld1_2_" + i).closest("li").css("background-color", "#3399FF");
		}

	}

	if( obj["d2"] != "" ){

		$("#ld2v"+ obj["d2"] ).closest("li").css("background-color", "#3399FF");

	}

	if( obj["d3"] != "" ){

		$("#ld3v"+ obj["d3"] ).closest("td").css("background-color", "#3399FF");

	}

	for(i=1;i<=4;i++){

		if( obj["ff1_"+ i] == i ){
			$("#lff1_" + i).closest("li").css("background-color", "#3399FF");
		}

	}

	for(i=1;i<=6;i++){

		if( obj["ff2a_"+ i] == i ){
			$("#lff2a_" + i).closest("td").css("background-color", "#3399FF");
		}

	}

	for(i=1;i<=6;i++){

		if( obj["ff2b_"+ i] == i ){
			$("#lff2b_" + i).closest("td").css("background-color", "#3399FF");
		}

	}

	for(i=1;i<=11;i++){

		if( obj["ff2c_"+ i] == i ){
			$("#lff2c_" + i).closest("td").css("background-color", "#3399FF");
		}

	}

	if( obj["e4b"] != "" ){

		$("#le4bv"+ obj["e4b"] ).closest("li").css("background-color", "#3399FF");

	}

	if( obj["f2_1"] != "" ){

		$("#lf2_1v"+ obj["f2_1"] ).closest("li").css("background-color", "#3399FF");

	}

	for(i=1;i<=26;i++){

		if( obj["f3_"+ i] == i ){
			$("#lf3_" + i).closest("td").css("background-color", "#3399FF");
		}

	}

	for(i=1;i<=13;i++){

		if( obj["g1_"+ i] == i ){
			$("#lg1_" + i).closest("td").css("background-color", "#3399FF");
		}

	}

	if( obj["h1"] != "" ){

		$("#lh1v"+ obj["h1"] ).closest("li").css("background-color", "#3399FF");

	}

	if( obj["h2"] != "" ){

		$("#lh2v"+ obj["h2"] ).closest("li").css("background-color", "#3399FF");

	}

	if( obj["h3"] != "" ){

		$("#lh3v"+ obj["h3"] ).closest("li").css("background-color", "#3399FF");

	}

	for(i=1;i<=23;i++){

		if( obj["j1_"+ i] == i ){
			$("#lj1_" + i).closest("td").css("background-color", "#3399FF");
		}

	}

	for(i=1;i<=11;i++){

		if( obj["j2_"+ i] == i ){
			$("#lj2_" + i).closest("td").css("background-color", "#3399FF");
		}

	}

	for(i=1;i<=15;i++){

		if( obj["j3_"+ i] == i ){
			$("#lj3_" + i).closest("td").css("background-color", "#3399FF");
		}

	}

	for(i=1;i<=21;i++){

		if( obj["j6_1a_"+ i] == i ){
			$("#lj6_1a_"+ i).closest("td").css("background-color", "#3399FF");
		}

	}

	for(i=1;i<=21;i++){

		if( obj["j6_1b_"+ i] == i ){
			$("#lj6_1b_"+ i).closest("td").css("background-color", "#3399FF");
		}

	}

	for(i=1;i<=21;i++){

		if( obj["j6_2a_"+ i] == i ){
			$("#lj6_2a_"+ i).closest("td").css("background-color", "#3399FF");
		}

	}

	if( obj["j6_2b"] != "" ){

		$("#lj6_2bv"+ obj["j6_2b"] ).closest("td").css("background-color", "#3399FF");

	}

	for(i=1;i<=21;i++){

		if( obj["j6_3_"+ i] == i ){
			$("#lj6_3_"+ i).closest("td").css("background-color", "#3399FF");
		}

	}



	select_disa_ctm1();
	select_disa_ctm2();
	select_disa_ctm3();
	
	select_disa_ctm5();

	if( obj["c4_18"] == 18 ){
		select_disa_var2("c4_tar1","lc4_",17,"lc4_18","lc4_18");
	}else{
		for(i=1;i<=17;i++){
			select_disa_var2("c4_tar1","lc4_",17,"lc4_18","lc4_"+ i);
		}
	}

	select_disa_ctm7();
	set_cy("d1_1");
	select_disa_ctm8();
	set_cy("d1_2");
	select_disa_ctm9();
	select_disa_ctm10();


	for(j=1;j<=4;j++){
		(function(k){
		if( obj["ff1_"+ k] == k ){
			select_disa_ff1("lff1_"+ k);
		}
		})(j);
	}

	e4_all();

	if(obj["e4b"] == 1){
		set_cy("le4bv1");
	}else if(obj["e4b"] == 2){
		set_cy("e4c");
	}

	for(j=1;j<=15;j++){
		(function(k){

				select_disa_e2haku(k);
				haku_goukei();

		})(j);
	}

	if(obj["f2_1"] == 1){
		set_cy("lf2_1v1");
	}else if(obj["f2_1"] == 2){
		set_cy("f2_2");
	}

	var f3_goukei = 0;
	var sagaku = 0;
	for(i=1;i<=26;i++){

		f3_goukei = f3_goukei + Number( $("#f3_"+ i +"oa").val() );

	}

	if( isNaN(f3_goukei) ){

		$("#in_all").text("0");

	}else{

		$("#in_all").text(f3_goukei);

	}

	sagaku = Number( $("#f3doa").val() ) - f3_goukei;

	if( isNaN( sagaku ) ){

		$("#sougakusa").text("0");

	}else{

		$("#sougakusa").text(sagaku);

	}

	for(j=1;j<=13;j++){
		(function(k){
			//select_disa_var2("g1_tar1","lg1_",12,"lg1_13","lg1_"+ k);
			select_disa_var2_g1("g1_tar1","lg1_",12,"lg1_13","lg1_"+ k);
		})(j);
	}

	select_disa_g1();

	for(j=1;j<=23;j++){
		(function(k){
			select_disa_var3("j1_tar1","lj1_",22,"lj1_23","lj1_"+ k,"lj1_11","j1oa");
		})(j);
	}

	for(j=1;j<=11;j++){
		(function(k){
			select_disa_var2("j2_tar1","lj2_",10,"lj2_11","lj2_"+ k);
		})(j);
	}

	for(j=1;j<=15;j++){
		(function(k){
			select_disa_var3("j3_tar1","lj3_",14,"lj3_15","lj3_"+ k,"j3oa");
		})(j);
	}


	for(j=1;j<=21;j++){
		(function(k){

			oid1 = "lj6_1a_"+ k;
			Select_disa_j6_1a( oid1 );

			oid2 = "lj6_1b_"+ k;
			Select_disa_j6_1b( oid2 );

			oid3 = "lj6_2a_"+ k;
			Select_disa_j6_2a( oid3 );

			oid4 = "lj6_2bv"+ k;
			Select_disa_j6_2b( oid4 );

			oid5 = "lj6_3_"+ k;
			Select_disa_j6_3( oid5 );

		})(j);
	}

	$("#lj6_2bv" + obj["j6_2b"] ).click();
	if( Number( obj["j6_2b"] ) > 0 ){
		$("#lj6_2bv" + obj["j6_2b"] ).closest("td").css("background-color","#3399ff");
	}

	if( obj["j6_2b"] == "undefined" || obj["j6_2b"] == null ){
		$("#j6_2b").css("background-color","#ff8c00");
	}else{
		$("#j6_2b").css("background-color","#FFFFCC");
	}

}


//---------------
//選択肢　制御
//---------------
//その他var
function select_disa_var1(x1,x2){

	str1 = String(x1);//その他ラジオorチェック
	str2 = String(x2);//その他テキスト


	if( $("#" + str1).prop("checked") == true ){
		$("#" + str2).prop("disabled", "");
		$("#" + str2).css("background","");
	}else if( $("#" + str1).prop("checked") == false ){
		$("#" + str2).prop("disabled", "true");
		$("#" + str2).val("");
		$("#" + str2).css("background","#999999");
	}

}

//排他
function select_disa_var2(x3,x4,x5,x6,x7){

	pt = String(x3);//親テーブルor li等
	str4 = String(x4);//排他の回す文字列
	num1 = Number(x5);//排他の回す数
	str6 = String(x6);//排他
	str7 = String(x7);//タッチした選択肢のID


	var cnt = 0;
	var ptfc = $("#" + pt).find(":checkbox");

	if( $("#" + str6).prop("checked") == true ){
        alert("IN");
		ptfc.not("#" + str6).prop("disabled", true);
		ptfc.not("#" + str6).prop("checked", "");
		ptfc.not("#" + str6).closest("td").css("background-color", "#666666");
	}else if( $("#" + str6).prop("checked") == false && $("#" + str6).prop("disabled") == false ){
		//alert(str6+"/"+str7);
		if( str6 == str7 ){
			ptfc.prop("disabled", "");
			ptfc.not("#" + str6).closest("td").css("background-color","");
		}
	}

	for(i=1;i<=num1;i++){
		if( $("#" + str4 + i).prop("checked") == true){
			$("#" + str6).prop("disabled", "true");
			$("#" + str6).closest("td").css("background-color","#666666");
			cnt ++;
		}
	}

	if( cnt == 0 && $("#" + str6).prop("checked") == false  ){
		$("#" + str6).prop("disabled","");
		$("#" + str6).closest("td").css("background-color","");
	}

}

//排他 + その他１つ
function select_disa_var3(ha_id,group_class,x1,x2){

	var str1 = String(ha_id);//排他のID
	var target_class = String(group_class);//対象グループのclass
	var str2 = String(x1);//その他の選択肢
	var str3 = String(x2);//その他の入力欄


    if( $("#"+ str1).prop("checked") == true ){
        $("."+ target_class).not("#"+ str1).prop("checked",false);
        $("."+ target_class).not("#"+ str1).prop("disabled",true);
        $("."+ target_class).not("#"+ str1).closest("div").css("background","#999999");
    }else{
        $("."+ target_class).not("#"+ str1).prop("disabled","");
        $("."+ target_class).not("#"+ str1).filter(':not(":checked")').closest("div").css("background","");
    }
    
    if( Number( $("."+ target_class).not("#"+ str1).filter(":checked").length ) > 0 ){
        $("#"+ str1).prop("disabled",true);
        $("#"+ str1).prop("checked","");
        $("#"+ str1).closest("div").css("background","#999999");
    }else{
        $("#"+ str1).prop("disabled","");
        $("#"+ str1).filter(':not(":checked")').closest("div").css("background","");
    }
    
    if( $("#"+ str2).prop("checked") == true ){
        $("#"+ str3).prop("disabled","").css("background","");
    }else{
        $("#"+ str3).prop("disabled",true).css("background","#999999");
        $("#"+ str3).val("");
    }

}

//Q1
function select_disa_ctm1(){

    if( $("#q1a").val() != "" ){
        $("#q1c").val("");
        $("#q1c").prop("disabled", true).css("background", "#999999");
    }else{
        $("#q1c").prop("disabled", "").css("background", "");
    }
    
    if( $("#q1a").val() == 13 ){
        $("#q1b").prop("disabled", "").css("background", "");
    }else{
        $("#q1b").val("");
        $("#q1b").prop("disabled", true).css("background", "#999999");
    }

}

//Q1
function select_disa_ctm2(){

	if( $("#q1c").val() != "" ){
        $("#q1a").val("");
        $("#q1a").prop("disabled", true).css("background", "#999999");
        $("#q1b").val("");
        $("#q1b").prop("disabled", true).css("background", "#999999");
    }else{
        $("#q1a").prop("disabled", "").css("background", "");
    }

}

//Q3
function select_disa_ctm3(){

    if( $("#lq3_1v2").prop("checked") == true ){
        $("#q3_1aoa").prop("disabled","").css("background","");
        $("#q3_1boa").prop("disabled","").css("background","");
        $("#q3_1coa").prop("disabled","").css("background","");
        
        for(i=1;i<=6;i++){
            $("#lq3_2_"+ i).prop("disabled","");
            $("#lq3_2_"+ i).closest("div").css("background","");
        }
    }else if( $("#lq3_1v2").prop("checked") == false ){
        $("#q3_1aoa").val("");
        $("#q3_1aoa").prop("disabled",true).css("background","#999999");
        $("#q3_1boa").val("");
        $("#q3_1boa").prop("disabled",true).css("background","#999999");
        $("#q3_1coa").val("");
        $("#q3_1coa").prop("disabled",true).css("background","#999999");
        
        for(i=1;i<=6;i++){
            $("#lq3_2_"+ i).prop("checked",false);
            $("#lq3_2_"+ i).prop("disabled",true);
            $("#lq3_2_"+ i).closest("div").css("background","#999999");
        }
    }

}


//Q5
function select_disa_ctm4(){
    if( Number( $("#q5oa").val() ) >= 2 ){
        for(i=1;i<=4;i++){
            $("#lq5_"+ i).prop("disabled", "");
            $("#lq5_"+ i).closest("div").css("background","");
        }
    }else{
        for(i=1;i<=4;i++){
            $("#lq5_"+ i).prop("checked", false);
            $("#lq5_"+ i).prop("disabled", true);
            $("#lq5_"+ i).closest("div").css("background","#999999");
        }
    }
}

//Q6
function select_disa_ctm5(){
    
    var alp_ary = ["","a","b","c","d"];
    
    if( $("#lq6v1").prop("checked") == true ){
        for(i=1;i<=4;i++){
            $("#q6"+ alp_ary[i] +"oa").prop("disabled","").css("background","");
        }
    }else{
        for(i=1;i<=4;i++){
            $("#q6"+ alp_ary[i] +"oa").val("");
            $("#q6"+ alp_ary[i] +"oa").prop("disabled",true).css("background","#999999");
        }
    }
    
}