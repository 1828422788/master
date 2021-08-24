@incident @incidentpage @incidentpage0
Feature: 事件管理界面


  @incidentpage01
  Scenario Outline: 验证清空按钮
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond

    And I set the parameter "SearchInput" with value "<alertref>"
    When I click the "SearchButton" button under some element
    When I wait for "1000" millsecond
    Then I will see the input box "SearchInput" contains "<alertref>"

    When I click the "ClearButton" button under some element
    When I wait for "500" millsecond
    Then I will see the input box "SearchInput" contains ""

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |
