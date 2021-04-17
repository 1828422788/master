Feature: 入库优先级搜索

  Background:
    Given open the "ingestPriority.ListPage" page for uri "/ingestpriority/"

  Scenario Outline:
    When I set the parameter "SearchInput" with value "<searchName>"
    And I click the "Search" button
    And I wait for loading invisible
    Then I will see the search result "{'column':'0','name':'<searchName>'}"
#    And I will see the element "RecordNumber" is "<recordNumber>"
    Examples:
      | searchName     |
      | autotest |