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
<div class="modal fade" id="resApplModal" tabindex="-1"
	aria-labelledby="resApplModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 800px; height: 500px;">
			<form id="applForm" method="post">
				<div class="modal-header" style="height: 100px;">

					<span class="nanum-gothic-extrabold" style="font-size: 50px;">식당등록</span>
					<button type="submit" style="position: absolute; top: 30px; right: 30px; width: 80px; height: 50px; border-radius: 15px; font-size: 15px;" class="btn btn-primary">
						등록
					</button>
				</div>
				<div class="modal-body" style="height: 400px;">

					<table>
						<tr>
							<th></th>
							<td><select name="resCode" required="true"
								style="font-size: 15px; font-family: 'Nanum Gothic', sans-serif; text-align: center; position: absolute; top: 40px; width: 120px; height: 50px; left: 30px; border-radius: 30px;">
									<option selected="" value="">분류</option>
									<option value="한식">한식</option>
									<option value="중식">중식</option>
									<option value="일식">일식</option>
									<option value="양식">양식</option>
									<option value="베트남식">베트남식</option>
							</select> <span data-err-msg="resCode"
								style="position: absolute; top: 55px; left: 170px;"></span></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" name="resName" required="true"
								class="applPaper" style="top: 110px; left: 30px;"
								placeholder="식당이름" /> <span data-err-msg="resName"
								style="position: absolute; top: 125px; left: 350px;"></span></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" name="resLocation"
								id="sample6_address" required="true" class="applPaper"
								style="top: 170px; left: 30px;" placeholder="주소" /> 
								<input type="button" id="restApplFindAddressBtn"
								style="position: absolute; top: 170px; left: 350px;"
								class="btn btn-outline-secondary"
								value="주소 찾기"><br>
								<span data-err-msg="resLocation"
								style="position: absolute; top: 185px; left: 450px;"></span></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" name="resTel" required="true"
								class="applPaper" style="top: 230px; left: 30px;"
								placeholder="전화번호" /> <span data-err-msg="resTel"
								style="position: absolute; top: 245px; left: 350px;"></span></td>
						</tr>
					</table>

					<button type="button"
						style="position: absolute; top: 330px; right: 30px; float: right; background-color: rgba(255, 255, 255, 0); border-color: black; color: black; width: 50px;"
						class="btn btn-accent" class="close"
						onclick="$('#resApplModal').modal('hide');">
						<i class="material-icons">close</i>
					</button>

				</div>
			</form>

		</div>
	</div>
</div>