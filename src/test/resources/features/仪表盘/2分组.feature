@dashboard @all @smoke @dashboardSmoke
Feature: 仪表盘分组

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "分组" button
    Then I cancel selection "<group>" from the "GroupInput"
    And I click the "EnsureChangeGroupButton" button
    Then I will see the success message "请至少选择一个仪表盘分组"
    And I choose the "<newGroup>" from the "GroupInput"
    And I click the "EnsureChangeGroupButton" button
    And I refresh the website
    Then I will see the data "<name>" values "{'column':'2','name':'<newGroup>'}"

    Examples:
      | name     | group                       | newGroup                                                      |
      | autotest | AutoTestRoleWithAllResource | AutoTestRoleWithAllResource, AutoTestRoleWithAuth&SourceGroup |