@incident @incidentpage @incidentpage1
Feature: 事件管理界面_分页功能

  Background:
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete

  @incidentpage11
  Scenario Outline: 每页10，第2页
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"

    And I choose the "<everypage>" from the "EveryPageList"
    Given I wait for loading complete
    And I set the parameter "PaginationInput" with value "2"
    Given I wait for loading complete
    And I press the parameter "PaginationInput" with enter
    Given I wait for loading complete
    Then I will see the element "NameCell13" contains "<alertref>"
    Then I will see the every page "<everypage>" 条
    
    Examples:
      | alertref         | everypage |
      | api00_all_事件数描述项 | 20        |
      | api00_all_事件数描述项 | 50        |


  @incidentpage12
  Scenario Outline: 每页50，第2页
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"

    And I choose the "30" from the "EveryPageList"
    When I click the "AriaLabelRight" button
    Given I wait for loading complete
    Then I will see the element "NameCell13" contains "<alertref>"
    Then I will see the every page "30" 条

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |

  @incidentpage13
  Scenario Outline: 每页50，第2页
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"

    And I choose the "30" from the "EveryPageList"
    When I click the "No3page" button
    Given I wait for loading complete
    Then I will see the element "NameCell13" contains "<alertref>"
    Then I will see the every page "30" 条

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |