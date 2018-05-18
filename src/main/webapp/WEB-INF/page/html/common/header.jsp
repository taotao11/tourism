<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8"%>
<div class="fly-header layui-bg-black">
  <div class="layui-container">
    <a class="fly-logo" href="/">
      <img src="${pageContext.request.contextPath}/res/images/logo.png" alt="layui">
    </a>

    <ul class="layui-nav fly-nav-user">

      <c:if test="${user == null}">
        <!-- 未登入的状态 -->
        <li class="layui-nav-item">
          <a class="iconfont icon-touxiang layui-hide-xs" href="${pageContext.request.contextPath}/login"></a>
        </li>
        <li class="layui-nav-item">
          <a href="${pageContext.request.contextPath}/login">登入</a>
        </li>
        <li class="layui-nav-item">
          <a href="${pageContext.request.contextPath}/reg">注册</a>
        </li>
      </c:if>
      <c:if test="${user != null}">
        <li class="layui-nav-item">
          <a class="fly-nav-avatar" href="${pageContext.request.contextPath}/userIndex?uid=${user.id}">
            <cite class="layui-hide-xs">${user.name}</cite>
            <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：xxx公司 员工"></i>
            <i class="layui-badge fly-badge-vip layui-hide-xs">VIP</i>
            <c:if test="${user.url == null}">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
            </c:if>
            <c:if test="${user.url != null}">
              <img src="${pageContext.request.contextPath}/${user.url}" alt="头像">
            </c:if>
          </a>
          <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/set"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
            <dd><a href="${pageContext.request.contextPath}/myIndex/${user.id}"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
            <hr style="margin: 5px 0;">
            <dd><a href="${pageContext.request.contextPath}/user/layout/" style="text-align: center;">退出</a></dd>
          </dl>
        </li>
      </c:if>
    </ul>
  </div>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>