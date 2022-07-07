@configs @configsCopy
Feature: 字段提取复制、编辑

  Scenario Outline:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "NextButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button in more menu
    And I wait for "SuccessMessage" will be invisible
    Then I will see the search result contains "{'column':'1','name':'<name>(副本)'}"
    When the data name is "{'column':'1','name':'<name>(副本)'}" then i click the "编辑" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "NextButton" button
    When I set the parameter "Name" with value "<name>的副本"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "更新成功"
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'<name>的副本'}"

    Examples:
      | name  | appName       |
      | wym复制和编辑 | wym_copy_edit |


