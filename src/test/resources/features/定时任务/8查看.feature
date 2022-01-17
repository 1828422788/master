@timedTask @timedTaskLookUp @timedTaskSmoke
Feature: 定时任务查看

  Scenario Outline: 查看定时任务
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for "Loading" will be invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "<name>" button
    Then I will see the "timedTask.DetailPage" page
    And I wait for "LookUpButton" will be visible
    And I click the "LookUpButton" button
    And I wait for "5000" millsecond
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    And I wait for "3000" millsecond
    And I will see the element "DateEditor" contains "最近1天"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the element "ScheduleNameDetail" contains "<name>"

    Examples:
    | name            |
    | crontab_7min    |