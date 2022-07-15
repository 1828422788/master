@userGroups @all
Feature: 用户分组搜索

  Background:
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"

  Scenario: 搜索
    When I set the parameter "TextFilter" with value "AutoTestForEdit"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'AutoTestForEdit'}"


