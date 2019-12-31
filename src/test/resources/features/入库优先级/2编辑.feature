@indexSetting @indexSettingSmoke @priority
Feature: 入库优先级编辑（RZY-1487）

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/ingestpriority/"
    Given the data name is "{'column':'0','name':'autotest'}" then i click the "编辑" button without paging
    Then I will see the "ingestPriority.CreatePage" page

  Scenario Outline:
    When I choose the "<priority>" from the "Priority"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button
    And I refresh the website
#    Then I will see the search result contains "{'column':'3','name':'<priority>'}"

    Examples:
      | priority |
      | 高        |
      | 中        |
      | 低        |
