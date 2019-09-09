@setting @settingSmoke
Feature: 系统设置图标配置自动填充（RZY-1820）

  Background:
    Given open the "system.CustomConfigs" page for uri "/system/custom/configs/"

  Scenario Outline:
    When I "<status>" the checkbox which name is "图表配置自动填充"
    And I let element "ChartLabel" lose focus
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "* | stats avg(raw_message_length) as avg_length, count(apache.clientip) as ip_count by appname | sort by ip_count"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "Type" button
    And I click the "Line" button
    And I wait for loading invisible
    Then I will see the "<chart>" is display

    Examples:
      | status    | chart    |
      | unchecked | NoneData |
      | checked   | Canvas   |
