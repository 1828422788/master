@event @eventSmoke
Feature: 事件操作

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成"

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
    Then I will see the input element "SearchInput" value will be "<spl>"

  @first
    Examples:
      | searchSpl          | field    | buttonName       | spl                                                         |
      | tag:sample04061424 | Clientip | AddToSearch      | tag:sample04061424 AND 'apache.clientip':71.221.121.107     |
      | tag:sample04061424 | Clientip | RemoveFromSearch | tag:sample04061424 AND NOT 'apache.clientip':71.221.121.107 |

  @second
    Examples:
      | searchSpl                                      | field    | buttonName       | spl                                                                                           |
      | tag:sample04061424 OR tag:sample04061424_chart | Tag      | AddToSearch      | ((tag:sample04061424) OR (tag:sample04061424_chart)) AND 'tag':sample04061424                 |
      | tag:sample04061424 OR tag:sample04061424_chart | Clientip | RemoveFromSearch | ((tag:sample04061424) OR (tag:sample04061424_chart)) AND NOT 'apache.clientip':71.221.121.107 |