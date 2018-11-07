@timedTask @all @smoke
Feature: 定时任务查询

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline: 根据定时任务分组进行查询
    Given I choose the "<group>" from the "GroupList"
    Then I will see the special column contains "<name>"

    Examples:
      | group                 | name        |
      | default_SavedSchedule | sxjAutoTest |

  Scenario Outline: 根据搜索内容进行查询
    Given I set the parameter "SearchInput" with value "<inputName>"
    Then I will see the list of "" contains "" or I see the "Names" contains "<inputName>"

    Examples:
      | inputName |
      | sxj       |
