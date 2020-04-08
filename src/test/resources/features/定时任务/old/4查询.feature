#@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务查询

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline: 根据定时任务分组进行查询
    Given I click the "GroupDropdown" button
    And I wait for "GroupDropdownList" will be visible
    And I choose the "default_SavedSchedule" from the "GroupDropdownList"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'<name>'}"

    Examples:
      | name                      |
      | RZY-397:定时任务sample_昨天(副本) |

  Scenario Outline: 根据搜索内容进行查询
    Given I set the parameter "SearchInput" with value "<inputName>"
    And I click the "SearchIcon" button
    And I wait for loading invisible
    Then I will see the list of "" contains "" or I see the "Names" contains "<inputName>"

    Examples:
      | inputName                  |
      | RZY-396:定时任务_sample_表格_近一天 |
