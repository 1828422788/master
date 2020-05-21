@dataset
Feature: 数据集-13在搜索页

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    #And I wait element "SearchStatus" change text to "搜索完成!"


  Scenario: 父子行为无
    And I click the "fatherChildNull" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "zhanKai" button
       #验证内容是：tag:sample*
    And I will see the "dataSetPosition" result will be "tag:sample*"
    And I refresh the website
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "zhanKai" button
       #验证内容是：tag:sample*
    Then I will see the "dataSetPosition" result will be "tag:sample*"



  Scenario: 父子行为汇聚
    When I click the "huiJu" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "zhanKai" button
    #验证内容是：* AND tag:sample* AND (tag:beyond4 OR appname:apache)
    And I will see the "dataSetPosition" result will be "* AND tag:sample* AND (tag:beyond4 OR appname:apache)"
    And I refresh the website
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "zhanKai" button
    #验证内容是：* AND tag:sample* AND (tag:beyond4 OR appname:apache)
    And I will see the "dataSetPosition" result will be "* AND tag:sample* AND (tag:beyond4 OR appname:apache)"



  Scenario: 父子行为为：继承
    When I click the "jiCheng" button
    And I click the "DateEditor" button
    And I click the "RecentSevenDay" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "zhanKai" button
    #验证内容是： * AND tag:sample*
    Then I will see the "dataSetPosition" result will be "* AND tag:sample*"
    And I refresh the website
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "zhanKai" button
    #验证内容是： * AND tag:sample*
    Then I will see the "dataSetPosition" result will be "* AND tag:sample*"
