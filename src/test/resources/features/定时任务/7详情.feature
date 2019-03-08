#@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务详情页截图

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    Given I click the detail which name is "<name>"
    And I will see the "timedTask.DetailPage" page
    When I click the button "LookUpButton" if exist
    And I wait for "1000" millsecond

    Examples:
      | name               |
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