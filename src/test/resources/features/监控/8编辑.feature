@alert @alertSmoke @second
Feature: 编辑一个告警

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario:
    When the data name is "RZY-436：SPL统计监控步骤1(副本)" then i click the "编辑" button
    And I will see the "alert.CreatePage" page
    And I set the parameter "AlertName" with value "RZY-436:SPL统计监控步骤2"
    And I set the parameter "AlertTriggerRightInput" with value "计数"
    And I set the parameter "AlertLevelInput" with value "3"
    And I set the parameter "MiddleLevelInput" with value "5"
    And I set the parameter "HighLevelInput" with value "10"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"