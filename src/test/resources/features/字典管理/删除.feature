@clean @cleanSecond
Feature: 字典管理删除

  Background:
    Given open the "dictionary.ListPage" page for uri "/dictionary/"

  Scenario Outline: 删除字典管理
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button

    Examples:
      | name         |
      | AutoTest.csv |

  Scenario Outline: 删除字典分组
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I wait for loading invisible
    Given I set the search input with "<name>"
    And I wait for loading invisible
    When the data name is "<name>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name         |
      | 字典分组AutoTest |
