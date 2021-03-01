@alertsearch
Feature: 监控搜索界面

  Background:
    Given open the "incident.AlertSearchPage" page for uri "/app/incident/alertsearch/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline:验证不能搜到yotta索引数据
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the element "EventNumber" name is "(0)"

    Examples:
      | splQuery |
      | index=yotta * |

  Scenario Outline:验证统计语句事件数不为0
    #* | table appname | limit 100
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the element "EventNumber" larger than "1"

    Examples:
      | splQuery |
      #* | table appname | limit 100
      | * \| table appname \| limit 100 |
      #* | limit 100 | table appname
      | * \| limit 100 \| table appname |
