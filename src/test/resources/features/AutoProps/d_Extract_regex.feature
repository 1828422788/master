@autoprops @extract @autopropsSmoke
Feature: 字段萃取_正则解析
  #  详细功能参见testlink中RZY-5412隶属文件夹【正则解析】中的配置

  Background:
    Given open the "autoProps.ListPage" page for uri "/fieldconfig/"

  Scenario Outline: 添加字段萃取_正则解析
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AddExtract_regex" will be visible

    And I click the "AddExtract_regex" button
    And I set the parameter "RegexName" with value "<RegexName>"
    And I set the parameter "RegexExpression" with value "<RegexExpression>"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    Examples:
      | RegexName   | RegexExpression         |
      | AutoRegex   | (?<AutoRegex>\d+)       |
      | AutoExtract | (?<AutoExtract>\w+)     |

  Scenario: 验证正则解析
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "AutoRegex:" exist
    Then I will see the field "AutoExtract:" exist

  Scenario: 字段萃取_修改正则解析
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AddExtract_regex" will be visible

    And I set the parameter "RegexExpression" with value "\w+"
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 验证修改后的字段萃取_正则解析
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "AutoExtract:" exist
    Then I will see the spl search result data "AutoRegex:" doesn't exist

  Scenario: 字段萃取_删除正则解析
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AutoRegexDelete" will be visible
    And I click the "AutoRegexDelete" button
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 字段萃取_正则解析_开启全局共享
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AddExtract_regex" will be visible
    And I click the "AutoExtractGlobalShared" button
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 验证全局共享_页面验证
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldExtract" will be visible
    And I click the "FieldExtract" button
    And I wait for element "AutoExtractGlobal" change text to "来自"

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "app之api全部用例" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "FieldExtract" will be visible
    And I click the "FieldExtract" button
    And I wait for element "AutoExtractGlobal" change text to "来自"

    Given open the "autoProps.ListPage" page for uri "/fieldconfig/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page
    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AddExtract_ts" will be visible
    And I wait for element "AutoExtractGlobal" change text to "来自"

  Scenario: 验证全局共享_搜索验证
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AppFieldConfig"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "AutoExtract:" exist

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "app之api全部用例"
    Then I will see the "splSearch.SearchPage" page
    And I click the "Search" button
    Given open the "app.ListPage" page for uri "/app/1/search/"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "AutoExtract:" exist

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "AutoExtract:" exist

  Scenario: 字段萃取_正则解析_关闭全局共享
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Extract" will be visible
    And I click the "Extract" button
    And I wait for "AddExtract_regex" will be visible
    And I click the "AutoExtractGlobalShared" button
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario: 验证关闭全局共享
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AppFieldConfig"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the spl search result data "AutoExtract:" doesn't exist

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "app之api全部用例"
    Then I will see the "splSearch.SearchPage" page
    And I click the "Search" button
    Given open the "app.ListPage" page for uri "/app/1/search/"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "appname:apache | stats count() by AutoExtract"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "appname:apache"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    And I click the "RightIcon" button
    Then I will see the field "AutoExtract:" exist
















