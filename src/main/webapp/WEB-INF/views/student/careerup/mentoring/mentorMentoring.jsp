<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page import='java.util.Random' %>

<div class="mdk-header-layout__content page-content bg-white">

    <div class="container page__container page-section">

        <div class="card-header p-0 nav">
            <div class="row no-gutters" role="tablist">
                <div class="col-auto dashboard-area-tabs__tab card-body d-flex flex-row align-items-center justify-content-start active">
                    <span class="h2 mb-0 mr-3">1</span>
                    <span class="flex d-flex flex-column">
                        <strong class="card-title">멘토링 채팅 목록</strong>
                        <small class="card-subtitle text-50"></small>
                    </span>
                </div>
            </div>
        </div>

        <div class="table-responsive" data-toggle="lists"
            data-lists-sort-by="js-lists-values-date" data-lists-sort-desc="true"
            data-lists-values='["js-lists-values-lead", "js-lists-values-project", "js-lists-values-status", "js-lists-values-budget", "js-lists-values-date"]'
            style="overflow-y: scroll; max-height: 500px;"
            >
            <table class="table mb-0 thead-border-top-0 table-nowrap">
                <thead>
                    <tr>
                        <th style="width: 150px;"><a href="javascript:void(0)"
                            class="sort" data-sort="js-lists-values-project">번호</a></th>

                        <th><a href="javascript:void(0)" class="sort"
                            data-sort="js-lists-values-lead">이름</a></th>

                        <th style="width: 48px;"><a href="javascript:void(0)"
                            class="sort" data-sort="js-lists-values-status">학과</a></th>

                        <th style="width: 48px;"><a href="javascript:void(0)"
                            class="sort" data-sort="js-lists-values-budget">시작일</a></th>

                        <th style="width: 48px;"><a href="javascript:void(0)"
                            class="sort" data-sort="js-lists-values-date">비고</a></th>
                        <th style="width: 24px;"></th>
                    </tr>
                </thead>
                <c:forEach items="${mentoringList}" var="mentoring" varStatus="loop">
                <tbody class="list" id="projects">
                    <tr>
                        <td>
                            <div class="media-body">
                                <div class="d-flex flex-column">
                                    <small class="js-lists-values-project"><strong>${loop.count}</strong></small>
                                </div>
                            </div>
                        </td>

                        <td>
                            <div class="media-body">
                                <div class="d-flex align-items-center">
                                    <div class="flex d-flex flex-column">
                                        <p class="mb-0">
                                            <small class="js-lists-values-lead"><strong>${mentoring.memName}</strong></small>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </td>

                        <td>
                            <div class="d-flex flex-column">
                                <small class="js-lists-values-status text-50 mb-4pt">${mentoring.deptName}</small>
                            </div>
                        </td>

                        <td>
                            <div class="d-flex flex-column">
                                <small class="js-lists-values-budget"><strong>${mentoring.chatDate}</strong></small>
                            </div>
                        </td>

                        <td>
                            <div class="d-flex flex-column">
                                <button class="btn btn-primary" onclick="openPopup('${mentoring.chatId}')">채팅 시작</button>
                            </div>
                        </td>
                    </tr>
                </tbody>
                </c:forEach>
            </table>
        </div>
        
    </div>
</div>
<%-- <security:authentication property="memNo"/> --%>
<form name="usersForm">
        <input type="hidden" id="chatId" name="chatId"/>
        <input type="hidden" id="username" name="username"/>
    <br/>
</form>
    
<script src="<c:url value='/resources/js/paging.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
var webSocket = null;
$(document).ready(function() {
    var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/usersServerEndpoint';
    webSocket = connection(url);
    var connectionType;

    webSocket.onopen = function(){ processOpen(); };
    webSocket.onmessage = function(message) { processMessage(message); };
    webSocket.onerror = function(message) { processError(message); };

});

function connection(url) {
    var webSocket = null;
    if ('WebSocket' in window) {
        webSocket = new WebSocket(url);
    } else if ('MozWebSocket' in window) {
        webSocket = new MozWebSocket(url);
    } else {
        console.log('Error: WebSocket is not supported by this browser.');
        return null;
    }
    return webSocket;
}

function processOpen() {
    connectionType = "firstConnection";
    username = "${loginVO.name}";
    webSocket.send(JSON.stringify({ "connectionType" : connectionType, "username" : username }));
}

function processMessage(message) {
    var jsonData = JSON.parse(message.data);

    if (jsonData.allUsers != null) {
//         displayUsers(jsonData.allUsers);
    }

    if (jsonData.disconnectedUser != null) {
        $("#" + jsonData.disconnectedUser).remove();
    }

    if (jsonData.enterChatId != null) {
        var chatId = jsonData.enterChatId;
        $("#chatId").val(chatId);
        $("#username").val(jsonData.username);
        openPopup(chatId);
    }
}

function openPopup(chatId) {
	console.log(chatId);
    var popOptions = "width=300, height=550, resizable=yes, status=no, scrollbar=yes";
    var targetTitle = chatId;
    popupPost("<c:url value='/student/careerup/mentoring/msg/websocketMessengePopup.do'/>", targetTitle, popOptions);
}

function popupPost(url, target, option) {
    window.open("", target, option);
	console.log("target",target);
	
    var form = $("form[name=usersForm]");
    form.attr("target", target);
    form.attr("action", url);
    form.attr("method", "post");
    form.find("[name='chatId']").val(target);
    
    console.log("form", form);
    
    form.submit();
}

function trClick(selectedTr) {
    if (selectedTr.id != null) {
        connectionType = "chatConnection";
        webSocket.send(JSON.stringify({ "connectionType" : connectionType, "connectingUser" : selectedTr.id }));
    }
}

function random(chatId) {
    var rUid = "";
    for (var i = 0; i < 8; i++) {
        rUid += String.fromCharCode(Math.floor(Math.random() * 26) + 97);
    }
    return chatId + "." + rUid;
}

function processError(message) {
    console.error('WebSocket Error: ', message);
}

window.onbeforeunload = function() {
    webSocket.close();
};
</script>
