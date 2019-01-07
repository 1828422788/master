@report @all @smoke @reportSmoke
Feature: 报表编辑（RZY-129）

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline: 修改趋势图布局设计
    When the data name is "<dataName>" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I choose the "<runningUser>" from the "RunningUser"
    And I set the parameter "Subject" with value "<subject>"
    Then I click the "NextButton" button
    And I click the "Layout2" button
    Then I click the "<layout>" button
    Then I click the "Save" button
    Then I will see the success message "保存成功"

    Examples: 保存成功
      | dataName        | name                 | runningUser | subject                       | layout  |
      | 改为面积图散点图sample2 | 改为面积图散点图sample2(PDF) | AutoTest    | 报表名称：<%report_name%>, 第三种布局方式 | Layout3 |