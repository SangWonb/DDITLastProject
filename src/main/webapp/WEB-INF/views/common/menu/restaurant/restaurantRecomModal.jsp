<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<style>
.nanum-gothic-extrabold {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 800;
	font-style: normal;
}

.nanum-gothic-bold {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 700;
	font-style: normal;
}

.nanum-gothic-regular {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 400;
	font-style: normal;
}
</style>
<div class="modal fade" id="resRecomModal" tabindex="-1"
	aria-labelledby="resRecomModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 800px; height: 600px;">
			<form id="recomForm">
				<div class="modal-header" style="height: 100px;">
					<svg style="fill: DarkSlateBlue;  width: 80px;" data-v-134867f8="" aria-hidden="true" 
						focusable="false" data-prefix="fas" data-icon="store" role="img"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 616 512"
						class="svg-inline--fa fa-store fa-w-20">
						<path data-v-134867f8=""
							d="M602 118.6L537.1 15C531.3 5.7 521 0 510 0H106C95 0 84.7 5.7 78.9 15L14 118.6c-33.5 53.5-3.8 127.9 58.8 136.4 4.5.6 9.1.9 13.7.9 29.6 0 55.8-13 73.8-33.1 18 20.1 44.3 33.1 73.8 33.1 29.6 0 55.8-13 73.8-33.1 18 20.1 44.3 33.1 73.8 33.1 29.6 0 55.8-13 73.8-33.1 18.1 20.1 44.3 33.1 73.8 33.1 4.7 0 9.2-.3 13.7-.9 62.8-8.4 92.6-82.8 59-136.4zM529.5 288c-10 0-19.9-1.5-29.5-3.8V384H116v-99.8c-9.6 2.2-19.5 3.8-29.5 3.8-6 0-12.1-.4-18-1.2-5.6-.8-11.1-2.1-16.4-3.6V480c0 17.7 14.3 32 32 32h448c17.7 0 32-14.3 32-32V283.2c-5.4 1.6-10.8 2.9-16.4 3.6-6.1.8-12.1 1.2-18.2 1.2z"
							class=""></path></svg>
					<span class="nanum-gothic-extrabold" style="font-size: 50px; color: DarkSlateBlue;">오늘의 식당</span>

				</div>
				<div class="modal-body" style="height: 500px;">

					<div id="recomDetail"
						style="position: absolute; top: 170px; left: 80px; width: 600px; height: 150px;">
						<div
							style="position: absolute; top: 100px; left: 0px; width: 600px; height: 50px; background-color: DarkSlateBlue; border-style: solid; border-color: CornflowerBlue; border-width: 20px; border-radius: 15px;">

						</div>
						<div class="ani1" style="position: absolute; top: 0px; left: 100px; width: 400px; height: 100px; background-color: Lavender;">
							<div style="font-family: 'Nanum Gothic', sans-serif; font-weight: 800; font-style: normal; font-size: 20px; text-align: center; margin-top: 30px;">
								<button id="recomDetailContent" data-recom-resappno=""></button>
							</div>
						</div>
						<div
							style="position: absolute; top: 0px; left: 0px; width: 600px; height: 100px; background-color: white;"></div>
						<div
							style="position: absolute; top: 100px; left: 50px; width: 500px; height: 20px; background-color: CornflowerBlue;"></div>

					</div>

					<!-- 얘가 더 위에 있음 -->
					<select id="userChoice"
						style="font-size: 30px; font-family: 'Nanum Gothic', sans-serif; text-align: center; position: absolute; top: 70px; width: 200px; height: 80px; left: 170px; border-radius: 80px;">
						<option selected="" class="userC" value>분류</option>
						<option value="한식" class="userC">한식</option>
						<option value="중식" class="userC">중식</option>
						<option value="일식" class="userC">일식</option>
						<option value="양식" class="userC">양식</option>
						<option value="베트남식" class="userC">베트남식</option>
					</select> <span id="userChoiceWarn"
						style="display: none; font-size: 15px; font-family: 'Nanum Gothic', sans-serif; color: red; position: absolute; top: 150px; left: 210px;">선택해주세요</span>
					<svg data-v-134867f8="" id="lightBtn"
						style="position: absolute; top: 40px; right: 170px; width: 100px;"
						aria-hidden="true" focusable="false" data-prefix="fas"
						data-icon="lightbulb" role="img"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512"
						class="svg-inline--fa fa-lightbulb fa-w-11">
						<path data-v-134867f8="" fill="gray"
							d="M96.06 454.35c.01 6.29 1.87 12.45 5.36 17.69l17.09 25.69a31.99 31.99 0 0 0 26.64 14.28h61.71a31.99 31.99 0 0 0 26.64-14.28l17.09-25.69a31.989 31.989 0 0 0 5.36-17.69l.04-38.35H96.01l.05 38.35zM0 176c0 44.37 16.45 84.85 43.56 115.78 16.52 18.85 42.36 58.23 52.21 91.45.04.26.07.52.11.78h160.24c.04-.26.07-.51.11-.78 9.85-33.22 35.69-72.6 52.21-91.45C335.55 260.85 352 220.37 352 176 352 78.61 272.91-.3 175.45 0 73.44.31 0 82.97 0 176zm176-80c-44.11 0-80 35.89-80 80 0 8.84-7.16 16-16 16s-16-7.16-16-16c0-61.76 50.24-112 112-112 8.84 0 16 7.16 16 16s-7.16 16-16 16z"
							class=""></path></svg>

					<button type="button" id="restRecomCloseBtn"
						style="position: absolute; top: 430px; right: 30px; float: right; background-color: rgba(255, 255, 255, 0); border-color: black; color: black; width: 50px;"
						class="btn btn-accent" class="close"
						onclick="$('#resRecomModal').modal('hide');">
						<i class="material-icons">close</i>
					</button>
				</div>
			</form>

		</div>
	</div>
</div>