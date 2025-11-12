<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if msg??>${msg("errorTitle")}<#else>Lỗi</#if>
    <#elseif section = "form">
        <div id="kc-error-message">
            <p class="instruction"><#if message??>${message}<#else>Đã xảy ra lỗi</#if></p>
            <#if client?? && client.baseUrl?has_content>
                <p><a id="backToApplication" href="${client.baseUrl}"><#if kcSanitize?? && msg??>${kcSanitize(msg("backToApplication"))?no_esc}<#else>Quay lại ứng dụng</#if></a></p>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>