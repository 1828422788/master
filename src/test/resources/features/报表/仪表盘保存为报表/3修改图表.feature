@saveDashboardAsReport @dashboardChartSettings
Feature:3修改图表

  Background:
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for "2000" millsecond

  Scenario Outline: 修改图表_序列
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I click the "<label>" button
    And I click the "<order>" button
    And I wait for "1000" millsecond
    And I click the "Yaxis" button
    And I set the parameter "unit" with value "<unit>"
    And I wait for "1000" millsecond
    And I click the "<button>" button
    And I wait for "1000" millsecond
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"

    And I click the "Group" button
    And I wait for "1000" millsecond
    And I click the "<pile>" button
    And I wait for "1000" millsecond

    And I click the "Example" button
    And I click the "<legendPosition>" button
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond
  Examples:
    | name     | folder  |  tag         | chart            | label          | order          | unit   |  button        | pile | min  | max   | legendPosition   |
    | 序列     | Order   | LineChart    | LineChart        | FirstLabel     |                |   个   |  Smooth        |      |  1   |   25  | FirstPosition    |
    | 序列     | Order   | AreaChart    | AreaChart        | SecondLabel    | AscendingOrder |  pcs.  |ConnectEmptyData|      |      |   20  | SecondPosition   |
    | 序列     | Order   | AreaChart    | AreaChart_Pile   | ThirdLabel     | DescendingOrder|  pcs.  |                | Pile |  2   |   25  | ThirdPosition    |
    | 序列     | Order   | ColumnChart  | ColumnChart_Pile | ThirdLabel     | DescendingOrder|   个   |                | Pile |  0   |   20  | ThirdPosition    |

  Scenario Outline: 修改图表_气泡
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I click the "<label>" button
    And I wait for "1000" millsecond
    And I click the "Yaxis" button
    And I set the parameter "unit" with value "<unit>"
    And I wait for "1000" millsecond

    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I choose the "count()" from the "BubbleSize"
    And I wait for "1000" millsecond

    And I click the "Example" button
    And I click the "<legendPosition>" button
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder  |  tag         | chart            | label          |unit  |legendPosition  |
      | 序列     | Order   | ScatterChart | ScatterChart     | SecondLabel    | 个   | FirstPosition  |

  Scenario Outline: 修改图表_维度
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I choose the "<typeInfo>" from the "ShowLabel"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder    |  tag         | chart |  typeInfo     |   color   |
      | 维度     | Dimension | Pie          | Pie   |  只展示名称   |   Red     |
      | 维度     | Dimension | Rose         | Rose  |  全部展示     |   Green   |
      | 维度     | Dimension | Bar          | Bar   |  不展示       |   Yellow  |
      | 维度     | Dimension | Sun          | Sun   |               | DarkBlue  |

  Scenario Outline: 修改图表_维度_bar
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I choose the "<typeInfo>" from the "ShowLabel"
    And I choose the "<option>" from the "LabelLocation"
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder    |  tag         | chart |  typeInfo     | option         |   color   |
      | 维度     | Dimension | Bar          | Bar   |  只展示名称   |  柱状外右侧    |   Red     |
      | 维度     | Dimension | Bar          | Bar   |  全部展示     |  柱状内靠左侧  |   Green   |

  Scenario Outline: 修改图表_维度_火焰图
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I click the "Divide" button
    And I click the "DeleteFirst" button
    And I click the "DeleteFirst" button
    And I click the "Exhibition" button
    And I click the "DrillIn" button
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder    |  tag         | chart |
      | 维度     | Dimension | Flame        | Flame |

  Scenario Outline: 修改图表_关系
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I set the parameter "<field>" with value "<repulsion>"
    And I click the "<multistage>" button
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder    |  tag         | chart        |   color   | repulsion | multistage  | field  |
      | 关系     | Connection| Chord        | Chord        | Red       |           |             |         |
      | 关系     | Connection| Sankey       | Sankey       | Yellow    |           |             |         |
      | 关系     | Connection| Sankey       | Sankey_Mult  | Red       |           | Multistage  |         |
      | 关系     | Connection| Force        | Force        | Green     | 20        |             | Repulsion|

  Scenario Outline: 修改图表_区间图
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I click the "Xaxis" button
    And I choose the "<xValue>" from the "FieldValue" in config
    And I click the "Yaxis" button
    And I choose the "<actualValue>" from the "Actual" in config
    And I choose the "<predictedValue>" from the "Predict" in config
    And I choose the "<upperValue>" from the "Outlier" in config
    And I choose the "<upperValue>" from the "TopLimit" in config
    And I choose the "<lowerValue>" from the "LowerLimit" in config
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder    |  tag         | chart        | xValue | actualValue|  predictedValue| upperValue | lowerValue |
      | 复合     | Compound  | Rangeline    | Rangeline    |   ts   |   cnt      |   _predict_cnt |    upper95 |    lower95 |

  Scenario Outline: 修改图表_多y轴图
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I click the "Xaxis" button
    And I choose the "apache.resp_len" from the "FieldValue" in config
    And I click the "FirstLabel" button
    And I click the "AscendingOrder" button

    And I click the "Yaxis" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"
    And I set the parameter "Unit" with value "面"
    And I choose the "max(apache.resp_len)" from the "FieldValue" in config
    And I choose the "面积图" from the "TypeChartField" in config
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button

    And I click the "AddField" button
    And I click the "Yaxis2" button
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""
    And I click the "AddConfigFields" button
    And I choose the "min(apache.resp_len)" from the "FieldValue" in config
    And I choose the "柱状图" from the "TypeChartField" in config

    And I click the "AddField" button
    And I click the "Yaxis3" button
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "49000"
    And I click the "AddConfigFields" button
    And I choose the "sum(apache.status)" from the "FieldValue" in config
    And I choose the "散点图" from the "TypeChartField" in config

    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Red" button
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder    |  tag         | chart        |
      | 复合     | Compound  | Multiaxis    | Multiaxis    |

  Scenario Outline: 修改图表_多y轴图2
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "1000" millsecond
    And I click the "Setting" button under some element
    And I click the "Xaxis" button
    And I choose the "apache.resp_len" from the "FieldValue" in config
    And I click the "FirstLabel" button
    And I click the "AscendingOrder" button
    And I click the "Group" button
    And I click the "DeleteFirst" button

    And I click the "Yaxis" button
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170000"
    And I set the parameter "Unit" with value "面"
    And I choose the "max(apache.resp_len)" from the "FieldValue" in config
    And I choose the "面积图" from the "TypeChartField" in config
    And I drag the element "SliderHandle" by "-60" pixels
    And I click the "AddColor" button
    And I click the "Green" button
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button

    And I click the "AddField" button
    And I click the "Yaxis2" button
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I set the parameter "Max" with value ""
    And I click the "AddConfigFields" button
    And I choose the "min(apache.resp_len)" from the "FieldValue" in config
    And I choose the "柱状图" from the "TypeChartField" in config
    And I click the "AddColor" button
    And I click the "Red" button

    And I click the "AddField" button
    And I click the "Yaxis3" button
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Min" with value ""
    And I set the parameter "Max" with value "49000"
    And I click the "AddConfigFields" button
    And I choose the "sum(apache.status)" from the "FieldValue" in config
    And I choose the "散点图" from the "TypeChartField" in config
    And I click the "AddColor" button
    And I click the "Orange" button
    And I wait for "1000" millsecond
    Then I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder    |  tag         | chart        |
      | 复合     | Compound  | Multiaxis    | Multiaxis_2  |

  Scenario Outline: 修改图表_区划地图
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "500" millsecond
    And I click the "Setting" button
    And I click the "Value" button
    And I choose the "count()" from the "FieldValue" in config
    And I click the "Divide" button
    And I click the "DeleteLast" button
    And I choose the "<field>" from the "FieldValue" in config
    And I click the "Region" button
    And I click the "Select<region>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder    |  tag         | chart            | region   | field               |
      | 地图     | Map       | Regionmap    | Regionmap_Jiangsu| Jiangsu  | apache.geo.city     |
      | 地图     | Map       | Regionmap    | Regionmap_China  | China    | apache.geo.province |

  Scenario Outline: 修改图表_地图
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I wait for "1000" millsecond
    And I click the Circle "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder    |  tag         | chart           |
      | 地图     | Map       | Regionmap    | Regionmap_World |
      | 地图     | Map       | Heatmap      | Heatmap         |

  Scenario Outline: 修改图表_攻击地图
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "500" millsecond
    And I click the "Setting" button
    And I click the "Source" button
    And I choose the "apache.clientip" from the "FieldValue" in config
    And I choose the "clientlon" from the "FieldLongitude" in config
    And I choose the "clientlat" from the "FieldLatitude" in config
    And I click the "Target" button
    And I choose the "gw_address" from the "FieldValue" in config
    And I choose the "gw_lon" from the "FieldLongitude" in config
    And I choose the "gw_lat" from the "FieldLatitude" in config
    And I click the "Weight" button
    And I choose the "cnt" from the "FieldValue" in config
    And I click the "Region" button
    And I click the "Select<region>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name     | folder    |  tag         | chart            | region   |
      | 地图     | Map       | Attackmap    | Attackmap_China  | China    |
      | 地图     | Map       | Attackmap    | Attackmap_World  | World    |

  Scenario Outline: 修改图表_其他
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "500" millsecond
    And I click the "Setting" button
    And I choose the "<value>" from the "<field>"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond
    
    Examples:
      | name     | folder    |  tag         | chart     | value     | field        | color     |
      | 其他     | Other     | Single       | Single    | cnt       | NumericField | Green     |
      | 其他     | Other     | Liquidfill   | Liquidfill| cnt_perc  | FieldValue   | Green     |
      | 其他     | Other     | Wordcloud    | Wordcloud | count()   | FieldValue   | Green     |
      | 其他     | Other     | Funnel       | Funnel    | count()   | FieldValue   | LightGreen|


  Scenario Outline: 修改图表_其他_single_icon
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I wait for "500" millsecond
    And I click the "Setting" button
    And I choose the "cnt" from the "NumericField"
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "icon" from the "FieldValue"
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name | folder |  tag   | chart       | color |
      | 其他 | Other  | Single | Single_icon | Red   |

  Scenario Outline: 修改图表_其他_single_font
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "500" millsecond
    And I click the "Setting" button
    And I choose the "cnt" from the "NumericField"
    And I click the "Icon" button
    And I click the "AccordingName" button
    And I set the parameter "IconName" with value "font-awesome-flag"
    And I click the "Exhibition" button
    And I set the parameter "FontSize" with value "100"
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "<color>" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name | folder |  tag   | chart       | color |
      | 其他 | Other  | Single | Single_font | Orange|

  Scenario Outline: 修改图表_其他_single_backgr
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "500" millsecond
    And I click the "Setting" button
    And I choose the "cnt" from the "NumericField"
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I wait for "2000" millsecond
    And I set the parameter "MinRange" with value "1"
    And I set the parameter "MaxRange" with value "100"
    And I click the "AddColor" button
    And I click the "Yellow" button
    And I click the "AddRange" button
    And I set the parameter "MinRange" with value "100"
    And I set the parameter "MaxRange" with value "200"
    And I click the "AddColor" button
    And I click the "Orange" button
    And I wait for "1000" millsecond
    And I click the "Background" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name | folder |  tag   | chart               |
      | 其他 | Other  | Single | Single_range_backgr |

  Scenario Outline: 修改图表_其他_环形比例图1
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "500" millsecond
    And I click the "Setting" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "Orange" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name | folder |  tag   | chart         |
      | 其他 | Other  | Ring   | Ring_oneField |

  Scenario Outline: 修改图表_其他_环形比例图2
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "500" millsecond
    And I click the "Setting" button
    And I choose the "count_perc" from the "FieldValue" in config
    And I click the "Compare" button
    And I choose the "count2_perc" from the "FieldValue" in config
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name | folder |  tag   | chart         |
      | 其他 | Other  | Ring   | Ring_twoFields|

  Scenario Outline: 修改图表_其他_radar
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "500" millsecond
    And I click the "Setting" button
    And I click the "Divide" button
    And I click the "DeleteLast" button
    And I choose the "apache.geo.city" from the "FieldValue" in config
    And I click the "Indicator" button
    And I choose the "apache.geo.city" from the "FieldValue" in config
    And I wait for "1500" millsecond
    And I click the "UnifyMetric" button
    And I click the "Exhibition" button
    And I click the "AddColor" button
    And I click the "DarkBlue" button
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name | folder |  tag   | chart |
      | 其他 | Other  | Radar  | Radar |

  Scenario Outline: 修改图表_其他_matrixheatmap
    And I set the parameter "SearchInput" with value "仪表盘_<name>"
    And I wait for "2000" millsecond
    When I click the detail which name is "仪表盘_<name>"
    And switch to window "仪表盘"
    And I close all tabs except main tab
    Then I will see the "dashboard.DetailPage" page
    And I wait for "LastTag" will be visible
    And I wait for "500" millsecond
    And I set the parameter "SearchTagInput" with value "<tag>"
    And I wait for "500" millsecond
    And I click the Element with text "<tag>"
    And I wait for "2000" millsecond
    And I click the "LastChartType" button under some element
    Then I will see the "trend.CreatePage" page
    And I wait for "<folder>" will be visible
    And I click the "<folder>" button
    And I click the "<tag>" button
    And I hide the element "Content"
    And I wait for "500" millsecond
    And I click the "Setting" button
    And I click the "Xaxis" button
    And I choose the "count()" from the "FieldValue" in config
    And I click the "Yaxis" button
    And I choose the "apache.status" from the "FieldValue" in config
    And I set the parameter "Segments" with value "10"
    And I wait for "1000" millsecond
    And I click the "Generate" button
    And I wait for "1000" millsecond
    And I click the "Setting" button
    And I wait for "2000" millsecond

    Examples:
      | name | folder |  tag         | chart         |
      | 其他 | Other  | Matrixheatmap| Matrixheatmap |
