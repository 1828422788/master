Feature: 知识搜索

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  @knowledge
  Scenario Outline: 按分组搜索
    When I choose the "<GroupList>" from the "GroupList"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'0','name':'sunxj1'}"

  @smoke @all
    Examples:
      | GroupList               |
      | AutoTestWithAllResource |

  Scenario Outline: 全文搜索
    When I set the parameter "SearchInput" with value "<search>"
    Then I will see the element value in json "<value>"

    Examples:
      | search   | value                                                                               |
      | autotest | {'ResultTitle1':'sunxj1','ResultTitle2':'sxjautotest','ResultTitle3':'sxjautotest'} |