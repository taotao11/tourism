<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="fly-panel fly-column">
  <div class="layui-container">
    <ul class="layui-clear">
      <li class="layui-hide-xs layui-this"><a href="${pageContext.request.contextPath}/">首页</a></li> 
      <li><a href="${pageContext.request.contextPath}/jList?current=0&&type=0">公告</a></li>
      <li><a href="${pageContext.request.contextPath}/aList?current=0&&type=0">背景<span class="layui-badge-dot"></span></a></li>
      <li><a href="${pageContext.request.contextPath}/tList?current=0&&type=0">员工排行</a></li>
      <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li>
    </ul>
    <c:if test="${user != null}">
      <div class="  fly-column-right layui-hide-xs">
        <a href="${pageContext.request.contextPath}/addObj" class="layui-btn">添加申请</a>
      </div>
      <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;">
        <a href="${pageContext.request.contextPath}/addObj" class="layui-btn">添加申请</a>
      </div>
    </c:if>
  </div>
</div>
<script>
    layui.use('form',function(){});<!--加载form模块-->
</script>