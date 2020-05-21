@dataset
Feature: 数据集-4按应用查询


  Scenario: 按应用查询
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    And I choose the "无数集app之api全部测试用例" from the "appSearch"
    And I wait for loading invisible
#    Then I will see the search result contains "{'column':'0','name':'分组和应用'}"
    Then I will see the data "{'column':'0','name':'分组和应用'}" values "{'column':'4','name':'无数集app之api全部测试用例'}"


