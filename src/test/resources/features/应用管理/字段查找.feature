#@all @smoke @app @appSmoke
Feature: 应用字段查找

  Scenario: 添加模糊字段查找
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldSearch" will be visible
    And I click the "FieldSearch" button
    And I wait for "AddFieldSearch" will be visible
    And I click the "AddFieldSearch" button
    And I set the parameter "FieldSearchName" with value "AutoTestSearch"
    And I set the parameter "CsvPath" with value "/data/rizhiyi/app_csv/hostname.csv"
    And I set the parameter "SearchInputField" with value "hostname"
    And I choose the "WILDCARD" from the "MatchType"
    And I click the "SaveButton" button

  Scenario: 验证模糊字段查找
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the field "f1,f2" exist

  Scenario: 添加查找输出字段
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldSearch" will be visible
    And I click the "FieldSearch" button
    When the data name is "AutoTestSearch" then i click the "编辑" button
    And I click the "AddOutputField" button
    And I set the parameter "OutputField" with value "f1"
    And I set the parameter "EventField" with value "AutoTestName"
    And I click the "SaveButton" button

  Scenario: 验证查找输出字段
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | stats count() by AutoTestName"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "Thead" name is "AutoTestName  count() "

  Scenario: 删除输出字段
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldSearch" will be visible
    And I click the "FieldSearch" button
    When the data name is "AutoTestSearch" then i click the "删除" button
    And I click the "SaveButton" button

  Scenario: 验证字段删除成功
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result data "f1,f2" doesn't exist

  Scenario: 添加字段CIDR查找
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldSearch" will be visible
    And I click the "FieldSearch" button
    And I wait for "AddFieldSearch" will be visible
    And I click the "AddFieldSearch" button
    And I set the parameter "FieldSearchName" with value "AutoTestSearch"
    And I set the parameter "CsvPath" with value "/data/rizhiyi/app_csv/hostname.csv"
    And I set the parameter "SearchInputField" with value "hostname"
    And I choose the "CIDR" from the "MatchType"
    And I click the "SaveButton" button

  Scenario: 验证字段CIDR查找
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "hostname:192.168.1.*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the field "f1,f2" exist

  Scenario: 删除字段CIDR查找
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldSearch" will be visible
    And I click the "FieldSearch" button
    When the data name is "AutoTestSearch" then i click the "删除" button
    And I click the "SaveButton" button

  Scenario: 验证CIDR删除成功
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result data "f1,f2" doesn't exist

  Scenario: 添加字段精确查找
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldSearch" will be visible
    And I click the "FieldSearch" button
    And I wait for "AddFieldSearch" will be visible
    And I click the "AddFieldSearch" button
    And I set the parameter "FieldSearchName" with value "AutoTestSearch"
    And I set the parameter "CsvPath" with value "/data/rizhiyi/app_csv/hostname.csv"
    And I set the parameter "SearchInputField" with value "appname"
    And I click the "SaveButton" button

  Scenario: 验证字段精确查找
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the field "f1,f2" exist

  Scenario: 增加精确查找输出字段
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldSearch" will be visible
    And I click the "FieldSearch" button
    When the data name is "AutoTestSearch" then i click the "编辑" button
    And I click the "AddOutputField" button
    And I set the parameter "OutputField" with value "f1"
    And I set the parameter "EventField" with value "f1Name"
    And I click the "SaveButton" button

  Scenario: 验证精确查找输出字段
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "AppFieldConfig" then i click the "打开" button
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the field "f1Name" exist
    Then I will see the spl search result data "f1,f2" doesn't exist



