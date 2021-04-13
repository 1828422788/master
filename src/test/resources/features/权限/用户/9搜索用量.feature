#@users @all
Feature: 用户搜索用量

  Background:
    Given open the "users.UsagePage" page for uri "/usage/"

  Scenario:
    Given I click the "SearchButton" button
    Then I will see the error message "请输入时间范围"

  Scenario:
    Given I click the "DateButton" button
    And I set the parameter "StartData" with value "2018-09-04"
    And I set the parameter "StartTime" with value "00:00:00.000"
    And I wait for "1000" millsecond
    And I click the " StartTime" button
    And I set the parameter "EndData" with value "2018-09-05"
    And I set the parameter "EndTime" with value "00:00:00.000"
    And I click the " EndTime" button
    And I click the "Confirm" button
    And I click the "SearchButton" button
    Then take a screenshot

  Scenario:
    Given I click the "DateButton" button
    And I wait for "1000" millsecond
    And I set the parameter "StartData" with value "2018-09-05"
    And I wait for "1000" millsecond
    And I set the parameter "StartTime" with value "00:00:00.000"
    And I set the parameter "EndData" with value "2018-09-04"
    And I wait for "1000" millsecond
    And I set the parameter "EndTime" with value "00:00:00.000"
    And I let element "StartTime" lose focus
    And I click the "Confirm" button
    And I click the "SearchButton" button
    Then I will see the error message "请输入时间范围"

  Scenario:
    Given I click the "DateButton" button
    And I set the parameter "EndData" with value "2018.9.4"
    And I let element "EndData" lose focus
    Then I will see the element " EndData" value contains "2018-09-04"
   # And I let element "EndTime" lose focus
   # Then I will see the error message "请输入正确的日期格式：yyyy-MM-dd"

