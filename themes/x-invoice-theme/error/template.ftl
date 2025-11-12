<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html lang="${locale?default('vi')}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <title><#if msg??>${msg("errorTitle")}<#else>Lỗi</#if></title>
    <link rel="icon" href="<#if url.resourcesPath??>${url.resourcesPath}/img/favicon.ico</#if>" />
    <link href="<#if url.resourcesPath??>${url.resourcesPath}/css/error.css<#else>css/error.css</#if>" rel="stylesheet" />
</head>

<body>
    <div class="error-container">
        <div class="header">
            <div class="logo"></div>
            <#if realm?? && realm.displayName?? && realm.name?? && realm.displayName != realm.name>
                <h1>${realm.displayName}</h1>
            </#if>
        </div>
        <div class="content-area">
            <#if section?? && section = "header">
                <h1>${section}</h1>
            </#if>

            <#if section = "form">
                <#nested "form">
            </#if>
        </div>
    </div>
</body>
</html>
</#macro>