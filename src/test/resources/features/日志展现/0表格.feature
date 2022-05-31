@all @logDisplay @logDisplayTable
Feature: 日志展现_0表格

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count,apache.clientip | limit 13"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"

  Scenario Outline: 表格_默认
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count,apache.clientip | limit 13  | eval ip_count = ip_count/11*1000"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "trend.CreatePage" page
    When I click the "Pencil" button
    And I will see the element "SelectedValueColorType" contains "无"
    And I choose the "梯度" from the "ColorType"

    And I set the parameter "FontColor" with value "de2626"
    And I choose the "粗体" from the "FontStyle"
    And I set the parameter "ColumnWidth" with value "15"
    And I choose the "居中" from the "Alignment"
    And I click the "ThousandSeparatorCheckbox" button
    And I choose the "2" from the "PrecisionTable"
    And I click the "CancelButton" button
    And I wait for "2000" millsecond
    And I will see the element "Cell" contains "3545.4545"

    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/8表格_<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格_<caseNum>" with target image "expect/高级搜索视图/8表格_<caseNum>"

    Examples:
      | caseNum  |
      |  826     |

  @logDisplaySmoke
  Scenario Outline: 梯度1
    Then I will see the "trend.CreatePage" page
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I will see the input element "FontColor" value will be "4A4A4A"
    And I choose the "梯度" from the "ColorType"

    And I set the parameter "FontColor" with value "5522E0FF"
    And I choose the "斜体" from the "FontStyle"
    And I set the parameter "ColumnWidth" with value "80"
    And I choose the "居右" from the "Alignment"

    And I click the "EnsureButton" button

    And I wait for "Chart" will be visible
    And I will see the element "Cell" style contains "background-color: rgb(188, 232, 252);"
    And I will see the element "Cell" style contains "color: rgb(85, 34, 224);"
    And I will see the element "Cell" style contains "font-style: italic;"
    And I will see the element "Cell" style contains "justify-content: right;"
    And I wait for "3000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/8表格_<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格_<caseNum>" with target image "expect/高级搜索视图/8表格_<caseNum>"

    Examples:
      | caseNum      |
      | 827_default  |

  Scenario Outline: 梯度2
    Then I will see the "trend.CreatePage" page
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "梯度" from the "ColorType"

    And I click the "SelectColor" button
    And I wait for "1000" millsecond
    And I click the Circle "<color>" button

    And I set the parameter "LowerLimitValue" with value "4"
    And I set the parameter "MiddleValue" with value "7"
    And I set the parameter "UpperLimitValue" with value "39"
    And I click the "EnsureButton" button

    And I wait for "Chart" will be visible
    And I will see the element "Cell" style contains "<style>"
    And I wait for "3000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/8表格_<caseNum>_<color>"
    Then I compare source image "actual/高级搜索视图/8表格_<caseNum>_<color>" with target image "expect/高级搜索视图/8表格_<caseNum>_<color>"

    Examples:
      |   color      | caseNum  |  style                                |
      |  Continuity  |  827     | background-color: rgb(225, 245, 254)  |
      |  Discrete    |  828     | background-color: rgb(229, 28, 35)    |

  @logDisplaySmoke
  Scenario Outline: 范围
    Then I will see the "trend.CreatePage" page
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "范围" from the "ColorType"

    #RED
    And I set the parameter "ColorCode" with value "FF0000FF"
    And I click the "ChangeColor" button
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "4"
    #ORANGE
    And I set the parameter "ColorCode" with value "FFA500FF"
    And I click the "ChangeColor" button
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "6"
    #YELLOW
    And I set the parameter "ColorCode" with value "FFFF00FF"
    And I click the "ChangeColor" button
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "10"
    #GREEN
    And I set the parameter "ColorCode" with value "00FF00FF"
    And I click the "ChangeColor" button

    And I wait for "2000" millsecond
    And I choose the "下划线" from the "FontStyle"
    And I set the parameter "ColumnWidth" with value "80"
    And I will see the element "SelectedAlignment" contains "居左"
    And I set the parameter "FontColor" with value "5522E0FF"
    And I click the "EnsureButton" button

    And I wait for "Chart" will be visible
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I wait for "Chart" will be visible
    And I will see the element "Cell" style contains "color: rgb(85, 34, 224)"
    And I will see the element "Cell" style contains "text-decoration: underline"
    And I will see the element "Cell" style contains "background-color: rgb(0, 255, 0)"
    And I wait for "3000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/8表格_<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格_<caseNum>" with target image "expect/高级搜索视图/8表格_<caseNum>"

    Examples:
      | caseNum  |
      |  829     |

  Scenario Outline: 范围_删除
    Then I will see the "trend.CreatePage" page
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "范围" from the "ColorType"

    #RED
    And I set the parameter "ColorCode" with value "FF0000FF"
    And I click the "ChangeColor" button
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "4"
    #ORANGE
    And I set the parameter "ColorCode" with value "FFA500FF"
    And I click the "ChangeColor" button
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "6"
    #YELLOW
    And I set the parameter "ColorCode" with value "FFFF00FF"
    And I click the "ChangeColor" button
    And I click the "AddInterval" button
    And I set the parameter "IntervalInput" with value "10"
    #GREEN
    And I set the parameter "ColorCode" with value "00FF00FF"
    And I click the "ChangeColor" button
    And I wait for "2000" millsecond
    And I click the "<button>" button
    And I click the "EnsureButton" button

    And I wait for "Chart" will be visible
    And I will see the element "Cell" style contains "<style>"
    And I wait for "3000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/8表格_<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格_<caseNum>" with target image "expect/高级搜索视图/8表格_<caseNum>"

    Examples:
      |  button               | caseNum          |   style   |
      |  DeleteFirstInterval  |  829_del_orange  | background-color: rgb(0, 255, 0);  |
      |  DeleteSecondInterval |  829_del_yellow  | background-color: rgb(0, 255, 0);  |
      |  DeleteLastInterval   |  829_del_green   | background-color: rgb(255, 255, 0);|

  Scenario Outline: 值
    Then I will see the "trend.CreatePage" page
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "值" from the "ColorType"

    And I click the "<button>" button
    And I click the "EnsureButton" button

    And I wait for "Chart" will be visible
    And I will see the element "<element>" style contains "<style>"
    And I wait for "3000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/8表格_<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格_<caseNum>" with target image "expect/高级搜索视图/8表格_<caseNum>"

    Examples:
      |   button      | caseNum       |   element  | style    |
      |  DefaultColor | defaultColor  | Cell2      | background-color: rgb(230, 247, 255); width: 25 |
      |  AutoColor    |  830_auto     | Cell       | background-color: rgb(3, 169, 244); |

  Scenario Outline: 值_自定义
    Then I will see the "trend.CreatePage" page
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "值" from the "ColorType"
    And I click the "CustomColor" button
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "5"
    And I set the parameter "ColorCode" with value "FF0000FF"
    And I click the Circle "ChangeColor" button
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "7"
    And I set the parameter "ColorCode" with value "00FF00FF"
    And I click the Circle "ChangeColor" button
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "10"
    And I set the parameter "ColorCode" with value "FFFF00FF"
    And I click the Circle "ChangeColor" button
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "24"
    And I set the parameter "ColorCode" with value "FF00FFFF"
    And I click the Circle "ChangeColor" button
    And I click the "CustomColor" button
    And I click the "DeleteLastValue" button
    And I choose the "粗体" from the "FontStyle"
    And I will see the element "SelectedAlignment" contains "居左"
    And I choose the "居中" from the "Alignment"
    And I set the parameter "FontColor" with value "744E78FF"

    And I click the "EnsureButton" button

    And I wait for "Chart" will be visible
    And I will see the element "Cell" style contains "color: rgb(116, 78, 120);"
    And I will see the element "Cell" style contains "font-weight: bold;"
    And I will see the element "Cell" style contains "justify-content: center;"
    And I wait for "3000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/8表格_<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格_<caseNum>" with target image "expect/高级搜索视图/8表格_<caseNum>"

    Examples:
      | caseNum     |
      | 830_custom  |

  @logDisplaySmoke
  Scenario Outline: 值_自定义2
    Then I will see the "trend.CreatePage" page
    When I click the "PencilFirst" button
    And I wait for "ColorPanel" will be visible
    And I choose the "值" from the "ColorType"
    And I click the "CustomColor" button
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "117.136.79.162"
    And I set the parameter "ColorCode" with value "FF0000FF"
    And I click the "ChangeColor" button
    And I click the "AddValue" button
    And I set the parameter "InputValue" with value "1.207.60.51"
    And I set the parameter "ColorCode" with value "00FF00FF"
    And I click the "ChangeColor" button
    And I click the "CustomColor" button
    And I click the "EnsureButton" button

    And I wait for "3000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/8表格_<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格_<caseNum>" with target image "expect/高级搜索视图/8表格_<caseNum>"

    Examples:
      | caseNum         |
      | 830_custom_str  |

  Scenario Outline: 使用千分隔符
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count,apache.clientip | limit 13  | eval ip_count = ip_count/11*1000"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "trend.CreatePage" page
    When I click the "Pencil" button
    And I will see the element "SelectedValueColorType" contains "无"

    And I choose the "值" from the "ColorType"

    And I wait for "AutoColor" will be visible
    And I click the "AutoColor" button

    And I click the "ThousandSeparatorCheckbox" button
    And I choose the "3" from the "PrecisionTable"
    And I click the "EnsureButton" button
    And I wait for "2000" millsecond
    And I will see the element "Cell" contains "3,545.455"
    And I will see the element "Cell" style contains "background-color: rgb(3, 169, 244);"

    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And take part of "Chart" with name "actual/高级搜索视图/8表格_<caseNum>"
    Then I compare source image "actual/高级搜索视图/8表格_<caseNum>" with target image "expect/高级搜索视图/8表格_<caseNum>"

    Examples:
      | caseNum           |
      | ThousandSeparator |

  Scenario Outline: 提示
    Then I will see the "trend.CreatePage" page
    When I click the "Pencil" button
    And I will see the element "SelectedValueColorType" contains "无"
    And I choose the "<colorType>" from the "ColorType"
    And I click the "<button>" button

    And I set the parameter "<param>" with value "<value>"
    And I click the "<ensure>" button
    And I wait for "ErrorMessage" will be visible
    And I will see the element "ErrorMessage" contains "<message>"

    Examples:
      | colorType  |  button       |  param          | ensure       | value    | message              |
      | 范围       | AddInterval   | IntervalInput   | EnsureButton | a        | 请填写正确数值内容！ |
      | 范围       | AddInterval   | IntervalInput   | EnsureButton |          | 请填写正确数值内容！ |
      | 梯度       |               | LowerLimitValue |              | a        | 请填写正确数值内容！ |
      | 梯度       |               | MiddleValue     | EnsureButton |          | 请填写正确数值内容！ |
      |            |               | ColumnWidth     | EnsureButton | 0        | 列宽度不能为0        |
