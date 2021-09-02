@incident @incidentpage @incidentpage2
Feature: 事件管理界面_查看功能

  @incidentpage21
  Scenario Outline:
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    When in incident page i click the "查看合并策略" button in more menu
    Given I wait for loading complete
    Given open the "incident.CruxeePolicyPage" page
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And switch to window "编辑合并策略"
    And I close all tabs except main tab
    Then I will see the input element "CruxeePolicyName" value will be "事件样例name分组"

    Examples:
      | alertref               |
      | api00_incident界面用例2描述项 |

