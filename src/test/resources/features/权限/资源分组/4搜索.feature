@resourceGroups @all @resourceGroupsSmoke @smoke
Feature: 资源分组搜索（RZY-534）

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  Scenario: 按照分组搜索
    Given I choose the "仪表盘" from the "SearchDropdown"
    And I wait for loading invisible
    Then I will see the search result "{'column':'1','name':'仪表盘'}"

  Scenario: 根据搜索框搜索
    And I wait for loading invisible
    Given I set the search input with "Auto"
    And I click the "Search" button under some element
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'Auto'}"