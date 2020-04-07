@dataset
Feature: 定时任务详情页的数据集

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible

  @dataset
  Scenario Outline: 父子无
    Given I click the detail which name is "{'column':'2','name':'无'}"
    And I will see the "timedTask.DetailPage" page
    And I wait for "3000" millsecond
    Then I will see the "detailDataSet" result will be "<dataSetResult>"


    Examples:
      |dataSetResult  |
      |(tag:sample*)   |


  @dataset
  Scenario Outline: 父子汇聚

    Given I click the detail which name is "{'column':'2','name':'汇聚'}"
    And I will see the "timedTask.DetailPage" page
    And I wait for "3000" millsecond
    Then I will see the "detailDataSet" result will be "<dataSetResult>"


    Examples:
       |dataSetResult|
       |(* AND tag:sample* AND (tag:beyond4 OR appname:apache))   |




  @dataset
  Scenario Outline: 父子继承
    Given I click the detail which name is "{'column':'2','name':'继承'}"
    And I will see the "timedTask.DetailPage" page
    And I wait for "3000" millsecond
    Then I will see the "detailDataSet" result will be "<dataSetResult>"


    Examples:
        |dataSetResult|
        |(* AND tag:sample*)|
