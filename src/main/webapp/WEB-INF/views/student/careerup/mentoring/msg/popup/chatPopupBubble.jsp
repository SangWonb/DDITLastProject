<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle">Web Messenger</c:set>

<!DOCTYPE html>
<html>
<head>
<style>
/* CSS 스타일 추가 */
.chat-container { 
    display: flex; 
    flex-direction: column; 
    align-items: center; 
} 

.chat-input { 
    width: 300px; 
    margin-bottom: 10px; 
} 

.chat-btn { 
    margin-bottom: 10px; 
    padding: 8px 16px;
    background-color: #007bff; 
    color: white; 
    border: none; 
    border-radius: 5px; 
    cursor: pointer; 
} 

.chat-btn:hover { 
    background-color: #0056b3; 
} 

.chat-messages { 
    width: 100%; 
    max-height: 300px; 
    overflow-y: auto; 
    border: 1px solid #ccc; 
    padding: 10px; 
    margin-bottom: 10px; 
} 

.chat-message { 
    background-color: #f9f9f9; 
    padding: 8px 12px; 
    border-radius: 5px; 
    margin-bottom: 5px; 
} 

.chat-message.self { 
    background-color: #cce5ff; 
} 

.chat-message.sender { 
    font-weight: bold; 
    color: #007bff; 
} 

.chat-message.time { 
    font-size: 0.8em; 
    color: #777; 
} 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/bubbleChat.css'/>"/>

<title>${pageTitle} chat</title><!--WebSocket messenger chat -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var websocket = null;
	var first = "true";
	$('#sendBtn').attr("disabled", true);
	
	
	$(document).ready(function() {
		var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/chat/'+'<c:out value="${chatId}"/>';
		websocket = connection(url);
		
		websocket.onopen = function(){
			send('<c:out value="${username}"/>');
			$('#sendBtn').attr("disabled", false);
		};

		websocket.onmessage = function(message) {
			processMessage(message);
		};
		
		websocket.onclose = function() {
			console.log('Info: WebSocket closed.');
		};
		
		websocket.onerror = function(message) {
			processError(message);
		};
		
		$('#sendBtn').click(function() {
			send(textMessage.value);
			textMessage.value = "";
		});
		
		$('#textMessage').keypress(function(e) {
			if(e.which==13) {
				send(textMessage.value);
				textMessage.value = "";
			}
		});
		
		$('#leaveBtn').click(function() {
			websocket.close();
			window.close();
		});
	});

	function processMessage(message) {
		var jsonData = JSON.parse(message.data);
		//alert("jsonData: " + jsonData.messageType + "," + jsonData.name +  "," + jsonData.message + "," + jsonData.users  );
		if (jsonData.messageType == "ChatMessage") {
			message = jsonData.name + " : "+ jsonData.message + '\n';
			display(message);
			if (jsonData.message != null && jsonData.message.trim() !== "") {
			displaybubble(jsonData);
			} else {
				return;
			}
		} else if (jsonData.messageType == "UsersMessage") {
			var other = "";
// 			$('#users').append(jsonData.users+"님과 대화중입니다."); //님과 대화중입니다.
// 			$('#users').text(jsonData.users + "님과 대화중입니다.");
			for(var i=0; i<jsonData.users.length; i++) {
				if ("${username}"!=jsonData.users[i]) {
					$('#users').text(jsonData.users[i] + "님과 대화중입니다.");
// 					$('#users').append(jsonData.users[i]+"님과 대화중입니다."); //님과 대화중입니다.
					other = jsonData.users[i];
					first = "false";
				}
			}
			if(first=="false" && other=="") {
				$('#users').empty();
				$('#users').text("대화상대가 아무도 없습니다."); //대화상대가 아무도 없습니다.
			} 
		}
	}
	
	function connection(url) {
		var websocket = null;
		if ('WebSocket' in window) {
			websocket = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			websocket = new MozWebSocket(url);
		} else {
			Console.log('Error: WebSocket is not supported by this browser.');
            return null;
		}
		return websocket;
	}

	function send(message) {
		websocket.send(JSON.stringify({ 'message' : message , 'chatId' : "<c:out value='${chatId}'/>"}));
	}
	
	function display(message) {
		
	}
	
	function displaybubble(data) {
		//message = jsonData.name + " : "+ jsonData.message + '\n';
		if (data.name == "${username}") {
			$('#chat').append(data.name+"(me)<br/><div class='bubble right'><span class='tail'>&nbsp;</span>"+data.message +"</div>");
	      	    
		} else {
		    $('#chat').append(data.name+"<br/><div class='bubble left'><span class='tail'>&nbsp;</span>"+data.message+"</div>");
		}
	    // 스크롤을 맨 아래로 내리는 코드
	    var chatContainer = document.getElementById('chat');
	    chatContainer.scrollTop = chatContainer.scrollHeight;
	}

	function processError(message) {
	}

 	window.onbeforeunload = function() {
		websocket.close();
	};  
</script>
</head>
<body style="background-color: slategrey;">
	
	    <p>
	      <div id="users" style="font-size: 16px; font-weight: bold; color: #FFFFFF;"></div>
	    </p>
	<div class="chat" id="chat">
	    <hr/>
	</div>
	<br/>

<div class="chat-container">
<!--     <div class="chat-messages" id="chatMessages"></div> -->
    <input id="textMessage" class="chat-input" type="text" placeholder="Type your message here..." />
    <button id="sendBtn" class="chat-btn">Send</button>
    <button id="leaveBtn" class="chat-btn">Leave</button>
</div>
</body>
</html>
