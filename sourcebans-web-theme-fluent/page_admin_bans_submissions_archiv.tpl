{if NOT $permission_protests}
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
        <h2><i class="fas fa-archive"></i>举报存档 (<span id="subcountarchiv">{$submission_count_archiv}</span>)</h2>
    </div>

    <div class="padding">
        <div class="margin-bottom">
            点击玩家昵称可查看其提交的信息。
        </div>

        <div class="pagination">
            <span>{$asubmission_nav}</span>
        </div>

        <div class="table table_box">
            <table>
                <thead>
                    <tr>
                        <th class="text:left">昵称</th>
                        <th class="text:left">Steam ID</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$submission_list_archiv item="sub"}
                        <tr class="collapse"
                            {if $sub.hostname == ""}onclick="xajax_ServerHostPlayers('{$sub.server}', 'id', 'suba{$sub.subid}');"
                            {/if}>
                            <td>
                                {$sub.name}
                            </td>
                            <td>
                                {if $sub.SteamId!=""}
                                    {$sub.SteamId}
                                {else}
                                    {$sub.sip}
                                {/if}
                            </td>
                            <td class="flex flex-jc:center flex-ai:center">
                                {if $sub.archiv != "2" and $sub.archiv != "3"}
                                    {if $permissions_editsub}
                                        <button class="button button-success margin-right:half"
                                            onclick="RemoveSubmission({$sub.subid}, '{$sub.name|smarty_stripslashes}', '2');">
                                            恢复
                                        </button>
                                    {/if}

                                    <a href="index.php?p=admin&c=bans&o=email&type=s&id={$sub.subid}" class="button button-primary margin-right:half">
                                        联系
                                    </a>

                                    <button class="button button-important margin-right:half"
                                        onclick="xajax_SetupBan({$sub.subid});">
                                        封禁
                                    </button>
                                {/if}

                                {if $permissions_editsub}
                                    <button class="button button-important margin-right:half"
                                        onclick="RemoveSubmission({$sub.subid}, '{$sub.name|smarty_stripslashes}', '0');">
                                        删除
                                    </button>
                                {/if}
                            </td>
                        </tr>

                        <tr class="table_hide">
                            <td colspan="3">
                                <div class="collapse_content">
                                    <div class="cMessage cMessage_warning margin" style="font-weight: bold">
                                        <p style="text-align:center">
                                            <i class="fas fa-info-circle"></i>这{$sub.archive}由
                                                {if empty($sub.archivedby)}
                                                    <span class="text:italic">管理员已删除</span>
                                                {else}
                                                    <span>{$sub.archivedby}</span>
                                                {/if}
                                        </p>
                                    </div>
                                    <div class="padding flex flex-jc:start">
                                        <ul class="ban_action">
                                            <li class="button button-light">
                                                {$sub.demo}
                                            </li>
                                            <li class="button button-success">
                                                {$sub.subaddcomment}
                                            </li>
                                        </ul>

                                        <ul class="ban_list_detal">
                                            <li>
                                                <span><i class="fa-solid fa-user"></i>玩家</span>
                                                <span>
                                                    {$sub.name}
                                                </span>
                                            </li>

                                            <li>
                                                <span><i class="fa-solid fa-play"></i>已提交</span>
                                                <span>
                                                    {$sub.submitted}
                                                </span>
                                            </li>

                                            <li>
                                                <span><i class="fa-brands fa-steam"></i>Steam ID</span>
                                                {if $sub.SteamId == ""}
                                                    <span class="text:italic">未提供 Steam id</span>
                                                {else}
                                                    <a href="https://www.steamidfinder.com/lookup/{$sub.SteamId}" target="_blank" rel="noopener">{$sub.SteamId}</a>
                                                {/if}
                                            </li>

                                            <li>
                                                <span><i class="fa-solid fa-network-wired"></i>IP 地址</span>
                                                {if $sub.sip == ""}
                                                    <span class="text:italic">未提供 IP 地址</span>
                                                {else}
                                                    <a href="https://geoiplookup.net/geo/{$sub.sip}" target="_blank" rel="noopener">{$sub.sip}</a>
                                                {/if}
                                            </li>

                                            <li>
                                                <span><i class="fa-solid fa-server"></i>服务器</span>
                                                <div id="suba{$sub.subid}">
                                                    {if $sub.hostname == ""}
                                                        <span class="text:italic">获取主机名...</span>
                                                    {else}
                                                        <span>{$sub.hostname}</span>
                                                    {/if}
                                                </div>
                                            </li>

                                            <li>
                                                <span><i class="fa-solid fa-gamepad"></i>MOD</span>
                                                <span>{$sub.mod}</span>
                                            </li>

                                            <li>
                                                <span><i class="fa-solid fa-user"></i>提交者姓名</span>
                                                {if $sub.subname == ""}
                                                    <span class="text:italic">无姓名</span>
                                                {else}
                                                    <span>{$sub.subname}</span>
                                                {/if}
                                            </li>

                                            <li>
                                                <span><i class="fa-solid fa-network-wired"></i>提交者 IP</span>
                                                <a href="https://geoiplookup.net/geo/{$sub.ip}" target="_blank" rel="noopener">{$sub.ip}</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="ban_list_comments margin-bottom">
                                        <div class="layout_box_title">
                                            <h2><i class="fa-solid fa-pen-to-square"></i>原因</h2>
                                        </div>

                                        <div class="layout_box-child padding margin:half">
                                            <div class="ban_list_comments_header">
                                                {$sub.reason}
                                            </div>
                                        </div>
                                    </div>

                                    <div class="ban_list_comments">
                                        <div class="layout_box_title">
                                            <h2><i class="fa-regular fa-comments"></i>留言</h2>
                                        </div>

                                        {if $sub.commentdata != "None"}
                                            <ul>
                                                {foreach from=$sub.commentdata item="commenta"}
                                                    <li>
                                                        <div class="layout_box-child padding">
                                                            <div class="ban_list_comments_header">
                                                                {if !empty($commenta.comname)}
                                                                    <span class="text:bold">{$commenta.comname|escape:'html'}</span>
                                                                {else}
                                                                    <span class="text:italic">管理员已删除</span>
                                                                {/if}
                                                                <span>{$commenta.added}</span>
                                                                {if $commenta.editcomlink != ""}
                                                                    {$commenta.editcomlink} {$commenta.delcomlink}
                                                                {/if}
                                                            </div>

                                                            <div class="margin-top flex flex-fd:column">
                                                                {$commenta.commenttxt}

                                                                {if !empty($commenta.edittime)}
                                                                    <span class="margin-top:half text:italic">
                                                                        <i class="fas fa-pencil-alt"></i>
                                                                        {$commenta.editname} 最后编辑于 {$commenta.edittime}
                                                                    </span>
                                                                {/if}
                                                            </div>
                                                        </div>
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        {else}
                                            <div class="padding">
                                                {$sub.commentdata}
                                            </div>
                                        {/if}
                                    </div>

                                </div>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
        <script type="text/javascript" src="themes/{$theme}/scripts/collapse.js"></script>
        <script>
            document.querySelectorAll('.button').forEach(e => e.addEventListener('click', el => el.stopPropagation()));
        </script>
    </div>
{/if}