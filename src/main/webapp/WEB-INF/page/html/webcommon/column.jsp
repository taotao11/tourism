<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="fly-panel fly-column">
  <div class="layui-container">
    <ul class="layui-clear">
      <c:if test="${admin != null}">
        <li><a href="${pageContext.request.contextPath}/admin/selectAll?current=1">管理员</a></li>
        <li><a href="${pageContext.request.contextPath}/user/selectAllUser/1">用户</a></li>
        <li><a href="${pageContext.request.contextPath}/web/addNotice">添加公告</a></li>
        <li><a href="${pageContext.request.contextPath}/notice/selectAll?current=1">公告</a></li>
        <li><a href="${pageContext.request.contextPath}/levea/selectByStu/0?current=1">请假审批</a></li>
        <li><a href="${pageContext.request.contextPath}/submit/selectByStu/0?current=1">报销<span class="layui-badge-dot"></span></a></li>
        <li><a href="${pageContext.request.contextPath}/work/selectByStu/0?current=1">工作回复</a></li>
        <li><a href="${pageContext.request.contextPath}/suggest/selectByStu/0?current=1">反馈</a></li>
      </c:if>
    </ul>
  </div>
</div>