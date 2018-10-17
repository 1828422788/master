@timedTask @all @smoke
Feature: 定时任务详情页截图

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    Given I click the detail which name is "<name>"
    When I click the button "LookUpButton" if exist
    And take a screenshot

    Examples:
      | name               |
      | sxjAutoTest        |
      | lineAutoTest       |
      | wordcloudAutoTest  |
      | singleAutoTest     |
      | liquidfillAutoTest |
      | areaAutoTest       |
      | columnAutoTest     |
      | scatterAutoTest    |
      | pieAutoTest        |
      | roseAutoTest       |
      | barAutoTest        |
      | multiaxisAutoTest  |
      | chordAutoTest      |
      | sankeyAutoTest     |
      | forceSunAutoTest   |
      | sequenceAutoTest   |
      | rangelineAutoTest  |

  Scenario: 删除所有自动化新建的定时任务
    Then I delete from "SavedSchedule" where "{'name':['rangelineAutoTest','sequenceAutoTest','forceSunAutoTest','sankeyAutoTest','chordAutoTest','multiaxisAutoTest','barAutoTest','roseAutoTest','pieAutoTest','scatterAutoTest','columnAutoTest','areaAutoTest','liquidfillAutoTest','singleAutoTest','wordcloudAutoTest','lineAutoTest','sxjAutoTest','forceAutoTest']}"

