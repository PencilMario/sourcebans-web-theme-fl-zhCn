<div class="flex flex-jc:center flex-ai:center">
    <div class="layout_box layout_box_medium">
        <div class="layout_box_title">
            <h2><i class="fas fa-flag-checkered"></i>提交举报</h2>
        </div>

        <div class="padding">
            <div>
                为了保证我们的服务器顺利运行，违反我们规则的人应该受到惩罚，而我们不可能总是随叫随到提供帮助。
            </div>
            <div>
                在提交玩家报告时，我们要求您尽可能详细地填写报告，以帮助封禁违规者，这将有助于我们快速处理您的报告。
            </div>

            <div class="margin-top:half margin-bottom">
                如果您不确定如何在游戏内记录证据，请点击
                <a href="javascript:void(0)"
                onclick="ShowBox('如何记录证据', '记录违反规则的玩家的证据的最佳方法是使用Shadow Play或Plays.TV。这两款软件都会全天候记录你的游戏，对你的游戏几乎没有影响，你只需要按下一个键绑定就可以录制最近的几分钟游戏，这非常适合抓住违规者。<br /><br />或者，你也可以使用旧方法使用demos进行记录。当你在旁观违规玩家时，按下键盘上的 ` 键以显示开发者控制台。如果没有显示，你需要进入游戏设置并启用它。然后输入 `record [demoname]` 并按回车，文件将会位于游戏文件夹中。', 'blue', '', true);">点击此处 </a>查看说明。
            </div>

            <form action="index.php?p=submit" method="post" enctype="multipart/form-data">
                <input type="hidden" name="subban" value="1">

                <div class="margin-bottom:half">
                    <label for="Type" class="form-label form-label:bottom">
                        封禁类型
                    </label>
                    <select id="Type" name="Type" class="form-select form-full"
                        onChange="changeType(this[this.selectedIndex].value);">
                        <option value="0">Steam ID</option>
                        <option value="1">IP 地址</option>
                    </select>
                </div>

                <div class="margin-bottom:half">
                    <label for="SteamID" class="form-label form-label:bottom">
                        玩家Steam ID
                    </label>
                    <input type="text" id="SteamID" name="SteamID" size="40" maxlength="64" value="{$STEAMID}"
                        class="form-input form-full" />
                </div>

                <div class="margin-bottom:half">
                    <label for="BanIP" class="form-label form-label:bottom">
                        玩家 IP
                    </label>
                    <input type="text" id="BanIP" name="BanIP" size="40" maxlength="64" value="{$ban_ip}"
                        class="form-input form-full" />
                </div>

                <div class="margin-bottom:half">
                    <label for="PlayerName" class="form-label form-label:bottom">
                        玩家昵称<span class="mandatory">*</span>
                    </label>
                    <input type="text" id="PlayerName" size="40" maxlength="70" name="PlayerName" value="{$player_name}"
                        class="form-input form-full" />
                </div>

                <div class="margin-bottom:half">
                    <label for="BanReason" class="form-label form-label:bottom">
                        留言<span class="mandatory">*</span>（请写下有用的描述性留言。请不要写诸如"这是挂钩"之类的留言）
                    </label>
                    <textarea id="BanReason" name="BanReason" class="form-text form-full">{$ban_reason}</textarea>
                </div>

                <div class="margin-bottom:half">
                    <label for="SubmitName" class="form-label form-label:bottom">
                        您的姓名
                    </label>
                    <input type="text" id="SubmitName" size="40" maxlength="70" name="SubmitName"
                        value="{$subplayer_name}" class="form-input form-full" />
                </div>

                <div class="margin-bottom:half">
                    <label for="EmailAddr" class="form-label form-label:bottom">
                        您的电子邮件<span class="mandatory">*</span>
                    </label>
                    <input type="text" id="EmailAddr" size="40" maxlength="70" name="EmailAddr" value="{$player_email}"
                        class="form-input form-full" />
                </div>

                <div class="margin-bottom:half">
                    <label for="server" class="form-label form-label:bottom">
                        服务器<span class="mandatory">*</span>
                    </label>
                    <select id="server" name="server" class="form-select form-full">
                        <option value="-1">-- 选择服务器</option>
                        {foreach from=$server_list item="server"}
                            <option value="{$server.sid}" {if $server_selected==$server.sid}selected{/if}>
                                {$server.hostname}</option>
                        {/foreach}
                        <option value="0">其他服务器 / 未在此列出</option>
                    </select>
                </div>

                <div class="margin-bottom:half">
                    <label for="demo_file" class="form-label form-label:bottom">
                        上传演示
                    </label>

                    <input name="demo_file" id="demo_file" type="file" size="25" class="form-file form-full" />
                    <div class="form-desc">
                        注意：只允许使用 DEM、ZIP、RAR、7Z、BZ2 或 GZ。
                    </div>
                </div>

                <div class="flex">
                    {sb_button text="Submit" class="button button-primary flex:11" id="save" submit=true}
                </div>
            </form>

            <div class="margin-top">
                <h3>如果有人被封禁，会发生什么？</h3>
                <p>
                    如果您举报的人被封禁，其 SteamID 或 IP 将被列入封禁列表中，而且每次他们尝试连接任何服务器时，都会被阻止加入，并将被记录到我们的数据库中。
                </p>
            </div>
        </div>
    </div>
</div>