<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/4headerSub.jsp"%>
<!DOCTYPE html>


        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 30px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">(음)</h1>
                    <a href="" class="h5 text-white">ㄴㄴㄴㄴ</a>
                    <i class="far fa-circle text-white px-2"></i>
                    <a href="" class="h5 text-white">ㄷㄷㄷㄷㄷ</a>
                </div>
            </div>
        </div>



    <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                        <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full Screen Search End -->


    <!-- Contact Start -->
    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container py-5">
            
            <!-- 입력창과 지도 쪽  -->
            <div class="row g-5">
            	<div class="col-lg-6 wow slideInUp" data-wow-delay="0.6s">
                   	<img src="/resources/img/${product.m_pimage }" alt="">
                </div>
                <div class="col-lg-6 wow slideInUp" data-wow-delay="0.3s">
                    <form>
                        <div class="row g-3">
                        	<div class="col-2">
                        		<input type="text" class="form-control border-0 bg-white" value="상품명:" style="height: 55px;" disabled="disabled">
                        	</div>
                        	<div class="col-10">
                                <input type="text" class="form-control border-0 bg-light px-4" value="${product.m_pname }" style="height: 55px;" disabled="disabled">
                            </div>
                            <div class="col-md-2">
                                <input type="text" class="form-control border-0 bg-white px-4" value="가격:" style="height: 55px;" disabled="disabled">
                            </div>
                            
                            <div class="col-md-4">
                                <input type="text" class="form-control border-0 bg-light px-4" value="${product.price }원" style="height: 55px;" disabled="disabled">
                            </div>
                            
                            <div class="col-md-2">
                                <input type="text" class="form-control border-0 bg-white" value="판매자:" style="height: 55px;" disabled="disabled">
                            </div>
                            
                            <div class="col-md-4">
                                <input type="text" class="form-control border-0 bg-light px-4" value="${product.m_writer }" style="height: 55px;" disabled="disabled">
                            </div>
                            
                            <div class="col-md-2">
                                <input type="text" class="form-control border-0 bg-white px-4" value="설명:" style="height: 55px;" disabled="disabled">
                            </div>
                            
                            <div class="col-md-10">
                                <input type="text" class="form-control border-0 bg-light px-4" value="${product.m_pcontent }" style="height: 110px;" disabled="disabled">
                            </div>
                            
                            <div class="col-12">
                                <input type="text" class="form-control border-0 bg-light px-4" placeholder="Subject" style="height: 55px;">
                            </div>
                            <div class="col-12">
                                <textarea class="form-control border-0 bg-light px-4 py-3" rows="4" placeholder="Message"></textarea>
                            </div>
                            <div class="col-7">
                            </div>
                            <div class="col-5">
                                <button type="button" class="btn btn-primary" id="btnUpdate">글 수정</button>
                                <button type="button" class="btn btn-danger" id="btnDelete">글 삭제</button>
                                <button type="button" class="btn btn-secondary" id="btnList">글 목록</button>
                            </div>
                        </div>
                    </form>
                </div>
                
            </div>
            <!-- 입력창과 지도 끝 -->
            
        </div>
    </div>
    <!-- Contact End -->

    <script>
    $("#btnUpdate").click(function(){
    	if(confirm("수정화면으로 이동할까요?")) {
    		location.href="/marketUpdate/${product.mno}"
    	}
    })
    
    $("#btnDelete").click(function(){
    	if(!confirm("삭제 하시겠습니까?")) return
    	$.ajax({
    		type:"delete",
    		url:"/marketDelete/${product.mno}",
    		success: function(resp){
    			if(resp=="success"){
    				alert("삭제성공")
    				location.href="/marketList"
    			}
    		},
    		error: function(e){
    			alert("삭제 실패"+e)
    		}
    	})
    })
    
    $("#btnList").click(function(){
    	location.href = "/marketList"
    })
    </script>

    


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>