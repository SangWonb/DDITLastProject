<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<body class="layout-default layout-login-image">

        <div class="layout-login-image__overlay"
             style="background-image: url(/lcms/resources/images/University-campus-view.jpg">
            <div class="fullbleed bg-dark"
                 style="opacity: 0"></div>
        </div>

        <div class="layout-login-image__form bg-white"
             data-perfect-scrollbar>
            <div class="d-flex justify-content-center mt-2 mb-5 navbar-light">
                <a href="index-student.html"
                   class="navbar-brand flex-column mb-2 align-items-center mr-0"
                   style="min-width: 0">

                    <span class="avatar avatar-sm navbar-brand-icon mr-0">

                        <span class="avatar-title rounded bg-white"><img src="/lcms/resources/images/logo/logo.png"
                                 alt="logo"
                                 class="img-fluid" /></span>

                    </span>

                    한국인재대학교
                </a>
            </div>

            <h4 class="m-0">포털시스템 로그인</h4>
            <input type="radio" id="html" name="fav_language" value="HTML">
            <label for="html"><a href="index-student.html">학생</a></label><br>
            <input type="radio" id="css" name="fav_language" value="CSS">
            <label for="css"><a href="index-professor.html">교수</a></label><br>
            <input type="radio" id="javascript" name="fav_language" value="JavaScript">
            <label for="javascript"><a href="index-staff.html">교직원</a></label>

            <form action="index-student.html"
                  novalidate>
                <div class="form-group">
                    <label class="text-label"
                           for="email_2">ID:</label>
                    <div class="input-group input-group-merge">
                        <input id="email_2"
                               type="email"
                               required=""
                               class="form-control form-control-prepended"
                               placeholder="로그인ID">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="far fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="text-label"
                           for="password_2">Password:</label>
                    <div class="input-group input-group-merge">
                        <input id="password_2"
                               type="password"
                               required=""
                               class="form-control form-control-prepended"
                               placeholder="비밀번호">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="fa fa-key"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-5">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox"
                               class="custom-control-input"
                               checked=""
                               id="remember">
                        <label class="custom-control-label"
                               for="remember">아이디 저장</label>
                    </div>
                </div>
                <div class="form-group text-center">
                    <button class="btn btn-primary mb-5"
                            type="submit">Login</button><br>
                    <a href="">Forgot id?</a> <br>
                    <a href="">Forgot password?</a>
                </div>
            </form>
        </div>
        
    </body>