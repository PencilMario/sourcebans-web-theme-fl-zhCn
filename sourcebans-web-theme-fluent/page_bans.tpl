{if $comment}
  <div class="flex flex-jc:center flex-ai:center">
    <div class="layout_box layout_box_medium">
      <div class="layout_box_title">
        <h2><i class="fa-solid fa-comment"></i> {$commenttype}留言</h2>
      </div>

      <div class="padding">
        <textarea class="form-text" id="commenttext" name="commenttext" {if !$canedit}disabled{/if}>{$commenttext}</textarea>

        <div id="commenttext.msg" class="message message:error" style="display:none;"></div>

        <div class="margin-top:half flex flex-jc:space-between flex-ai:center">
          <input type="hidden" name="bid" id="bid" value="{$comment}">
          <input type="hidden" name="ctype" id="ctype" value="{$ctype}">

          {if $cid != ""}
            <input type="hidden" name="cid" id="cid" value="{$cid}">
          {else}
            <input type="hidden" name="cid" id="cid" value="-1">
          {/if}

          <input type="hidden" name="page" id="page" value="{$page}">

		{if $canedit}
		  <a class="button button-important" onclick="history.go(-1)">取消</a>
          <a class="button button-success" onclick="ProcessComment();">添加</a>
		{/if}
        </div>
        {foreach from=$othercomments item="com"}
            <div class="flex flex-jc:center flex-ai:center">
                <div class="layout_box layout_box_medium padding">
                    <hr>
                <div>
                    <span class=left><b>{$com.comname}</b></span>
                    <span class=right><b>{$com.added}</b></span> 	
                </div>
                    {$com.commenttxt}
                    {if $com.editname != ''}<br /><br /><i>{$com.editname}最后编辑于{$com.edittime}</i>{/if}
                </div>
            </div>
        {/foreach}
      </div>
    </div>
  </div>
{else}
{load_template file="admin.bans.search"}

<div class="layout_box margin-bottom padding:half flex flex-jc:space-between flex-ai:center m:flex-fd:column">
    <span>
        <a href="index.php?p=banlist&hideinactive={if $hidetext == 'Hide'}true{else}false{/if}{$searchlink|smarty_htmlspecialchars}" title="{$hidetext} inactive">{$hidetext}隐藏解封</a> | <i>累计封禁：{$total_bans} </i>
    </span>
        <div class="pagination">
            <span>{$ban_nav}</span>
        </div>
</div>

