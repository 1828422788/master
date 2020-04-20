@tenant
Feature:  租户系统-租户外观


Scenario: 界面配色
  Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#  When I set the parameter "Username" with properties "saas_username"
#  And I set the parameter "Password" with properties "saas_password"
#  And I click the "LoginButton" button
  And I will see the "tenant.ListPage" page
#租户外观
  And I click the "tenantAppearance" button
#  主色系
  And I click the "mainColor" button
  And I set the parameter "ColorInput" with value "#484FCD"
  And I click the "EnsureColor" button
  And I wait for "EnsureColor" will be invisible
#  主色系悬停
  And I click the "mainColorHover" button
  And I set the parameter "ColorInput" with value "#31C1B2"
  And I click the "EnsureColor" button
  And I wait for "EnsureColor" will be invisible
#  一级导航
  And I click the "firstNavigation" button
  And I set the parameter "ColorInput" with value "#5C7CEB"
  And I click the "EnsureColor" button
  And I wait for "EnsureColor" will be invisible
  #  图标及占位符辅助色
  And I click the "iconColor" button
  And I set the parameter "ColorInput" with value "#1F773B"
  And I click the "EnsureColor" button
  And I wait for "EnsureColor" will be invisible
  And I click the "update" button

Scenario: 验证界面颜色
  Given open the "dashboard.ListPage" page for uri "/dashboard/"
  And I wait for loading invisible
  Then take a screenshot with name "tenantStatus/界面配色"


  Scenario: 更换logo
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
#    When I set the parameter "Username" with properties "saas_username"
#    And I set the parameter "Password" with properties "saas_password"
#    And I click the "LoginButton" button
    And I will see the "tenant.ListPage" page
    #租户外观
    And I click the "tenantAppearance" button

    And I click the "replaceLogo" button
    And I upload a file with name "/src/test/resources/testdata/image/tenantlogo.png"

Scenario:  验证logo
  Given I logout current user
  And I wait for title change text to "登录"
  And open the "LoginPage" page for uri "/auth/login/"
  Then take a screenshot with name "tenantStatus/logo"


  Scenario: 页面颜色恢复初始状态
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
    And I will see the "tenant.ListPage" page
    #租户外观
    And I click the "tenantAppearance" button
    And I click the "firstStatus" button
    And I wait for loading invisible


  Scenario: logo恢复初始状态
    Given open the "saas.SaasLoginPage" page for uri "/domain/tenant/"
    And I will see the "tenant.ListPage" page
    #租户外观
    And I click the "tenantAppearance" button
    And I click the "reset" button
