<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI ChatBot</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 20px; /* 대화창 둥글게 라운딩 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
        }

        #chatArea {
            border: 1px solid #ccc;
            border-radius: 10px; /* 대화창 내용 둥글게 라운딩 */
            padding: 10px;
            margin-top: 20px;
            min-height: 200px;
            overflow-y: scroll;
            max-height: 300px;
        }

        #chatArea div {
            margin-bottom: 10px;
            padding: 8px; /* 대화창 내용 패딩 추가 */
            border-radius: 8px; /* 대화창 내용 둥글게 라운딩 */
        }

        #chatForm {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        #userInput {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }

        #userInput:focus {
            outline: none;
            border-color: #007bff;
        }

        #chatForm button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #chatForm button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>HRU AI ChatBot</h1>

    <div id="chatArea"></div>

    <form id="chatForm">
        <input type="text" id="userInput" placeholder="question">
        <button type="submit">submit</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#chatForm').submit(function(event) {
            event.preventDefault(); // 폼 제출 방지
            var url = "${pageContext.request.contextPath}/common/chatbot/answer";

            var userInput = $('#userInput').val(); // 사용자 입력 받기
            $('#userInput').val(''); // 입력 필드 초기화

            // 사용자 입력 화면에 출력
            $('#chatArea').append('<div>You: ' + userInput + '</div>');

            // AJAX 요청을 통해 서버로 사용자 입력 전송
            $.ajax({
                type: 'POST',
                url: url,
                contentType: 'application/json',
                dataType : 'json',
                data: JSON.stringify({ recomCoverLetter: userInput }),
                success: function(response) {
                    console.log("응답응답응답응답: ",response);
                    var jsonObj = JSON.parse(response.response);
                    var content = jsonObj.choices[0].message.content;
                    console.log("content: ",content);

                    var customResponse = response.customResponse; // 커스텀 응답 가져오기
                    if (customResponse) {
                        $('#chatArea').append('<div>AI: ' + customResponse + '</div>'); // 커스텀 응답 출력
                    } else {
                        $('#chatArea').append('<div>AI: ' + content + '</div>'); // 기본 응답 출력
                    }
                },
                error: function(xhr, status, error) {
                    console.error('에러 발생:', error);
                }
            });
        });
    });
</script>

</body>
</html>
