@dashboard @dashboard11
Feature: 搜索页输入项

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 输入项-文本输入
    Given I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I select the string from "0" to "20" in search box
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
    And I select the string from "0" to "20" in search box
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

  Scenario Outline: 输入项-下拉菜单-多选
    Given I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I select the string from "0" to "20" in search box
    And I wait for "CreateInputItem" will be visible
    And I click the "CreateInputItem" button
    Then I wait for "filterToken" will be visible
    And I set the parameter "filterToken" with value "filter"
    And I choose the "下拉菜单" from the "InputType"
    And I click the "MultiSelect" button
    And I set the parameter "ChoiceValue" with value "sample04061424_chart"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "sample04061424_display"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "sample04061424"
    And I click the "AddChoiceValueButton" button
    And I wait for "2000" millsecond
    And I choose the "sample04061424_display,sample04061424" from the "DefaultDropdownList"
    And I set the parameter "Prefix" with value "tag "
    And I set the parameter "Suffix" with value " tag : sample04061424_display |"
    And I set the parameter "PrefixValue" with value ": "
    And I set the parameter "SuffixValue" with value " OR"
    And I set the parameter "Separate" with value "tag "
    And I wait for "500" millsecond
    And I click the "AcceptCreateDownloadTask" button
    Then I wait for "InputItem" will be visible
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    Examples:
      |                    spl                              |
      |  sample04061424_chart stats count() by 'apache.geo.city'  |

  Scenario Outline: 输入项-动态菜单-单选
    Given I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I select the string from "0" to "20" in search box
    And I wait for "CreateInputItem" will be visible
    And I click the "CreateInputItem" button
    Then I wait for "filterToken" will be visible
    And I set the parameter "filterToken" with value "filter"
    And I choose the "动态菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I set the parameter "InputItemSpl" with value "tag : sample04061424_chart | stats count() by 'apache.geo.city'"
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I click the "InputItemDateEditor" button
    And I click the "Today" button
    And I set the parameter "ChoiceValue" with value "北京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "南京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "成都市"
    And I click the "AddChoiceValueButton" button
    And I wait for "2000" millsecond
    And I choose the "北京市" from the "DefaultDropdownList"
    And I set the parameter "Prefix" with value "apache.geo.city:"
    And I set the parameter "Suffix" with value " |"
    And I wait for "500" millsecond
    And I click the "AcceptCreateDownloadTask" button
    And I wait for "Progress" will be invisible
    Then I wait for "InputItem" will be visible
    And I choose the "苏州市" from the "FilterDropdown"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    Examples:
      |                  spl                              |
      |  sample04061424_chart stats count() by 'apache.geo.city'  |

  Scenario Outline: 输入项-动态菜单-多选
    Given I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I select the string from "0" to "20" in search box
    And I wait for "CreateInputItem" will be visible
    And I click the "CreateInputItem" button
    Then I wait for "filterToken" will be visible
    And I set the parameter "filterToken" with value "filter"
    And I choose the "动态菜单" from the "InputType"
    And I click the "MultiSelect" button
    And I set the parameter "InputItemSpl" with value "tag : sample04061424_chart | stats count() by 'apache.geo.city'"
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I click the "InputItemDateEditor" button
    And I click the "InputDateToday" button
    And I set the parameter "ChoiceValue" with value "北京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "南京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "成都市"
    And I click the "AddChoiceValueButton" button
    And I wait for "2000" millsecond
    And I choose the "北京市,成都市" from the "DefaultDropdownList"
    And I set the parameter "Prefix" with value "apache.geo.city"
    And I set the parameter "Suffix" with value " apache.geo.city：苏州市 | "
    And I set the parameter "PrefixValue" with value ": "
    And I set the parameter "SuffixValue" with value " OR"
    And I set the parameter "Separate" with value "apache.geo.city"
    And I wait for "500" millsecond
    And I click the "AcceptCreateDownloadTask" button
    Then I wait for "InputItem" will be visible
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"

    Examples:
      |                    spl                              |
      |  sample04061424_chart stats count() by 'apache.geo.city'  |

  Scenario Outline: 输入项-切换
    Given I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I select the string from "0" to "20" in search box
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
    Then I will see the "AlertMessage" doesn't exist
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I move the mouse pointer to the "InputItem"
    And I click the "InputItemEditor" button
    Then I wait for "filterToken" will be visible
    And I choose the "下拉菜单" from the "InputType"
    And I set the parameter "ChoiceValue" with value "sample04061424_chart"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "sample04061424_display"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "sample04061424"
    And I click the "AddChoiceValueButton" button
    And I wait for "2000" millsecond
    And I choose the "sample04061424_display" from the "DefaultDropdownList"
    And I wait for "500" millsecond
    And I click the "AcceptCreateDownloadTask" button
    Then I wait for "InputItem" will be visible
    And I click the "SearchButton" button
