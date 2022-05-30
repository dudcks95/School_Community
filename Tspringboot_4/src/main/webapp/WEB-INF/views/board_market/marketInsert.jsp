<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/views/includes/4headerSub.jsp" %>
        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">물품등록</h1>
                </div>
            </div>
        </div>
        <div class="container">
            <form action="marketInsert" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="m_pname">제목:</label> <input type="text" class="form-control" id="mpname"
                        placeholder="Enter product name" name="mpname">
                </div>



                <div class="form-group">
                    <label for="m_writer">작성자:</label> <input type="text" class="form-control" id="m_writer"
                        value="${principal.user.name }" name="m_writer" readonly="readonly">
                </div>

                <div class="form-group">
                    <label for="m_pname">가격:</label> <input type="text" class="form-control" id="price"
                        placeholder="Enter price" name="price">
                </div>

                <div class="form-group">
                    <label for="m_pcontent">상품설명:</label>
                    <textarea class="form-control" row="5" id="m_pcontent" name="m_pcontent"></textarea>

                </div>

                <!-- 파일 칸 -->
                <div class="form-group">
                    <label for="file">이미지:</label>
                    <input type="file" class="mt-3" id="upload" placeholder="Enter file" name="upload">
                </div>


                <button type="submit" class="btn btn-primary btn-sm mt-3">글쓰기</button>
            </form>
        </div>