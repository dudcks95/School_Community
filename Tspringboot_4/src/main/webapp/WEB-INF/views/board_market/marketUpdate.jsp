<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/views/includes/4headerSub.jsp" %>
        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">물품 정보 수정</h1>
                </div>
            </div>
        </div>
        <div class="container">
            <form action="marketUpdate" method="post" enctype="multipart/form-data" id="uploadForm">
                <input type="hidden" id="mno" name="mno" value="${product.mno}" />
                <div class="form-group">
                    <label for="m_pname">제목:</label> <input type="text" class="form-control" id="mpname"
                        value="${product.mpname }" name="mpname">
                </div>



                <div class="form-group">
                    <label for="m_writer">작성자:</label> <input type="text" class="form-control" id="m_writer"
                        value="${product.m_writer }" name="m_writer" readonly="readonly">
                </div>

                <div class="form-group">
                    <label for="m_pname">가격:</label> <input type="text" class="form-control" id="price"
                        value="${product.price }" name="price">
                </div>

                <div class="form-group">
                    <label for="m_pcontent">상품설명:</label>
                    <textarea class="form-control" row="5" id="m_pcontent"
                        name="m_pcontent">${product.m_pcontent }</textarea>

                </div>

                <!-- 파일 칸 -->
                <div class="form-group">
                    <label for="file">업로드할 이미지 : </label>

                    <input type="file" class="" id="upload" placeholder="upload image" name="upload">
                    기존 업로드된 파일: <span>${product.m_pimage }</span>
                </div>


                <button type="button" class="btn btn-primary btn-sm" id="btnModify">글쓰기</button>
            </form>
        </div>
        <script>
            $("#btnModify").click(function () {
                var form = $("#uploadForm")[0]
                var data = new FormData(form);

                $.ajax({
                    type: "post",
                    url: "/marketUpdate",
                    processData: false,
                    contentType: false,
                    data: data,
                    success: function (resp) {
                        if (resp == "success") {
                            alert("수정 성공");
                            location.href = "/marketList";
                        }
                    }

                })
            })
        </script>