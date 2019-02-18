@clean
Feature: 应用删除

  Scenario Outline:
    Given open the "app.ListPage" page for uri "/app/list/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I will see the success message "删除成功"
    And I refresh the website
    Then I will see the data "AutoTest" is not available on the list

    Examples:
      | name                        |
      | AutoTestApp                 |
      | AutoTestAppWithAllResources |

  Scenario Outline: 删除对应的资源分组
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    When I set the search input with "<name>"
    And the data name is "<name>" then i click the "删除" button
    Then I click the "MessageBoxOKButton" button

    Examples:
      | name                        |
      | AutoTestSourceForApp        |
      | AutoTestApp                 |
      | AutoTestAppWithAllResources |


