<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>

<style>
    .sidebar-btn {
        width: 250px;
        height: 100px;
        padding: 12px 20px;
        border: none;
        font-size: 40px;
        cursor: pointer;
        border-radius: 25px;
        transition: 0.3s;
    }
	
    .sidebar-btn.user { background-color: #FFFFFF; color: #7D81CA; }
    .sidebar-btn.movie { background-color: #FFFFFF; color: #7D81CA; }
    .sidebar-btn.wc { background-color: #FFFFFF; color: #7D81CA; }

    .sidebar-btn.user:hover,
    .sidebar-btn.movie:hover,
    .sidebar-btn.wc:hover {
        background-color: #7D81CA;
        color: #FFFFFF;
    }
    
</style>

<div class="sidebar" 
     style="
        position: fixed;
        top: 100px;           
        left: 0;
        width: 280px;
        height: 924px;
        background-color: #FFFFFF;
        box-shadow: 20px 4px 20px rgba(0, 0, 0, 0.1);
        padding: 20px;
        display: flex;
        flex-direction: column;
        gap: 15px;
     ">
     
    <button class="sidebar-btn user" onclick="location.href='${root}/admin/users/list'">user</button>
    <button class="sidebar-btn movie" onclick="location.href='${root}/admin/movie/list'">영화</button>    
    <button class="sidebar-btn wc" onclick="location.href='adminwc.jsp'">월드컵</button>
     
</div>
