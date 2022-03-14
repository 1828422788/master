@autoprops @alias @autopropsSmoke
Feature: 字段别名

  #  详细功能参见testlink中RZY-5353隶属文件夹【字段别名】中的配置

  Background:
    Given open the "autoProps.ListPage" page for uri "/fieldconfig/"

  Scenario: 添加字段别名成功
    Given I click the "AddButton" button
    And I choose the "default_search" from the "AppName"
    And I click the "Ensure" button
    Then I will see the "autoProps.CreatePage" page

    And I click the "Alias" button
    And I wait for "AddAlias" will be visible
    And I click the "AddAlias" button

    And I set the parameter "AliasName" with value "AutoAlias"
    And I set the parameter "OriginalField" with value "apache.resp_len"
    And I set the parameter "FieldAlias" with value "resp_len"
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AliasMapping" change text to "apache.resp_len AS resp_len"
    And I wait for element "AliasGlobal" change text to "否"

  Scenario: 添加影响应用失败_重复
    Given I click the "AddButton" button
    And I choose the "default_search" from the "AppName"
    And I click the "Ensure" button
    And I wait for "HelpMessage" will be visible

  Scenario: 添加影响应用失败_
    Given I click the "AddButton" button
    And I choose the "default_search" from the "AppName"
    And I click the "Ensure" button
    And I wait for "HelpMessage" will be visible

  Scenario Outline: 添加字段别名失败
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Alias" will be visible
    And I click the "Alias" button
    And I wait for "2000" millsecond
    And I click the "AddAlias" button

    And I set the parameter "AliasName" with value "<aliasname>"
    And I set the parameter "OriginalField" with value "<original>"
    And I set the parameter "FieldAlias" with value "<alias>"
    And I click the "Save" button under some element
    And I will see the element "WarningInfo" name is "<warning>"

    Examples:
      | aliasname     | original | alias | warning              |
      |          |    test  |  test  | 请输入别名名称        |
      |AutoAlias|  test     | test   |名称重复               |
      | 中文      |          |       | 名称由字母、数字和下划线组成 |
      | #%autotest |          |       | 名称由字母、数字和下划线组成 |
      | auto_te st |          |       | 名称由字母、数字和下划线组成 |
      | test     | test     |         | 请输入字段别名        |
      | test     |          |test     | 请输入字段原名        |

  Scenario: 新增字段别名
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I wait for "Alias" will be visible
    And I click the "Alias" button
    And I wait for "AddAlias" will be visible
    And I click the "AddAlias" button

    And I set the parameter "AliasName" with value "AutoNewName"
    And I set the parameter "OriginalField" with value "appname"
    And I set the parameter "FieldAlias" with value "name"
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"

  Scenario Outline: 验证字段别名
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(1)"

    Examples:
      | spl                                   |
      | * \|stats count() by name \| limit 1 |
      | * \|stats count() by resp_len \| limit 1  |

  Scenario: 更改别名映射
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I click the "Alias" button
    And I wait for "AddAlias" will be visible
    When the data name is "AutoAlias" then i click the "编辑" button
    And I set the parameter "OriginalField" with value "apache.geo.country"
    And I set the parameter "FieldAlias" with value "COUNTRY"
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AliasMapping" change text to "apache.geo.country AS COUNTRY"

  Scenario Outline: 增加别名映射
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I click the "Alias" button
    And I wait for "AddAlias" will be visible
    When the data name is "AutoAlias" then i click the "编辑" button
    And I wait for "AddAliasMap" will be visible
    And I click the "AddAliasMap" button
    And I set the parameter "OriginalField" with value "<OriginalField>"
    And I set the parameter "FieldAlias" with value "<FieldAlias>"
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AliasMapping" change text to "<aliasMapping>"
    Examples:
    | OriginalField | FieldAlias| aliasMapping |
    | apache.status | STATUS    |apache.geo.country AS COUNTRY, apache.status AS STATUS|
    | apache.resp_len| ART      |apache.geo.country AS COUNTRY, apache.status AS STATUS, apache.resp_len AS ART|
    | apache.geo.city| CITY     |apache.geo.country AS COUNTRY, apache.resp_len AS ART, apache.status AS STATUS, apache.geo.city AS CITY |

  Scenario Outline: 验证编辑后字段别名
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
    Examples:
    | spl |
    |* \| where apache.geo.country == COUNTRY && apache.geo.city == CITY|
    |* \| where apache.resp_len == ART && apache.status == STATUS       |
    |* \| where appname == name                                         |

  Scenario: 删除别名映射
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I click the "Alias" button
    And I wait for "AddAlias" will be visible
    When the data name is "AutoAlias" then i click the "编辑" button
    And I click the "AliasMappingDelete" button
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AliasMapping" change text to "apache.geo.country AS COUNTRY, apache.resp_len AS ART, apache.status AS STATUS"

  Scenario: 验证删除别名映射成功
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | stats count() by CITY"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "StatsNum" change text to "统计(0)"

  Scenario: 删除字段别名
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I click the "Alias" button
    And I wait for "AddAlias" will be visible
    When the data name is "AutoNewName" then i click the "删除" button in more menu
    And I wait for "EnsureText" will be visible
    And I click the "EnsureDelete" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除成功"

  Scenario: 开启全局共享
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I click the "Alias" button
    And I wait for "AddAlias" will be visible
    When the data name is "AutoAlias" then i click the "编辑" button
    Then I wait for "GlobalShared" will be visible
    And I click the "GlobalShared" button
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AliasGlobal" change text to "是"

  Scenario: 验证全局共享_页面验证
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "AddFieldAlias" will be visible
    And I wait for element "AliasGlobal" change text to "来自"

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When the data name is "app之api全部用例" then i click the "编辑" button
    Then I will see the "app.CreatePage" page
    And I click the "FieldConfig" button
    And I wait for "AddFieldAlias" will be visible
    And I wait for element "AliasGlobal" change text to "来自"

    Given open the "autoProps.ListPage" page for uri "/fieldconfig/"
    When the data name is "AppFieldConfig" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page
    And I click the "Alias" button
    And I wait for "AddAlias" will be visible
    And I wait for element "AliasGlobal" change text to "来自"

  Scenario: 验证全局共享_搜索验证
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AppFieldConfig"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | where apache.resp_len == ART"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "app之api全部用例"
    Then I will see the "splSearch.SearchPage" page
    And I click the "Search" button
    And I set the parameter "SearchInput" with value "* | where apache.resp_len == ART"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | where apache.resp_len == ART"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"

  Scenario: 关闭全局共享
    When the data name is "default_search" then i click the "编辑" button
    Then I will see the "autoProps.CreatePage" page

    And I click the "Alias" button
    And I wait for "AddAlias" will be visible
    When the data name is "AutoAlias" then i click the "编辑" button
    Then I wait for "GlobalShared" will be visible
    And I click the "GlobalShared" button
    And I click the "Save" button under some element
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "更新成功"
    And I wait for element "AliasGlobal" change text to "否"

  Scenario: 验证关闭全局共享
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "AppFieldConfig"
    Then I will see the "splSearch.SearchPage" page
    And I set the parameter "SearchInput" with value "* | where apache.resp_len == ART"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventNumbers" change text to "事件(0)"

    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for loading invisible
    When  I click the detail which name is "app之api全部用例"
    Then I will see the "splSearch.SearchPage" page
    And I click the "Search" button
    And I set the parameter "SearchInput" with value "* | where apache.resp_len == ART"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventNumbers" change text to "事件(0)"

    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for loading invisible
    And I set the parameter "SearchInput" with value "* | where apache.resp_len == ART"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for element "EventsTitle" change text to "事件列表"
