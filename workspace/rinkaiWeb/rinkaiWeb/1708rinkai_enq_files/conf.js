//**************************************
//		ENTER�L�[�둗�M���
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
//		�G���[�`�F�b�N���[�`��
//**************************************
function trim(vals){

	return vals.replace(/^\s+|\s+$/g, "");

}


//**************************************
//		�p�^�[��No1�i���W�I�`�F�b�N�j
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

			//�O�̂���
			break;
		}
	}

	err_f = 1;

	return (err_f);
}

//***************************************
//		�p�^�[��No2(�e�L�X�g�`�F�b�N�@�Z���N�g�{�b�N�X�`�F�b�N)
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
//		�p�^�[��No3(�`�F�b�N�{�b�N�X�`�F�b�N)
//**************************************
function Chk_ptn03(err_f,str_q,end_c){
var err_f = 0;
var i = 0;
str_buff="";
text_fa = "";
var docs = document.forms[form_name];

	for(i=1;i<=end_c;i++){

		//�`�F�b�N�{�b�N�XNAME�̍쐬
		str_buff = str_q + i;

		if(docs.elements[str_buff].checked == true){

			err_f = 0;
			return (err_f);

			//�O�̂���
			break;
		}
	}

	err_f = 1;

	return (err_f);
}


//**************************************
//		�p�^�[��No4(�`�F�b�N�{�b�N�X�`�F�b�N�ύX)
//**************************************
function Chk_ptn04(err_f,str_q,end_c,mt_a){
var err_f = 0;
var i = 0;
str_buff="";
text_fa = "";
var docs = document.forms[form_name];

	for(i=1;i<=end_c;i++){

		//�`�F�b�N�{�b�N�XNAME�̍쐬
		str_buff = str_q + mt_a[i];

		if(docs.elements[str_buff].checked == true){

			err_f = 0;
			return (err_f);

			//�O�̂���
			break;
		}
	}

	err_f = 1;

	return (err_f);
}

//****************************************************************************************
//�����_�`�F�b�N
//****************************************************************************************
function Chk_SQ( str_Q, num ){
	//SQ�̐��l�E�����_�`�F�b�N
	var ret_i = 0;
	var ick = document.forms[form_name].elements[str_Q].value;
	var err_flag2 = 0;
	
	if( Chk_ptn02(err_flag2,str_Q) == 1 ){
		//���͂Ȃ�
		ret_i = 1;
	}else{
		if(ick.match(/[^0-9|^.]/g)){
			// �p�^�[���}�b�` ���p�����Ə����_�ȊO�͂m�f
			ret_i = 2;
		}else{
			if( ick > 1000000000 ){
				//��������������
				ret_i = 3;
			}else if( ick == 0 ){
				//�[��
				ret_i = 4;
			}else{
				// �����_�̐����擾����
				var count = 0;
				for (iii = 0; iii <= (ick.length - 1); iii++) {
					if (ick.charAt(iii) == "."){
						count++;
					}
				}
				
				if(count == 0){
					//�����_�Ȃ�
				}else if(count >= 2){
					// "."���Q�ȏ���͂���Ă���ꍇ�͂m�f
					ret_i = 5;
				}else{
					// �擪�ɏ����_�����͂��ꂽ�ꍇ�͂m�f
					if (ick.charAt(0) == "."){
						ret_i = 5;
					}else{
						// �����_�����͂��ꂽ�ꍇ
						if (count == 1){
							// �����_�ȉ��̌����`�F�b�N
							var idx = ick.lastIndexOf(".");
							var decimalPart = ick.substring(idx);
							
							// �����_�ȉ��̌������擾����
							var length = decimalPart.length - 1;
							if (length == 0){
								// �����_�ȉ��̓��͂��Ȃ��ꍇ�͂m�f
								ret_i = 5;
							}else if(length > num){
								//�����_�ȉ��̌���������num���傫��
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
//�����_�`�F�b�N�@�[���n�j
//****************************************************************************************
function Chk_SQzero( str_Q, num ){
	//SQ�̐��l�E�����_�`�F�b�N
	var ret_i = 0;
	var ick = document.forms[form_name].elements[str_Q].value;
	var err_flag2 = 0;
	
	if( Chk_ptn02(err_flag2,str_Q) == 1 ){
		//���͂Ȃ�
		ret_i = 1;
	}else{
		if(ick.match(/[^0-9|^.]/g)){
			// �p�^�[���}�b�` ���p�����Ə����_�ȊO�͂m�f
			ret_i = 2;
		}else{
			if( ick > 1000000000 ){
				//��������������
				ret_i = 3;
			}else{
				// �����_�̐����擾����
				var count = 0;
				for (iii = 0; iii <= (ick.length - 1); iii++) {
					if (ick.charAt(iii) == "."){
						count++;
					}
				}
				
				if(count == 0){
					//�����_�Ȃ�
				}else if(count >= 2){
					// "."���Q�ȏ���͂���Ă���ꍇ�͂m�f
					ret_i = 5;
				}else{
					// �擪�ɏ����_�����͂��ꂽ�ꍇ�͂m�f
					if (ick.charAt(0) == "."){
						ret_i = 5;
					}else{
						// �����_�����͂��ꂽ�ꍇ
						if (count == 1){
							// �����_�ȉ��̌����`�F�b�N
							var idx = ick.lastIndexOf(".");
							var decimalPart = ick.substring(idx);
							
							// �����_�ȉ��̌������擾����
							var length = decimalPart.length - 1;
							if (length == 0){
								// �����_�ȉ��̓��͂��Ȃ��ꍇ�͂m�f
								ret_i = 5;
							}else if(length > num){
								//�����_�ȉ��̌���������num���傫��
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

