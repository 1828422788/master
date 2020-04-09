@all @logDisplay @logDisplayTable
Feature: 日志展现_表格

  # tag:sample04061424_chart should be uploaded for Today
  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:sample04061424_chart | stats count(apache.clientip) as ip_count by apache.clientip | sort by ip_count | limit 13"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "trend.CreatePage" page

  Scenario Outline: table_default
    When I click the "Pencil" button
    And I will see the element "SelectedValueColorType" contains "无"
    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "日志展现/高级搜索视图/8表格/<caseNum>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/8表格/<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/8表格/<caseNum>.png"

    Examples:
      | caseNum  |
      |  826     |


  Scenario Outline: table_gradient_default
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "梯度" from the "ColorType"

    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "日志展现/高级搜索视图/8表格/<caseNum>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/8表格/<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/8表格/<caseNum>.png"

    Examples:
      | caseNum      |
      | 827_default  |

# bug add for another color     827 828
  Scenario Outline: table_gradient
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "梯度" from the "ColorType"

    And I click the "SelectColor" button
    And I wait for "1000" millsecond
    And I click the "<color>" button

    And I set the parameter "LowerLimitValue" with value "4"
    And I set the parameter "MiddleValue" with value "7"
    And I set the parameter "UpperLimitValue" with value "39"
    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "日志展现/高级搜索视图/8表格/<caseNum>_<color>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/8表格/<caseNum>_<color>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/8表格/<caseNum>_<color>.png"

    Examples:
      |   color      | caseNum  |
      |  Continuity  |  827     |
      |  Discrete    |  828     |

  Scenario Outline: table_interval
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "范围" from the "ColorType"

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
    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "日志展现/高级搜索视图/8表格/<caseNum>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/8表格/<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/8表格/<caseNum>.png"

    Examples:
      | caseNum  |
      |  829     |


  Scenario Outline: table_interval_delete
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "范围" from the "ColorType"

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
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "日志展现/高级搜索视图/8表格/<caseNum>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/8表格/<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/8表格/<caseNum>.png"

    Examples:
      |  button               | caseNum          |
      |  DeleteFirstInterval  |  829_del_orange  |
      |  DeleteSecondInterval |  829_del_yellow  |
      |  DeleteLastInterval   |  829_del_green   |


  Scenario Outline: table_value_autocolor
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "值" from the "ColorType"

    And I click the "AutoColor" button
    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "日志展现/高级搜索视图/8表格/<caseNum>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/8表格/<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/8表格/<caseNum>.png"

    Examples:
      | caseNum     |
      |  830_auto   |

# bug
  Scenario Outline: table_value_customcolor
    When I click the "Pencil" button
    And I wait for "ColorPanel" will be visible
    And I choose the "值" from the "ColorType"
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
    And I click the "DeleteLastValue" button

    And I click the "CreateEnsureButton" button

    And I wait for "ChartView" will be visible
    And I drag the scroll bar to the element "ChartView"
    And I wait for "2000" millsecond
    And take part of "ChartView" with name "日志展现/高级搜索视图/8表格/<caseNum>"
#    Then I compare source image "src/test/resources/expect/日志展现/高级搜索视图/8表格/<caseNum>.png" with target image "target/cucumber-html-reports/embeddings/actual_img/日志展现/高级搜索视图/8表格/<caseNum>.png"

    Examples:
      | caseNum     |
      | 830_custom  |

