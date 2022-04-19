@event
Feature: 事件操作

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成"

  Scenario Outline: 添加到搜索sample
    When I set the parameter "SearchInput" with value "<searchSpl>"
    And I click the "DateEditor" button
    And I click the "TwoDays" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I wait for "2000" millsecond
    And I click the "<field>" button
    And I click the "<buttonName>" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "SearchButton" will be visible
    Then I will see the input element "SearchInput" value will be "<spl>"

    Examples:
      | searchSpl          | field    | buttonName       | spl                                                 |
      | tag:sample04061424 | Appname | RemoveFromSearch | tag:sample04061424 AND NOT 'appname':apache |
      | tag:sample04061424  | Tag      | AddToSearch      | tag:sample04061424 AND 'tag':sample04061424  |
      | tag:sample04061424  | Tag  | RemoveFromSearch | tag:sample04061424 AND NOT 'tag':sample04061424 |

    @eventSmoke
    Examples:
      | searchSpl           | field    | buttonName       | spl                                          |
      | tag:sample04061424 | Appname | AddToSearch      | tag:sample04061424 AND 'appname':apache     |
