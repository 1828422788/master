@incident @incidentpage @incidentpage3
Feature: 事件管理界面--按钮功能

  @incidentpage31
  Scenario Outline: 标记为-工作中
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose5 the status "待分配" on the path "incident-active-option" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    When in incident page i click 10 times the "标记为" and "工作中" button in more menu

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |

  @incidentpage32
  Scenario Outline: 验证标记为-工作中
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

#    And I choose the "工作中" from the "StatusList"
    And I choose5 the status "工作中" on the path "incident-wip-option" from the "StatusList"
    Given I wait for loading complete
    And I wait for "2000" millsecond
#    And I choose the "admin" from the "OwnerList"
    And I choose the item "admin" on the path "span" from the "OwnerList"

    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"
#    Then I will see the "TotalItem" result will be "<totalItem>"
#    And I choose the "10" from the "EveryPageList"
    And I choose the item "10" on the path "span" from the "EveryPageList"

    And I click the "AriaLabelRight" button
    Then I will see the element "NameCell13" contains "<alertref>"

    Examples:
      | alertref         | totalItem |
      | api00_all_事件数描述项 | 共 11 条    |


  @incidentpage331
  Scenario Outline:
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

#    And I choose the "待分配" from the "StatusList"
    And I choose5 the status "待分配" on the path "incident-active-option" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    When in incident page i click 10 times the "负责人" and "ctest" button in more menu

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |

  @statistic332
  Scenario Outline:
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

#    And I choose the "工作中" from the "StatusList"
    And I choose5 the status "工作中" on the path "incident-wip-option" from the "StatusList"
    Given I wait for loading complete
    And I wait for "2000" millsecond

#    And I choose the "ctest" from the "OwnerList"
    And I choose the item "ctest" on the path "span" from the "OwnerList"

    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"
#    And I choose the "30" from the "EveryPageList"
    And I choose the item "30" on the path "span" from the "EveryPageList"
    Given I wait for loading complete
    And I wait for "2000" millsecond

    When in incident page i click 10 times the "标记为" and "已忽略" button in more menu
    When in incident page i click 10 times the "负责人" and "ctest" button in more menu

    And I click the "AriaLabelRight" button
    Then I will see the element "NameCell13" contains "<alertref>"

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |

  @statistic333
  Scenario Outline:
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

#    And I choose the "ctest" from the "OwnerList"
    And I choose the item "ctest" on the path "span" from the "OwnerList"

    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond
    Then I will see the message "事件列表(20)" on page

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |

  @incidentpage5
  Scenario Outline: 操作-ping主机
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

#    And I choose the "待分配" from the "StatusList"
    And I choose5 the status "待分配" on the path "incident-active-option" from the "StatusList"

    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button under some element
    And I wait for "2000" millsecond

    When in incident page i click the "操作" and "ping主机" button in more menu
    When I wait for loading complete
    And I wait for "1000" millsecond
    And I set the parameter "HostipInput" with value "192.168.1.183"

    When I click the "ExecuteButton" button
    Given I wait for loading complete
    And I wait for "5000" millsecond
    And I wait for "5000" millsecond
    And I will see the "ExecuteRet" result will contain "is not ip or hostname"

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |
