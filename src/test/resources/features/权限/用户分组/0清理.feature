@smoke @userGroups @all @userGroupsSmoke
Feature:

  Background:
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "删除" button
    And I click the "MessageBoxOKButton" button

    Examples:
      | name            |
      | AutoTestGroup   |
      | AutoTestForUser |