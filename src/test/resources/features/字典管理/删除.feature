Feature: 字典管理删除

  Background:
    Given open the "dictionary.ListPage" page for uri "/dictionary/"

  Scenario Outline: 删除字典管理
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    Then I will see the success message "删除成功"
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name         |
      | AutoTest.csv |