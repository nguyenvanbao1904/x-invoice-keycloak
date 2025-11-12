<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${kcSanitize(msg("loginTitle", realm.displayName))}</title>
    <link href="${url.resourcesPath}/css/login.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;700&display=swap"
            rel="stylesheet"
    />
</head>
<body>
<div class="login-page">
    <div class="login-container">
        <header class="login-header">
            <div class="logo-icon"></div>
            <div class="slogan">
                <p class="name">X INVOICE</p>
                <p class="logo-text">Giải pháp hóa đơn điện tử Việt Nam</p>
            </div>
        </header>
        <main class="login-form-container">
            <form id="kc-form-login" class="login-form" action="${url.loginAction}" method="post">
                <h2>${kcSanitize(msg("loginTitle", realm.displayName))}</h2>
                <#if message?has_content>
                    <div class="alert alert-${message.type}">
                        ${kcSanitize(message.summary)}
                    </div>
                </#if>
                <div class="input-group">
                    <i class="user-icon"></i>
                    <input
                            type="text"
                            id="username"
                            name="username"
                            value="${(login.username!'')}"
                            placeholder="${kcSanitize(msg("usernameOrEmail"))}"
                            class="form-control"
                            autofocus
                    />
                </div>
                <div class="input-group">
                    <i class="lock-icon"></i>
                    <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="${kcSanitize(msg("password"))}"
                            class="form-control"
                    />
                </div>
                <div class="form-options">
                    <label class="remember-me">
                        <input
                                type="checkbox"
                                id="rememberMe"
                                name="rememberMe"
                                <#if login.rememberMe?has_content>checked="checked"</#if>
                        />
                        ${kcSanitize(msg("rememberMe"))}
                    </label>
                    <a href="${url.loginResetCredentialsUrl}" class="forgot-password green">
                        ${kcSanitize(msg("forgotPassword"))}
                    </a>
                </div>
                <button type="submit" class="login-button">
                    ${kcSanitize(msg("doLogIn"))}
                </button>
                <p class="register-link">
                    ${kcSanitize(msg("noAccount"))} <a class="green" href="${url.registrationUrl}">${kcSanitize(msg("doRegister"))}</a>
                </p>
            </form>
        </main>
        <footer class="login-footer">
            <p>
                © 2025 X-Invoice. Giải pháp hóa đơn điện tử miễn phí tiên phong Việt Nam.
            </p>
        </footer>
    </div>
</div>
</body>
</html>