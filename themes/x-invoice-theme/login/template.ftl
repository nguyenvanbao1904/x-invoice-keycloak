<#macro registrationLayout displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!doctype html>
<html lang="${locale?default('vi')}">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title><#nested "header"></title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/login.css" />
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>
<body>
    <div class="login-page">
        <div class="background-graphics"></div>
        <div class="login-container">
            <div class="login-header">
                <img src="${url.resourcesPath}/xinvoice-logo.svg" alt="X Invoice Logo" class="logo-img">
                <div class="logo-text">
                    <span class="logo-title">X Invoice</span>
                    <span class="subtitle">Giải pháp hóa đơn điện tử Việt Nam</span>
                </div>
            </div>

            <#nested "form">

            <div class="login-footer">
                <p>© 2023 X Invoice. Giải pháp hóa đơn điện tử miễn phí tiên phong Việt Nam.</p>
            </div>
        </div>
    </div>
</body>
</html>
</#macro>