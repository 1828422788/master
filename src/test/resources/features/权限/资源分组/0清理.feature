@clean
Feature: 资源分组清理

  Scenario Outline:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
#    When I set the search input with "<name>"
    And the data name is "<name>" then i click the "删除" button
    Then I click the "MessageBoxOKButton" button

    Examples:
      | name                 |
      | AutoTestNew          |
      | AutoTestForKnowledge |

  Scenario:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    When the data name is "孙小晶" then i click the "删除" button
    And I click the "EnsureDeleteButton" button
