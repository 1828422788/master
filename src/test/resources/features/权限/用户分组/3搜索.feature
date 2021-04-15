@userGroups @all
Feature: 用户分组搜索

  Background:
    Given open the "userGroups.ListPage" page for uri "/account/usergroups/"

  Scenario: 搜索
    When I set the parameter "SearchInput" with value "AutoTestForEdit"
    And I wait for "3000" millsecond
    Then I will see the search result "{'column':'1','name':'AutoTestForEdit'}"


