@configs @configs2
Feature: 字段提取禁用/启用

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

  Scenario Outline: 单个规则禁用、启用
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I click the "AddRule" button
    Then I wait for "500" millsecond
    And I choose the "JSON解析" from the "ParseRule" in config
    Then I wait for "500" millsecond
    And I choose the "raw_message" from the "SourceField" in config
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

    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    Then I refresh the website
    And I wait for loading invisible
    Then I will see the element "{'column':'1','name':'<name>'}" is "open"
    When the data name is "{'column':'1','name':'<name>'}" then I "close" the switch
    Then I refresh the website
    And I wait for loading invisible
    Then I will see the element "{'column':'1','name':'<name>'}" is "close"

    Examples:
      | name       | appName |
      | 禁用和启用 | wym_disable |