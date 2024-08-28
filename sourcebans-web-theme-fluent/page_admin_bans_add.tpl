{if NOT $permission_addban}
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
{else}
    <div class="admin_tab_content_title">
        <h2><i class="fas fa-user-times"></i>添加封禁</h2>
    </div>

    <div class="padding">
        <div class="margin-bottom">
            如需有关某一主题的更多信息或帮助，请将鼠标移至问号上。
        </div>

        <div class="margin-bottom:half">
            <label for="nickname" class="form-label form-label:bottom">
                昵称
            </label>

            <input type="hidden" id="fromsub" value="" />
            <input type="text" TABINDEX=1 class="form-input form-full" id="nickname" name="nickname" />

            <div id="nick.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="type" class="form-label form-label:bottom">
                封禁类型
            </label>

            <select id="type" name="type" TABINDEX=2 class="form-select form-full">
                <option value="0">Steam ID</option>
                <option value="1">IP 地址</option>
            </select>
        </div>

        <div class="margin-bottom:half">
            <label for="steam" class="form-label form-label:bottom">
                Steam ID / Steam 社区 ID
            </label>

            <input type="text" TABINDEX=3 class="form-input form-full" id="steam" name="steam" />

            <div id="steam.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="ip" class="form-label form-label:bottom">
                IP 地址
            </label>

            <input type="text" TABINDEX=3 class="form-input form-full" id="ip" name="ip" />

            <div id="ip.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="listReason" class="form-label form-label:bottom">
                封禁理由
            </label>

            <select id="listReason" name="listReason" TABINDEX=4 class="form-select form-full"
                onChange="changeReason(this[this.selectedIndex].value);">
                <option value="" selected>-- 选择原因 --</option>
                <optgroup label="Hacking">
                    <option value="Aimbot">自瞄</option>
                    <option value="Antirecoil">无后座</option>
                    <option value="Wallhack">透视</option>
                    <option value="Spinhack">高亮</option>
                    <option value="Multi-Hack">多项作弊</option>
                    <option value="No Smoke">无烟</option>
                    <option value="No Flash">无闪</option>
                </optgroup>
                <optgroup label="Behavior">
                    <option value="Team Killing">恶意TK</option>
                    <option value="Team Flashing">恶意闪光</option>
                    <option value="Spamming Mic/Chat">滥用麦克风/聊天</option>
                    <option value="Inappropriate Spray">不适当的喷漆</option>
                    <option value="Inappropriate Language">不当语言</option>
                    <option value="Inappropriate Name">不恰当的名称</option>
                    <option value="Ignoring Admins">无视管理员</option>
                    <option value="Team Stacking">恶意炸鱼</option>
                </optgroup>
                {if $customreason}
                    <optgroup label="Custom">
                        {foreach from=$customreason item="creason"}
                            <option value="{$creason}">{$creason}</option>
                        {/foreach}
                    </optgroup>
                {/if}
                <option value="other">其他原因</option>
            </select>

            <div id="dreason" class="margin-top:half" style="display:none;">
                <textarea class="form-text" TABINDEX=4 cols="30" rows="5" id="txtReason" name="txtReason"></textarea>
            </div>

            <div id="reason.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="banlength" class="form-label form-label:bottom">
                封禁时长
            </label>

            <select id="banlength" TABINDEX=5 class="form-select form-full">
                <option value="0">永久</option>
                <optgroup label="minutes">
                    <option value="1">1 分钟</option>
                    <option value="5">5 分钟</option>
                    <option value="10">10 分钟</option>
                    <option value="15">15 分钟</option>
                    <option value="30">30 分钟</option>
                    <option value="45">45 分钟</option>
                </optgroup>
                <optgroup label="hours">
                    <option value="60">1 小时</option>
                    <option value="120">2 小时</option>
                    <option value="180">3 小时</option>
                    <option value="240">4 小时</option>
                    <option value="480">8 小时</option>
                    <option value="720">12 小时</option>
                </optgroup>
                <optgroup label="days">
                    <option value="1440">1 天</option>
                    <option value="2880">2 天</option>
                    <option value="4320">3 天</option>
                    <option value="5760">4 天</option>
                    <option value="7200">5 天</option>
                    <option value="8640">6 天</option>
                </optgroup>
                <optgroup label="weeks">
                    <option value="10080">1 周</option>
                    <option value="20160">2 周</option>
                    <option value="30240">3 周</option>
                </optgroup>
                <optgroup label="months">
                    <option value="43200">1 个月</option>
                    <option value="86400">2 个月</option>
                    <option value="129600">3 个月</option>
                    <option value="259200">6 个月</option>
                    <option value="518400">12 个月</option>
                </optgroup>
            </select>

            <div id="length.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="udemo" class="form-label form-label:bottom">
                上传 Demo
            </label>

            {sb_button text="Upload a demo" onclick="childWindow=open('pages/admin.uploaddemo.php','upload','resizable=no,width=300,height=130');" class="button button-primary" id="udemo" submit=false}

            <div id="demo.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="flex flex-ai:center flex-jc:space-between margin-top">
            {sb_button text="Add Ban" onclick="ProcessBan();" class="button button-success" id="aban" submit=false}
            {sb_button text="Back" onclick="history.go(-1)" class="button button-light" id="aback"}
        </div>
    </div>
{/if}