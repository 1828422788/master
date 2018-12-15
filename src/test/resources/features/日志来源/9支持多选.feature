@resourceGroups @all @smoke @resourceGroupsSmoke
Feature: 日志来源支持多选

  Scenario: 搜索页面URL参数支持多个日志来源（RZY-2064）
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "ArrowDown" button
    And I click the "Sunxjautotest" button
    Then I will see the element "Sup" name is "2"