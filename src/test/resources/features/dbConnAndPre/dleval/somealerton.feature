@autoui02
Feature: 新建数据库输出

  Background:
    And I zoom the browse to full screen

  @alertpre00
  Scenario Outline: 启用监控
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading complete
    When I set the parameter "AlertListSearchInput" with value "<name>"
    And I wait for "3000" millsecond

    When the data name is "{'column':'1','name':'<name>'}" then I "open" the switch
    And I wait for "3000" millsecond
    And I wait for loading complete

    Then I will see the element "{'column':'1','name':'<name>'}" is "open"

    Examples:
      | name          |
      | api00_all_事件数 |
      | api00_incident界面用例1 |
      | api00_incident界面用例2 |
      | api00_incident界面用例3 |