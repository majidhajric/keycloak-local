<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!doctype html>
<html lang="en" class="${properties.kcHtmlClass!}">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="robots" content="noindex, nofollow">

    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Open+Sans:300|Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">

    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
  <div class="${properties.kcLoginClass!} container-fluid">

      <section id="kc-header" class="row d-flex flex-grow-1 align-items-center justify-content-center">
          <div id="kc-header-wrapper" class="col p-3">
              <h3 class="text-center">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</h3>
          </div>
      </section>

      <section id="kc-login-form" class="row d-flex flex-grow-1 align-items-center justify-content-center">
          <div class="col col-md-8 col-lg-6 py-3">
              <div id="login-card" class="card mx-auto">
                  <header class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                      <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                          <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                              <#if displayRequiredFields>
                                  <div class="${properties.kcContentWrapperClass!}">
                                      <div class="${properties.kcLabelWrapperClass!} subtitle">
                                          <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                                      </div>
                                      <div class="col-md-10">
                                          <h4 id="kc-simplePage-title" class="text-white font-weight-bolder text-center mt-2 mb-0"><#nested "header"></h4>
                                      </div>
                                  </div>
                              <#else>

                              <h4 id="kc-simplePage-title" class="text-white font-weight-bolder text-center mt-2 mb-0"><#nested "header"></h4>

                              </#if>
                          <#else>
                              <#if displayRequiredFields>
                                  <div class="${properties.kcContentWrapperClass!}">
                                      <div class="${properties.kcLabelWrapperClass!} subtitle">
                                          <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                                      </div>
                                      <div class="col-md-10">
                                          <#nested "show-username">
                                          <div class="${properties.kcFormGroupClass!}">
                                              <div id="kc-username">
                                                  <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                                  <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                                      <div class="kc-login-tooltip">
                                                          <i class="${properties.kcResetFlowIcon!}"></i>
                                                          <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                                      </div>
                                                  </a>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              <#else>
                                  <#nested "show-username">
                                  <div class="${properties.kcFormGroupClass!}">
                                      <div id="kc-username">
                                          <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                          <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                              <div class="kc-login-tooltip">
                                                  <i class="${properties.kcResetFlowIcon!}"></i>
                                                  <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                              </div>
                                          </a>
                                      </div>
                                  </div>
                              </#if>
                          </#if>
                      </div>
                  </header>
                  <div id="kc-content" class="card-body">
                      <div id="kc-content-wrapper">

                          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                              <#if message.type = 'success'><div class="alert alert-success `my-3" role="alert">${kcSanitize(message.summary)?no_esc}</div></#if>
                              <#if message.type = 'warning'><div class="alert alert-warning my-3" role="alert">${kcSanitize(message.summary)?no_esc}</div></#if>
                              <#if message.type = 'error'><div class="alert alert-danger my-3" role="alert">${kcSanitize(message.summary)?no_esc}</div></#if>
                              <#if message.type = 'info'><div class="alert alert-info my-3" rol`e="alert">${kcSanitize(message.summary)?no_esc}</div></#if>
                          </#if>

                          <#nested "form">

                          <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                              <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post" <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
                                  <div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                                      <div class="input-group">
                                          <input class="form-control" type="hidden" name="tryAnotherWay" value="on" />
                                          <a href="#" id="try-another-way" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                                      </div>
                                  </div>
                              </form>
                          </#if>

                          <#if displayInfo>
                              <div id="kc-info" class="${properties.kcSignUpClass!}">
                                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                      <#nested "info">
                                  </div>
                              </div>
                          </#if>
                      </div>
                  </div>
              </div>
          </div>
      </section>

      <section id="kc-login-footer" class="row d-flex flex-grow-1 align-items-center justify-content-center">
          <div class="col">
              <p class="text-center">Lorem ipsum footer.</p>
          </div>
      </section>
  </div>
  <#if properties.bottomScripts?has_content>
      <#list properties.bottomScripts?split(' ') as script>
          <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
      </#list>
  </#if>
  <#if scripts??>
      <#list scripts as script>
          <script src="${script}" type="text/javascript"></script>
      </#list>
  </#if>
  <#if properties.scripts?has_content>
      <#list properties.scripts?split(' ') as script>
      <#--
      <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
      <script src="${url.resourcesPath}/${script}" type="module"></script>
      -->
          <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
      </#list>
  </#if>
  <#if scripts??>
      <#list scripts as script>
          <script src="${script}" type="text/javascript"></script>
      </#list>
  </#if>
<div id="login-backdrop" class="position-fixed top-0 left-0 w-100 h-100 z-index-2"></div>
</body>
</html>
</#macro>
