@dashboard @dashboardSmoke
Feature: 搜索页输入项

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 输入项-文本输入
    Given I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I select the 'sample04061424_chart' on search box
    And I wait for "CreateInputItem" will be visible
    And I click the "CreateInputItem" button
    Then I wait for "filterToken" will be visible
    And I set the parameter "filterToken" with value "filter"
    And I choose the "文本输入" from the "InputType"
    And I set the parameter "Prefix" with value "tag : "
    And I set the parameter "Suffix" with value " |"
    And I wait for "500" millsecond
    And I click the "AcceptCreateDownloadTask" button
    Then I wait for "InputItem" will be visible
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    Examples:
      |                  spl                              |
      |  sample04061424_chart stats count() by 'apache.geo.city'  |

  Scenario Outline: 输入项-下拉菜单-单选
    Given I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I select the 'sample04061424_chart' on search box
    And I wait for "CreateInputItem" will be visible
    And I click the "CreateInputItem" button
    Then I wait for "filterToken" will be visible
    And I set the parameter "filterToken" with value "filter"
    And I choose the "下拉菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "ChoiceValue" with value "sample04061424_chart"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "sample04061424_display"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "sample04061424"
    And I click the "AddChoiceValueButton" button
    And I wait for "2000" millsecond
    And I choose the "sample04061424_display" from the "DefaultDropdownList"
    And I set the parameter "Prefix" with value "tag : "
    And I set the parameter "Suffix" with value " |"
    And I wait for "500" millsecond
    And I click the "AcceptCreateDownloadTask" button
    Then I wait for "InputItem" will be visible
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    Examples:
      |                  spl                              |
      |  sample04061424_chart stats count() by 'apache.geo.city'  |

