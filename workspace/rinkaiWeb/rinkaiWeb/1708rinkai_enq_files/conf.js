//**************************************
//		ENTERキー誤送信回避
//**************************************

function enter_kill(){
	
	window.document.onkeydown = function(e){
	
		if( navigator.userAgent.indexOf("Firefox") > -1 ){
			if( e.which == 13 ){
				e.preventDefault();
			}
		}else{
			if( event.keyCode == 13 ){
				event.returnValue = false;
			}
		}
		
	}

}


//**************************************
//		エラーチェックルーチン
//**************************************
function trim(vals){

	return vals.replace(/^\s+|\s+$/g, "");

}


//**************************************
//		パターンNo1（ラジオチェック）
//**************************************
function Chk_ptn01(err_f,str_q){
var err_f = 0;
var i = 0;
var docs = document.forms[form_name];
var for_num = docs.elements[str_q].length - 1;

	for(i = 0;i <= for_num;i++){
		if(docs.elements[str_q][i].checked == true){

			err_f = 0;
			return (err_f);

			//念のため
			break;
		}
	}

	err_f = 1;

	return (err_f);
}

//***************************************
//		パターンNo2(テキストチェック　セレクトボックスチェック)
//***************************************
function Chk_ptn02(err_f,str_q){
var err_f = 0;
var i = 0;
text_fa = "";
var docs = document.forms[form_name];

	text_fa = "";
	text_fa = trim(docs.elements[str_q].value);

	if(text_fa != ""){

		err_f = 0;

	}else{
		err_f = 1;
	}

	return (err_f);

}

//**************************************
//		パターンNo3(チェックボックスチェック)
//**************************************
function Chk_ptn03(err_f,str_q,end_c){
var err_f = 0;
var i = 0;
str_buff="";
text_fa = "";
var docs = document.forms[form_name];

	for(i=1;i<=end_c;i++){

		//チェックボックスNAMEの作成
		str_buff = str_q + i;

		if(docs.elements[str_buff].checked == true){

			err_f = 0;
			return (err_f);

			//念のため
			break;
		}
	}

	err_f = 1;

	return (err_f);
}


//**************************************
//		パターンNo4(チェックボックスチェック変更)
//**************************************
function Chk_ptn04(err_f,str_q,end_c,mt_a){
var err_f = 0;
var i = 0;
str_buff="";
text_fa = "";
var docs = document.forms[form_name];

	for(i=1;i<=end_c;i++){

		//チェックボックスNAMEの作成
		str_buff = str_q + mt_a[i];

		if(docs.elements[str_buff].checked == true){

			err_f = 0;
			return (err_f);

			//念のため
			break;
		}
	}

	err_f = 1;

	return (err_f);
}

//****************************************************************************************
//小数点チェック
//****************************************************************************************
function Chk_SQ( str_Q, num ){
	//SQの数値・小数点チェック
	var ret_i = 0;
	var ick = document.forms[form_name].elements[str_Q].value;
	var err_flag2 = 0;
	
	if( Chk_ptn02(err_flag2,str_Q) == 1 ){
		//入力なし
		ret_i = 1;
	}else{
		if(ick.match(/[^0-9|^.]/g)){
			// パターンマッチ 半角数字と小数点以外はＮＧ
			ret_i = 2;
		}else{
			if( ick > 1000000000 ){
				//桁数が多すぎる
				ret_i = 3;
			}else if( ick == 0 ){
				//ゼロ
				ret_i = 4;
			}else{
				// 小数点の数を取得する
				var count = 0;
				for (iii = 0; iii <= (ick.length - 1); iii++) {
					if (ick.charAt(iii) == "."){
						count++;
					}
				}
				
				if(count == 0){
					//小数点なし
				}else if(count >= 2){
					// "."が２つ以上入力されている場合はＮＧ
					ret_i = 5;
				}else{
					// 先頭に小数点が入力された場合はＮＧ
					if (ick.charAt(0) == "."){
						ret_i = 5;
					}else{
						// 小数点が入力された場合
						if (count == 1){
							// 小数点以下の桁数チェック
							var idx = ick.lastIndexOf(".");
							var decimalPart = ick.substring(idx);
							
							// 小数点以下の桁数を取得する
							var length = decimalPart.length - 1;
							if (length == 0){
								// 小数点以下の入力がない場合はＮＧ
								ret_i = 5;
							}else if(length > num){
								//小数点以下の桁数が引数numより大きい
								ret_i = 6;
							}
						}
					}
				}
			}
		}
	}
	
	return ret_i;
}

//****************************************************************************************
//小数点チェック　ゼロＯＫ
//****************************************************************************************
function Chk_SQzero( str_Q, num ){
	//SQの数値・小数点チェック
	var ret_i = 0;
	var ick = document.forms[form_name].elements[str_Q].value;
	var err_flag2 = 0;
	
	if( Chk_ptn02(err_flag2,str_Q) == 1 ){
		//入力なし
		ret_i = 1;
	}else{
		if(ick.match(/[^0-9|^.]/g)){
			// パターンマッチ 半角数字と小数点以外はＮＧ
			ret_i = 2;
		}else{
			if( ick > 1000000000 ){
				//桁数が多すぎる
				ret_i = 3;
			}else{
				// 小数点の数を取得する
				var count = 0;
				for (iii = 0; iii <= (ick.length - 1); iii++) {
					if (ick.charAt(iii) == "."){
						count++;
					}
				}
				
				if(count == 0){
					//小数点なし
				}else if(count >= 2){
					// "."が２つ以上入力されている場合はＮＧ
					ret_i = 5;
				}else{
					// 先頭に小数点が入力された場合はＮＧ
					if (ick.charAt(0) == "."){
						ret_i = 5;
					}else{
						// 小数点が入力された場合
						if (count == 1){
							// 小数点以下の桁数チェック
							var idx = ick.lastIndexOf(".");
							var decimalPart = ick.substring(idx);
							
							// 小数点以下の桁数を取得する
							var length = decimalPart.length - 1;
							if (length == 0){
								// 小数点以下の入力がない場合はＮＧ
								ret_i = 5;
							}else if(length > num){
								//小数点以下の桁数が引数numより大きい
								ret_i = 6;
							}
						}
					}
				}
			}
		}
	}
	
	return ret_i;
}

