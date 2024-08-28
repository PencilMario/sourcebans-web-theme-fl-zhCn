<div class="admin_tab_content_title">
    <h2><i class="fas fa-cogs"></i>Sourcebans++ 功能</h2>
</div>

<div class="padding">
    <div class="margin-bottom">
        如需有关某一主题的更多信息或帮助，请将鼠标移至问号上。
    </div>

    <form action="" method="post">
        <input type="hidden" name="settingsGroup" value="features" />

        <div class="margin-bottom:half">
            <input type="checkbox" name="export_public" class="form-check" id="export_public" />

            <label for="export_public" class="form-label form-label:left">
                启用公开封禁列表
            </label>

            <div class="form-desc">
                选中此复选框可公开下载和分享整个禁言列表。
            </div>
        </div>

        <div class="margin-bottom:half">
            <input type="checkbox" name="enable_kickit" class="form-check" id="enable_kickit" />

            <label for="export_public" class="form-label form-label:left">
                启用 KickIt
            </label>

            <div class="form-desc">
                选中此复选框可在封禁时踢出玩家。
            </div>
        </div>

        <div class="margin-bottom:half">
            {if $steamapi}
                <input type="checkbox" name="enable_groupbanning" class="form-check" id="enable_groupbanning" />
            {else}
                <input type="checkbox" name="enable_groupbanning" class="form-check" id="enable_groupbanning" disabled />
            {/if}

            <label for="enable_groupbanning" class="form-label form-label:left">
                启用Steam组封禁
            </label>

            {if !$steamapi}
                <div class="message message:error margin-top:half">
                    您没有在配置中设置有效的 steamapi 密钥。
                </div>
            {/if}

            <div class="form-desc">
                如果要禁止整个Steam社区组，请选中此复选框。
            </div>

            <div id="enable_groupbanning.msg" class="message message:error margin-top:half" style="display: none;">
            </div>
        </div>

        <div class="margin-bottom:half">
            <input type="checkbox" name="enable_friendsbanning" class="form-check" id="enable_friendsbanning" />

            <label for="enable_friendsbanning" class="form-label form-label:left">
                启用好友封禁
            </label>

            <div class="form-desc">
                如果要封禁玩家的所有 steam 社区好友，请选中此复选框。
            </div>

            <div id="enable_friendsbanning.msg" class="message message:error margin-top:half" style="display: none;">
            </div>
        </div>

        <div class="margin-bottom:half">
            <input type="checkbox" name="enable_adminrehashing" class="form-check" id="enable_adminrehashing" />

            <label for="enable_adminrehashing" class="form-label form-label:left">
                启用管理员刷新
            </label>

            <div class="form-desc">
                如果要在每次更改管理员/组时刷新管理员，请选中此复选框。
            </div>

            <div id="enable_adminrehashing.msg" class="message message:error margin-top:half" style="display: none;">
            </div>
        </div>

        <div class="margin-bottom:half">
            <input type="checkbox" name="enable_steamlogin" class="form-check" id="enable_steamlogin" />

            <label for="enable_steamlogin" class="form-label form-label:left">
                启用 Steam 登录
            </label>

            <div class="form-desc">
                如果要在登录表单上启用 Steam 登录选项，请选中此复选框。
            </div>

            <div id="enable_steamlogin.msg" class="message message:error margin-top:half" style="display: none;">
            </div>
        </div>

        <div class="margin-bottom:half">
            <input type="checkbox" name="enable_publiccomments" class="form-check" id="enable_publiccomments" />

            <label for="enable_publiccomments" class="form-label form-label:left">
                启用公开留言
            </label>

            <div class="form-desc">
                如果您想让所有人都能查看管理员对封禁的留言，请选中此复选框。
            </div>

            <div id="enable_publiccomments.msg" class="message message:error margin-top:half" style="display: none;">
            </div>
        </div>

        <div class="flex flex-ai:center flex-jc:space-between">
            {sb_button text="Save Changes" class="button button-success" id="fsettings" submit=true}
            {sb_button text="Back" class="button button-light" id="fback"}
        </div>
    </form>
</div>