@dataset @datasetg @dataset2
Feature: 数据集-g在搜索页，前置-数据集-f构建树形结构

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the fixed side

  Scenario: RZY-4085:父子行为-无
    When the dataset is "无tree" then I "expand" the item
    When I click the "fatherChildNull" button
    When I click the "DateEditor" button
    #And I click the "RecentSevenDay" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I drag the element "SearchPageSvg" to the "right" side
    And I click the "zhanKai" button
       #验证内容是：tag:sample*
    And I will see the "dataSetPosition" result will be "tag:sample*"
    And I refresh the website
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "zhanKai" button
       #验证内容是：tag:sample*
    Then I will see the "dataSetPosition" result will be "tag:sample*"

  Scenario: RZY-4083:父子行为-汇聚
    When I click the "huiJu" button
    When I click the "DateEditor" button
    #And I click the "RecentSevenDay" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "zhanKai" button
    #验证内容是：* AND tag:sample* AND (tag:beyond4 OR appname:apache)
#    And I will see the "dataSetPosition" result will be "* AND tag:sample* AND (tag:beyond4 OR appname:apache)"
    And I will see the "dataSetPosition" result will be "(*) AND (tag:sample*) AND ((tag:beyond4) OR (appname:apache))"
    And I refresh the website
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "zhanKai" button
    #验证内容是：* AND tag:sample* AND (tag:beyond4 OR appname:apache)
    And I will see the "dataSetPosition" result will be "(*) AND (tag:sample*) AND ((tag:beyond4) OR (appname:apache))"

  @s4084
  Scenario: 在搜索界面验证：RZY-4084:父子行为-继承
    When the dataset is "继承tree" then I "expand" the item
    When I click the "jiCheng" button
    When I click the "DateEditor" button
    #And I click the "RecentSevenDay" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "zhanKai" button
    #验证内容是： * AND tag:sample*
    Then I will see the "dataSetPosition" result will be "(*) AND (tag:sample*)"
    And I refresh the website
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "zhanKai" button
    #验证内容是： * AND tag:sample*
    Then I will see the "dataSetPosition" result will be "(*) AND (tag:sample*)"