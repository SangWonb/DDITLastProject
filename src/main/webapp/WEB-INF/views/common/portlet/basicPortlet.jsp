<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description"
	content="gridstack.js Build interactive dashboards in minutes." />
<meta name="keywords"
	content="gridstack, typescript, jquery, grid, layout, drag-n-drop, widgets, js, javascript, gridstack.js, dashboard" />
<!-- ES5 support for IE -->
<script
	src="https://gridstackjs.com/node_modules/gridstack/dist/es5/gridstack-poly.js"></script>
<script
	src="https://gridstackjs.com/node_modules/gridstack/dist/es5/gridstack-all.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.16.2/build/highlight.min.js"></script>

<!-- Bootstrap core CSS -->
<link href="https://bootswatch.com/4/yeti/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://gridstackjs.com/node_modules/gridstack/dist/gridstack.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.16.2/build/styles/default.min.css"
	rel="stylesheet" />
<style type="text/css">
.grid-container {
	padding: 15px;
	border: 1px solid white;
	max-width: 1000px;
}

.center {
	margin-left: auto;
	margin-right: auto;
}

.grid-stack-item {
	border: 0;
}

.grid-stack-item-content {
	background-color: white;
	text-align: center;
}

h1 {
	text-align: center;
	font-size: 3rem;
	margin-top: 2rem;
	margin-bottom: 1.5rem;
}

.card {
	background: none;
}

section {
	padding: 0 15px 0 15px;
}

.grid-stack-item-removing {
	opacity: 0.8;
	filter: blur(5px);
}

@media all and (max-width: 575px) {
	#hero {
		margin-top: 32px;
	}
}

.logo {
	display: inline;
	margin-right: 15px;
}

#trash {
	background-color: #cc6857;
}

.newWidget>.grid-stack-item-content {
	background-color: #6cad84;
}
</style>
</head>

<body>
	<main role="main" class="container-fluid" style="padding: 0">
		<section id="advancedDemo" class="bg-primary">

			<div class="row">
				<div class="col-lg-12 text-white">
					<ion-icon class="float-right" name="grid"
						style="font-size: 350%; margin-top: 10px"></ion-icon>
					<hr />
				</div>
			</div>

			<div class="row">

				<div class="col-md-2 d-none d-md-block"
					style="border-right: 1px dashed white;">

					<!-- 삭제 : #trash 라는 아이디를 가진 요소에 드래그 하면 삭제됨 -->
					<div id="trash" style="padding: 15px; margin-bottom: 15px;"
						class="text-center text-white">
						<div>
							<ion-icon name="trash" style="font-size: 400%"></ion-icon>
						</div>
						<div>
							<span>포틀릿 삭제~</span>
						</div>
					</div>

					<!-- 추가 :newWidget 라는 클래스를 가진 요소들은 드래그를 하여 대시보드에 추가할 수 있음. -->
					<div class="text-center card text-white grid-stack-item newWidget">
						<div class="card-body grid-stack-item-content">
							<div>
								<ion-icon name="add-circle" style="font-size: 400%"></ion-icon>
							</div>
							<div>
								<span>포틀릿 생성!</span>
							</div>
						</div>
					</div>
					<br />
					<div id="save"
						class="text-center card text-white grid-stack-item newWidget">
						<div class="card-body grid-stack-item-content">
							<div>
								<ion-icon name="save" style="font-size: 400%"></ion-icon>
							</div>
							<div>
								<span>포틀릿 저장!</span>
							</div>
						</div>
					</div>

				</div>

				<div class="col-sm-12 col-md-10" style="padding-bottom: 25px;">
					<div class="grid-container">
						<div class="grid-stack" id="advanced-grid"></div>
					</div>
				</div>
			</div>

		</section>
	</main>
	<!-- /.container -->

	<script type="text/javascript">
		/* 포틀릿 내용 */
		var advanced = [
				{
					x : 0,
					y : 0,
					w : 4,
					h : 2,
					content : '<h1>안뇽</h1>'
				},
				{
					x : 4,
					y : 0,
					w : 4,
					h : 4,
					noMove : true,
					noResize : true,
					locked : true,
					content : '고정포틀릿(사이즈,위치,크기조정 불가)<br><ion-icon name="ios-lock" style="font-size:300%"></ion-icon>'
				},
				{
					x : 8,
					y : 0,
					w : 2,
					h : 2,
					minW : 2,
					noResize : true,
					content : '<p class="card-text text-center" style="margin-bottom: 0">움직일 수 있음<p class="card-text text-center"style="margin-bottom: 0"><ion-icon name="hand" style="font-size: 300%"></ion-icon><p class="card-text text-center" style="margin-bottom: 0">크기조절만 불가</p>'
				}, {
					x : 10,
					y : 0,
					w : 2,
					h : 2,
					content : '4'
				}, {
					x : 0,
					y : 2,
					w : 2,
					h : 2,
					content : '5'
				}, {
					x : 2,
					y : 2,
					w : 2,
					h : 4,
					content : '6'
				}, {
					x : 8,
					y : 2,
					w : 4,
					h : 2,
					content : '7'
				}, {
					x : 0,
					y : 4,
					w : 2,
					h : 2,
					content : '8'
				}, {
					x : 4,
					y : 4,
					w : 4,
					h : 2,
					content : '9'
				}, {
					x : 8,
					y : 4,
					w : 2,
					h : 2,
					content : '10'
				}, {
					x : 10,
					y : 4,
					w : 2,
					h : 2,
					content : '11'
				}, ];

		/* 대시보드 생성 */
		var advGrid = GridStack.init({
			margin : 5,
			disableOneColumnMode : true,
			acceptWidgets : true,
			removable : '#trash',
			removeTimeout : 100
		}, '#advanced-grid').load(advanced);

		GridStack.setupDragIn('.newWidget', {
			appendTo : 'body',
			helper : 'clone'
		});

		hljs.initHighlightingOnLoad();
	</script>
	<script type="module"
		src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule=""
		src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.js"></script>
	<!-- Google Analytics -->
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			(i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments);
			}), (i[r].l = 1 * new Date());
			(a = s.createElement(o)), (m = s.getElementsByTagName(o)[0]);
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m);
		})(window, document, 'script',
				'https://www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-1891156-8', 'auto');
		ga('send', 'pageview');

		
		/* save 버튼을 누르면 해당 대시보드의 정보를 추출 .. 저장은 알아서 */
		$("#save").on("click", function(){
			var grid = document.querySelector('#advanced-grid');
			console.log(grid);
			let grids = $(grid).find(".grid-stack-item");
			for(var g of grids){
				console.log("======================");
				var gg = $(g)['0'].gridstackNode;
			    console.log("content : "+gg.content);
			    console.log("x : "+gg.x);
			    console.log("y : "+gg.y);
			    console.log("w : "+gg.w);
			    console.log("h : "+gg.h);
			    console.log("locked : "+(gg.locked ? "true" : "false"));
			    console.log("noMove : "+(gg.noMove ? "true" : "false"));
			    console.log("noResize : "+(gg.noResize ? "true" : "false"));
			    console.log("minW : "+(gg.minW ?? null));
			    console.log("minH : "+(gg.minH ?? null));
			}
		});
			
		
	</script>
	<!-- End Google Analytics -->
</body>

</html>