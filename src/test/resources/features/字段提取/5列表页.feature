@all @smoke @configs @configsSmoke @configs28
Feature: 字段提取列表页

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible

  Scenario Outline: 按名称过滤
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I click the "AddRule" button
    Then I wait for "500" millsecond
    And I choose the "JSON解析" from the "ParseRule" in config
    Then I wait for "500" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "500" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "500" millsecond
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    Examples:
      | name     | appName    |
      | wym按名称过滤 | filtByName |


  Scenario Outline: 选择标签并按照标签过滤
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I click the "AddRule" button
    Then I wait for "500" millsecond
    And I choose the "JSON解析" from the "ParseRule" in config
    Then I wait for "500" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "500" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "500" millsecond
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button in more menu
    Then I set the parameter "TagInput" with value "configtag"
    And I choose the "configtag" from the "TagGroup" in config
    And I click the "Ensure" button
    Then I wait for loading invisible
    Then I refresh the website
    And I wait for loading invisible
    And I choose the "configtag" from the "ResourceDropdown" in config
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'<name>'}"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button in more menu
    And I cancel selection "configtag" from the "TagGroup" in config
    And I click the "Ensure" button
    Then I wait for loading invisible
    And I will see the "SearchResultIsEmpty" result will be "暂无数据"


    Examples:
      | name     | appName   |
      | wym按标签过滤 | filtByTag |

  Scenario: 验证运行统计是否自动关闭
    Then I will see the "SwitchButton" is "ant-switch-small ant-switch"