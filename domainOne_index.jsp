<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>跨域获取数据</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	http://127.0.0.1/testTwo/servlet/TestDomain   // url for testTwo
	-->
  </head>
  <script src="js/jquery.min.js"></script>
  <script type="text/javascript">

    function domainData(url, fn) {
        var isFirst = true;
        var iframe = document.createElement('iframe');
        iframe.style.display = 'none';
        var loadfn = function(){
            if(isFirst){
                iframe.contentWindow.location = 'http://127.0.0.1/one/null.html';
                isFirst = false;
            } else {
                fn(iframe.contentWindow.name);
                iframe.contentWindow.document.write('aaaaa');
                iframe.contentWindow.close();
                document.body.removeChild(iframe);
                iframe.src = '';
                iframe = null;
            }
        };
        iframe.src = url;
        if(iframe.attachEvent){
            iframe.attachEvent('onload', loadfn);
        } else {
            iframe.onload = loadfn;
        }
        document.body.appendChild(iframe);
    }
    </script>
  <body>
    alert 弹出来的数据就是 domainTwo 中取到的值 <br>
  <script type="text/javascript">
 		domainData('http://localhost/testTwo/index.jsp', function(data){
        alert(data);
    });
 	</script>
  </body>
</html>
