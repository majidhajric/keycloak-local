<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
            <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                        <div class="input-group input-group-dynamic mb-4">
                            <label for="username" class="form-label"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                            <#if usernameEditDisabled??>
                                <input tabindex="1" id="username" class="form-control" name="username" value="${(login.username!'')}" type="text" disabled aria-label="User Name"/>
                            <#else>
                                <input tabindex="1" id="username" class="form-control" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" aria-label="User Name"/>
                            </#if>
                        </div>

                        <#--
                        <div class="${properties.kcFormGroupClass!}">

                            <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!} <#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
                                <i class="material-icons mdc-text-field__icon" role="button">person</i>
                                <input tabindex="0" required id="username" class="mdc-text-field__input ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" <#if usernameEditDisabled??>disabled</#if>>
                                <div class="mdc-line-ripple"></div>
                                <label for="username" class="mdc-floating-label ${properties.kcLabelClass!}">
                                    <#if !realm.loginWithEmailAllowed>
                                        ${msg("username")}
                                    <#elseif !realm.registrationEmailAsUsername>
                                        ${msg("usernameOrEmail")}
                                    <#else>
                                        ${msg("email")}
                                    </#if>
                                </label>
                            </div>
                        </div>
                        -->

                        <div class="input-group input-group-dynamic mb-4">
                            <label for="password" class="form-label">${msg("password")}</label>
                            <input tabindex="0" required id="password" class="form-control" name="password" type="password" autocomplete="off">
                        </div>


                        <div class="input-group input-group-dynamic mb-4">
                            <div id="kc-form-options">
                                <#if realm.rememberMe && !usernameEditDisabled??>

                                    <div class="form-check form-switch d-flex align-items-center mb-3">
                                        <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe" tabindex="0" <#if login.rememberMe??>checked</#if>>
                                        <label class="form-check-label mb-0 ms-2" for="rememberMe">${msg("rememberMe")}</label>
                                    </div>
                                </#if>
                            </div>
                            <div class="d-flex flex-grow-1 justify-content-end">
                                <#if realm.resetPasswordAllowed>
                                    <span><a tabindex="0" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <button tabindex="0" name="login" id="kc-login" type="submit" class="btn bg-gradient-primary w-100 my-4 mb-2">
                                   ${msg("doLogIn")}
                                </button>
                            </div>
                        </div>

                    </form>
                </#if>
            </div>
            <#if realm.password && social.providers??>
                <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                    <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                        <#list social.providers as p>
                            <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                        </#list>
                    </ul>
                </div>
            </#if>
        </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>

            <hr>

            <div id="kc-registration" class="registration-controls">
                <span>${msg("noAccount")} <a tabindex="0" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
