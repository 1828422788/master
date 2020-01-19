
@dataset
Feature: 查询数据集jnd

  @dataset
  Scenario Outline: 按资源查询
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I wait for loading invisible
    When I choose the "<GroupList>" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "<name>"


    Examples:
      |GroupList     |name    |
      |auto_package  |分组和应用|