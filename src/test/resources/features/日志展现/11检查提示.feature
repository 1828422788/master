@logDisplayPrompt
Feature: 日志展现_提示

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I drag the element "SearchPageSvg" to the "left" side

  Scenario Outline: test1
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  | stats count() as cnt by apache.clientip,apache.method  | sort by cnt, apache.clientip"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "<folder>" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "<settingsTab>" button
    And I click the "<button>" button
    And I choose the "cnt" from the "FieldValue" in config
    And I set the parameter "<parameter>" with value "<value>"
    And I click the "Generate" button
    And I wait for "EnsureButton" will be visible
    And I will see the success message "<message>"


  Examples:
    |  folder    |    chartType   | settingsTab | button        | parameter       |  value   | message                          |
    | Order      | LineChart      | Yaxis       |               | Min             | abc      | 请输入正确的数值(min < max)      |
    | Order      | LineChart      | Facet       | AddField      | RowNum          |          | 请输入行数                       |
    | Order      | LineChart      | Facet       | AddField      | RowNum          | abc      | 请输入列数                       |
    | Order      | LineChart      | Xaxis       |               | LabelInterval   | abc      | 请输入正确的标签间隔             |
    | Order      | LineChart      | Yaxis       |               | Unit            | abcde    | y轴单位的长度最多是4个字符！     |


  Scenario Outline: test2
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.method, apache.geo.province, apache.geo.city | sort by +apache.geo.province, cnt, apache.go.city | limit 10"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "<folder>" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "<settingsTab>" button
    And I click the "<button>" button
    And I set the parameter "<parameter>" with value "<value>"
    And I click the "Generate" button
    And I wait for "EnsureButton" will be visible
    And I will see the success message "<message>"

  Examples:
    |  folder    |    chartType   | settingsTab | button        | parameter       |  value   | message                          |
    | Connection | Force          | Exhibition  |               | Repulsion       | 0        | 斥力因子应为大于0的数值！        |
    | Map        | Statisticalmap | General     |               | Transparency    |          | 请填写合理的透明度数字！         |
    | Map        | Statisticalmap | General     |               | MinRadius       | abc      | 请填写合理的标记宽度！           |
    | Map        | Statisticalmap | Tile        |               | CenterLatitude  | a        | 请填写合理的经纬度！             |
    | Map        | Statisticalmap | Tile        |               | ZoomLevel       | a        | 请填写合理的缩放级别！           |
    | Map        | Statisticalmap | Tile        |               | MapOpacity      | a        | 请填写合理的透明度数字！         |
    | Other      | Single         | Exhibition  |               | FontSize        | a        | 请选择展示字段！                 |
    | Other      | Single         | Exhibition  | AccordingArea | MinRange        | 1        | 请输入合理的分段颜色数值区间！   |
    | Other      | Matrixheatmap  | Yaxis       |               | Segments        | a        | 分段数应为正整数                 |
    | Other      | NetworkNode    | Exhibition  |               | Repulsion       | a        | 斥力因子应为正整数！             |

  Scenario Outline: test3
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart  \| stats count() as cnt by apache.clientip,apache.method  \| sort by cnt, apache.clientip"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "<folder>" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "<tab>" button
    And I click the "AddField" button
    And I click the "<button>" button
    And I wait for "EnsureButton" will be visible
    And I will see the success message "<message>"


    Examples:
      |  folder   |    chartType   | tab       | button    | message                  |
      | Order     | LineChart      | Group     |           | 最多添加1个分组字段      |
      | Order     | AreaChart      | Group     |           | 最多添加1个分组字段      |
      | Order     | ScatterChart   | Group     |           | 最多添加1个分组字段      |
      | Order     | ColumnChart    | Group     | AddField  | 最多添加2个分组字段      |
      | Dimension | Pie            | Divide    | AddField  | 最多添加2个切分字段      |
      | Dimension | Rose           | Divide    | AddField  | 最多添加2个切分字段      |
      | Dimension | Bar            | Divide    | AddField  | 最多添加2个切分字段      |
      | Compound  | Multiaxis      | Group     | AddField  | 最多添加2个分组字段      |
      | Other     | Radar          | Divide    |           | 最多添加1个切分字段      |

