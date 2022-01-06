@alertsearch @incident
Feature: 监控搜索界面

  Background:
    Given open the "incident.AlertSearchPage" page for uri "/app/incident/alertsearch/"

  @as0
  Scenario Outline:验证不能搜到yotta索引数据
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    Then I will see the message contains "in JSON at position"

    Examples:
      | splQuery      |
      | index=yotta * |

  @as1
  Scenario Outline:
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the message contains "仅支持query搜索语句查询"

    Examples:
      | splQuery           |
      | * \| table appname |
