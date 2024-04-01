<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>상담목록</h2>
*비대면상담(화상상담)의 경우 상담예정일시에 상담입장을 클릭하면 화상상담을 이용하실 수 있습니다. 
<div style="width:90%; margin-top:10px;" class="bg-white">
<div class="card card-body">
<div>
	총상담건수 : 
	상담대기건수 : 
</div>
	<table class="table">
		<thead>
			<tr>
				<td>
					<a>번호</a>
				</td>
				<td>상담교수</td>
				<td>
					<a href="">상담제목</a>
				</td>
				<td>상담방법</td>
				<td>상담종류</td>
				<td>삼담예정일시</td>
				<td>상담입장</td>
				<td>삼담일지</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>counsMethod(비대면)</td>
				<td>counselTitle</td>
				<td>counsPro</td>
				<td>counsType(학업)</td>
				<td>counsDate</td>
				<td>
					<button class="btn btn-outline-accent">
						입장
					</button>
				</td>
				<td>
					<button class="btn btn-outline-primary">
 						모달창 사용!
						<br>
						if절 사용해서 일지가 0 => 일지 확인(btn-secondary)
						<br>
						일지 x => 일지 등록(btn-primary)
					</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>