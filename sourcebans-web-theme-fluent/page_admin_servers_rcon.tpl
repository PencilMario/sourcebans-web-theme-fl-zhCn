-{if NOT $permission_rcon}-
  <section class="error padding">
    <i class="fas fa-exclamation-circle"></i>
  <div class="error_title">哎呀，出问题了 (╯□°)╯︵ ┻━┻</div>

  <div class="error_content">
    拒绝访问！
  </div>

  <div class="error_code">
    错误代码：<span class="text:bold">403 禁止</span>
  </div>
</section>
-{else}-
<div id="admin-page-content">
  <div class="admin_tab_content_title">
    <h2 class="fas fa-laptop-code">RCON 控制台</h2>
  </div>

  <div class="padding">
    <div id="rcon" class="form-text form-text:rcron">
      <pre>
        <div id="rcon_con">***********************************************************<br />*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*<br />* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *<br />*&nbsp;在下面的框中输入您的命令，然后按回车键&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*<br />*&nbsp;键入 "clr "清除控制台&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*<br />*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*<br />***********************************************************<br />
        </div>
        </pre>
    </div>

    <div class='flex flex-ai:end flex-jc:space-between margin-top'>
      <div class="flex:11 margin-right">
        <label for="cmd" class="form-label form-label:bottom">命令：</label>
        <input type="text" class="form-input form-full" id="cmd" name="cmd" />
      </div>

      <input type="button" onclick="SendRcon();" class="button button-success btn" id="rcon_btn" value="Send">
    </div>
  </div>
</div>

<script>
  $E('html').onkeydown = function(event) {
    var event = new Event(event);
    if (event.key == 'enter') SendRcon();
  };

  function SendRcon() {
    xajax_SendRcon('-{$id}-', $('cmd').value, true);
    $('cmd').value = '执行中...';
    $('cmd').disabled = 'true';
    $('rcon_btn').disabled = 'true';

  }

  var scroll = new Fx.Scroll($('rcon'),{duration: 500, transition: Fx.Transitions.Cubic.easeInOut});
    if (scroll) scroll.toBottom();
  </script>
-{/if}-