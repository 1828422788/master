@all @smoke @app @appSmoke
Feature: 应用字段别名

  Scenario Outline: 新建KV字典应用
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    When I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "app所选资源"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "app所选资源" in tiny table
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
    And I click the "CurrentApp" button under some element
    And I click the "CreateButton" button under some element
    And I will see the "app.ListPage" page
    Then I wait for "CreateButton" will be visible

    Examples:
      | name           |
      | AppFieldConfig |

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
    And I click the "NextButton" button under some element
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName        |
      | AppFieldConfig |

  Scenario: 添加字段别名
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "AddFieldAlias" will be visible
    And I click the "AddFieldAlias" button
    And I set the parameter "FieldAliasModalName" with value "AutoTest"
    And I set the parameter "OriginalField" with value "appname"
    And I set the parameter "FieldAlias" with value "app"
    And I click the "SaveButton" button under some element

  Scenario Outline: 字段别名失败校验
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "AddFieldAlias" will be visible
    And I click the "AddFieldAlias" button
    And I set the parameter "FieldAliasModalName" with value "<name>"
    And I set the parameter "OriginalField" with value "<original>"
    And I set the parameter "FieldAlias" with value "<alias>"
    And I click the "SaveButton" button under some element
    Then I will see the element "WarningInfo" value is "<warning>"

    Examples:
      | name | original | alias | warning        |
      |      |          |       | 请输入别名名称        |
      | 测试   |          |       | 名称由字母、数字和下划线组成 |
      | ！@   |          |       | 名称由字母、数字和下划线组成 |
      | test |          |       | 请填写至少一组别名映射    |
      | test | test     |       | 请输入字段别名        |

  Scenario: 验证字段别名
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "*|stats count() by appname"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I set value with element "TrList"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "*|stats count() by app"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I compare with list "TrList"

  Scenario: 添加多个字段别名映射
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "AddFieldAlias" will be visible
    When the data name is "AutoTest" then i click the "编辑" button
    And I click the "AddAlias" button
    And I set the parameter "OriginalField" with value "apache.geo.province"
    And I set the parameter "FieldAlias" with value "province"
    And I click the "SaveButton" button under some element

  Scenario: 验证多个字段别名映射
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "* | stats count() by apache.geo.province,appname"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I set value with element "TrList"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by province,app"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I compare with list "TrList"

  Scenario: 删除字段别名映射
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "AddFieldAlias" will be visible
    When the data name is "AutoTest" then i click the "编辑" button
    And I click the "DeleteAlias" button
    And I click the "SaveButton" button under some element

  Scenario: 验证删除成功
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by app"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "CountNum" value is "(0)"

  Scenario: 添加多个字段别名
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "AddFieldAlias" will be visible
    And I click the "AddFieldAlias" button
    And I set the parameter "FieldAliasModalName" with value "test"
    And I set the parameter "OriginalField" with value "appname"
    And I set the parameter "FieldAlias" with value "app"
    And I click the "SaveButton" button under some element

  Scenario: 验证多个字段别名
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "* | stats count() by apache.geo.province,appname"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I set value with element "TrList"
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by province,app"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I compare with list "TrList"