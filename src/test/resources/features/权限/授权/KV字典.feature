@authtest
Feature: 权限-KV字典

  Scenario Outline: 授权可使用应用功能
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    And I "checked" the checkbox which name is "全选" in trend page
    And I "unchecked" the checkbox which name is "全选" in trend page
    And I "checked" the checkbox which name is "可查看搜索页"
    And I "checked" the checkbox which name is "可查看统计菜单"
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "App" button
    And I "checked" the checkbox which name is "可查看应用"
    And I click the "SaveButton" button

    @authSmoke
    Examples:
      | name              |
      | __user_AutoTest__ |

    Examples:
      | name              |
      | __user_验证授权用户__   |

  @authSmoke
  Scenario: 新建拓扑图资源
    Given open the "topology.ListPage" page for uri "/topology/"
    And I wait for loading invisible
    When I click the "Create" button
    And I wait for "1500" millsecond
    And I set the parameter "NameInput" with value "KVAuthTopo"
    And I click the "Ensure" button

  @authSmoke
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
    And I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "搜索"
    And I set the parameter "Url" with value "/search/"
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "仪表盘"
    And I set the parameter "Url" with value "/dashboard/"
    And I click the "SaveMenuButton" button
    And I choose the "搜索" from the "DefaultPage"
    And I click the "CurrentApp" button
    And I click the "CreateButton" button
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name   |
      | KVAuth |

  @authSmoke
  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__admin__" from the "Role"
    And I click the "NextButton" button
    And I click the "DoneButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName |
      | KVAuth  |

  @authSmoke
  Scenario Outline: 授权app所有权限给其他用户
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "ResourceAuth" button
    And I click the "ResourceOfApp" button
    And I "checked" the checkbox which name is "KVAuth" in auth table
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |
      | __user_验证授权用户__   |

  @authSmoke
  Scenario: 添加KV字典
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "AddKVStore" button
    And I set the parameter "KVName" with value "AutoAuthKV"
    And I set the parameter "KVFieldInput1" with value "apachecity"
    And I click the "AddKVField" button
    And I set the parameter "KVFieldInput2" with value "count"
    And I click the "AddKVField" button
    And I set the parameter "KVFieldInput3" with value "appname"
    And I click the "CreateKVStore" button
    And I click the "SaveButton" button
    Then I will see the "MessageContent" is display

  Scenario: 授权读取权限
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I choose the "授权" from the "KVDropdownList"
    And I wait for "{'ButtonXpath':'确定'}" will be clickable by xpath
    When I "check" the function "读取" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I click the "Ensure" button
    And I click the "SaveButton" button
    And I wait for "Message" will be visible in "8000" milliseconds
    And I logout current user

  Scenario: 验证读取权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "KvDropdown" button
    And I wait for "{'AppButtonXpath':'删除'}" will be visible by xpath
    Then I will see the "ChangeTag" is "disabled"
    Then I will see the "DeleteKV" is "disabled"
    And open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I choose the "授权" from the "KVDropdownList"
    And I wait for "{'ButtonXpath':'确定'}" will be visible by xpath
    Then I will see the checkbox in tiny table before "验证授权用户" is disabled
    And I logout current user

  @authSmoke
  Scenario: 授权读取+编辑权限
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I choose the "授权" from the "KVDropdownList"
    And I wait for "{'ButtonXpath':'确定'}" will be visible by xpath
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I "uncheck" the checkbox which name is "AutoTest" in tiny table
    When I "check" the function "读取,编辑" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I click the "Ensure" button
    And I click the "SaveButton" button
    And I wait for "Message" will be visible in "8000" milliseconds
    And I logout current user

  @authSmoke
  Scenario: 验证读取+编辑权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I click the "KvDropdown" button
    And I wait for "{'AppButtonXpath':'删除'}" will be visible by xpath
    Then I will see the "DeleteKV" is "disabled"
    And I click the "ChangeTag" button
    And I wait for "KVTag" will be visible
    And I click the "KVTag" button
    And I set the parameter "KVTagInput" with value "test"
    And I click the "Ensure" button
    Then I will see the element "MessageContent" value is "修改成功"
    And I logout current user

  Scenario: 授权读取+编辑+转授权限
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I wait for loading invisible
    And I choose the "授权" from the "KVDropdownList"
    And I wait for "{'ButtonXpath':'确定'}" will be clickable by xpath
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I "uncheck" the checkbox which name is "AutoTest" in tiny table
    When I "check" the function "读取,编辑,转授" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I click the "Ensure" button
    And I click the "SaveButton" button
    And I wait for "Message" will be visible in "8000" milliseconds
    And I logout current user

  Scenario: 验证读取+编辑+转授权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    And I wait for "{'AppButtonXpath':'删除'}" will be visible by xpath
    Then I will see the "DeleteKV" is "disabled"
    And open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I choose the "授权" from the "KVDropdownList"
    And I wait for "{'ButtonXpath':'确定'}" will be clickable by xpath
    And I "check" the checkbox which name is "验证授权用户" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I click the "Ensure" button
    And I click the "SaveButton" button
    And I wait for "Message" will be visible in "8000" milliseconds
    And I logout current user

  Scenario: 验证
    Given I login user "验证授权用户" with password "All#123456"
    And open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I click the "KvDropdown" button
    And I wait for "{'AppButtonXpath':'删除'}" will be visible by xpath
    Then I will see the "DeleteKV" is "disabled"
    And I logout current user

  Scenario: 存储kvstore
    Given I login user "AutoTest" with password "All#123456"
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    And I click the detail which name is "KVAuth"
    Then I will see the "splSearch.SearchPage" page
    Given I set the parameter "SearchInput" with value "* | stats count() as 'count' by apache.geo.city,appname| rename apache.geo.city as apachecity| outputlookup AutoAuthKV"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I logout current user

  Scenario Outline: 验证是否成功
    Given I login user "AutoTest" with password "All#123456"
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    And I click the detail which name is "KVAuth"
    And I wait for loading invisible
    Then I will see the "splSearch.SearchPage" page
    Given I set the parameter "SearchInput" with value "* | stats count() by apache.geo.city | lookup appname AutoAuthKV on apache.geo.city=apachecity"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "Thead" name is "<head>"
    And I logout current user

    Examples:
      | head              |
      | apache.geo.city\ncount()\nappname |


  Scenario: 授权读取+编辑+转授+删除权限
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    And I wait for loading invisible
    Then I will see the "app.CreatePage" page
    And I choose the "授权" from the "KVDropdownList"
    And I wait for "{'ButtonXpath':'确定'}" will be clickable by xpath
    And I "check" the checkbox which name is "AutoTest" in tiny table
    And I "uncheck" the checkbox which name is "AutoTest" in tiny table
    When I "check" the function "读取,编辑,删除,转授" which name is "AutoTest" in tiny table
    And I click the "Ensure" button
    Then I will see the success message "保存成功"
    And I click the "Ensure" button
    And I click the "SaveButton" button
    And I wait for "Message" will be visible in "8000" milliseconds
    And I logout current user

  Scenario: 验证读取+编辑+转授+删除权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVAuth" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I choose the "删除" from the "KVDropdownList"
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    Then I will see the element "MessageContent" value is "删除成功"
    And I logout current user

  Scenario Outline: 删除app
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    Then the data name is "<name>" then i click the "删除" button in more menu
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
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "1500" millsecond
    Then I will see the message "删除成功"

    Examples:
      | name       |
      | KVAuthTopo |
