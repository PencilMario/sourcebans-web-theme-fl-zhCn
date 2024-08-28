{if $dashboard_text || $dashboard_title}
  <div class="layout_box padding margin-bottom">
	  {if $dashboard_title}
		  <b>{$dashboard_title}</b><br>
	  {/if}
    {$dashboard_text}
  </div>
{/if}

<div class="margin-bottom">
  {include file='page_servers.tpl'}
</div>

<div class="layout_box margin-bottom">
  <div class="layout_box_title flex flex-jc:space-between flex-ai:center">
    <h2><i class="fa-solid fa-face-angry"></i> 最新添加的封禁</h2>
    <span style="text-align: right;">封禁总数：{$total_bans}</span>
  </div>

  <div class="padding">
    <div class="table table_box">
      <table>
        <thead>
          <tr>
            <th style="width: 15%"><span class="responsive_show:desktop">MOD</span>类型</th>
            <th style="width: 28%" class="text:left">日期/时间</th>
			<th style="width: 28%" class="text:left">名称</th>
            <th style="width: 28%">长度</th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$players_banned item="player"}
            <tr class="collapse" onclick="{$player.link_url}">
              <td class="text:center">
                <img src="images/games/{$player.icon}" alt="{$player.icon}" title="MOD" border="0" align="absmiddle"/>&nbsp;<i class="responsive_show:desktop fas fa-ban fa-lg"></i>
              </td>
              <td>
                {$player.created}
              </td>
			  <td>
                {if empty($player.short_name)}
                  <span class="text:italic">无昵称</span>
                {else}
                  <span>{$player.short_name|escape:'html'}</span>
                {/if}
              </td>
              <td
                class="listtable_1{if $player.unbanned}_unbanned{elseif $player.perm}_permanent{elseif $player.temp}_banned{/if}">
                {$player.length}{if $player.unbanned} ({$player.ub_reason}){/if}
              </td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
  </div>
</div>

<div class="flex flex-ai:start flex-jc:space-bwtween m:flex-fd:column">
  <div class="layout_box flex:11 margin-right margin-bottom">
    <div class="layout_box_title flex flex-jc:space-between flex-ai:center">
      <h2><i class="fa-solid fa-volume-xmark"></i> 最新添加的禁言</h2>
      <span style="text-align: right;">累计禁言: {$total_comms}</span>
    </div>

    <div class="padding">
      <div class="table table_box">
        <table>
          <thead>
            <tr>
              <th><span class="responsive_show:desktop">MOD | </span>类型</th>
			  <th class="text:left">日期/时间</th>
              <th class="text:left">名称</th>
              <th>时长</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$players_commed item="player"}
              <tr class="collapse" onclick="{$player.link_url}">
                <td class="text:center">
                  <img src="images/games/{$player.icon}" alt="{$player.icon}" title="MOD" border="0" align="absmiddle"/>&nbsp;<i class="responsive_show:desktop {$player.type}"></i>
                </td>
                <td>
                  {$player.created}
                </td>
				<td>
                  {if empty($player.short_name)}
                    <span class="text:italic">无昵称</span>
                  {else}
                    <span>{$player.short_name|escape:'html'}</span>
                  {/if}
                </td>
                <td
                  class="listtable_1{if $player.unbanned}_unbanned{elseif $player.perm}_permanent{elseif $player.temp}_banned{/if}">
                  {$player.length}{if $player.unbanned} ({$player.ub_reason}){/if}
                </td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <div class="layout_box flex:11 margin-bottom">
    <div class="layout_box_title flex flex-jc:space-between flex-ai:center">
      <h2><i class="fa-solid fa-hand"></i> 最新被阻止连接的玩家</h2>
      <span style="text-align: right;">累计阻止连接: {$total_blocked}</span>
    </div>

    <div class="padding">
      <div class="table table_box">
        <table>
          <thead>
            <tr>
              <th class="text:center">类型</th>
			        <th class="text:left">日期/时间</th>
              <th class="text:left">名称</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$players_blocked item="player"}
              <tr class="collapse"
              {if $dashboard_lognopopup}
                onclick="{$player.link_url}" 
              {else}
                onclick="{$player.popup}"
              {/if}
              onmouseout="this.className='tbl_out'" onmouseover="this.className='tbl_hover'" style="cursor: pointer;" id="{$player.server}" title="Querying Server Data...">
                <td class="text:center">
                  <i class="fas fa-ban fa-lg"></i>
                </td>
                <td class="text:left">
                  {$player.date}
                </td>
				        <td class="text:left">
                  <span>{$player.short_name|escape:'html'}</span>
                </td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
