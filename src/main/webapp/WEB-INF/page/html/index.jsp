<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>xxx公司</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="手拉手">
  <meta name="description" content="手拉手">
  <jsp:include page="common/link.jsp"></jsp:include>
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<jsp:include page="common/column.jsp"></jsp:include>
<%--<c:if test="${jin == null}">--%>
  <%--<script  type="text/javascript">--%>
      <%--window.self.location = "${pageContext.request.contextPath}/";--%>
  <%--</script >--%>
<%--</c:if>--%>
<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8">
      <div class="fly-panel layui-row" style="padding: 40px 0">
        <div class="fly-panel-title fly-filter">
          <a>公司背景</a>
        </div>
        <div class="layui-col-md5" style="margin-top: 20px">
          <div style="width: 280px;margin-left: 20px">
            <a href="#">
              <img width="280px" height="230px" src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" alt="" />
            </a>

            <a href="${pageContext.request.contextPath}"><h3 class="layui-word-aux fly-panel-title">&nbsp;大明湖畔</h3></a>
            <p class="layui-word-aux">大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔大明湖畔</p>
          </div>
        </div>
        <%--<c:forEach items="${jin}" var="j">--%>
          <%--<div class="layui-col-md5" style="margin-top: 20px">--%>
            <%--<div style="width: 280px;margin-left: 20px">--%>
              <%--<a href="${pageContext.request.contextPath}/detail/${j.id}">--%>
                <%--<img width="280px" height="230px" src="${pageContext.request.contextPath}/${j.url}" alt="" />--%>
              <%--</a>--%>

              <%--<a href="${pageContext.request.contextPath}/detail/${j.id}"><h3 class="layui-word-aux fly-panel-title">&nbsp;${j.title}</h3></a>--%>
              <%--<p class="layui-word-aux">${j.reason}</p>--%>
            <%--</div>--%>
          <%--</div>--%>
        <%--</c:forEach>--%>
      </div>

      <%--<div class="fly-panel" style="margin-bottom: 0;">--%>
        <%----%>
        <%--<div class="fly-panel-title fly-filter">--%>
          <%--<a href="" class="layui-this">热门话题</a>--%>
          <%--<span class="fly-mid"></span>--%>
        <%--</div>--%>

        <%--<ul class="fly-list">--%>

          <%--&lt;%&ndash;<c:forEach items="${rm}" var="x">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<a href="${pageContext.request.contextPath}/myIndex/${x.user.id}" class="fly-avatar">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<img src="${pageContext.request.contextPath}/${x.user.url}" alt="">&ndash;%&gt;--%>
              <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<h2>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<a class="layui-badge">话题</a>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<a href="${pageContext.request.contextPath}/topic/${x.topic.id}">${x.topic.title}</a>&ndash;%&gt;--%>
              <%--&lt;%&ndash;</h2>&ndash;%&gt;--%>
              <%--&lt;%&ndash;<div class="fly-list-info">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<a href="${pageContext.request.contextPath}/myIndex/${x.user.id}" link>&ndash;%&gt;--%>
                  <%--&lt;%&ndash;<cite>${x.user.name}</cite>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<span>${x.topic.creatTime}</span>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i></span>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<span class="layui-badge fly-badge-accept layui-hide-xs">gg</span>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<span class="fly-list-nums">&ndash;%&gt;--%>

              <%--&lt;%&ndash;</span>&ndash;%&gt;--%>
              <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
          <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
        <%--</ul>--%>
        <%--<div style="text-align: center">--%>
          <%--<div class="laypage-main">--%>
            <%--<a href="${pageContext.request.contextPath}/tList?current=0&&type=0" class="laypage-next">更多话题</a>--%>
          <%--</div>--%>
        <%--</div>--%>

      <%--</div>--%>
    </div>
    <div class="layui-col-md4">
      <div class="fly-panel">
        <h3 class="fly-panel-title">公告</h3>
        <ul class="fly-list">
          <li>
            <h2>
              <a class="layui-badge">公告</a>
              <a href="${pageContext.request.contextPath}/notice/select?id=">关于涨工资</a>
            </h2>
          </li>
          <%--<c:forEach items="${notice}" var="x">--%>
            <%--<li>--%>
              <%--<h2>--%>
                <%--<a class="layui-badge">公告</a>--%>
                <%--<a href="${pageContext.request.contextPath}/notice/select?id=${x.id}">${x.title}</a>--%>
              <%--</h2>--%>
            <%--</li>--%>
          <%--</c:forEach>--%>
        </ul>
      </div>
      <%--<div class="fly-panel">--%>
        <%--<h3 class="fly-panel-title">相关活动</h3>--%>
        <%--<ul class="fly-list">--%>
          <%--<c:forEach items="${xg}" var="x">--%>
            <%--<li>--%>
              <%--<a href="${pageContext.request.contextPath}/myIndex/${x.user.id}" class="fly-avatar">--%>
                <%--<img src="${pageContext.request.contextPath}/${x.user.url}" alt="">--%>
              <%--</a>--%>
              <%--<h2>--%>
                <%--<a class="layui-badge">活动</a>--%>
                <%--<a href="${pageContext.request.contextPath}/activity/${x.activity.id}">${x.activity.title}</a>--%>
              <%--</h2>--%>
              <%--<div class="fly-list-info">--%>
                <%--<a href="${pageContext.request.contextPath}/myIndex/${x.user.id}" link>--%>
                  <%--<cite>${x.user.name}</cite>--%>
                <%--</a>--%>
                <%--<span>${x.activity.beginTime}</span>--%>
                <%--<span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i></span>--%>
                <%--<span class="layui-badge fly-badge-accept layui-hide-xs">gg</span>--%>
                <%--<span class="fly-list-nums">--%>

              <%--</span>--%>
              <%--</div>--%>
            <%--</li>--%>
          <%--</c:forEach>--%>
        <%--</ul>--%>
      <%--</div>--%>

    </div>
  </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
<%--<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>--%>

</body>
</html>