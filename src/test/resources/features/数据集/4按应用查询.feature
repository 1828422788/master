@dataset
Feature: 数据集-按应用查询

@dataset123
  Scenario: 按应用查询
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    And I choose the "AutoTestAppWithAllResources" from the "appSearch"
    And I wait for loading invisible
#    Then I will see the search result contains "{'column':'0','name':'分组和应用'}"
    Then I will see the data "{'column':'0','name':'分组和应用'}" values "{'column':'4','name':'AutoTestAppWithAllResources'}"


