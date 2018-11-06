@smoke @all @resourceGroups @resourceGroupsSmoke
Feature: 资源分组删除

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"
    And I click the "EnsureButton" button
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name          |
      | sunxjAutoTest |
