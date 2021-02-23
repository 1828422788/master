@all @logDisplay @logDisplayTable
Feature: 日志展现_表格

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 13"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "trend.CreatePage" page

  Scenario Outline: table_default
    When I click the "Pencil" button
    And I will see the element "SelectedValueColorType" contains "无"
    And I choose the "梯度" from the "ColorType" in config

    And I set the parameter "FontColor" with value "#de2626"
    And I choose the "粗体" from the "FontStyle" in config
    And I set the parameter "ColumnWidth" with value "15"
    And I choose the "居中" from the "Alignment" in config
    And I click the "CancelButton" button

    And I wait for "ChartView" will be visible
#    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/8表格/<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格/<caseNum>" with target image "expect/高级搜索视图/8表格/<caseNum>"

    Examples:
      | caseNum  |
      |  826     |


  Scenario Outline: table_gradient_default
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I will see the input element "FontColor" value will be "#4a4a4a"
    And I choose the "梯度" from the "ColorType" in config

    And I set the parameter "FontColor" with value "#5522e0"
    And I choose the "斜体" from the "FontStyle" in config
    And I set the parameter "ColumnWidth" with value "80"
    And I choose the "居右" from the "Alignment" in config

    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
#    And I drag the scroll bar to the element "ChartView"
    And I will see the element "Cell" style contains "background-color: rgb(188, 232, 252);"
    And I will see the element "Cell" style contains "color: rgb(85, 34, 224);"
    And I will see the element "Cell" style contains "font-style: italic;"
    And I will see the element "Cell" style contains "text-align: right;"
    And I wait for "3000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/8表格/<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格/<caseNum>" with target image "expect/高级搜索视图/8表格/<caseNum>"

    Examples:
      | caseNum      |
      | 827_default  |

  Scenario Outline: table_gradient
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "梯度" from the "ColorType" in config

    And I click the "SelectColor" button
    And I wait for "1000" millsecond
    And I click the "<color>" button

    And I set the parameter "LowerLimitValue" with value "4"
    And I set the parameter "MiddleValue" with value "7"
    And I set the parameter "UpperLimitValue" with value "39"
    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
#    And I drag the scroll bar to the element "ChartView"
    And I will see the element "Cell" style contains "<style>"
    And I wait for "3000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/8表格/<caseNum>_<color>"
    Then I compare source image "actual/高级搜索视图/8表格/<caseNum>_<color>" with target image "expect/高级搜索视图/8表格/<caseNum>_<color>"

    Examples:
      |   color      | caseNum  |  style    |
      |  Continuity  |  827     | background-color: rgb(225, 245, 254);  |
      |  Discrete    |  828     | background-color: rgb(229, 28, 35);    |

  Scenario Outline: table_interval
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "范围" from the "ColorType" in config

    #RED
    And I set the parameter "ColorCode" with value "#FF0000"
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "4"
    #ORANGE
    And I set the parameter "ColorCode" with value "#FFA500"
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "6"
    #YELLOW
    And I set the parameter "ColorCode" with value "#FFFF00"
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "10"
    #GREEN
    And I set the parameter "ColorCode" with value "#00FF00"
    And I click the "ChangeColor" button

    And I set the parameter "FontColor" with value "#5522e0"
    And I choose the "下划线" from the "FontStyle" in config
    And I set the parameter "ColumnWidth" with value "80"
    And I will see the element "SelectedAlignment" contains "居左"
    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "ChartView" will be visible
    And I will see the element "Cell" style contains "color: rgb(85, 34, 224);"
    And I will see the element "Cell" style contains "text-decoration: underline;"
    And I will see the element "Cell" style contains "background-color: rgb(0, 255, 0);"
    And I wait for "3000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/8表格/<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格/<caseNum>" with target image "expect/高级搜索视图/8表格/<caseNum>"

    Examples:
      | caseNum  |
      |  829     |


  Scenario Outline: table_interval_delete
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "范围" from the "ColorType" in config

    #RED
    And I set the parameter "ColorCode" with value "#FF0000"
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "4"
    #ORANGE
    And I set the parameter "ColorCode" with value "#FFA500"
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "6"
    #YELLOW
    And I set the parameter "ColorCode" with value "#FFFF00"
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "10"
    #GREEN
    And I set the parameter "ColorCode" with value "#00FF00"
    And I click the "ChangeColor" button
    And I click the "<button>" button
    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
