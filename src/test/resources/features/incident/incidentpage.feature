@incident @incidentpage @incidentpage0
Feature: 事件管理界面

  @incidentpage01
  Scenario Outline: 验证清空按钮
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond

    And I set the parameter "SearchInput" with value "<alertref>"
    When I click the "SearchButton" button
    When I wait for "1000" millsecond
    Then I will see the input box "SearchInput" contains "<alertref>"

    When I click the "ClearButton" button
    When I wait for "500" millsecond
    Then I will see the input box "SearchInput" contains ""

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |

  @incidentpage02
  Scenario Outline:验证事件名称(默认是合并策略的分组字段)，概要
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond

    And I will see the "MainDom" is display
    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.name:<alertname>"
    When I click the "SearchButton" button
    And I wait for "2000" millsecond
    Then I will see the element "NameCell12" contains "name:<alertname>"
    Then I will see the element "NameCell13" contains "<alertref>"

    Examples:
      | alertname         | alertref |
      | api00_incident界面用例1 | api00_incident界面用例1描述项    |