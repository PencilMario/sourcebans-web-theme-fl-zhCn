<div class="admin_tab_content_title">
    <h2><i class="fas fa-cogs"></i>MOD图标详细信息</h2>
</div>

<div class="padding">
    <div class="margin-bottom">
        如需有关某一主题的更多信息或帮助，请将鼠标移至问号上。
    </div>

    <form action="" method="post">
        <input type="hidden" name="insert_type" value="add">

        <div class="margin-bottom:half">
            <label for="name" class="form-label form-label:bottom">
                MOD名称
            </label>

            <input type="hidden" id="icon_hid" name="icon_hid" value="{$mod_icon}">
            <input type="text" TABINDEX=1 class="form-input form-full" id="name" name="name" value="{$name}" />

            <div class="form-desc">
                键入要添加的MOD名称。
            </div>

            <div id="name.msg" class="message message:error margin-top:half" style="display: none;"></div>
        </div>

        <div class="margin-bottom:half">
            <label for="folder" class="form-label form-label:bottom">
                MOD文件夹
            </label>

            <input type="text" TABINDEX=2 class="form-input form-full" id="folder" name="folder" value="{$folder}" />

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
                value="{$steam_universe}" />

            <div class="form-desc">
                (STEAM_<span class="text:bold">X</span>:Y:Z)有些游戏显示 steamid 的方式与其他游戏不同。键入 SteamID 中的第一个数字 (<span class="text:bold">X</span>)来让sbpp知道如何处理该MOD。（默认值：0）。
            </div>
        </div>

        <div class="margin-bottom:half">
            <input type="checkbox" TABINDEX=4 id="enabled" class="form-check" name="enabled" value="1" />

            <label for="enabled" class="form-label form-label:left">
                已启用MOD
            </label>

            <div class="form-desc">
                选择是否启用此 MOD 并将其分配给封禁和服务器。
            </div>
        </div>

        <div class="margin-bottom:half">
            <label for="enabled" class="form-label form-label:button">
                上传图标
            </label>

            {sb_button text="Upload MOD Icon" onclick="childWindow=open('pages/admin.uploadicon.php','upload','resizable=yes,width=300,height=130');" class="button button-primary" id="upload" submit=false}

            <div class="form-desc">
                单击此处上传图标，以便与此MOD关联。
            </div>

            {if $mod_icon}
                <div id="icon.msg" class="message message:info margin-top:half">
                    <span class="text:bold">已上传：</span> {$mod_icon}
                </div>
            {/if}
        </div>

        <div class="flex flex-ai:center flex-jc:space-between">
            {sb_button text="Save Changes" class="button button-success" id="editmod" submit=true}
            {sb_button text="Back" onclick="history.go(-1)" class="button button-light" id="back" submit=false}
        </div>
    </form>
</div>