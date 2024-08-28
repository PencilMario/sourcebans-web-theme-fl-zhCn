{if NOT $permission_import}
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
    {if NOT $groupbanning_enabled}
        <section class="error padding">
            <i class="fas fa-exclamation-circle"></i>
            <div class="error_title">哎呀，出问题了 (╯□°)╯︵ ┻━┻</div>

            <div class="error_content">
                此功能已禁用！<br />
                拒绝访问！
            </div>

            <div class="error_code">
                错误代码：<span class="text:bold">423 锁定</span>
            </div>
        </section>
    {else}
        <div class="admin_tab_content_title">
            <h2><i class="fa-solid fa-people-group"></i>添加Steam组封禁</h2>
        </div>

        <div class="padding">
            <div class="margin-bottom">
                {if NOT $list_steam_groups}
                    <div class="margin-bottom">
                        在这里，您可以为整个 steam 社区组添加封禁。<br />
                        例如<code>http://steamcommunity.com/groups/interwavestudios</code>
                    </div>
                    <table width="90%" style="border-collapse:collapse;" id="group.details" cellpadding="3">
                        <tr>
                            <td valign="top" width="35%">
                                <div class="rowdesc">
                                    {help_icon title="Group Link" message="Type the link to a steam community group."}群组链接
                                </div>
                            </td>
                            <td>
                                <div align="left">
                                    <input type="text" TABINDEX=1 class="textbox" id="groupurl" name="groupurl" style="width: 229px" />
                                </div>
                                <div id="groupurl.msg" class="badentry"></div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" width="35%">
                                <div class="rowdesc">
                                    {help_icon title="Group Ban Reason" message="Type the reason, why you are going to ban this steam community group."}组
                                    禁止原因
                                </div>
                            </td>
                            <td>
                                <div align="left">
                                    <textarea class="textbox" TABINDEX=2 cols="30" rows="5" id="groupreason"
                                        name="groupreason" /></textarea>
                                </div>
                                <div id="groupreason.msg" class="badentry"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                {sb_button text="Add Group Ban" onclick="ProcessGroupBan();" class="ok" id="agban" submit=false}
                                &nbsp;
                                {sb_button text="Back" onclick="history.go(-1)" class="cancel" id="aback"}
                            </td>
                        </tr>
                    </table>
                    {else}
                        玩家 {$player_name} 所有加入的组已列出。<br />
                        选择要封禁的Steam组。<br /><br />
                        <div id="steamGroupsText" name="steamGroupsText">加载组...</div>
                        <div id="steamGroups" name="steamGroups" style="display:none;">
                            <table id="steamGroupsTable" name="steamGroupsTable" border="0" width="500px">
                                <tr>
                                    <td height="16" class="listtable_1" style="padding:0px;width:3px;" align="center">
                                        <div class="ok" style="height:16px;width:16px;cursor:pointer;" id="tickswitch" name="tickswitch"
                                            onclick="TickSelectAll();"></div>
                                    </td>
                                    <td height="16" class="listtable_top" align="center"><b>组别</b></td>
                                </tr>
                            </table>
                            &nbsp;&nbsp;L&nbsp;&nbsp;<a href="#" onclick="TickSelectAll();return false;" title="Select All"
                                name="tickswitchlink" id="tickswitchlink">全部选择</a><br /><br />
                            <table width="90%" style="border-collapse:collapse;" id="group.details" cellpadding="3">
                                <tr>
                                    <td valign="top" width="35%">
                                        <div class="rowdesc">
                                            {help_icon title="Group Ban Reason" message="Type the reason, why you are going to ban this steam community group."}组
                                            禁止原因
                                        </div>
                                    </td>
                                    <td>
                                        <div align="left">
                                            <textarea class="submit-fields" TABINDEX=2 cols="30" rows="5" id="groupreason"
                                                name="groupreason" /></textarea>
                                        </div>
                                        <div id="groupreason.msg" class="badentry"></div>
                                    </td>
                                </tr>
                            </table>
                            <input type="button" class="btn ok" onclick="CheckGroupBan();" name="gban" id="gban"
                                onmouseover="ButtonOver('gban');" onmouseout="ButtonOver('gban');" value="Add Group Ban">
                        </div>
                        <div id="steamGroupStatus" name="steamGroupStatus" width="100%"></div>
                        <script type="text/javascript">
                            $('tickswitch').value = 0;xajax_GetGroups('{$list_steam_groups}');
                        </script>
                {/if}
            </div>
        </div>
    {/if}
{/if}