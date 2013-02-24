crossDomain || github的使用
===========

跨域取值通过window.name 传值
domainOne_index.jsp向域二请求，域二返回domainTwo_index.jsp页面，值放到window.name属性中，响应后立即跳转到请求域中
页面null.jsp请求域实际上是在自己本域上的null.jsp中的window.name取值,当拿到值后再次请求域二返回domainTwo_index.jsp。
用户体验只访问了一次，实际上访问了2次。
Git使用.docx把项目保存到git的库中的教程
