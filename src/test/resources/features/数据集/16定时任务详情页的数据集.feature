@dataset
Feature: 定时任务详情页的数据集

  Background:
    Given open the "timedTask.ListPage" page for uri "/schedule/"


  @dataset
  Scenario Outline: 父子无
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Given I click the detail which name is "{'column':'2','name':'无'}"
    And I will see the "timedTask.DetailPage" page
    And I wait for loading invisible
    Then I will see the "detailDataSet" result will be "<dataSetResult>"


    Examples:
      |name|dataSetResult  |
      |无  |(tag:heka)     |


  @dataset
  Scenario Outline: 父子汇聚
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Given I click the detail which name is "{'column':'2','name':'汇聚'}"
    And I will see the "timedTask.DetailPage" page
    And I wait for loading invisible
    Then I will see the "detailDataSet" result will be "<dataSetResult>"


    Examples:
      |name   |dataSetResult|
      |汇聚    |(* AND tag:heka AND (tag:top_info OR appname:apache))   |




  @dataset
  Scenario Outline: 父子继承
    And I set the parameter "SearchInput" with value "<name>"
    And I wait for loading invisible
    Given I click the detail which name is "{'column':'2','name':'继承'}"
    And I will see the "timedTask.DetailPage" page
    And I wait for loading invisible
    Then I will see the "detailDataSet" result will be "<dataSetResult>"


    Examples:
      |name   |dataSetResult|
      |继承    |(* AND tag:heka)|
