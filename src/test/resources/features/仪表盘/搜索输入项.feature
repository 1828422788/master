@dashboard @dashboardSmoke
Feature: 搜索页输入项

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 输入项-文本输入
    Given I set the parameter "SearchInput" with value "<spl>"
    And I wait for "InputItem" will be visible
    And I move the mouse pointer to the "InputItemEditor"
    And I click the "InputItemEditor" button
    And I wait for "2000" millsecond
#    And I will see the element "" value is ""
#    And I wait for element "SearchStatus" change text to "搜索完成!"

    Examples:
      |   defaultValue        |                  spl                              |
      | sample04061424_chart  |  ${filter} stats count() by 'apache.geo.city'  |

