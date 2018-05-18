<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>用户主页</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/column.jsp"></jsp:include>

<div class="fly-home fly-panel" style="background-image: url();">
  <c:if test="${userI.url != null}">
    <img src="${pageContext.request.contextPath}/${userI.url}" alt="${userI.name}">
  </c:if>
  <c:if test="${userI.url == null}">
    <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="默认头像">
  </c:if>

  <i class="iconfont icon-renzheng" title="Fly社区认证"></i>
  <h1>
    ${userI.name}
    <i class="iconfont icon-nan"></i>
    <i class="layui-badge fly-badge-vip">VIP</i>
  </h1>

  <p style="padding: 10px 0; color: #5FB878;">认证信息：xxx公司员工</p>

  <p class="fly-home-info">
    <i class="iconfont icon-kiss" title="飞吻"></i><span style="color: #FF7200;">66666 飞吻</span>
    <i class="iconfont icon-shijian"></i><span>${userI.creatTime} 加入</span>
  </p>

  <p class="fly-home-sign">（
    <c:if test="${userI.title == null}">
      这人很懒，什么都没有留下....
    </c:if>
    <c:if test="${userI.title != null}">
      ${userI.title}
    </c:if>
    ）</p>
</div>

<div class="layui-container">
  <div class="layui-row layui-col-space15">
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