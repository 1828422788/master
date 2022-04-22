@dataset @datasetDelete
Feature: 数据集_02删除

  Background:
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible

  Scenario: 新建删除数据集
    When I click the "Create" button
    And I set the parameter "Name" with value "delete测试"
    And I set the parameter "Alias" with value "delete"
    And I set the parameter "Spl" with value "*"
    And I click the "Ensure" button
    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
    And I click the "Return" button

  Scenario Outline: RZY-4079:删除数据集
    When I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'<name>'}" then i click the "删除" button in more menu
    Then I will see the message "确定删除该数据集？"
    When I click the "Ensure" button
    And I will see the success message "删除数据集成功"
    And I refresh the website
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      |name      |
      |delete测试|