Feature: 搜索初始配置

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  @v33init
  Scenario Outline: 拖动分屏按钮至屏幕最左端
    And I drag the element "SearchPageSvg" to the "searchPageLeft"

#    Given I set the parameter "SearchInput" with value "<splQuery>"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 2"
    #And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    #And I wait for "4000" millsecond
    #Then take a screenshot with name "<splcasename>"
    And I wait for "SplStatsRetTable" will be visible
    And I drag the scroll bar to the element "SplStatsRetTable"
    And I wait for "2000" millsecond
    And take part of "SplStatsRetTable" with name "actual/<splcasename>"

    Examples:
      |splcasename| splQuery |
      | eval_math_stats | tag:\"sample04061424\" \| eval new_len = 1000 + apache.resp_len \| stats count(new_len) |