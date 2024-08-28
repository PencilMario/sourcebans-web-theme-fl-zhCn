{if NOT $permission_add}
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
        <h2><i class="fas fa-plus"></i>添加模式</h2>
    </div>

    <div class="padding">
        <div class="margin-bottom">
            如需有关某一主题的更多信息或帮助，请将鼠标移至问号上。
        </div>

        <div class="margin-bottom:half">
            <label for="name" class="form-label form-label:bottom">
                MOD名称
            </label>

            <input type="hidden" id="fromsub" value="" />
            <input type="text" TABINDEX=1 class="form-input form-full" id="name" name="name" />

            <div class="form-desc">
                键入要添加的MOD名称。
            </div>

            <div id="name.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="folder" class="form-label form-label:bottom">
                修改文件夹
            </label>

            <input type="text" TABINDEX=2 class="form-input form-full" id="folder" name="folder" />

            <div class="form-desc">
                键入此 mods 文件夹的名称。例如，Counter-Strike：Source 的 mod 文件夹名为 "cstrike"。
            </div>

            <div id="folder.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="steam_universe" class="form-label form-label:bottom">
                Steam ID
            </label>

            <input type="text" TABINDEX=3 class="form-input form-full" id="steam_universe" name="steam_universe"
                value="0" />

            <div class="form-desc">
                (STEAM_<span class="text:bold">X</span>:Y:Z) 有些游戏显示 steamid 的方式与其他游戏不同。键入
                SteamID 中的第一个数字(<span class="text:bold">X</span>) 取决于该
                mod.（默认值：0）。
            </div>
        </div>

        <div class="margin-bottom:half">
            <input type="checkbox" TABINDEX=4 id="enabled" name="enabled" class="form-check" value="1" checked="checked" />

            <label for="enabled" class="form-label form-label:left">
                已启用MOD
            </label>

            <div class="form-desc">
                选择是否启用此 MOD 并将其分配给禁止和服务器。
            </div>
        </div>

        <div class="margin-bottom:half">
            <label for="upload" class="form-label form-label:button">
                上传图标
            </label>

            {sb_button text="Upload Mod Icon" onclick="childWindow=open('pages/admin.uploadicon.php','upload','resizable=yes,width=300,height=130');" class="button button-primary" id="upload"}

            <div class="form-desc">
                单击此处上传图标，以便与此模式关联。
            </div>

            <div id="icon.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="padding flex flex-ai:center flex-jc:space-between">
            {sb_button text="Add Mod" onclick="ProcessMod();" class="button button-success" id="amod"}
            {sb_button text="Back" onclick="history.go(-1)" class="button button-light" id="aback"}
        </div>
    </div>
{/if}