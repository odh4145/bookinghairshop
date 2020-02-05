$(function(){ 
	$('#go_top').css('display', 'none');
	
	//페이지 시작 시 맨 위로
	($(function(){
        $('html, body').animate({scrollTop : $("body").offset().top});
    }));
	
	// 스크롤 위치 받아오기
	$(window).scroll(function() {
	    var scrollPosition = $(document).scrollTop();
	    
	    // 상단 메뉴 고정 및 탑버튼
	    if (scrollPosition > 70) {	      
	      $('#content_title').addClass('scroll');
	      $('#go_top').css('display', 'block');
	      $('#go_top').addClass('show');
	    } else{
	      $('#content_title').removeClass('scroll');
	      $('#go_top').css('display', 'none');
	      $('#go_top').removeClass('show');
	    }
	  });
	
	// 탑버튼 클릭 시 맨 위로 이동
	$('#go_top').click(function() {
		$('html, body').animate({scrollTop : $("body").offset().top});
	});
	
	// 모바일메뉴
	$("#btn_menu").click(function () {
		$("#mo_menu").toggle();
	});
	$("#mypage").click(function () {
		$("#mo_sub").toggle();
	});
	
});