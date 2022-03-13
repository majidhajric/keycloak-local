<#import "template.ftl" as layout>
<@layout.registrationLayout; htmlContent>
    <#if htmlContent = "header">
        ${msg("registerTitle")}
    <#elseif htmlContent = "form">
        <form id="kc-register-form" action="${url.registrationAction}" method="post">

            <#--
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}" />
                </div>
            </div>
            -->

            <div class="${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">

                <div class="input-group input-group-dynamic mb-4 <#if usernameEditDisabled??>input-disabled</#if>">
                    <input tabindex="0" required id="firstName" class="form-control" name="firstName" value="${(register.formData.firstName!'')}" type="text" autofocus autocomplete="off">
                    <label for="firstName" class="form-label">
                        ${msg("firstName")}
                    </label>
                </div>

            </div>

            <#--
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}" />
                </div>
            </div>
            -->

            <div class="${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">

                <div class="input-group input-group-dynamic mb-4 ">
                    <input tabindex="0" required id="lastName" class="form-control" name="lastName" value="${(register.formData.lastName!'')}" type="text" autofocus autocomplete="off">
                    <label for="lastName" class="form-label">
                        ${msg("lastName")}
                    </label>
                </div>

            </div>

            <#--
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
                </div>
            </div>
            -->

            <div class="${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">

                <div class="input-group input-group-dynamic mb-4 ">
                    <input tabindex="0" required id="email" class="form-control" name="email" value="${(register.formData.email!'')}" type="text" autofocus autocomplete="off">
                    <label for="email" class="form-label">
                        ${msg("email")}
                    </label>
                </div>

            </div>

            <#--
            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                    </div>
                </div>
            </#if>
            -->

            <#if !realm.registrationEmailAsUsername>
                <div class="${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">

                    <div class="input-group input-group-dynamic mb-4 ">
                        <input tabindex="0" required id="username" class="form-control" name="username" value="${(register.formData.username!'')}" type="text" autofocus autocomplete="off">
                        <label for="username" class="form-label">
                            ${msg("username")}
                        </label>
                    </div>

                </div>
            </#if>

            <#--
            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password" class="${properties.kcInputClass!}" name="password" autocomplete="new-password"/>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" />
                    </div>
                </div>
            </#if>
            -->

            <#if passwordRequired??>
                <div class="${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">

                    <div class="input-group input-group-dynamic mb-4 ">
                        <input tabindex="0" required id="password" class="form-control" name="password" type="password" autocomplete="off">
                        <label for="password" class="form-label">${msg("password")}</label>
                    </div>

                </div>

                <div class="${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">

                    <div class="input-group input-group-dynamic mb-4 ">
                        <input tabindex="0" required id="password-confirm" class="form-control" name="password-confirm" type="password" autocomplete="off">
                        <label for="password-confirm" class="form-label">${msg("passwordConfirm")}</label>
                    </div>

                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="input-group input-group-dynamic mb-4 ">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </#if>

            <#--
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
            -->

            <div class="mdc-card__actions">

                <#--
                <button class="mdc-button mdc-card__action mdc-card__action--button" onclick="window.location.href = ${url.loginUrl}">
                    <i class="material-icons mdc-button__icon">arrow_back</i>
                    ${kcSanitize(msg("backToLogin"))?no_esc}
                </button>
                -->

                <a href="${url.loginUrl}" class="btn">
                    <i class="material-icons mdc-button__icon">arrow_back</i>
                    ${kcSanitize(msg("backToLogin"))?no_esc}
                </a>

                <div class="row">
                    <div class="col">
                        <button tabindex="0" name="login" id="kc-login" type="submit" class="btn btn-primary btn-raised">
                            ${msg("doRegister")}
                        </button>
                    </div>
                </div>

            </div>

        </form>
    </#if>
</@layout.registrationLayout>
