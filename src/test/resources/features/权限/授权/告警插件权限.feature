@authorization @all @smoke
Feature: 授权告警插件

  Scenario: 上传告警插件
    Given open the "alert.PluginPage" page for uri "/plugins/"
    And I wait for loading invisible
    And I click the "Upload" button
    And I choose the "告警类型" from the "PluginType"
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/sendSms.py"
    And I wait for "VerifyText" will be visible
    And I click the "EnsureButton" button

  Scenario Outline: 授权读取告警插件
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'告警插件'}" button
    When I check "<AlertPluginName>" from the "UrlCheckboxes"
    And I click the "{'TabButton':'监控'}" button
    When I "checked" the checkbox which name is "新建监控"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    And open the "alert.CreatePage" page for uri "/alerts/new/"
    And I click the "AlertNoteTypeTab" button
    And I will see the element "AddType" name is "<AlertPluginName>"

    Examples:
      | AlertPluginName |
      | ping主机          |