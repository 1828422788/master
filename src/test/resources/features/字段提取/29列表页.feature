@configs @configsListPage
Feature: 字段提取列表页

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible

  Scenario Outline: 按名称过滤
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"

    Examples:
      | name     | appName    |
      | wym按名称过滤 | filtByName |

  Scenario Outline: 选择标签并按照标签过滤1
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | name     | appName   |
      | wym按标签过滤 | filtByTag |

  Scenario Outline: 选择标签并按照标签过滤2
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'<name>'}"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button in more menu
    And I choose the new value "configtag" from the "TagField"
    And I click the "Ensure" button
    And I wait for loading invisible
    Then I refresh the website
    And I wait for loading invisible

    When I choose the "configtag" from the "TagFilter"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'<name>'}"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "标签" button in more menu
    And I cancel selection "configtag" from the "TagField"
    And I click the "Ensure" button
    And I wait for loading invisible
    And I will see the text "暂无数据" exist in page

    Examples:
      | name     |
      | wym按标签过滤 |