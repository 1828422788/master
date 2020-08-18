@auth
Feature: 权限-KV字典

  Scenario Outline: 授权可使用应用功能
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    When I "checked" the checkbox which name is "全选"
    When I "unchecked" the checkbox which name is "全选"
    And I "checked" the checkbox which name is "可查看应用,可查看仪表盘,可查看搜索页"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 新建拓扑图资源
    Given open the "topology.ListPage" page for uri "/topology/"
    When I click the "Create" button
    And I set the parameter "NameInput" with value "KVAuthTopo"
    And I click the "Ensure" button

  Scenario Outline: 新建KV字典应用
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    When I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "KVAuthTopo"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "KVAuthTopo" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "搜索"
    And I set the parameter "Url" with value "/search/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button under some element
    And I set the parameter "MenuName" with value "仪表盘"
    And I set the parameter "Url" with value "/dashboard/"
    And I click the "SaveMenuButton" button
    And I choose the "搜索" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "CreateButton" button under some element
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name   |
      | KVAuth |

  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__admin__" from the "Role"
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName |
      | KVAuth  |

  Scenario Outline: 授权app所有权限给其他用户
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for "Loading" will be invisible
    Then I click the "{'TabButton':'应用'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "KVAuth" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  Scenario: 添加KV字典
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "AddKVStore" button
    And I set the parameter "KVName" with value "AutoAuthKV"
    And I set the parameter "KVFieldInput" with value "apachecity"
    And I click the "AddKVField" button
    And I set the parameter "KVFieldInput" with value "count"
    And I click the "AddKVField" button
    And I set the parameter "KVFieldInput" with value "appname"
    And I click the "CreateKVStore" button
    And I click the "SaveButton" button under some element
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario: 授权读取权限
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    And I choose the "授权" from the "KVDropdownList"
    And I wait for loading invisible
    When I "check" the function "读取" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

  Scenario: 验证读取权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    Then I will see the "ChangeTag" is "disabled"
    Then I will see the "DeleteKV" is "disabled"
    And I choose the "授权" from the "KVDropdownList"
    And I wait for loading invisible
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled

  Scenario: 授权读取+编辑权限
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    And I choose the "授权" from the "KVDropdownList"
    And I wait for loading invisible
    When I "check" the function "读取,编辑" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

  Scenario: 验证读取+编辑权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    Then I will see the "DeleteKV" is "disabled"
    And I click the "ChangeTag" button
    And I wait for "KVTag" will be visible
    And I set the parameter "KVTag" with value "test"
    And I click the "Ensure" button under some element
    Then I will see the element "MessageContent" value is "修改成功"

  Scenario: 授权读取+编辑+转授权限
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    And I choose the "授权" from the "KVDropdownList"
    And I wait for loading invisible
    When I "check" the function "转授" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

  Scenario: 验证读取+编辑+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    Then I will see the "DeleteKV" is "disabled"
    And I choose the "授权" from the "KVDropdownList"
    And I wait for loading invisible
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  Scenario: 验证
    Given I login user "验证授权用户" with password "All#123456"
    And open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    Then I will see the "DeleteKV" is "disabled"

  Scenario: 存储kvstore
    Given I login user "AutoTest" with password "All#123456"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    Given I set the parameter "SearchInput" with value "* | stats count() as 'count' by apache.geo.city,appname| rename apache.geo.city as apachecity| outputlookup AutoAuthKV"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario: 验证是否成功
    Given I login user "AutoTest" with password "All#123456"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    Given I set the parameter "SearchInput" with value "* | stats count() by apache.geo.city | lookup appname AutoAuthKV on apache.geo.city=apachecity"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "Thead" name is "apache.geo.city  count()  appname  apachecity "

  Scenario: 授权读取+编辑+转授+删除权限
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    And I choose the "授权" from the "KVDropdownList"
    And I wait for loading invisible
    When I "check" the function "删除" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

  Scenario: 验证读取+编辑+转授+删除权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    And I choose the "删除" from the "KVDropdownList"
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the element "MessageContent" value is "删除成功"

  Scenario Outline: 删除app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除成功"

    Examples:
      | name   |
      | KVAuth |

  @cleanAuth
  Scenario Outline: 清理
    Given open the "topology.ListPage" page for uri "/topology/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    Examples:
      | name       |
      | KVAuthTopo |
      | KVAuthTopo |