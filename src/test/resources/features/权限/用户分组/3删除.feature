@smoke @userGroups @all @userGroupsSmoke
Feature: 用户分组删除

  Background:
    Given Create a "userGroup" with "{'name':'AutoTest','owner':['admin'],'role':['admin']}"
    And open the "userGroups.ListPage" page for uri "/account/usergroups/"

  Scenario Outline:
    Given I set the parameter "SearchInput" with value "<name>"
    And I wait table element "SearchResultTable-1.2" change text to "<name>"
    And I click the table "TableDeleteButton-1" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'1','name':'<name>','contains':'no'}"

    Examples:
      | name            |
      | AutoTestForEdit |
