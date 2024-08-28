<div class="admin_tab_content_title">
    <h2><i class="fas fa-paint-roller"></i>当前主题 ：</h2>
</div>

<div class="padding">
    <div class="margin-bottom">
        <h2 id="theme.name">{$theme_name}</h2>
    </div>

    <div class="flex m:flex-fd:column" id="current-theme-details">
        <div id="current-theme-screenshot" class="text:center">
            {$theme_screenshot}
        </div>

        <ul class="theme_list">
            <li>
                <h3>主题作者：</h3>
                <span id="theme.auth">{$theme_author}</span>
            </li>
            <li>
                <h3>主题版本：</h3>
                <span id="theme.vers">{$theme_version}</span>
            </li>
            <li>
                <h3>主题链接：</h3>
                <span id="theme.link">
                    <a href="{$theme_link}" target="_new">{$theme_link}</a>
                </span>
            </li>
        </ul>
    </div>
</div>

<div class="admin_tab_content_title">
    <h2>可用主题</h2>
</div>

<div class="padding">
    <div>
        点击下面的主题查看详细信息。
    </div>

    <ul class="margin-top">
        {foreach from=$theme_list item="theme"}
            <li><a href="javascript:void(0);" onclick="javascript:xajax_SelTheme('{$theme.dir}');"><b>{$theme.name}</b></a>
            </li>
        {/foreach}
    </ul>

    <div id="theme.apply"></div>
</div>