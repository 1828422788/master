@event @eventSmoke
Feature: 事件操作

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: 添加到搜索sample
    When I set the parameter "SearchInput" with value "<searchSpl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I click the "<field>" button
    And I click the "<buttonName>" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "SearchButton" will be visible
#    Then I will see the input element "SearchInput" value will be "<spl>"
    Then take a screenshot with name "RZY-<num>：事件操作-<name>"

  @first
    Examples:
      | searchSpl          | field    | buttonName       | num  | name         | spl                                                         |
      | tag:sample04061424 | Clientip | AddToSearch      | 2852 | 添加到搜索sample  | tag:sample04061424 AND 'apache.clientip':71.221.121.107     |
      | tag:sample04061424 | Clientip | RemoveFromSearch | 2853 | 从搜索中删除sample | tag:sample04061424 AND NOT 'apache.clientip':71.221.121.107 |

  @second
    Examples:
      | searchSpl                                      | field    | buttonName       | num  | name    | spl                                                                                           |
      | tag:sample04061424 OR tag:sample04061424_chart | Tag      | AddToSearch      | 2854 | 添加到搜索1  | ((tag:sample04061424) OR (tag:sample04061424_chart)) AND 'tag':sample04061424                 |
      | tag:sample04061424 OR tag:sample04061424_chart | Clientip | RemoveFromSearch | 2855 | 从搜索中删除1 | ((tag:sample04061424) OR (tag:sample04061424_chart)) AND NOT 'apache.clientip':71.221.121.107 |