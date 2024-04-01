!function(t){var e={};function n(r){if(e[r])return e[r].exports;var o=e[r]={i:r,l:!1,exports:{}};return t[r].call(o.exports,o,o.exports,n),o.l=!0,o.exports}n.m=t,n.c=e,n.d=function(t,e,r){n.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:r})},n.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},n.t=function(t,e){if(1&e&&(t=n(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var r=Object.create(null);if(n.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var o in t)n.d(r,o,function(e){return t[e]}.bind(null,o));return r},n.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(e,"a",e),e},n.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},n.p="/",n(n.s=435)}({167:function(t,e){!function(){"use strict";domFactory.handler.autoInit(),$('[data-toggle="tooltip"]').tooltip()}()},435:function(t,e,n){t.exports=n(167)}});




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
					content : '움직이지도, 크기조절도 안됨<br><ion-icon name="ios-lock" style="font-size:300%"></ion-icon>'
				},
				{
					x : 8,
					y : 0,
					w : 2,
					h : 2,
					minW : 2,
					noResize : true,
					content : '<p class="card-text text-center" style="margin-bottom: 0">움직일 수 있음<p class="card-text text-center"style="margin-bottom: 0"><ion-icon name="hand" style="font-size: 300%"></ion-icon><p class="card-text text-center" style="margin-bottom: 0">크기조절은 안됨</p>'
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
//	<script type="module"
//		src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.esm.js"></script>
//	<script nomodule=""
//		src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons/ionicons.js"></script>
//	<!-- Google Analytics -->
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
			
			
		
