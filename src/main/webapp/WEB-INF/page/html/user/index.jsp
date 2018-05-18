<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户中心</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/column.jsp"></jsp:include>
<%--<c:if test="${jindians == null}">--%>
  <%--<script  type="text/javascript">--%>
      <%--window.self.location = "${pageContext.request.contextPath}/userIndex?id=${user.id}";--%>
  <%--</script >--%>
<%--</c:if>--%>
<div class="layui-container fly-marginTop fly-user-main">
  <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item">
      <a href="${pageContext.request.contextPath}/myIndex/${user.id}">
        <i class="layui-icon">&#xe609;</i>
        我的主页
      </a>
    </li>
    <li class="layui-nav-item layui-this">
      <a href="${pageContext.request.contextPath}/userIndex?uid=${user.id}">
        <i class="layui-icon">&#xe612;</i>
        员工中心
      </a>
    </li>
    <li class="layui-nav-item">
      <a href="${pageContext.request.contextPath}/set">
        <i class="layui-icon">&#xe620;</i>
        基本设置
      </a>
    </li>
  </ul>

  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>
  
  <div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
  </div>
  <div class="site-mobile-shade"></div>
  
  
  <div class="fly-panel fly-panel-user" pad20>
    <!--
    <div class="fly-msg" style="margin-top: 15px;">
      您的邮箱尚未验证，这比较影响您的帐号安全，<a href="activate.html">立即去激活？</a>
    </div>

    -->
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li data-type="mine-jie" lay-id="index" class="layui-this">请假记录（<span>${levea.size()}</span>）</li>
        <li data-type="collection" data-url="/collection/find/" lay-id="collection">报销记录（<span>${submit.size()}</span>）</li>
        <li data-type="collection" data-url="/collection/find/" lay-id="collection">工作记录（<span>${work.size()}</span>）</li>
        <li data-type="collection" data-url="/collection/find/" lay-id="collection">反馈记录（<span>${suggest.size()}</span>）</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <div class="layui-tab-item layui-show">
            <table class="layui-table" lay-skin="line">
              <colgroup>
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <thead>
              <tr>
                <th>请假内容</th>
                <th>请假天数</th>
                <th>时间</th>
                <th>处理人</th>
                <th>处理理由</th>
                <th>状态</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${levea}" var="l">
                <tr>
                  <td>${l.title}</td>
                  <td>${l.createTime}</td>
                  <td>${l.length}&nbsp;天</td>
                  <td>${l.aid}</td>
                  <td>${l.reason}</td>
                  <td>
                      ${l.type == 0 ? "等待处理" : ""}
                      ${l.type == 1 ? "批准" : ""}
                      ${l.type == 2 ? "不批准" : ""}
                  </td>
                </tr>
              </c:forEach>

              </tbody>
            </table>
          </div>
        </div>
        <div class="layui-tab-item">
          <div class="layui-tab-item layui-show">
            <table class="layui-table" lay-skin="line">
              <colgroup>
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <thead>
              <tr>
                <th>报销内容</th>
                <th>报销金额</th>
                <th>时间</th>
                <th>处理人</th>
                <th>处理理由</th>
                <th>状态</th>
                <th>审核时间</th>

              </tr>
              </thead>
              <tbody>
              <c:forEach items="${submit}" var="l">
                <tr>
                  <td>${l.title}</td>
                  <td>${l.money}&nbsp;元</td>
                  <td>${l.createTime}</td>

                  <td>${l.aid}</td>
                  <td>${l.reason}</td>
                  <td>
                      ${l.type == 0 ? "等待处理" : ""}
                      ${l.type == 1 ? "批准" : ""}
                      ${l.type == 2 ? "不批准" : ""}
                  </td>
                  <td>${l.uplodTime}</td>
                </tr>
              </c:forEach>

              </tbody>
            </table>
          </div>
        </div>
        <div class="layui-tab-item ">
          <div class="layui-tab-item layui-show">
            <table class="layui-table" lay-skin="line">
              <colgroup>
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <thead>
              <tr>
                <th colspan="2">工作内容</th>
                <th>时间</th>
                <th>处理人</th>
                <th>处理理由</th>
                <th>状态</th>
                <th>回复时间</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${work}" var="l">
                <tr>
                  <td colspan="2">${l.content}</td>
                  <td>${l.createTime}</td>
                  <td>${l.aid}</td>
                  <td>${l.reason}</td>
                  <td>
                      ${l.stuats == 0 ? "等待回复" : ""}
                      ${l.stuats== 1 ? "以回复" : ""}
                  </td>
                  <td>${l.updateTime}</td>
                </tr>
              </c:forEach>

              </tbody>
            </table>
          </div>
        </div>
        <div class="layui-tab-item ">
          <div class="layui-tab-item layui-show">
            <table class="layui-table" lay-skin="line">
              <colgroup>
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <thead>
              <tr>
                <th colspan="2">反馈内容</th>
                <th>时间</th>
                <th>处理人</th>
                <th>处理理由</th>
                <th>状态</th>
                <th>回复时间</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${suggest}" var="l">
                <tr>
                  <td colspan="2">${l.title}</td>
                  <td>${l.createTime}</td>
                  <td>${l.aid}</td>
                  <td>${l.reason}</td>
                  <td>
                      ${l.stuats == 0 ? "等待回复" : ""}
                      ${l.stuats== 1 ? "以回复" : ""}
                  </td>
                  <td>${l.updateTime}</td>
                </tr>
              </c:forEach>

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>