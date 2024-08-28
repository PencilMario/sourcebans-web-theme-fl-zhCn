<div class="layout_box flex:11 admin_tab_content tabcontent" id="Add new server">
    {if not $permission_addserver}
        拒绝访问
    {else}
        <div class="admin_tab_content_title">
            <h2><i class="fas fa-plus"></i>服务器详细信息</h2>
        </div>

        <div class="padding">
            <div class="margin-bottom">
                如需有关某一主题的更多信息或帮助，请将鼠标移至问号上。
            </div>

            <input type="hidden" name="insert_type" value="add">
            <div class="margin-bottom:half">
                <label for="address" class="form-label form-label:bottom">
                    服务器 IP/域名
                </label>
                <input type="text" TABINDEX=1 class="form-input form-full" id="address" name="address" value="{$ip}" />
                <div id="address.msg" class="message message:error margin-top:half" style="display: none;"></div>
            </div>

            <div class="margin-bottom:half">
                <label for="port" class="form-label form-label:bottom">
                    服务器端口
                </label>
                <input type="text" TABINDEX=2 class="form-input form-full" id="port" name="port"
                    value="{if $port}{$port}{else}27015{/if}" />
                <div id="port.msg" class="message message:error margin-top:half" style="display: none;"></div>
            </div>

            <div class="margin-bottom:half">
                <label for="rcon" class="form-label form-label:bottom">
                    RCON 密码
                </label>
                <input type="password" TABINDEX=3 class="form-input form-full" id="rcon" name="rcon" value="{$rcon}" />
                <div id="rcon.msg" class="message message:error margin-top:half" style="display: none;"></div>
            </div>

            <div class="margin-bottom:half">
                <label for="rcon2" class="form-label form-label:bottom">
                    RCON 密码（确认）
                </label>
                <input type="password" TABINDEX=4 class="form-input form-full" id="rcon2" name="rcon2" value="{$rcon}" />
                <div id="rcon2.msg" class="message message:error margin-top:half" style="display: none;"></div>
            </div>

            <div class="margin-bottom:half">
                <label for="mod" class="form-label form-label:bottom">
                    服务器MOD
                </label>

                <select name="mod" TABINDEX=5 onchange="" id="mod" class="form-select form-full">
                    {if !$edit_server}
                        <option value="-2">请选择...</option>
                    {/if}
                    {foreach from=$modlist item="mod"}
                        <option value='{$mod.mid}'>{$mod.name}</option>
                    {/foreach}
                </select>

                <div id="mod.msg" class="message message:error margin-top:half" style="display: none;"></div>
            </div>

            <div class="margin-bottom:half">
                <label for="enabled" class="form-label form-label:bottom">
                    启用
                </label>
                <input type="checkbox" id="enabled" class="form-check" name="enabled" checked="checked" />
                <div id="enabled.msg" class="message message:error margin-top:half" style="display: none;"></div>
            </div>

            {if $grouplist}
                <div class="margin-bottom:half">
                    <label class="form-label form-label:bottom">
                        服务器组
                    </label>

                    <ul class="form_ul margin-top">
                        {foreach from=$grouplist item="group"}
                            <li class="margin-bottom:half">
                                <input type="checkbox" class="form-check" value="{$group.gid}" id="g_{$group.gid}"
                                    name="groups[]" />
                                <label for="g_{$group.gid}" class="form-label form-label:right">
                                    {$group.name}
                                </label>
                            </li>
                        {/foreach}
                    </ul>
                    <div id="nsgroup" class="message message:error margin-top:half" style="display: none;"></div>
                </div>
            {/if}

            <div class="flex flex-ai:center flex-jc:space-between margin-top">
                {if $edit_server}
                    {sb_button text=$submit_text onclick="process_edit_server();" class="button button-success" id="aserver" submit=false}
                {else}
                    {sb_button text=$submit_text onclick="process_add_server();" class="button button-success" id="aserver" submit=false}
                {/if}

                {sb_button text="Back" onclick="history.go(-1)" class="button button-light" id="back" submit=false}
            </div>
        </div>
    {/if}
</div>
</div>