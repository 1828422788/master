@indexSetting @indexSettingSmoke @third
Feature: 索引-yotta默认索引信息编辑（RZY-1477至1480）

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/"
    And I wait for loading invisible

  Scenario Outline:
    Given the data name is "{'column':'0','name':'yotta'}" then i click the "编辑" button
    Then I will see the "index.CreatePage" page
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I choose the "<divideTimeDropDown>" from the "DivideTimeDropDown"
    And I click the "SavedButton" button
    And I will see the element "Message" name is "保存成功"
    Examples:
      | divideTime | divideTimeDropDown | message     |
      | 1          | 月                  | 保存成功 |
      | 1          | 年                  | 保存成功 |
      | 1          | 小时                   | 保存成功        |
      | 1          | 天                   | 保存成功        |

  Scenario: 计划查看
    Given the data name is "{'column':'0','name':'yotta'}" then i click the "编辑" button
    And I click the "look" button
    And I will see the element "ScheduleMessage" name is "计划查看"