<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container my-3">
            <c:if test="${dto.userId == principal.id}">
                <div class="mb-3">
                    <a href="/board/${dto.id}/updateForm" class="btn btn-dark">수정</a>
                    <button id="btn-delete" class="btn btn-danger" onClick="deleteById(${dto.id})">삭제</button>
                </div>
            </c:if>

            <script>

                function deleteById(id) {
                    $.ajax({
                        type: "delete",
                        url: "/board/" + id,
                        dataType: "json"
                    }).done((res) => {
                        alert(res.msg);
                        location.href = "/";
                    }).fail((err) => {
                        alert(err.responseJSON.msg);
                    });
                }
            </script>

            <div class="mb-2">
                글 번호 : <span id="id"><i>${dto.id} </i></span> 작성자 : <span><i>${dto.username} </i></span>
                <i id="heart" class="fa-regular fa-heart my-cursor my-xl"></i>

            </div>

            <div>
                <h3>${dto.title}</h3>
            </div>
            <hr />
            <div>
                <div>${dto.content}</div>
            </div>
            <hr />

            <div class="card">
                <form>
                    <div class="card-body">
                        <textarea id="reply-content" class="form-control" rows="1"></textarea>
                    </div>
                    <div class="card-footer">
                        <button type="button" id="btn-reply-save" class="btn btn-primary">등록</button>
                    </div>
                </form>
            </div>
            <br />
            <div class="card">
                <div class="card-header">댓글 리스트</div>
                <ul id="reply-box" class="list-group">
                    <li id="reply-1" class="list-group-item d-flex justify-content-between">
                        <div>댓글내용입니다</div>
                        <div class="d-flex">
                            <div class="font-italic">작성자 : cos &nbsp;</div>
                            <button onClick="replyDelete()" class="badge bg-danger">삭제</button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        </div>

        <%@ include file="../layout/footer.jsp" %>