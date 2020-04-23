@dataset
Feature: 数据集-在趋势图中的应用

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"




  Scenario Outline: 父子行为无
    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为无的数据集
    And I click the "fatherChildNull" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "saveTrend" button
    And I set the parameter "trendName" with value "<trendName>"
    And I click the "EnsureCrontab" button
    And I will see the success message "创建成功"
    And I click the "trendEnsureAfterEnsure" button
      #趋势图中的验证数据集
    And I click the "upperTrend" button
    And I will see the "trend.ListPage" page
    And I wait for loading invisible
    When the data name is "<trendName>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible
    And I click the "zhanKai" button
    Then I will see the "dataSetPosition" result will be "<dataSetResult>"



    Examples:
      |spl                         |trendName|dataSetResult|
      |*\| stats count() by appname|父子无    |tag:sample* |







  Scenario Outline: 父子行为汇聚
    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为汇聚的数据集
    And I click the "huiJu" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "saveTrend" button
    And I set the parameter "trendName" with value "<trendName>"

    And I click the "EnsureCrontab" button
    And I will see the success message "创建成功"
    And I click the "trendEnsureAfterEnsure" button
      #趋势图中的验证数据集
    And I click the "upperTrend" button
    And I will see the "trend.ListPage" page
    And I wait for loading invisible
    When the data name is "<trendName>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible

    And I click the "zhanKai" button
    Then I will see the "dataSetPosition" result will be "<dataSetResult>"



    Examples:
      |spl                         |trendName  |dataSetResult|
      |*\| stats count() by appname|父子汇聚    |* AND tag:sample* AND (tag:beyond4 OR appname:apache)|





  Scenario Outline: 父子行为继承
    Given I set the parameter "SearchInput" with value "<spl>"
        #选择父子行为为继承的数据集
    And I click the "jiCheng" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "SaveAsOther" button
    And I click the "saveTrend" button
    And I set the parameter "trendName" with value "<trendName>"

    And I click the "EnsureCrontab" button
    And I will see the success message "创建成功"
    And I click the "trendEnsureAfterEnsure" button
      #趋势图中的验证数据集
    And I click the "upperTrend" button
    And I will see the "trend.ListPage" page
    And I wait for loading invisible
    When the data name is "<trendName>" then i click the "编辑" button
    Then I will see the "trend.CreatePage" page
    And I wait for loading invisible

    And I click the "zhanKai" button
    Then I will see the "dataSetPosition" result will be "<dataSetResult>"


    Examples:
      |spl                         |trendName|dataSetResult|
      |*\| stats count() by appname|父子继承  |* AND tag:sample*|