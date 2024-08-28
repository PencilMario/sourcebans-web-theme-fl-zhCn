<div class="layout_box flex:11 admin_tab_content tabcontent" id="View Permissions" style="display: block;">
    <div class="admin_tab_content_title">
        <h2><i class="fas fa-address-card"></i>您的权限</h2>
    </div>

    <div class="padding">
        <div class="margin-bottom">
            以下是您在本系统中拥有的权限列表。
        </div>

        <div class="flex m:flex-fd:column">
            <div class="flex:11">
                <h3 style="color: var(--table-permanent-text);">在线权限</h3>

                <ul>
                    -{if $web_permissions}-
                        -{foreach from=$web_permissions item="permission"}-
                            <li>-{$permission}-</li>
                        -{/foreach}-
                    -{else}-
                        <li class="text:italic">无</li>
                    -{/if}-
                </ul>
            </div>

            <div class="flex:11">
                <h3 style="color: var(--table-unbanned-text);">服务器权限</h3>

                <ul>
                    -{if $server_permissions}-
                        -{foreach from=$server_permissions item="permission"}-
                            <li>-{$permission}-</li>
                        -{/foreach}-
                    -{else}-
                        <li class="text:italic">无</li>
                    -{/if}-
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="layout_box flex:11 admin_tab_content tabcontent" id="Change Password">
    <div class="admin_tab_content_title">
        <h2><i class="fas fa-key"></i>更改密码</h2>
    </div>

    <div class="padding">
        <div class="margin-bottom:half">
            <label for="current" class="form-label form-label:bottom">
                当前密码
            </label>

            <input type="password" onblur="xajax_CheckPassword(-{$user_aid}-, $('current').value);"
                class="form-input form-full" id="current" name="current" />

            <div class="form-desc">
                我们需要知道您的当前密码，以验证您的身份。
            </div>

            <div id="current.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom">
            <label for="pass1" class="form-label form-label:bottom">
                新密码
            </label>

            <input class="form-input form-full" type="password" onkeyup="checkYourAcctPass();" id="pass1" value=""
                name="pass1" />

            <div class="form-desc">
                在此输入您的新密码。
            </div>

            <div id="pass1.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="pass2" class="form-label form-label:bottom">
                确认密码
            </label>

            <input type="password" onkeyup="checkYourAcctPass();" class="form-input form-full" id="pass2"
                name="pass2" />

            <div class="form-desc">
                在此输入您的新密码。
            </div>

            <div id="pass2.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="flex flex-ai:center flex-jc:space-between">
            <input type="submit" onclick="xajax_CheckPassword(-{$user_aid}-, $('current').value);dispatch();"
                name="button" class="button button-success" id="button" value="Save" />
            <input type="submit" onclick="history.go(-1)" name="button" class="button button-light" id="button"
                value="Cancel" />
        </div>
    </div>
</div>


<div class="layout_box flex:11 admin_tab_content tabcontent" id="Server Password">
    <div class="admin_tab_content_title">
        <h2><i class="fab fa-steam-symbol"></i>更改服务器密码</h2>
    </div>

    <div class="padding">
        <div class="margin-bottom">
            <div>
                在使用管理员权限之前，您需要在游戏服务器中指定该密码。
            </div>
            <div>
                点击<a href="http://wiki.alliedmods.net/Adding_Admins_%28SourceMod%29#Passwords"
                    title="SourceMod Password Info" target="_blank" rel="noopener" class="text:bold">这里</a>获取更多信息。
            </div>
        </div>

        -{if $srvpwset}-
            <div class="margin-bottom:half">
                <label for="scurrent" class="form-label form-label:bottom">
                    当前服务器密码
                </label>

                <input type="password" onblur="xajax_CheckSrvPassword(-{$user_aid}-, $('scurrent').value);"
                    class="form-input form-full" id="scurrent" name="scurrent" />

                <div class="form-desc">
                    我们需要知道您的当前密码，以验证您的身份。
                </div>

                <div id="scurrent.msg" class="message message:error margin-top:half" style="display: none;"></div>
            </div>
        -{/if}-

        <div class="margin-bottom:half">
            <label for="spass1" class="form-label form-label:bottom">
                新密码
            </label>

            <input class="form-input form-full" type="password" onkeyup="checkYourSrvPass();" id="spass1" value=""
                name="spass1" />

            <div class="form-desc">
                在此处键入新的服务器密码。
            </div>

            <div id="spass1.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="spass2" class="form-label form-label:bottom">
                确认密码
            </label>

            <input type="password" onkeyup="checkYourSrvPass();" class="form-input form-full" id="spass2"
                name="spass2" />

            <div class="form-desc">
                请再次输入您的新服务器密码，以免出错。
            </div>

            <div id="spass2.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        -{if $srvpwset}-
            <div class="margin-bottom:half">
                <input type="checkbox" id="delspass" class="form-check" name="delspass" />

                <label for="delspass" class="form-label form-label:left">
                    删除密码
                </label>

                <div class="form-desc">
                    如果要删除服务器密码，请选中此复选框。
                </div>
            </div>
        -{/if}-

        <div class="flex flex-ai:center flex-jc:space-between">
            <input type="submit"
                onclick="-{if $srvpwset}-xajax_CheckSrvPassword(-{$user_aid}-, $('scurrent').value);-{/if}-srvdispatch();"
                name="button" class="button button-success" id="button" value="Save" />
            <input type="submit" onclick="history.go(-1)" name="button" class="button button-light" id="button"
                value="Cancel" />
        </div>
    </div>
