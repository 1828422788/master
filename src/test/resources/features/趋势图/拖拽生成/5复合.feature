@dragAndDrop @dragAndDropCompound
Feature:拖拽生成趋势图_复合

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page
    And I wait for "Loading" will be invisible

    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "DateEditor" button under some element
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button under some element
    Then I wait for "CheckBox" will be visible
    When I "checked" the checkbox which name is "apache.clientip" in trend page
    And I wait for "CheckBox" will be visible
    When I "checked" the checkbox which name is "apache.resp_len" in trend page
    And I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.method" in trend page
    And I wait for "CheckBox" will be visible
    Then I click the "NextButton" button under some element

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible


  Scenario Outline: drag_and_drop_order_line
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Resplen" to the "Values"
    And I wait for "3000" millsecond
    And I wait for "OtherChart" will be visible
    And I click the "AddValueField" button
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I drag the element "Resplen" to the "Values2"
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    When I click the "ElementInDimensions" button
    And I click the "AscendingOrder" button
#    And I hide the element "Panel"
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond

    And I wait for "EditFirstField" will be visible
    And I click the "EditFirstField" button
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "3000"
    And I click the "Clientip" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Smooth" will be visible
    And I choose the "柱状图" from the "TypeChartField" in config
    And I choose the "平均值" from the "TypeFunction" in config
    And I click the "EditColor" button
    And I wait for "Purple" will be visible
    And I wait for "1500" millsecond
    And I click the "Purple" button
    And I click the "Clientip" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond

    And I wait for "EditSecondField" will be visible
    And I click the "EditSecondField" button
    And I set the parameter "Unit" with value "面"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""
    And I click the "Clientip" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I wait for "ElementInValues2" will be visible
    When I click the "ElementInValues2" button
    And I wait for "Smooth" will be visible
    And I choose the "面积图" from the "TypeChartField" in config
    And I choose the "去重" from the "TypeFunction" in config

    And I click the "Clientip" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I click the "RightPosition" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond


    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats avg(apache.resp_len),dc(apache.resp_len) by apache.clientip"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/拖拽_<chartType>"
    And I compare source image "actual/拖拽_<chartType>" with target image "expect/拖拽_<chartType>"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value ""
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  button_dim      | button       | unit | min | max | color  |
      |  Multiaxis |  DescendingOrder | Smooth       |  个  |  1  | 28  | Orange |