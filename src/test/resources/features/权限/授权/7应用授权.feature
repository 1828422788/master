@authorization @all @smoke @roleSmoke
Feature: 角色授权应用

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'应用'}" button

  Scenario Outline: 授权应用读取（RZY-2605）
    When I check "读取" from the "{'IntraGroupManagement':['<name>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'打开 导出 查看'}" button
    Given delete file "/target/download-files/AutoTest.tar"
    When the data name is "<name>" then i click the "导出" button
    And I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "ExportButton" button
    Then I will see the success message "请等待下载开始后，点击确定返回列表页，然后等待下载完成"

    Examples:
      | name            |
      | TempAutoTestApp |

  Scenario Outline: 授权应用读取+删除（RZY-2607）
    When I check "读取,删除" from the "{'IntraGroupManagement':['<name>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'打开 导出 查看 删除'}" button

    Examples:
      | name            |
      | TempAutoTestApp |

  Scenario Outline: 授权应用读取+更新（RZY-2606）
    When I check "读取,更新" from the "{'IntraGroupManagement':['<name>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'打开 导出 编辑 查看'}" button
    When the data name is "<name>" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I set the parameter "DescribeInput" with value "DeleteMe"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name            |
      | TempAutoTestApp |

  Scenario Outline: 授权应用读取+更新+删除（RZY-2608）
    When I check "读取,更新,删除" from the "{'IntraGroupManagement':['<name>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "app.ListPage" page for uri "/app/list/"
    Then the data name is "<name>" then i will see "{'column':'5','name':'打开 导出 编辑 查看 删除'}" button
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"

    Examples:
      | name            |
      | TempAutoTestApp |