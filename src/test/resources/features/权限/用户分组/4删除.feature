@smoke @userGroups @all @userGroupsSmoke
Feature: 用户分组删除（RZY-1180）

  Scenario: 删除用户分组
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    When the data name is "{'column':'1','name':'AutoTestForEdit'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button

  Scenario: 验证用户分组删除成功
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"
    Then I will see the search result "{'column':'1','name':'AutoTestForEdit','contains':'no'}"