</div>


<div class="layout_box flex:11 admin_tab_content tabcontent" id="Change Email">
    <div class="admin_tab_content_title">
        <h2><i class="fas fa-envelope"></i>更改电子邮件</h2>
    </div>

    <div class="padding">
        <div class="margin-bottom:half">
            <label class="form-label form-label:bottom">
                当前电子邮件
            </label>

            <div class="text:bold">
                -{$email}-
            </div>

            <div class="form-desc">
                这是您当前保存的电子邮件地址。
            </div>
        </div>

        <div class="margin-bottom:half">
            <label for="emailpw" class="form-label form-label:bottom">
                密码
            </label>

            <input class="form-input form-full" type="password" id="emailpw" value="" name="emailpw" />

            <div class="form-desc">
                在此输入您的密码。
            </div>

            <div id="emailpw.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="email1" class="form-label form-label:bottom">
                新电子邮件
            </label>

            <input class="form-input form-full" type="text" id="email1" value="" name="email1" />

            <div class="form-desc">
                在此输入您的新电子邮件地址。
            </div>

            <div id="email1.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="email2" class="form-label form-label:bottom">
                确认电子邮件
            </label>

            <input type="text" class="form-input form-full" id="email2" name="email2" />

            <div class="form-desc">
                请再次输入您的新电子邮件地址，以免出错。
            </div>

            <div id="email2.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="flex flex-ai:center flex-jc:space-between">
            <input type="submit" onclick="checkmail();" name="button" class="button button-success" id="button"
                value="Save" />
            <input type="submit" onclick="history.go(-1)" name="button" class="button button-light" id="button"
                value="Cancel" />
        </div>
    </div>
</div>

<script>
    let error = 0;

    const set_error = (count) => {
        error = count;
    }

    const checkYourAcctPass = () => {
        let err = 0;

        if($('pass1').value.length < -{$min_pass_len}-)
        {
            $('pass1.msg').setStyle('display', 'block');
            $('pass1.msg').setHTML('Your password must be atleast -{$min_pass_len}- letters long');
            err++;
        } else {
            $('pass1.msg').setStyle('display', 'none');
        }
        if ($('pass2').value != "" && $('pass2').value != $('pass1').value) {
            $('pass2.msg').setStyle('display', 'block');
            $('pass2.msg').setHTML('Your passwords dont match');
            err++;
        } else {
            $('pass2.msg').setStyle('display', 'none');
        }
        if (err > 0) {
            set_error(1);
            return false;
        } else {
            set_error(0);
            return true;
        }
    }

    const dispatch = () => {
        if ($('current.msg').innerHTML == "Incorrect password.") {
            alert("Incorrect Password");
            return false;
        }
        if (checkYourAcctPass() && error == 0) {
            xajax_ChangePassword(-{$user_aid}-, $('pass2').value, $('current').value);
        }
    }

    const checkYourSrvPass = () => {
        if (!$('delspass') || $('delspass').checked == false) {
            var err = 0;

            if($('spass1').value.length < -{$min_pass_len}-)
            {
                $('spass1.msg').setStyle('display', 'block');
                $('spass1.msg').setHTML('Your password must be atleast -{$min_pass_len}- letters long');
                err++;
            } else {
                $('spass1.msg').setStyle('display', 'none');
            }
            if ($('spass2').value != "" && $('spass2').value != $('spass1').value) {
                $('spass2.msg').setStyle('display', 'block');
                $('spass2.msg').setHTML('Your passwords dont match');
                err++;
            } else {
                $('spass2.msg').setStyle('display', 'none');
            }
            if (err > 0) {
                set_error(1);
                return false;
            } else {
                set_error(0);
                return true;
            }
        } else {
            set_error(0);
            return true;
        }
    }

    const srvdispatch = () => {
        -{if $srvpwset}-
            if ($('scurrent.msg').innerHTML == "Incorrect password.") {
                alert("密码错误");
                return false;
            }
        -{/if}-
        if (checkYourSrvPass() && error == 0 && (!$('delspass') || $('delspass').checked == false)) {
            xajax_ChangeSrvPassword(-{$user_aid}-, $('spass2').value);
        }
        if ($('delspass').checked == true) {
            xajax_ChangeSrvPassword(-{$user_aid}-, 'NULL');
        }
    }

    const checkmail = () => {
        let err = 0;
        if ($('email1').value == "") {
            $('email1.msg').setStyle('display', 'block');
            $('email1.msg').setHTML('请重新输入新邮箱.');
            err++;
        } else {
            $('email1.msg').setStyle('display', 'none');
        }

        if ($('email2').value == "") {
            $('email2.msg').setStyle('display', 'block');
            $('email2.msg').setHTML('请重新输入新邮箱.');
            err++;
        } else {
            $('email2.msg').setStyle('display', 'none');
        }

        if (err == 0 && $('email2').value != $('email1').value) {
            $('email2.msg').setStyle('display', 'block');
            $('email2.msg').setHTML('邮箱不匹配');
            err++;
        }

        if ($('emailpw').value == "") {
            $('emailpw.msg').setStyle('display', 'block');
            $('emailpw.msg').setHTML('请输入密码');
            err++;
        } else {
            $('emailpw.msg').setStyle('display', 'none');
        }

        if (err > 0) {
            set_error(1);
            return false;
        } else {
            set_error(0);
        }
        if (error == 0) {
            xajax_ChangeEmail(-{$user_aid}-, $('email2').value, $('emailpw').value);
        }
    }
</script>