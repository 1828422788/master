@second @configsSmoke
Feature: 字段提取搜索验证

  Scenario Outline: RZY-3418:在搜索页验证自定义配置高级算子
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | spl             | searchResult                                                                                              |
      | appname:dissect | {"other.id":"other.id：123 ","other.domain":"other.domain：rizhiyi.com ","other.url":"other.url：index.do "} |
      | appname:script  | {"other.result.count":"other.result.count：5664 ","other.result.time":"other.result.time：1516189 "}        |
      | appname:base64  | {"other.code":"other.code：hello base64 "}                                                                 |
      | appname:unicode | {"other.rr":"other.rr：PartyBasicInfoService_客户基本信息服务 "}                                                   |
