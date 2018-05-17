<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>手拉手后台</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="手拉手">
  <meta name="description" content="手拉手">
  <jsp:include page="../common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../webcommon/header.jsp"></jsp:include>
<jsp:include page="../webcommon/column.jsp"></jsp:include>
<div class="layui-container">
  <c:if test="${page == null}">
    <script  type="text/javascript">
        window.location.href = "${pageContext.request.contextPath}/notice/selectAll?current=1";
    </script >
  </c:if>
  <div class="layui-row layui-col-space15">
    <div class="fly-panel fly-panel-user" pad20>
      <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title">
          <li class="layui-this">公告列表</li>
        </ul>
        <div class="layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
          <div class="layui-tab-item layui-show">
            <div class="fly-panel" style="margin-bottom: 0;">
              <ul class="fly-list">
                <c:forEach items="${page.records}" var="x">
                  <li>
                    <h2>
                      <a class="layui-badge">公告</a>
                      <a href="${pageContext.request.contextPath}/notice/select?id=${x.id}">${x.title}</a>
                    </h2>
                    <span class="fly-list-nums">
                      <a href="${pageContext.request.contextPath}/notice/set?id=${x.id}">修改</a>
                      <a href="${pageContext.request.contextPath}/notice/delete?id=${x.id}">删除</a>
                      </span>
                  </li>
                </c:forEach>
              </ul>

              <!-- <div class="fly-none">没有相关数据</div> -->

              <div style="text-align: center">
                <div class="laypage-main">
                  <c:if test="${page.current != 1}">
                    <a href="${pageContext.request.contextPath}/notice/selectAll?current=${ page.current - 1 }&&type=1" class="laypage-last" title="尾页">上一页</a>
                  </c:if>

                  <span class="laypage-curr">${page.current}</span>

                  <c:if test="${page.current < page.pages}">
                    <a href="${pageContext.request.contextPath}/notice/selectAll?current=${ page.current + 1 }&&type=1" class="laypage-last" title="尾页">下一页</a>
                  </c:if>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<%--<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>--%>
<script>
    //JavaScript代码区域
    layui.use('form',function(){});<!--加载form模块-->
</script>
</body>
</html>