@dataset
Feature: 数据集-在定时任务详情页

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"
    And I wait for loading invisible


  Scenario Outline: 父子无
    Given I click the detail which name is "{'column':'2','name':'父子行为无'}"
    And I will see the "timedTask.DetailPage" page
    And I wait for "3000" millsecond
    Then I will see the "detailDataSet" result will be "<dataSetResult>"


    Examples:
      |dataSetResult  |
      |(tag:sample*)   |



  Scenario Outline: 父子汇聚

    Given I click the detail which name is "{'column':'2','name':'父子行为汇聚'}"
    And I will see the "timedTask.DetailPage" page
    And I wait for "3000" millsecond
    Then I will see the "detailDataSet" result will be "<dataSetResult>"


    Examples:
       |dataSetResult|
       |(* AND tag:sample* AND (tag:beyond4 OR appname:apache))   |





  Scenario Outline: 父子继承
    Given I click the detail which name is "{'column':'2','name':'父子行为继承'}"
    And I will see the "timedTask.DetailPage" page
    And I wait for "3000" millsecond
    Then I will see the "detailDataSet" result will be "<dataSetResult>"


    Examples:
        |dataSetResult|
        |(* AND tag:sample*)|
