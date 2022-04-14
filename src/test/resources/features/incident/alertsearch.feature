@incident @alertsearch
Feature: 告警搜索界面

  @alertsearch1
  Scenario Outline: 搜索当天数据
    Given open the "incident.AlertSearchPage" page for uri "/app/incident/alertsearch/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

#    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 13"
    And I set the parameter "SearchInput" with value "name:<alertname>"
    When I click the "DateEditor" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "NameCell21" contains "<alertname>"
    Then I will see the element "NameCell22" contains "<alertname>"
    And I wait for "500" millsecond

    Examples:
      | alertname     |
      | api00_all_事件数 |

    #+号，展开全部，summary:   api00_all_事件数描述项;appname:   alertcef;custom_info.alert_name:   api00_all_事件数;agent:   rizhiyi

  @alertsearch2
  Scenario Outline: 搜索当天数据
    Given open the "incident.AlertSearchPage" page for uri "/app/incident/alertsearch/"
    Given I wait for loading complete
    And I wait for "2000" millsecond
    And I will see the "MainDom" is display

#    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 13"
    And I set the parameter "SearchInput" with value "name:<alertname>"
    When I click the "DateEditor" button
    When I click the "Today" button
    When I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "NameCell21" contains "<alertname>"
    And I will see the "CustomButton" is display
    And I wait for "500" millsecond
    When I click the "CustomButton" button
    Given I wait for loading complete
    Then I will see the checkbox in alert search page which name is "agent_time" and status is "checked"
    Then I will see the checkbox in alert search page which name is "priority" and status is "checked"
    Then I will see the checkbox in alert search page which name is "source" and status is "checked"
    Then I will see the checkbox in alert search page which name is "name" and status is "checked"
#    Then I will see the checkbox in alert search page which name is "ip" and status is "checked"

    Examples:
      | alertname     |
      | api00_all_事件数 |

#后续加翻面，每页10，跳转，查看搜索历史
#17 AND name:api00_all_事件数