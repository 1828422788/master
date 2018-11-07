@all @smoke @alert @alertSmoke
Feature: 监控删除

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDeleteButton" button
    Then I will see the success message "删除成功"

    Examples:
      | name     |
      | AutoTest |

