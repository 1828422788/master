@dragAndDrop @dragAndDropOrder
Feature: 拖拽生成趋势图_序列

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "NewTrendButton" button
    Then I will see the "trend.CreatePage" page

    When I set the parameter "SearchInput" with value "tag:sample04061424_chart"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "1000" millsecond
    And I click the "SearchButton" button
    Then I wait for "CheckBox" will be visible
    When I "checked" the checkbox which name is "apache.clientip" in trend page
    And I wait for "CheckBox" will be visible
    And I "checked" the checkbox which name is "apache.method" in trend page
    And I wait for "CheckBox" will be visible
    Then I click the "NextButton" button

    When I will see the "trend.DragAndDropPage" page
    And I wait for "Dimensions" will be visible
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"


  Scenario Outline: drag_and_drop_order_line
    And I click the "<chartType>" button
    And I wait for "1500" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "1500" millsecond
    And I drag the element "Method" to the "CompareBy"
    And I wait for "1500" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "500" millsecond
    When I click the "ElementInDimensions" button
    And I click the "<button_dim>" button
    And I hide the element "Panel"
    And I wait for "Chart" will be visible
    And I wait for "1500" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Min" will be visible
    And I click the "<button>" button
    And I set the parameter "Unit" with value "<unit>"
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Clientip" button

    And I wait for "1500" millsecond
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.clientip) by apache.clientip,apache.method"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/<chartType>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<button_dim>_<button>_<unit>_<min>_<max>_<color>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  button_dim      | button           | unit | min | max | color  |
      |  Line      |  AscendingOrder  | ConnectEmptyData |  个  |  1  | 28  | Orange |

  Scenario Outline: drag_and_drop_order_pile
    And I click the "<chartType>" button
    And I wait for "1500" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "1500" millsecond
    And I drag the element "Method" to the "CompareBy"
    And I wait for "1500" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "1500" millsecond
    When I click the "ElementInDimensions" button
    And I click the "<button_dim>" button
    And I hide the element "Panel"
    And I wait for "Chart" will be visible
    And I wait for "1500" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Min" will be visible
    And I click the "<button>" button
    And I set the parameter "Unit" with value "<unit>"
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Clientip" button

    And I wait for "1500" millsecond
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I click the "ElementInCompare" button
    And I click the "Pile" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.clientip) by apache.clientip,apache.method"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/<chartType>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>_Pile"
    And I set the parameter "DescribeInput" with value "<button_dim>_<button>_<unit>_<min>_<max>_<color>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  button_dim      | button           | unit | min | max | color  |
      |  Area      |  DescendingOrder | Smooth           | pcs. |     | 25  | Yellow |
      |  Column    |  FirstLabel      |                  | r.   | 1   |     | Orange |

  Scenario Outline: drag_and_drop_order_scatter
    And I click the "<chartType>" button
    And I wait for "2000" millsecond
    And I drag the element "Method" to the "CompareBy"
    And I drag the element "Clientip" to the "Bubbles"
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    When I click the "ElementInDimensions" button
    And I click the "<button_dim>" button
    And I hide the element "Panel"
    And I wait for "Chart" will be visible
    And I wait for "1500" millsecond
    And I wait for "ElementInValues" will be visible
    When I click the "ElementInValues" button
    And I wait for "Min" will be visible
    And I set the parameter "Unit" with value "<unit>"
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Clientip" button

    And I wait for "1500" millsecond
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I click the "<color>" button
    And I click the "RightPosition" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart|stats count(apache.clientip) by apache.clientip,apache.method"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/<chartType>"
    And I click the "NextButton" button

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "拖拽_<chartType>"
    And I set the parameter "DescribeInput" with value "<button_dim>_<unit>_<min>_<max>_<color>"
    And I click the "NextButton" button
    Then I wait for "SuccessCreate" will be visible

    Examples:
      |  chartType |  button_dim      | unit | min | max | color  |
      |  Scatter   |  FirstLabel      |  个  | 0.5 |  10 | Yellow |

