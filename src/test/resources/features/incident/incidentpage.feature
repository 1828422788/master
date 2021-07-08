@incident @incidentpage
Feature: 事件管理界面

  @incidentpage1
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


  @incidentpage2
  Scenario Outline: 搜索最近1周数据
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "<alertref>"
#    When I click the "DateEditor" button
#    When I click the "Today" button
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
#    Then I will see the element "NameCell13" contains "<alertref>"
#    When the incident data name is "alertref" then i click the "标记为" button in more menu
    #   When I click the "MoreButton" button
    When the incident page "工作中" then i click the "标记为" button in more menu

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |

  @incidentpage3
  Scenario Outline: 搜索最近1周数据
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "<alertref>"
#    When I click the "DateEditor" button
#    When I click the "Today" button
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"
#    When the incident data name is "alertref" then i click the "标记为" button in more menu
    #   When I click the "MoreButton" button
    When the incident page "工作中" then i click the "标记为" button in more menu

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |