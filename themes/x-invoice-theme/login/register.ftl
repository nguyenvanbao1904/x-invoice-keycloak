<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('email','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <div class="form-wrapper">
            <div class="login-form-container">
                <form class="login-form register-form" id="kc-register-form" action="${url.registrationAction}" method="post">
                    <h2>Đăng ký</h2>
                    <p class="register-subtitle">Mở tài khoản duy nhất cho bộ giải pháp X Invoice</p>

                    <div class="input-group">
                        <div class="input-icon-wrapper">
                            <span class="kc-icon user-icon"></span>
                            <input type="text" id="user.attributes.fullName" class="input-field" name="user.attributes.fullName" 
                                value="${(register.formData['user.attributes.fullName']!'')}" 
                                placeholder="Họ và tên"
                                required
                            />
                        </div>
                    </div>
                    
                    <!-- Hidden fields cho firstName và lastName để tương thích với Keycloak -->
                    <input type="hidden" id="firstName" name="firstName" value=" " />
                    <input type="hidden" id="lastName" name="lastName" value=" " />

                    <div class="input-group">
                        <div class="input-icon-wrapper">
                            <span class="kc-icon email-icon"></span>
                            <input type="email" id="email" class="input-field" name="email" 
                                value="${(register.formData.email!'')}" 
                                autocomplete="email"
                                placeholder="Email"
                                aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                                required
                            />
                            <#if messagesPerField.existsError('email')>
                                <span class="error-message" id="error-email">${kcSanitize(messagesPerField.get('email'))?no_esc}</span>
                            </#if>
                        </div>
                    </div>
                    
                    <div class="input-group">
                        <div class="input-icon-wrapper">
                            <span class="kc-icon phone-icon"></span>
                            <input type="tel" id="user.attributes.phoneNumber" class="input-field" name="user.attributes.phoneNumber" 
                                value="${(register.formData['user.attributes.phoneNumber']!'')}" 
                                autocomplete="tel"
                                placeholder="Số điện thoại"
                                required
                            />
                        </div>
                    </div>
                    
                    <#if passwordRequired??>
                        <div class="input-group">
                            <div class="input-icon-wrapper">
                                <span class="kc-icon lock-icon"></span>
                                <input type="password" id="password" class="input-field" name="password" 
                                    autocomplete="new-password"
                                    placeholder="Mật khẩu"
                                    aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                    required
                                />
                                <span class="eye-icon" id="toggle-password" onclick="togglePasswordVisibility('password')"></span>
                                <#if messagesPerField.existsError('password')>
                                    <span class="error-message" id="error-password">${kcSanitize(messagesPerField.get('password'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                        <div class="input-group">
                            <div class="input-icon-wrapper">
                                <span class="kc-icon lock-icon"></span>
                                <input type="password" id="password-confirm" class="input-field" name="password-confirm" 
                                    autocomplete="new-password"
                                    placeholder="Xác nhận mật khẩu"
                                    aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                    required
                                />
                                <span class="eye-icon" id="toggle-password-confirm" onclick="togglePasswordVisibility('password-confirm')"></span>
                                <#if messagesPerField.existsError('password-confirm')>
                                    <span class="error-message" id="error-password-confirm">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>
                    </#if>

                    <#if recaptchaRequired??>
                        <div class="recaptcha-container">
                            <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                        </div>
                    </#if>

                    <div class="kc-form-buttons">
                        <button type="submit" class="login-button">Đăng ký</button>
                    </div>

                    <div class="register-link">
                        Bạn đã có tài khoản? <a href="${url.loginUrl}">Đăng nhập</a>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function togglePasswordVisibility(id) {
                const passwordInput = document.getElementById(id);
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                } else {
                    passwordInput.type = 'password';
                }
            }
        </script>

        <#if recaptchaRequired??>
            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        </#if>
    </#if>
</@layout.registrationLayout>