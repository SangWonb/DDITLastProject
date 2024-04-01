<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
    .drop {
        border: 3px solid pink;
        height: auto;
        padding: 20px;
        display: inline-block;
    }

    .ele {
        width: 100px;
        height: 50px;
        border: 3px solid blue;
        margin : 10px;
    }
</style>
<div class="drop">드롭위치1</div>
<div class="drop">드롭위치2</div>
<div class="drop">드롭위치3</div>
<div class="drop">드롭위치4</div>
<br><br>
<hr>
<br><br>
<div class="ele" draggable="true" id="ele1">1</div>
<div class="ele" draggable="true" id="ele2">2</div>
<div class="ele" draggable="true" id="ele3">3</div>
<div class="ele" draggable="true" id="ele4">4</div>
<div class="ele" draggable="true" id="ele5">5</div> 
<div class="ele" draggable="true" id="ele6">6</div>

<script>
    let v_ele = document.querySelectorAll('.ele');
    let v_div = document.querySelectorAll('.drop');

    // 각 .ele 요소에 대해 dragstart 이벤트 핸들러 추가
    v_ele.forEach(ele => {
        ele.addEventListener('dragstart', function (e) {
            // 드래그 중인 요소의 id를 데이터로 설정
            e.dataTransfer.setData("tgId", e.target.id);
        });
    });

    // 각 .drop 요소에 대해 dragover 이벤트 핸들러 추가
    v_div.forEach(div => {
        div.addEventListener('dragover', function (e) {
            e.preventDefault(); // 요소 위에서 드래그 중인 경우 기본 동작 방지
        });

        // 각 .drop 요소에 대해 drop 이벤트 핸들러 추가
        div.addEventListener('drop', function (e) {
            e.preventDefault(); // 요소에 드래그된 데이터가 들어오면 기본 동작 방지
            let targetId = e.dataTransfer.getData('tgId'); // 드래그된 요소의 id 가져오기
            let draggedElement = document.getElementById(targetId); // id에 해당하는 요소 가져오기
            // 드롭된 요소가 .drop 클래스를 가진 요소이며, 드래그된 요소가 .ele 클래스를 가진 경우에만 처리
            if (e.target.classList.contains('drop') && draggedElement.classList.contains('ele')) {
                e.target.appendChild(draggedElement); // 드롭 위치에 드래그된 요소 추가
            }
            if (e.target.classList.contains('ele') && draggedElement.classList.contains('ele')) {
            	 // e.target이 드롭 위치인지 확인
                let dropZone = e.target.closest('.drop');
                if (dropZone) {
                    dropZone.appendChild(draggedElement); // 드롭 위치에 드래그된 요소 추가
                }
            }
        });
    });
</script>