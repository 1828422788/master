#@alertss @alertSmoke @third
Feature: 监控分组

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "分组" button
    When I cancel selection "default_Alert" from the "ChangeGroup"
    And I click the "EnsureButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name                  |
      | RZY-434:字段统计监控步骤5(副本) |