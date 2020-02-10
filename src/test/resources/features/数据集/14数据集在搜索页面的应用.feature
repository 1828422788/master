@dataset
Feature: 数据集在搜索页中的应用

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    #And I wait element "SearchStatus" change text to "搜索完成!"

  @dataset
  Scenario: 父子行为无
    And I click the "fatherChildNull" button
    And I click the "zhanKai" button
       #验证内容是：tag:heka
    Then I will see the "dataSetPosition" result will be "tag:heka"


  @dataset
  Scenario: 父子行为汇聚
    When I click the "huiJu" button
    And I click the "zhanKai" button
    #验证内容是：* AND tag:heka AND (tag:top_info OR appname:apache)
    Then I will see the "dataSetPosition" result will be "* AND tag:heka AND (tag:top_info OR appname:apache)"


  @dataset
  Scenario: 父子行为为：继承
    When I click the "jiCheng" button
    And I click the "zhanKai" button
    #验证内容是： * AND tag:heka
    Then I will see the "dataSetPosition" result will be "* AND tag:heka"
