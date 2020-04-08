@dataset
Feature: 数据集按应用查询

  @dataset
  Scenario: 按应用查询
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    Given I choose the "无数集app之api全部测试用例" from the "appSearch"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'分组和应用'}"