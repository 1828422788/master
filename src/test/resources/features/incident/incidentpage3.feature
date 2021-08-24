@incident @incidentpage @incidentpage3
Feature: 事件管理界面

  @incidentpage3
  Scenario Outline: 标记为-工作中
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
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
      | api00_all_事件数描述项 |


  @incidentpage31
  Scenario Outline: 验证标记为-工作中
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "工作中" from the "StatusList"
    And I choose the "admin" from the "OwnerList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"
#    Then I will see the "TotalItem" result will be "<totalItem>"

    And I choose the "10" from the "EveryPageList"
    And I click the "AriaLabelRight" button

    Then I will see the element "NameCell13" contains "<alertref>"

    Examples:
      | alertref         | totalItem |
      | api00_all_事件数描述项 | 共 11 条    |


  @incidentpage4
  Scenario Outline: 负责人-Derek
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    When the incident page "Derek" then i click the "负责人" button in more menu

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
      | api00_all_事件数描述项 |


  @incidentpage41
  Scenario Outline: 验证标记为-工作中
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "工作中" from the "StatusList"
    And I choose the "Derek" from the "OwnerList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"

    And I choose the "10" from the "EveryPageList"
    And I click the "AriaLabelRight" button
    Then I will see the element "NameCell13" contains "<alertref>"

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |



  @incidentpage3
  Scenario Outline: 标记为-工作中
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond

    And I choose the "50" from the "EveryPageList"

    When the incident page "" then i click the "标记为" button in more menu

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
      | api00_all_事件数描述项 |