<%-- 
    Document   : toast
    Created on : Jun 30, 2023, 11:13:46 PM
    Author     : giadu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="toast">
    <div id="toast-id" class="toast toast--${MESSAGE.type}" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast_icon">
            <i class="${MESSAGE.icon}"></i>
        </div>
        <div class="toast_body">
            <h3 class="toast_title">${MESSAGE.title}</h3>
            <p class="toast_msg">${MESSAGE.message}</p>
        </div>

        <div class="toast_close">
            <i class="fa-solid fa-xmark"></i>
        </div>
    </div>
</div>

