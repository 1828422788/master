@incident @statistic
Feature: 事件管理界面-处理统计功能前置条件

  @statistic1
  Scenario Outline: 标记为-已解决、高级告警，admin用户
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button
    And I wait for "2000" millsecond
    When in incident page i click 10 times the "标记为" and "已解决" button in more menu

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |

  @statistic21
  Scenario Outline: 负责人-Leibniz
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button
    And I wait for "2000" millsecond
    When in incident page i click 10 times the "负责人" and "Leibniz" button in more menu

    Examples:
      | alertref               |
      | api00_incident界面用例2描述项 |
      | api00_incident界面用例2描述项 |


  @statistic22
  Scenario Outline:标记为-已解决、中级告警，用户-Leibniz
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "工作中" from the "StatusList"
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "Leibniz" from the "OwnerList"

    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"

    When in incident page i click 10 times the "标记为" and "已解决" button in more menu

    And I choose the "10" from the "EveryPageList"
    And I click the "AriaLabelRight" button
    Then I will see the element "NameCell13" contains "<alertref>"

    Examples:
      | alertref               |
      | api00_incident界面用例2描述项 |


  @statistic31
  Scenario Outline: 负责人-Derek
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button
    And I wait for "2000" millsecond
    When in incident page i click 10 times the "负责人" and "Derek" button in more menu

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |
      | api00_all_事件数描述项 |


  @statistic32
  Scenario Outline:标记为-已解决、高级告警，用户-Derek
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "工作中" from the "StatusList"
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "Derek" from the "OwnerList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"

    When in incident page i click 10 times the "标记为" and "已解决" button in more menu
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "已解决" from the "StatusList"
    Given I wait for loading complete
    And I wait for "1000" millsecond
    When I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I choose the "10" from the "EveryPageList"
    And I click the "AriaLabelRight" button
    Given I wait for loading complete
    And I wait for "1000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"

    Examples:
      | alertref         |
      | api00_all_事件数描述项 |


  @statistic41
  Scenario Outline:
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "待分配" from the "StatusList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button
    And I wait for "2000" millsecond
    When in incident page i click 10 times the "负责人" and "钟阿城" button in more menu

    Examples:
      | alertref               |
      | api00_incident界面用例1描述项 |
      | api00_incident界面用例1描述项 |


  @statistic42
  Scenario Outline:标记为-已解决、高级告警，用户-钟阿城
    Given open the "incident.IncidentPage" page for uri "/app/incident/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I choose the "工作中" from the "StatusList"
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "钟阿城" from the "OwnerList"
    And I set the parameter "SearchInput" with value "alertcef.summary:<alertref>"
    When I click the "SearchButton" button
    And I wait for "2000" millsecond
    Then I will see the element "NameCell13" contains "<alertref>"

    When in incident page i click 10 times the "标记为" and "已解决" button in more menu

    And I choose the "10" from the "EveryPageList"
    And I click the "AriaLabelRight" button
    Then I will see the element "NameCell13" contains "<alertref>"

    Examples:
      | alertref               |
      | api00_incident界面用例1描述项 |

  @statistic5
  Scenario Outline: 3个解决高级告警用户
    Given open the "incident.StatisticPage" page for uri "/app/incident/workload/"

    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

    And I set the parameter "SearchNameInput" with value "<name>"
    Given I wait for loading complete
    And I wait for "1000" millsecond
    Then I will see the data "{'column':'0','name':'<name>'}" values "{'column':'2','name':'<num>'}"

    Examples:
      | name  | num |
      | admin | 19  |
      | Derek | 9   |
      | 钟阿城   | 9   |