<div class="layout_box">
    <div class="table padding">
        <div class="table_box">
            <table>
                <thead>
                    <tr>
                        {if $view_bans}
                            <th class="text:left">
                                <input type="checkbox" title="Select All" name="tickswitch" id="tickswitch" onclick="TickSelectAll()" class="form-check" />
                            </th>
                        {/if}
                        <th>模式/国家</th>
                        <th class="text:left">日期</th>
                        <th class="text:left">玩家</th>
                        {if !$hideadminname}
                            <th class="text:left">管理员</th>
                        {/if}
                        <th class="text:left">时长</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$ban_list item="ban" name="banlist"}
                        <tr class="collapse" {if $ban.server_id != 0}
						onclick="xajax_ServerHostPlayers({$ban.server_id}, 'id', 'host_{$ban.ban_id}');"
						{/if}
						>
                            {if $view_bans}
                                <td>
                                    <input type="checkbox" name="chkb_{$smarty.foreach.banlist.index}" id="chkb_{$smarty.foreach.banlist.index}" class="form-check" value="{$ban.ban_id}">
                                </td>
                            {/if}
                            <td class="text:center">{$ban.mod_icon}</td>
                            <td>{$ban.ban_date}</td>
                                {if empty($ban.player)}
                                    <td class="text:italic">无昵称</td>
                                {else}
                                    <td>
	    			  	                {if $view_comments && $ban.commentdata != "None" && $ban.commentdata|@count > 0}
                                            <div style="float:right;">
                                                {$ban.commentdata|@count} <i class="fas fa-clipboard-list fa-lg"></i>
                                            </div>
                                        {/if}
                                        {if $ban.demo_available}
                                            <i class="fas fa-video fa-lg"></i>
                                        {/if}
                                        {$ban.player|escape:'html'|smarty_stripslashes}
                                    </td>
                                {/if}
                                {if !$hideadminname}
                                    {if !empty($ban.admin)}
                                        <td>{$ban.admin|escape:'html'}</td>
                                    {else}
                                        <td class="text:italic">管理员已删除</td>
                                    {/if}
                                {/if}
                            <td class="{$ban.class}">{$ban.banlength}</td>
                        </tr>
                                <tr class="table_hide">
                                    <td colspan="8">
                                        <div class="collapse_content">
                                            <div class="padding flex flex-jc:start" style="overflow: auto;">
                                                <ul class="ban_action responsive_show:desktop">
                                                        <li class="button button-light">{$ban.demo_link}</li>
                                                    {if !$login}
                                                        <li>
                                                            <a class="button button-success" href='index.php?p=login'>管理员登录</a>
                                                        </li>
													{elseif $view_bans}
                                                        {if ($ban.view_edit && !$ban.unbanned)}
                                                            <li class="button button-primary">{$ban.edit_link}</li>
                                                        {/if}
                                                        <li class="button button-success">{$ban.addcomment}</li>
                                                        <li class="button button-infos">{$ban.blockcomm_link}</li>
                                                        {if ($ban.unbanned == false && $ban.view_unban)}
                                                            <li class="button button-important">{$ban.unban_link}</li>
                                                        {/if}
                                                        {if $ban.unbanned && $ban.reban_link != false}
                                                            <li class="button button-important">{$ban.reban_link}</li>
                                                        {/if}
                                                        {if $ban.type == 0}
                                                            {if $groupban}
                                                                <li class="button button-important">{$ban.groups_link}</li>
                                                            {/if}
                                                            {if $friendsban}
                                                                <li class="button button-important">{$ban.friend_ban_link}</li>
                                                            {/if}
                                                        {/if}
                                                        {if $ban.view_delete}
                                                            <li class="button button-important">{$ban.delete_link}</li>
                                                        {/if}
                                                    {/if}
                                                </ul>
                                                <ul class="ban_list_detal">
                                                    <ul class="ban_action responsive_hide:desktop lists-mobile">
                                                        {if $view_bans}
                                                            {if ($ban.view_edit && !$ban.unbanned)}
                                                                <li class="button button-primary lists-mobile">{$ban.edit_link}</li>
                                                            {/if}
                                                            <li class="button button-success lists-mobile">{$ban.addcomment}</li>
                                                            <li class="button button-infos lists-mobile">{$ban.blockcomm_link}</li>
                                                            {if ($ban.unbanned == false && $ban.view_unban)}
                                                                <li class="button button-important lists-mobile">{$ban.unban_link}</li>
                                                            {/if}
                                                            {if $ban.unbanned && $ban.reban_link != false}
                                                                <li class="button button-important lists-mobile">{$ban.reban_link}</li>
                                                            {/if}
                                                            {if $ban.type == 0}
                                                                {if $groupban}
                                                                    <li class="button button-important lists-mobile">{$ban.groups_link}</li>
                                                                {/if}
                                                                {if $friendsban}
                                                                    <li class="button button-important lists-mobile">{$ban.friend_ban_link}</li>
                                                                {/if}
                                                            {/if}
                                                            {if $ban.view_delete}
                                                                <li class="button button-important lists-mobile">{$ban.delete_link}</li>
                                                            {/if}
                                                        {/if}
                                                    </ul>
                                                    <li>
                                                        <span><i class="fas fa-user"></i>玩家</span>
                                                            {if empty($ban.player)}
                                                            <span class="text:italic">无昵称</span>
                                                        {else}
                                                            <span>{$ban.player|escape:'html'|smarty_stripslashes}</span>
                                                        {/if}
                                                    </li>
                                                    <li>
                                                        <span><i class="fab fa-steam-symbol"></i>Steam ID</span>
                                                        {if empty($ban.steamid)}
                                                            <span class="text:italic">没有 Steam ID</span>
                                                        {else}
                                                            <span>{$ban.steamid}</span>
                                                        {/if}
                                                    </li>
                                                <li>
                                                        <span><i class="fab fa-steam-symbol"></i>Steam3 ID</span>
                                                        {if empty($ban.steamid)}
                                                            <span class="text:italic">没有 Steam3 ID</span>
                                                        {else}
                                                            <span>
                                                                <a href="http://steamcommunity.com/profiles/{$ban.steamid3}" target="_blank" rel="noopener">{$ban.steamid3}</a>
                                                            </span>
                                                        {/if}
                                                    </li>
                                                    {if $ban.type == 0}
                                                        <li>
                                                            <span><i class="fab fa-steam-symbol"></i>Steam社区</span>
                                                            {if empty($ban.steamid)}
                                                                <span class="text:italic">没有 Steam 社区 ID</span>
                                                            {else}
                                                                <span>
                                                                    <a href="http://steamcommunity.com/profiles/{$ban.communityid}" target="_blank" rel="noopener">{$ban.communityid}</a>
                                                                </span>
                                                            {/if}
                                                        </li>
                                                    {/if}
                                                    {if !$hideplayerips}
                                                        <li>
                                                            <span><i class="fas fa-network-wired"></i>IP 地址</span>
                                                            {if $ban.ip == "none"}
                                                                <span class="text:italic">没有 IP 地址</span>
                                                            {else}
                                                                <span>{$ban.ip}</span>
                                                            {/if}
                                                        </li>
                                                    {/if}
                                                        <li>
                                                            <span><i class="fas fa-play"></i>添加时间</span>
                                                            <span>{$ban.ban_date}</span>
                                                        </li>
                                                        <li>
                                                            <span><i class="fas fa-hourglass-half"></i>封禁时长</span>
                                                            <span>{$ban.banlength}</span>
                                                        </li>
                                                    {if $ban.unbanned}
                                                        <li>
                                                            <span><i class="fas fa-user-shield"></i>解禁原因</span>
                                                            {if $ban.ureason == ""}
                                                                <span class="text:italic">未提供</span>
                                                            {else}
                                                                <span>{$ban.ureason}</span>
                                                            {/if}
                                                        </li>
                                                        <li>
                                                            <span><i class="fas fa-user-shield"></i>被管理员解禁</span>
                                                            {if empty($ban.removedby)}
                                                                <span class="text:italic">管理员已删除</span>
                                                            {else}
                                                                <span>{$ban.removedby|escape:'html'}</span>
                                                            {/if}
                                                        </li>
                                                    {/if}
                                                    <li>
                                                        <span><i class="fas fa-clock"></i>结束时间</span>
                                                        {if $ban.expires == "never"}
                                                            <span class="text:italic">不适用</span>
                                                        {else}
                                                            <span>{$ban.expires}</span>
                                                        {/if}
                                                    </li>
                                                    <li>
                                                        <span><i class="fas fa-question"></i>原因</span>
                                                        <span>{$ban.reason|escape:'html'}</span>
                                                    </li>
                                                    {if !$hideadminname}
                                                        <li>
                                                            <span><i class="fas fa-ban"></i>被管理员禁言</span>
                                                            {if !empty($ban.admin)}
                                                                <span>{$ban.admin|escape:'html'}</span>
                                                            {else}
                                                                <span class="text:italic">管理员已删除</span>
                                                            {/if}
                                                        </li>
                                                    {/if}
                                                    <li>
                                                        <span><i class="fas fa-ban"></i>封禁总数</span>
                                                        <span>{$ban.prevoff_link}</span>
                                                    </li>
			    		                            <li>
                                                        <span><i class="fas fa-server"></i>禁止于</span>
                                                            <span {if $ban.server_id != 0} id="host_{$ban.ban_id}"{/if}>
                                                                {if $ban.server_id == 0}
                                                                在线封禁
                                                                {else}
                                                                请稍候...
                                                                {/if}
                                                            </span>
                                                    </li>
                                                    <li>
                                                        <span><i class="fas fa-ban"></i>阻止连接 ({$ban.blockcount})</span>
                                                        {if $ban.banlog == ""}
                                                            <span class="text:italic">未阻止过</span>
                                                        {else}
                                                            <i>{$ban.banlog}</i>
                                                        {/if}
                                                    </li>
                                                </ul>
                                                {if $view_comments}
                                                    <ul class="ban_list_comments margin-left responsive_show:desktop">
                                                        <div class="layout_box_title">
                                                            <h2><i class="fa-solid fa-comments"></i>留言</h2>
                                                        </div>
                                                        {if $ban.commentdata != "None"}
                                                            <ul>
                                                                {foreach from=$ban.commentdata item="commenta"}
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
                                                                                        <i class="fas fa-pencil-alt"></i>最后编辑
                                                                                        {$commenta.edittime}由{if !empty($commenta.editname)}{$commenta.editname}{else}<i>管理员已删除</i>{/if}
                                                                                    </span>
                                                                                {/if}
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                {/foreach}
                                                            </ul>
                                                        {else}
                                                            <div class="padding">
                                                                {$ban.commentdata}
                                                            </div>
                                                        {/if}
                                                    </ul>
                                                {/if}
                                            </div>
                                            {if $view_comments}
                                                {if $ban.commentdata != "None"}
                                                    <ul class="ban_list_comments responsive_hide:desktop" style="display: contents;">
                                                        <div class="layout_box_title">
                                                            <h2><i class="fa-solid fa-comments"></i>留言<i style="font-weight: normal;font-size: smaller;">（从最新的到最老的）</i></h2>
                                                        </div>
                                                        <ul>
                                                            {foreach from=$ban.commentdata item="commenta"}
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
                                                                                    <i class="fas fa-pencil-alt"></i>最后编辑
                                                                                    {$commenta.edittime}由{if !empty($commenta.editname)}{$commenta.editname}{else}<i>管理员已删除</i>{/if}
                                                                                </span>
                                                                            {/if}
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            {/foreach}
                                                        </ul>
                                                    {/if}
                                                </ul>
                                            {/if}
                                        </div>
                                    </td>
                                </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    {if $general_unban || $can_delete || $can_export}
        <div class="layout_box padding:half margin-top flex flex-ai:center flex-jc:space-between m:flex-fd:column">
            {if $general_unban || $can_delete}
                <div>
                    <button onclick="TickSelectAll();return false;" title="Select All" name="tickswitchlink" id="tickswitchlink" class="button button:line button-light margin-right:half">全选</button>
                    <select name="bulk_action" id="bulk_action" onchange="BulkEdit(this,'{$admin_postkey}');" class="form-select">
                        <option value="-1">操作</option>
                        {if $general_unban}
                            <option value="U">解禁</option>
                        {/if}
                        {if $can_delete}
                            <option value="D">删除</option>
                        {/if}
                    </select>
                </div>
            {/if}
            {if $can_export}
                <ul class="list-reset text:right">
                    <li>
                        <a href="./exportbans.php?type=steam" title="Export Permanent SteamID Bans">导出永久SteamID封禁</a>
                    </li>
                    <li>
                        <a href="./exportbans.php?type=ip" title="Export Permanent IP Bans">导出永久IP封禁</a>
                    </li>
                </ul>
            {/if}
        </div>
    {/if}
  <script type="text/javascript" src="themes/{$theme}/scripts/collapse.js"></script>
  <script>
    document.querySelectorAll('.form-check').forEach(e => e.addEventListener('click', el => el.stopPropagation()));
  </script>

  {literal}
    <script type="text/javascript">
      window.addEvent('domready', function() {
      {/literal}
      {if $view_bans}
        $('tickswitch').value = 0;
      {/if}
      {literal}
      });
    </script>
  {/literal}
{/if}
