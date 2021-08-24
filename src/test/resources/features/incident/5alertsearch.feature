@alertsearch
Feature: 告警搜索界面

  Background:
    Given open the "incident.AlertSearchPage" page for uri "/app/incident/alertsearch/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  @as0
  Scenario Outline:验证不能搜到yotta索引数据
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "EventNumber" contains "0"

    Examples:
      | splQuery |
      | index=yotta * |

  @as1
  Scenario Outline:验证事件数大于0
    #* | table appname | limit 100
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "EventNumber" larger than "1"

    Examples:
      | splQuery |
      #* | table appname | limit 100
      | * \| table appname \| limit 100 |
      #* | limit 100 | table appname
      | * \| limit 100 \| table appname |
