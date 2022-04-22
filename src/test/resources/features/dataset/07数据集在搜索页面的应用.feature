@dataset @datasetSearchPage
Feature: 数据集_07在搜索页

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "right" side

  Scenario: RZY-4085:父子行为-无
    When the dataset is "无tree" then I "expand" the item
    And I click the Element with text "无1"
    When I click the "DateEditor" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "ZhanKai" button
    And I will see the element "DataSetPosition" contains "tag:sample*"
    And I refresh the website
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "ZhanKai" button
    Then I will see the "dataSetPosition" result will be "tag:sample*"

  Scenario: RZY-4083:父子行为-汇聚
    And I click the Element with text "汇聚tree"
    When I click the "DateEditor" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "ZhanKai" button
    And I will see the element "DataSetPosition" contains "(*) AND (tag:sample*) AND ((tag:beyond4) OR (appname:apache))"
    And I refresh the website
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "ZhanKai" button
    And I will see the element "DataSetPosition" contains "(*) AND (tag:sample*) AND ((tag:beyond4) OR (appname:apache))"

  Scenario: 在搜索界面验证：RZY-4084:父子行为-继承
    When the dataset is "继承tree" then I "expand" the item
    And I click the Element with text "继承1"
    When I click the "DateEditor" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "ZhanKai" button
    And I will see the element "DataSetPosition" contains "(*) AND (tag:sample*)"
    And I refresh the website
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I click the "ZhanKai" button
    And I will see the element "DataSetPosition" contains "(*) AND (tag:sample*)"