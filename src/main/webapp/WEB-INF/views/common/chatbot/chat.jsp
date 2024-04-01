<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
    
    <style>
        #chat-container {
            width: 300px;
            height: 400px;
            border: 1px solid #ccc;
            overflow-y: scroll;
            padding: 10px;
        }
    </style>

<div id="chat-container">
    <!-- 채팅 내용이 표시될 곳 -->
</div>

<input type="text" id="user-input" placeholder="메시지를 입력하세요">
<button onclick="sendMessage()">전송</button>

<script>
    function sendMessage() {
        var userInput = document.getElementById("user-input").value;
        appendMessage("사용자: " + userInput);

        // AJAX 또는 Fetch API를 사용하여 백엔드로 메시지 전송
        fetch('/chat', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                message: userInput
            })
        })
        .then(response => response.json())
        .then(data => {
            var chatbotResponse = "챗봇: " + data.message;
            appendMessage(chatbotResponse);
        })
        .catch(error => console.error('Error:', error));
    }

    function appendMessage(message) {
        var chatContainer = document.getElementById("chat-container");
        var messageElement = document.createElement("p");
        messageElement.textContent = message;
        chatContainer.appendChild(messageElement);
    }
</script>