#    And I drag the scroll bar to the element "ChartView"
    And I will see the element "Cell" style contains "<style>"
    And I wait for "3000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/8表格/<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格/<caseNum>" with target image "expect/高级搜索视图/8表格/<caseNum>"

    Examples:
      |  button               | caseNum          |   style   |
      |  DeleteFirstInterval  |  829_del_orange  | background-color: rgb(0, 255, 0);  |
      |  DeleteSecondInterval |  829_del_yellow  | background-color: rgb(0, 255, 0);  |
      |  DeleteLastInterval   |  829_del_green   | background-color: rgb(255, 255, 0);|


  Scenario Outline: table_value_color
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "值" from the "ColorType" in config

    And I wait for "<button>" will be visible
    And I click the "<button>" button
    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
#    And I drag the scroll bar to the element "ChartView"
    And I will see the element "<element>" style contains "<style>"
    And I wait for "3000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/8表格/<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格/<caseNum>" with target image "expect/高级搜索视图/8表格/<caseNum>"

    Examples:
      |   button      | caseNum       |   element  | style    |
      |  DefaultColor | defaultColor  | Cell2      | background-color: rgb(230, 247, 255); width: 25 |
      |  AutoColor    |  830_auto     | Cell       | background-color: rgb(3, 169, 244); |


  Scenario Outline: table_value_customcolor_number
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "值" from the "ColorType" in config
    And I wait for "CustomColor" will be visible
    And I click the "CustomColor" button
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "5"
    And I set the parameter "ColorCode" with value "#FF0000"
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "7"
    And I set the parameter "ColorCode" with value "#00FF00"
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "10"
    And I set the parameter "ColorCode" with value "#FFFF00"
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "24"
    And I set the parameter "ColorCode" with value "#FF00FF"
    And I click the "CustomColor" button
    And I click the "DeleteLastValue" button
    And I set the parameter "FontColor" with value "#744e78"
    And I choose the "粗体" from the "FontStyle" in config
    And I will see the element "SelectedAlignment" contains "居左"
    And I choose the "居中" from the "Alignment" in config

    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
#    And I drag the scroll bar to the element "ChartView"
    And I will see the element "Cell" style contains "color: rgb(116, 78, 120);"
    And I will see the element "Cell" style contains "font-weight: bold;"
    And I will see the element "Cell" style contains "text-align: center;"
    And I wait for "3000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/8表格/<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格/<caseNum>" with target image "expect/高级搜索视图/8表格/<caseNum>"

    Examples:
      | caseNum     |
      | 830_custom  |

  Scenario Outline: table_value_customcolor_string
    When I click the "PencilFirst" button
    And I wait for "ColorPanel" will be visible
    And I choose the "值" from the "ColorType" in config
    And I wait for "CustomColor" will be visible
    And I click the "CustomColor" button
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "117.136.79.162"
    And I set the parameter "ColorCode" with value "#FF0000"
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "1.207.60.51"
    And I set the parameter "ColorCode" with value "#00FF00"
    And I click the "CustomColor" button
    And I click the "CreateEnsureButton" button

    And I wait for "3000" millsecond
    And take part of "ChartView" with name "actual/高级搜索视图/8表格/<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格/<caseNum>" with target image "expect/高级搜索视图/8表格/<caseNum>"

    Examples:
      | caseNum         |
      | 830_custom_str  |

  Scenario Outline: table_prompt
    When I click the "Pencil" button
    And I will see the element "SelectedValueColorType" contains "无"
    And I choose the "<colorType>" from the "ColorType" in config
    And I click the "<button>" button

    And I set the parameter "<param>" with value "<value>"
    And I click the "<ensure>" button
    And I wait for "EnsureButton" will be visible
    And I will see the element "ErrorMessage" contains "请填写正确数值内容！"

    Examples:
      | colorType  |  button       |  param          | ensure             | value    |
      | 范围       | AddInterval   | IntervalInput   | CreateEnsureButton | a        |
      | 范围       | AddInterval   | IntervalInput   | CreateEnsureButton |          |
      | 梯度       |               | LowerLimitValue |                    | a        |
      | 梯度       |               | MiddleValue     | CreateEnsureButton |          |
