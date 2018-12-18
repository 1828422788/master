@timedTask @all @smoke @timedTaskSmoke
Feature: 定时任务删除（RZY-412）

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"
    And I refresh the website
    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name               |
      | sxjAutoTest(1)     |
      | sxjAutoTest        |
      | rangelineAutoTest  |
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
      | forceAutoTest      |
      | sequenceAutoTest   |
