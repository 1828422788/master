@dragAndDrop @dragAndDropDataset @trend
Feature: 趋势图_选择数据集

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    When I click the "NewTrendFromDataset" button

  Scenario Outline:  single_dataset_1
    When I click the "SingleDataset" button
    And I click the "EnsureButton" button
    Then I will see the "trend.DragAndDropPage" page
    When I click the "Dataset_1" button
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "TableBody" will be visible
    And I choose the "apache.clientip" from the "ColumnField" in config
    And I choose the "<operator>" from the "Operator" in config
    And I set the parameter "Value" with value "221.226.97.92"
    And I click the "Apply" button
    And I wait for "Message" will be visible
    Then I will see the element "Message" contains "应用成功"
    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "<datasetspl>"
    When I click the "CloseSPL" button
    And I wait for "TableBody" will be visible
    And I click the "NextButton" button under some element

    Then I wait for "Dimensions" will be visible
    And I drag the element "Timestamp" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "<chart>" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    When I click the "ElementInDimensions" button
    And I set the parameter "Span" with value "30m"
    And I hide the element "Panel"
    And I wait for "ElementInValues" will be visible
    And I drag the element "Method" to the "CompareBy"
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "<spl>"
    When I click the "CloseSPL" button
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "CustomTimeTab" button
    And I set the parameter "StartDateField" with yesterday date
    And I set the parameter "EndDateField" with current date
    And I click the "StartTimeField" button
    And I click the "ApplyCustomTime" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/数据集_<chart>_单"
    And I compare source image "actual/数据集_<chart>_单" with target image "expect/数据集_<chart>_单"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "数据集_<chart>_单"
    And I set the parameter "DescribeInput" with value "<chart>_<operator>"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

  Examples:
    | chart    |  operator   |  datasetspl                                                             |spl    |
    | Line     |  不等于     |  tag:sample04061424_chart \| where(apache.clientip!="221.226.97.92")    |tag:sample04061424_chart \| where(apache.clientip!="221.226.97.92") \| timechart span=30m count(apache.clientip) by apache.method |
    | Area     |    等于     |  tag:sample04061424_chart \| where(apache.clientip=="221.226.97.92")    |tag:sample04061424_chart \| where(apache.clientip=="221.226.97.92") \| timechart span=30m count(apache.clientip) by apache.method |


  Scenario Outline:  single_dataset_3
    When I click the "SingleDataset" button
    And I click the "EnsureButton" button
    Then I will see the "trend.DragAndDropPage" page
    When I click the "Dataset_3" button
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "TableBody" will be visible
    And I choose the "<condition>" from the "Condition"
    And I choose the "apache.resp_len" from the "ColumnField" in config
    And I choose the "<oper1>" from the "Operator" in config
    And I set the parameter "Value" with value "70"
    And I click the "Add" button
    And I choose the "apache.resp_len" from the "ColumnField" in config
    And I choose the "<oper2>" from the "Operator" in config
    And I set the parameter "Value" with value "1500"
    And I click the "Apply" button
    And I wait for "Message" will be visible
    Then I will see the element "Message" contains "应用成功"
    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "<datasetspl>"
    When I click the "CloseSPL" button
    And I wait for "TableBody" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Dimensions" will be visible
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "<chart>" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I drag the element "Status" to the "CompareBy"
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "<spl>"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/数据集_<chart>_<condition>_单"
    And I compare source image "actual/数据集_<chart>_<condition>_单" with target image "expect/数据集_<chart>_<condition>_单"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "数据集_<chart>_<condition>_单"
    And I set the parameter "DescribeInput" with value "<chart>_<condition>_<oper1>_<oper2>"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chart    | condition  |  oper1 |  oper2 |datasetspl                                                                    |spl    |
      | Column   |  全部      |  大于  |  小于  |tag:sample04061424_chart \| where(apache.resp_len>70 && apache.resp_len<1500) |tag:sample04061424_chart \| where(apache.resp_len>70 && apache.resp_len<1500)\|stats count(apache.clientip) by apache.clientip,apache.status |
      | Column   |  任一      |  小于  |  大于  |tag:sample04061424_chart \| where(apache.resp_len<70 \|\| apache.resp_len>1500) |tag:sample04061424_chart \| where(apache.resp_len<70 \|\| apache.resp_len>1500)\|stats count(apache.clientip) by apache.clientip,apache.status |


  Scenario Outline:  single_dataset_3_expression
    When I click the "SingleDataset" button
    And I click the "EnsureButton" button
    Then I will see the "trend.DragAndDropPage" page
    When I click the "Dataset_3" button
    And I click the "DateEditor" button
    And I click the "Today" button
    And I wait for "TableBody" will be visible
    And I click the "Expression" button
    And I set the parameter "Value" with value "(apache.resp_len<70 || apache.resp_len>1500) && apache.clientip!="221.226.97.92" && apache.clientip!="183.14.126.216""
    And I click the "Apply" button
    And I wait for "Message" will be visible
    Then I will see the element "Message" contains "应用成功"
    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "<datasetspl>"
    When I click the "CloseSPL" button
    And I wait for "TableBody" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Dimensions" will be visible
    And I drag the element "Clientip" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "<chart>" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I drag the element "Status" to the "CompareBy"
    And I wait for "2000" millsecond
    Then I wait for "Chart" will be visible
    And I wait for "2000" millsecond

    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "<spl>"
    When I click the "CloseSPL" button
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/数据集_<chart>_表达式_单"
    And I compare source image "actual/数据集_<chart>_表达式_单" with target image "expect/数据集_<chart>_表达式_单"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "数据集_<chart>_表达式_单"
    And I set the parameter "DescribeInput" with value "<chart>_Expression"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chart    |  datasetspl                                                                                                               |spl    |
      | Column   |  tag:sample04061424_chart \| where((apache.resp_len<70 \|\| apache.resp_len>1500) && apache.clientip!="221.226.97.92" && apache.clientip!="183.14.126.216")    |tag:sample04061424_chart \| where((apache.resp_len<70 \|\| apache.resp_len>1500) && apache.clientip!="221.226.97.92" && apache.clientip!="183.14.126.216")\|stats count(apache.clientip) by apache.clientip,apache.status |


  Scenario Outline:  union_dataset_12
    When I click the "UnionDataset" button
    And I click the "EnsureButton" button
    Then I will see the "trend.DragAndDropPage" page
    When I drag the element "Dataset_1" to the "DropDataset"
    And I drag the element "Dataset_2" to the "DropDataset"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "Overview" button
    And I wait for "TableBody" will be visible
    And I click the "CheckSPL" button
    And I will see the element "SPL" contains "tag:sample04061424_chart | append [[ tag:sample04061424_display ]]"
    When I click the "CloseSPL" button
    And I wait for "TableBody" will be visible
    And I click the "NextButton" button under some element

    And I wait for "Dimensions" will be visible
    And I drag the element "Timestamp" to the "Dimensions"
    And I drag the element "Clientip" to the "Values"
    And I click the "<chart>" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    When I click the "ElementInDimensions" button
    And I set the parameter "Span" with value "30m"
    And I hide the element "Panel"
    And I wait for "ElementInValues" will be visible
    And I drag the element "Method" to the "CompareBy"
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "AddColor" will be visible
    And I click the "AddColor" button
    And I wait for "<color>" will be visible
    And I wait for "1500" millsecond
    And I click the "<color>" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    And I click the "ElementInCompare" button
    And I click the "Pile" button
    And I wait for "3000" millsecond
    And I wait for "Chart" will be visible

    And I click the "CheckSPL" button
    Then I will see the element "SPL" contains "tag:sample04061424_chart | append [[ tag:sample04061424_display ]] | timechart span=30m count(apache.clientip) by apache.method"
    When I click the "CloseSPL" button
    And I wait for "1000" millsecond
    And I click the "DateEditor" button
    And I click the "CustomTimeTab" button
    And I set the parameter "StartDateField" with yesterday date
    And I set the parameter "EndDateField" with current date
    And I click the "StartTimeField" button
    And I click the "ApplyCustomTime" button
    And I wait for "2000" millsecond
    And I wait for "Chart" will be visible
    And I wait for "2000" millsecond
    Then take part of "Chart" with name "actual/数据集_<chart>_追加"
    And I compare source image "actual/数据集_<chart>_追加" with target image "expect/数据集_<chart>_追加"
    And I click the "NextButton" button under some element

    When I will see the "trend.CreatePage" page
    And I set the parameter "NameInput" with value "数据集_<chart>_追加"
    And I set the parameter "DescribeInput" with value "<chart>_union_<color>"
    And I click the "NextButton" button under some element
    Then I wait for "SuccessCreate" will be visible

    Examples:
      | chart   |  color  |
      | Area    |  Purple |