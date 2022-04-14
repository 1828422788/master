@autoprops @lookup @autopropsSmoke
Feature: 字段查找
  #  详细功能参见testlink中RZY-5360隶属文件夹【字段查找】中的配置

  Background:
    Given open the "autoProps.ListPage" page for uri "/fieldconfig/"

  Scenario: 添加字段查找成功
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible

    And I click the "AddLookup" button
    And I set the parameter "LookupName" with value "AutoLookup"
    And I set the parameter "CsvPath" with value "/data/tmp/autolookup.csv"
    And I set the parameter "SearchInputField" with value "appname"
    And I set the parameter "EventInputField" with value "appname"
    And I click the "AddOutputField" button
    And I set the parameter "OutputField" with value "info1"
    And I set the parameter "EventOutPutField" with value "info1"
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "LookupMapping" change text to "lookup appname AS appname OUTPUT info1 AS info1"

  Scenario: 验证字段查找
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "info1:" exist
    And I set the parameter "SearchInput" with value "* | stats count() by appname,info2"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"

  Scenario Outline: 添加字段查找失败
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible

    And I click the "AddLookup" button
    And I set the parameter "LookupName" with value "<name>"
    And I set the parameter "CsvPath" with value "/data/tmp/autolookup.csv"
    And I set the parameter "SearchInputField" with value "appname"
    And I set the parameter "EventInputField" with value "appname"
    And I click the "AddOutputField" button
    And I set the parameter "OutputField" with value "info1"
    And I set the parameter "EventOutPutField" with value "info1"
    And I click the "SavedButton" button
    And I will see the element "WarningInfo" name is "<warning>"

    Examples:
      | name | warning        |
      |      | 请输入查找名称        |
      |AutoLookup|名称重复        |
      | 中文  | 名称由字母、数字和下划线组成 |
      | #%autotest| 名称由字母、数字和下划线组成 |
      | auto_te st | 名称由字母、数字和下划线组成 |

  Scenario: 新增字段查找
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    And I click the "AddLookup" button
    And I set the parameter "LookupName" with value "AutoFind"
    And I set the parameter "CsvPath" with value "/data/tmp/autofind.csv"
    And I set the parameter "SearchInputField" with value "method"
    And I set the parameter "EventInputField" with value "apache.method"
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "FindMapping" change text to "lookup method AS apache.method OUTPUT"

  Scenario: 新增字段查找_用于大小写敏感_全局共享
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    And I click the "AddLookup" button
    And I set the parameter "LookupName" with value "NewLookup"
    And I set the parameter "CsvPath" with value "/data/tmp/autolookupSensitive.csv"
    And I set the parameter "SearchInputField" with value "appname"
    And I set the parameter "EventInputField" with value "appname"
    And I click the "AddOutputField" button
    And I set the parameter "OutputField" with value "Prompt"
    And I set the parameter "EventOutPutField" with value "Prompt"
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "NewLookupMapping" change text to "lookup appname AS appname OUTPUT Prompt AS Prompt"

  Scenario: 验证新增字段查找
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "messages" exist
    Then I will see the field "method" exist

  Scenario: 添加字段查找输入字段
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    When the data name is "AutoLookup" then i click the "编辑" button
    And I click the "AddInputField" button
    And I set the parameter "SearchInputField" with value "status"
    And I set the parameter "EventInputField" with value "apache.status"
    And I click the "AddInputField" button
    And I set the parameter "SearchInputField" with value "info2"
    And I set the parameter "EventInputField" with value "info2"
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "LookupMapping" change text to "lookup appname AS appname status AS apache.status info2 AS info2 OUTPUT info1 AS info1"

  Scenario: 验证新增字段查找输入字段成功
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by appname,apache.status,info1"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"

  Scenario: 删除字段查找输入字段
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    When the data name is "AutoLookup" then i click the "编辑" button
    And I click the "LookupInputMappingDelete" button

    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "LookupMapping" change text to "lookup appname AS appname status AS apache.status OUTPUT info1 AS info1"

  Scenario: 验证删除字段查找输入字段成功
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:apache | where apache.status == 200"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "info1:" exist
    And I set the parameter "SearchInput" with value "* | stats count() by appname,apache.status,info1"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

  Scenario: 编辑字段查找输出字段
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    When the data name is "AutoLookup" then i click the "编辑" button
    And I set the parameter "EventOutPutField" with value "INFO"

    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "LookupMapping" change text to "lookup appname AS appname status AS apache.status OUTPUT info1 AS INFO"

  Scenario: 添加字段查找输出字段
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    When the data name is "AutoLookup" then i click the "编辑" button
    And I click the "AddOutputField" button
    And I set the parameter "OutputField" with value "info2"
    And I set the parameter "EventOutPutField" with value "info2"

    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "LookupMapping" change text to "lookup appname AS appname status AS apache.status OUTPUT info1 AS INFO info2 AS info2"

  Scenario: 验证编辑后字段查找
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by appname,INFO,info2"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"
    And I set the parameter "SearchInput" with value "* | stats count() by appname,info1"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"

  Scenario: 删除字段查找输出字段
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    When the data name is "AutoLookup" then i click the "编辑" button
    And I click the "LookupInputMappingDelete" button

    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "LookupMapping" change text to "lookup appname AS appname status AS apache.status OUTPUT info1 AS INFO"

  Scenario: 验证删除字段查找输出字段成功
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by appname,INFO,info2"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"
    And I set the parameter "SearchInput" with value "* | stats count() by appname,INFO"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

  Scenario: 验证大小写敏感
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by appname,Prompt"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"

  Scenario: 关闭大小写敏感
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    When the data name is "NewLookup" then i click the "编辑" button
    And I click the "CaseSensitive" button
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "NewLookupMapping" change text to "lookup appname AS appname OUTPUT Prompt AS Prompt"

  Scenario: 验证关闭大小写敏感
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by appname,Prompt"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

  Scenario: 删除字段查找
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    When the data name is "AutoFind" then i click the "删除" button in more menu
    And I wait for "EnsureText" will be visible
    And I click the "EnsureDelete" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除成功"

  Scenario: 开启全局共享
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    When the data name is "NewLookup" then i click the "编辑" button
    Then I wait for "GlobalShared" will be visible
    And I click the "GlobalShared" button
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "LookupGlobal" change text to "是"

  Scenario: 验证全局共享_页面验证
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldSearch" will be visible
    And I click the "FieldSearch" button
    And I wait for "AddFieldSearch" will be visible
    And I wait for element "LookupGlobal" change text to "来自"

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "app之api全部用例" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldSearch" will be visible
    And I click the "FieldSearch" button
    And I wait for "AddFieldSearch" will be visible
    And I wait for element "LookupGlobal" change text to "来自"

    Given open the "autoProps.ListPage" page for uri "/fieldconfig/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page
    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    And I wait for element "LookupGlobal" change text to "来自"

  Scenario: 验证全局共享_搜索验证
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AppFieldConfig"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by appname,Prompt"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "app之api全部用例"
    Then I will see the "splSearch.SearchPage" page
    And I click the "Search" button
    Given open the "app.ListPage" page for uri "/app/1/search/"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by appname,Prompt"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by appname,Prompt"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

  Scenario: 关闭全局共享
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Lookup" will be visible
    And I click the "Lookup" button
    And I wait for "AddLookup" will be visible
    When the data name is "NewLookup" then i click the "编辑" button
    Then I wait for "GlobalShared" will be visible
    And I click the "GlobalShared" button
    And I click the "SavedButton" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "LookupGlobal" change text to "否"

  Scenario: 验证关闭全局共享
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AppFieldConfig"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by appname,Prompt"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "app之api全部用例"
    Then I will see the "splSearch.SearchPage" page
    And I click the "Search" button
    And I set the parameter "SearchInput" with value "* | stats count() by appname,Prompt"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by appname,Prompt"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"










