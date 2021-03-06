@all @smoke @app
Feature: 应用KV字典

  Scenario Outline: 新建KV字典应用
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    And I click the "CreateButton" button
    Then I will see the "app.CreatePage" page
    Given delete file "/target/download-files/<name>.tar"
    When I set the parameter "NameInput" with value "<name>"
    And I click the "AddResource" button
    And I set the parameter "SearchResourceInput" with value "app所选资源"
    And I wait for "SearchLoading" will be invisible
    And I "check" the checkbox which name is "app所选资源" in tiny table
    And I click the "SaveMenuButton" button
    And I click the "AddMenuButton" button
    And I set the parameter "MenuName" with value "搜索"
    And I set the parameter "Url" with value "/search/"
    And I click the "SaveMenuButton" button
    And I wait for "AddMenuButton" will be visible
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
      | name  |
      | KVApp |

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
    And I wait for "1500" millsecond
    And I click the "Done" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName |
      | KVApp   |

  Scenario: 添加KV字典
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVApp" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "AddKVStore" button
    And I set the parameter "KVName" with value "AutoTestForKVStore"
    And I set the parameter "KVFieldInput1" with value "apachecity"
    And I click the "AddKVField" button
    And I set the parameter "KVFieldInput2" with value "count"
    And I click the "AddKVField" button
    And I set the parameter "KVFieldInput3" with value "appname"
    And I click the "CreateKVStore" button
    And I click the "SaveButton" button

  Scenario Outline: 添加KV字典失败校验
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "KVApp" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "AddKVStore" button
    And I set the parameter "KVName" with value "<name>"
    And I wait for "1000" millsecond
    And I set the parameter "KVFieldInput1" with value "<input>"
    And I click the "CreateKVStore" button
    Then I will see the element "MessageContent" name is "<message>"
    Then I wait for "5000" millsecond

    Examples:
      | name | input | message          |
      |      |       | 名称不能为空           |
      | test |       | 字段名称不能为空         |
      | 测试   |       | 名称仅支持字母、数字、下划线   |
      | t e  |       | 名称仅支持字母、数字、下划线   |
      | #@   |       | 名称仅支持字母、数字、下划线   |
      | test | @!    | 字段名称仅支持字母、数字、下划线 |
      | test | te te | 字段名称仅支持字母、数字、下划线 |
      | test | 测试    | 字段名称仅支持字母、数字、下划线 |

  Scenario: 存储kvstore----bugRZY-7554
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "KVApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KVApp"
    Then I will see the "splSearch.SearchPage" page
    Given I set the parameter "SearchInput" with value "* | stats count() as 'count' by apache.geo.city,appname| rename apache.geo.city as apachecity| outputlookup AutoTestForKVStore"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "3000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario: 验证是否成功---bugRZY-7554
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    And I click the detail which name is "KVApp"
    And I will see the "app.AppPage" page
    And I will see the element "Title" name is "KVApp"
    Then I will see the "splSearch.SearchPage" page
    Given I set the parameter "SearchInput" with value "* | stats count() by apache.geo.city | lookup appname AutoTestForKVStore on apache.geo.city=apachecity"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "1500" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
