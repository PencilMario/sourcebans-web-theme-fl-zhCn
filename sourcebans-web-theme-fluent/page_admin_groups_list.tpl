{if NOT $permission_listgroups}
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
        <h2><i class="fas fa-users"></i>组别</h2>
    </div>

    <div class="padding">
        <div>
            单击组查看其权限。
        </div>

        <h3 style="color: var(--table-permanent-text);">在线管理员组 ({$web_group_count})</h3>

        <div class="table table_box">
            <table>
                <thead>
                    <tr>
                        <th class="text:left">组名</th>
                        <th class="text:left">组内管理员</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$web_group_list item="group" name="web_group"}
                        <tr class="collapse">
                            <td style="width: 350px;">
                                {$group.name}
                            </td>

                            <td>
                                {$web_admins[$smarty.foreach.web_group.index]}
                            </td>

                            <td class="flex flex-jc:center flex-ai:center">
                                {if $permission_editgroup}
                                    <a class="button button-light margin-right:half"
                                        href="index.php?p=admin&c=groups&o=edit&type=web&id={$group.gid}">
                                        编辑
                                    </a>
                                {/if}

                                {if $permission_deletegroup}
                                    <button class="button button-important"
                                        onclick="RemoveGroup({$group.gid}, '{$group.name}', 'web');">
                                        删除
                                    </button>
                                {/if}
                            </td>
                        <tr class="table_hide">
                            <td colspan="8">
                                <div class="collapse_content">
                                    <div class="padding:half flex m:flex-fd:column">
                                        <div class="flex:11">
                                            <h4>权限</h4>

                                            <ul>
                                                {if $group.permissions}
                                                    {foreach from=$group.permissions item="permission"}
                                                        <li>{$permission}</li>
                                                    {/foreach}
                                                {else}
                                                    <li class="text:italic">无</li>
                                                {/if}
                                            </ul>
                                        </div>

                                        <div class="flex:11">
                                            <h4>成员</h4>

                                            <div class="table table_box">
                                                <table>
                                                    <tbody>
                                                        {foreach from=$web_admins_list[$smarty.foreach.web_group.index] item="web_admin"}
                                                            <tr>
                                                                <td>
                                                                    {$web_admin.user}
                                                                </td>
                                                                {if $permission_editadmin}
                                                                    <td class="flex flex-jc:center flex-ai:center">
                                                                        <a class="button button-light margin-right:half"
                                                                            href="index.php?p=admin&c=admins&o=editgroup&id={$web_admin.aid}"
                                                                            title="Edit Groups">
                                                                            编辑
                                                                        </a>

                                                                        <a class="button button-infos"
                                                                            href="index.php?p=admin&c=admins&o=editgroup&id={$web_admin.aid}&wg="
                                                                            title="Remove From Group">
                                                                            移除
                                                                        </a>
                                                                    </td>
                                                                {/if}
                                                            </tr>
                                                        {/foreach}
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
        	<h3 style="color: var(--table-unbanned-text);">服务器管理组 ({$server_admin_group_count})</h3>

        <div class="table table_box">
            <table>
                <thead>
                    <tr>
                        <th class="text:left">组名</th>
                        <th class="text:left">组内管理员</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$server_group_list item="group" name="server_admin_group"}
                        <tr class="collapse">
                            <td style="width: 350px;">
                                {$group.name}
                            </td>

                            <td>
                                {$server_admins[$smarty.foreach.server_admin_group.index]}
                            </td>

                            <td class="flex flex-jc:center flex-ai:center">
                                {if $permission_editgroup}
                                    <a class="button button-light margin-right:half"
                                        href="index.php?p=admin&c=groups&o=edit&type=srv&id={$group.id}">
                                        编辑
                                    </a>
                                {/if}

                                {if $permission_deletegroup}
                                    <button class="button button-important" onclick="RemoveGroup({$group.id}, '{$group.name}', 'srv');">
                                        删除
                                    </button>
                                {/if}
                            </td>
                        <tr class="table_hide">
                            <td colspan="8">
                                <div class="collapse_content">
                                    <div class="padding:half flex m:flex-fd:column">
                                        <div class="flex:11">
                                            <h4>权限</h4>

                                            <ul>
                                                {if $group.permissions}
                                                    {foreach from=$group.permissions item="permission"}
                                                        <li>{$permission}</li>
                                                    {/foreach}
                                                {else}
                                                    <li class="text:italic">无</li>
                                                {/if}
                                            </ul>
                                        </div>

                                        <div class="flex:11">
                                            <h4>成员</h4>

                                            <div class="table table_box">
                                                <table>
                                                    <tbody>
                                                        {foreach from=$server_admins_list[$smarty.foreach.server_admin_group.index] item="server_admin"}
                                                            <tr>
                                                                <td>
                                                                    {$server_admin.user}
                                                                </td>
                                                                {if $permission_editadmin}
                                                                    <td class="flex flex-jc:center flex-ai:center">
                                                                        <a class="button button-light margin-right:half"
                                                                            href="index.php?p=admin&c=admins&o=editgroup&id={$server_admin.aid}"
                                                                            title="Edit Groups">
                                                                            编辑
                                                                        </a>

                                                                        <a class="button button-important"
                                                                            href="index.php?p=admin&c=admins&o=editgroup&id={$server_admin.aid}&sg="
                                                                            title="Remove From Group">
                                                                            移除
                                                                        </a>
                                                                    </td>
                                                                {/if}
                                                            </tr>
                                                        {/foreach}
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    {if $server_overrides_list[$smarty.foreach.server_admin_group.index]}
                                        <div class="table table_box padding:half">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th class="text:left">类型</th>
                                                        <th class="text:left">名称</th>
                                                        <th class="text:left">权限</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {foreach from=$server_overrides_list[$smarty.foreach.server_admin_group.index] item="override"}
                                                        <tr>
                                                            <td>{$override.type}</td>
                                                            <td>{$override.name|smarty_htmlspecialchars}</td>
                                                            <td>{$override.access}</td>
                                                        </tr>
                                                    {/foreach}
                                                </tbody>
                                            </table>
                                        </div>
                                    {/if}
                                </div>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>

        <h3>服务器组 ({$server_group_count})</h3>

        <div class="table table_box">
            <table>
                <thead>
                    <tr>
                        <th class="text:left">组名</th>
                        <th class="text:left">组内服务器</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$server_list item="group" name="server_group"}
                        <tr class="collapse">
                            <td style="width: 350px;">
                                {$group.name}
                            </td>

                            <td>
                                {$server_counts[$smarty.foreach.server_group.index]}
                            </td>

                            <td class="flex flex-jc:center flex-ai:center">
                                {if $permission_editgroup}
                                    <a class="button button-light margin-right:half"
                                        href="index.php?p=admin&c=groups&o=edit&type=server&id={$group.gid}">
                                        编辑
                                    </a>
                                {/if}

                                {if $permission_deletegroup}
                                    <button class="button button-important"
                                        onclick="RemoveGroup({$group.gid}, '{$group.name}', 'server');">
                                        删除
                                    </button>
                                {/if}
                            </td>
                        <tr class="table_hide">
                            <td colspan="8">
                                <div class="collapse_content">
                                    <div class="padding">
                                        <h3>该组中的服务器</h3>

                                        <ul>
                                            <li id="servers_{$group.gid}">请稍候！</li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>
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