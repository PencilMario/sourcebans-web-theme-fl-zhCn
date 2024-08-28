<div class="flex flex-jc:center flex-ai:center">
    <div class="layout_box layout_box_medium">
        <div class="layout_box_title">
            <h2><i class="fas fa-user-clock"></i>申诉封禁</h2>
        </div>

        <div class="padding">
            <div>
                要对封禁进行申诉，您必须通过点击<a href="index.php?p=banlist"
                    class="text:bold">这里</a>查看您是否被封禁以及封禁原因。
            </div>
            <div class="margin-bottom">
                如果您确实在我们的封禁名单上，但您认为不公正或有其他情况，请填写下面的申诉格式。
            </div>

            <form action="index.php?p=protest" method="post">
                <input type="hidden" name="subprotest" value="1">

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

                <div id="steam.row" class="margin-bottom:half">
                    <label for="SteamID" class="form-label form-label:bottom">
                        您的 Steam ID<span class="mandatory">*</span>
                    </label>
                    <input type="text" id="SteamID" name="SteamID" size="40" maxlength="64" value="{$steam_id}"
                        class="form-input form-full" />
                </div>

                <div id="ip.row" class="margin-bottom:half" style="display: none;">
                    <label for="Ip" class="form-label form-label:bottom">
                        您的 IP 地址
                    </label>
                    <input type="text" id="Ip" name="IP" size="40" maxlength="64" value="{$ip}"
                        class="form-input form-full" />
                </div>

                <div class="margin-bottom:half">
                    <label for="PlayerName" class="form-label form-label:bottom">
                        名称<span class="mandatory">*</span>
                    </label>
                    <input type="text" id="PlayerName" size="40" maxlength="70" name="PlayerName" value="{$player_name}"
                        class="form-input form-full" />
                </div>

                <div class="margin-bottom:half">
                    <label for="BanReason" class="form-label form-label:bottom">
                        解禁理由<span class="mandatory">*</span>：（尽可能描述）
                    </label>
                    <textarea id="BanReason" name="BanReason" cols="30" rows="5"
                        class="form-text form-full input">{$reason}</textarea>
                </div>

                <div class="margin-bottom:half">
                    <label for="EmailAddr" class="form-label form-label:bottom">
                        您的电子邮件<span class="mandatory">*</span>
                    </label>
                    <input type="text" id="EmailAddr" size="40" maxlength="70" name="EmailAddr" value="{$player_email}"
                        class="form-input form-full" />
                </div>

                <div class="flex">
                    {sb_button text="Submit" class="button button-primary flex:11" id="alogin" submit=true}
                </div>
            </form>

            <div class="margin-top">
                <h3>发布申诉后会发生什么？</h3>
                <p>
                    工作人员团队将收到您的申诉通知。然后，他们将审查封禁是否确凿。审核后，您将收到回复，通常是在 24 小时内。
                </p>

                <h3>请注意：</h3>
                <p>
                    向我们的管理员发送威胁邮件、辱骂或大喊大叫都不会使您解除封禁，而且您将被永久禁止使用我们的任何服务。
                </p>
            </div>
        </div>
    </div>
</div>