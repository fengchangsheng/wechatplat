<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <title>后台登录</title>
  <link href="/static/hui/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
  <link href="/static/hui/static/h-ui/css/H-ui.login.css" rel="stylesheet" type="text/css" />
  <link href="/static/hui/static/h-ui/css/style.css" rel="stylesheet" type="text/css" />
  <link href="/static/hui/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="/account/login" method="post" id="form_login">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="uname" name="username" type="text" placeholder="账户" class="input-text size-L" value="lucare">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="upass" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input id="codetext" class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img src="/getCode" id="code"> <a id="kanbuq" href="javascript:;" onclick="changeImg()">看不清，换一张</a> </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 长晟集团</div>
<script type="text/javascript" src="/static/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/hui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/hui/lib/jquery/validation/1.14.0/jquery.validate.min.js"></script>
<%--<script type="text/javascript" src="/static/hui/lib/jquery/validation/1.14.0/validate-methods.js"></script>--%>
<script type="text/javascript" src="/static/hui/lib/jquery/validation/1.14.0/messages_zh.min.js"></script>

<script>
  function changeImg(){
    $("#code").attr("src","/getCode?num="+Math.random());
  }

  $(function () {
      $("#form_login").validate({
          rules: {
              uname: {
                  required: true,
                  minlength: 4,
                  maxlength: 16
              }
//              ,

//              upass: {
//                  required: true
//              },
//              codetext: {
//                  required: true,
//                  remote: {
//                      url: "/validateCode",     //后台处理程序
//                      type: "post",               //数据发送方式
//                      dataType: "json",           //接受数据格式
//                      data: {                     //要传递的数据
//                          strcode: function () {
//                              return $("#codetext").val();
//                          }
//                      }
//                  }
//              },
          }
      });
  });

</script>
</body>
</html>