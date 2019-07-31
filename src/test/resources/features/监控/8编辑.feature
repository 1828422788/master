@alert @alertSmoke @second
Feature: 监控编辑

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario:
    When the data name is "RZY-434:字段统计监控步骤1" then i click the "编辑" button
    And I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I set the parameter "AlertLevelInput" with value "0"
    And I set the parameter "MiddleLevelInput" with value "300"
    And I set the parameter "HighLevelInput" with value "400"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"