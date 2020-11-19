@all @timedTask @timedTaskLookUp
Feature: 定时任务查看

  Scenario: view
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading complete
    And I set the parameter "SearchInput" with value "crontab_7min"
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    When the data name is "{'column':'1','name':'crontab_7min'}" then i click the "crontab_7min" button
    Then I will see the "timedTask.DetailPage" page
    And I wait for "LookUpButton" will be visible
    And I click the "LookUpButton" button
    And I wait for "5000" millsecond
    And switch to another window
    And I close all tabs except main tab
    And I will see the "splSearch.SearchPage" page
    And I wait for "3000" millsecond
    And I will see the input element "DateEditor" value will be "-1d,now"