#    Then I will see the "AlertMessage" doesn't exist
#    Then I will see the message ""
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I move the mouse pointer to the "InputItem"
    And I click the "InputItemEditor" button
    Then I wait for "filterToken" will be visible
    And I choose the "动态菜单" from the "InputType"
    And I set the parameter "InputItemSpl" with value "tag : sample04061424_chart | stats count() by 'apache.geo.city'"
    And I set the parameter "DynamicField" with value "apache.geo.city"
    And I click the "InputItemDateEditor" button
    And I click the "InputDateToday" button
    And I set the parameter "ChoiceValue" with value "北京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "南京市"
    And I click the "AddChoiceValueButton" button
    And I set the parameter "ChoiceValue" with value "成都市"
    And I click the "AddChoiceValueButton" button
    And I wait for "2000" millsecond
    And I choose the "北京市" from the "DefaultDropdownList"
    And I set the parameter "Prefix" with value "apache.geo.city:"
    And I set the parameter "Suffix" with value " |"
    And I wait for "500" millsecond
    And I click the "AcceptCreateDownloadTask" button
    And I wait for "500" millsecond
    And I wait for "Progress" will be invisible
    Then I wait for "InputItem" will be visible
    And I choose the "苏州市" from the "FilterDropdown"
    And I click the "SearchButton" button
    Then I will see the "AlertMessage" doesn't exist
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"


    Examples:
      |                  spl                              |
      |  sample04061424_chart stats count() by 'apache.geo.city'  |

  Scenario Outline: 输入项-多个输入项联动与删除
    Given I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I select the string from "0" to "3" in search box
    And I wait for "CreateInputItem" will be visible
    And I click the "CreateInputItem" button
    Then I wait for "filterToken" will be visible
    And I choose the "文本输入" from the "InputType"
    And I wait for "500" millsecond
    And I click the "AcceptCreateDownloadTask" button
    And I wait for "3000" millsecond
#    Then I wait for "InputItem" will be visible
    And I select the string from "16" to "36" in search box
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
    And I wait for "2000" millsecond
    And I choose the "sample04061424_display" from the "DefaultDropdownList"
    And I set the parameter "Suffix" with value " |"
    And I wait for "500" millsecond
    And I click the "AcceptCreateDownloadTask" button
    Then I wait for "InputItem" will be visible
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I will see the "AlertMessage" doesn't exist
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "3000" millsecond
    And I move the mouse pointer to the "InputItem"
    And I click the "InputItemDelete" button
    Then I will see the "InputItem" doesn't exist

    Examples:
      |                  spl                              |
      |  tag : sample04061424_chart stats count() by 'apache.geo.city'  |

  Scenario Outline: 输入项-收起/展示搜索语句
    Given I set the parameter "SearchInput" with value "<spl>"
    And I wait for "2000" millsecond
    And I select the string from "0" to "20" in search box
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
    Then I will see the "AlertMessage" doesn't exist
    And I wait for "2000" millsecond
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "3000" millsecond
    And I move the mouse pointer to the "OpenAndHideSplIcon"
    Then I will see the element "OpenAndHideTip" value is "收起搜索语句"
    And I click the "OpenAndHideSplIcon" button
    And I wait for "1000" millsecond
    Then I will see the element "OpenAndHideTip" value is "展示搜索语句"
    And I click the "OpenAndHideSplIcon" button
    And I wait for "1000" millsecond
    Then I will see the element "OpenAndHideTip" value is "收起搜索语句"

    Examples:
      |                  spl                              |
      | sample04061424_chart stats count() by 'apache.geo.city'  |
