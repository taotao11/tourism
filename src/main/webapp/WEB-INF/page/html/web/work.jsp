<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>xxx公司后台</title>
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
        window.location.href = "${pageContext.request.contextPath}/work/selectByStu/0?current=1";
    </script >
  </c:if>
  <div class="layui-row layui-col-space15">
    <div class="fly-panel fly-panel-user" pad20>
      <div class="layui-tab layui-tab-brief" lay-filter="user">
        <ul class="layui-tab-title">
          <li class="layui-this">工作回复</li>
        </ul>
        <div class="layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
          <div class="layui-tab-item layui-show">
            <div class="fly-panel" style="margin-bottom: 0;">
              <a class="layui-btn layui-btn-sm" href="${pageContext.request.contextPath}/work/selectByStu/${stu == 0 ? 1 : 0}?current=1">${stu == 0 ? "查看已回复":"查看未回复"}</a>

              <c:if test="${stu == 0}">
                <%--未回复--%>
                <table class="layui-table" lay-skin="line">
                  <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                  </colgroup>
                  <thead>
                  <tr>
                    <th>员工姓名</th>
                    <th colspan="2">工作内容</th>
                    <th>时间</th>
                    <th>处理理由</th>
                    <th>回复</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${page.records}" var="l">
                    <form class="" action="${pageContext.request.contextPath}/work/update" method="post">
                      <input type="hidden" name="id" value="${l.id}">
                      <input type="hidden" name="aid" value="${admin.id}">
                      <tr>
                        <td>${l.uName}</td>
                        <td colspan="2">${l.content}</td>
                        <td>${l.createTime}</td>
                        <td><input class="layui-input" name="reason"></td>
                        <td><button class="layui-btn layui-btn-sm">回复</button></td>
                      </tr>
                    </form>

                  </c:forEach>
                  </tbody>
                </table>
              </c:if>

              <%--已回复--%>
              <c:if test="${stu == 1}">
                <table class="layui-table" lay-skin="line">
                  <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                  </colgroup>
                  <thead>
                  <tr>
                    <th>员工姓名</th>
                    <th colspan="2">工作内容</th>
                    <th>时间</th>
                    <th>处理人</th>
                    <th>处理理由</th>
                    <th>状态</th>
                    <th>回复时间</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${page.records}" var="l">
                    <tr>
                      <td>${l.uName}</td>
                      <td colspan="2">${l.content}</td>
                      <td>${l.createTime}</td>
                      <td>${l.aName}</td>
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
              </c:if>
              <!-- <div class="fly-none">没有相关数据</div> -->

              <div style="text-align: center">
                <div class="laypage-main">
                  <c:if test="${page.current != 1}">
                    <a href="${pageContext.request.contextPath}/work/selectByStu/${stu}?current=${ page.current - 1 }&&type=1" class="laypage-last" title="尾页">上一页</a>
                  </c:if>

                  <span class="laypage-curr">${page.current}</span>

                  <c:if test="${page.current < page.pages}">
                    <a href="${pageContext.request.contextPath}/work/selectByStu/${stu}?current=${ page.current + 1 }&&type=1" class="laypage-last" title="尾页">下一页</a>
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