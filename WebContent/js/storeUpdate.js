$(function() {
	// 기본정보수정
	function infoSubmit(frm) {
		var sh_telephone = frm.sh_telephone.value.trim();
		var sh_location = frm.sh_location.value.trim();
		var sh_starttime = frm.sh_starttime.value.trim();
		var sh_endtime = frm.sh_endtime.value.trim();

		if (sh_telephone == "" && sh_location == "" && sh_starttime == ""
				&& sh_endtime == "") {
			alert("빈 칸이 존재합니다.");
			return false;
		}
		return true;
	}

	// 스타일정보수정
	function priceSubmit(prfrm) {

		var ser_name = prfrm.ser_name.value.trim();
		var ser_price = prfrm.ser_price.value.trim();
		var ser_time = prfrm.ser_time.value.trim();

		if (ser_name == "" && ser_price == "" && ser_time == "") {
			alert("빈 칸이 존재합니다.");
			return false;
		}
		return true;
	}
	
	function checkSer_name(){
		$("input[name=이름]:checked").each(function() {
			var ser_uid = $(this).val(); 
			});

	}
});