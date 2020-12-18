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
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() as cnt by apache.method, apache.geo.province, apache.geo.city | sort by +apache.geo.province, cnt, apache.geo.city | limit 10"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "<folder>" button
    And I click the "<chartType>" button
    And I click the "Settings" button
    And I click the "<tab>" button
    And I click the "<button>" button
    And I click the "<button1>" button
    And I wait for "EnsureButton" will be visible
    And I will see the success message "<message>"


    Examples:
      |  folder   |    chartType   | tab       | button      | button1   | message                  |
      | Order     | LineChart      | Group     | AddField    |           | 最多添加1个分组字段      |
      | Order     | AreaChart      | Group     | AddField    |           | 最多添加1个分组字段      |
      | Order     | ScatterChart   | Group     | AddField    |           | 最多添加1个分组字段      |
      | Order     | ColumnChart    | Group     | AddField    | AddField  | 最多添加2个分组字段      |
      | Dimension | Pie            | Divide    | AddField    | AddField  | 最多添加2个切分字段      |
      | Dimension | Rose           | Divide    | AddField    | AddField  | 最多添加2个切分字段      |
      | Dimension | Bar            | Divide    | AddField    | AddField  | 最多添加2个切分字段      |
      | Compound  | Multiaxis      | Group     | AddField    | AddField  | 最多添加2个分组字段      |
      | Other     | Radar          | Divide    | AddField    |           | 最多添加1个切分字段      |
      | Other     | Ring           |           |             | Generate  | 请选择展示字段！         |
      | Other     | NetworkNode    | Indicators| AddIndicator| Generate  | 展示指标字段值为空！     |

  Scenario Outline: rangeline
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag: sample04061424_chart | bucket timestamp span=1h as ts | stats count() as cnt by ts | esma cnt timefield=ts "
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Compound" button
    And I click the "Rangeline" button
    And I click the "Settings" button
    And I click the "Xaxis" button
    And I choose the "<xaxis>" from the "FieldValue"
    And I click the "Yaxis" button
    And I choose the "<actual>" from the "Actual" in config
    And I choose the "<predict>" from the "Predict" in config
    And I choose the "<outliner>" from the "Outlier" in config
    And I choose the "<upper>" from the "TopLimit" in config
    And I click the "Generate" button
    And I wait for "EnsureButton" will be visible
    And I will see the success message "<message>"


    Examples:
    |  xaxis      |  actual |    predict  | outliner   | upper   |       message                                       |
    |             |         |             |            |         | 请选择x轴字段！                                     |
    | ts          |         |             |            |         | 实际值字段，预测值字段和异常值字段，请至少选择一项！|
    | ts          |  cnt    |             |            |         | 请选择上限字段！                                    |
    | ts          |         | _predict_cnt|            |         | 请选择上限字段！                                    |
    | ts          |         |             |_predict_cnt|         | 请选择上限字段！                                    |
    | ts          |  cnt    |             |            | upper95 | 请选择下限字段！                                    |

  Scenario Outline: attackmap
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart \| parse field=apache.request_query \"\^gw_address=(\?<gw_address>\\d+\\.\\d+\\.\\d+\\.\\d+)\" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Map" button
    And I click the "Attackmap" button
    And I click the "Settings" button
    And I click the "Source" button
    And I choose the "<source>" from the "FieldValue" in config
    And I choose the "<sourceLon>" from the "FieldLongitude" in config
    And I choose the "<sourceLat>" from the "FieldLatitude" in config
    And I click the "Target" button
    And I choose the "<target>" from the "FieldValue" in config
    And I choose the "<targetLon>" from the "FieldLongitude" in config
    And I choose the "<targetLat>" from the "FieldLatitude" in config
    And I click the "Generate" button
    And I wait for "EnsureButton" will be visible
    And I will see the success message "<message>"

    Examples:
      |      source     |  sourceLon | sourceLat  | target     | targetLon | targetLat | message                |
      |                 |            |            |            |           |           | 请选择来源字段！       |
      | apache.clientip |            |            |            |           |           | 请选择来源经度字段！   |
      | apache.clientip | client_lon |            |            |           |           | 请选择来源维度字段！   |
      | apache.clientip | client_lon | client_lat |            |           |           | 请选择目标字段！       |
      | apache.clientip | client_lon | client_lat | gw_address |           |           | 请选择目标经度字段！   |
      | apache.clientip | client_lon | client_lat | gw_address | gw_lon    |           | 请选择目标维度字段！   |
      | apache.clientip | client_lon | client_lat | gw_address | gw_lon    |  gw_lat   | 请选择权重字段！       |

  Scenario Outline: chain
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:gf_dapper* AND dapper.msg.traceId:\"511f8756ce1d0b8a\" dapper.msg.duration:\>0 \| table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations\[\].value, timestamp \| sort by dapper.msg.duration"
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "Chain" button
    And I click the "Settings" button
    And I choose the "<function>" from the "Function" in config
    And I choose the "<parentIDvalue>" from the "ParentId" in config
    And I choose the "<childIDvalue>" from the "ChildId" in config
    And I click the "Time" button
    And I choose the "<starttime>" from the "StartTime" in config
    And I click the "Generate" button
    And I wait for "EnsureButton" will be visible
    And I will see the success message "<message>"

    Examples:
      | function     | parentIDvalue       | childIDvalue  | starttime                | message            |
      |              |                     |               |                          | 请选择函数字段     |
      | dapper.class |                     |               |                          | 请选择父id字段     |
      | dapper.class | dapper.msg.parentId |               |                          | 请选择子id字段     |
      | dapper.class | dapper.msg.parentId | dapper.msg.id |                          | 请选择开始时间字段 |
      | dapper.class | dapper.msg.parentId | dapper.msg.id | dapper.msg.timestamp     | 请选择持续时间字段 |

  Scenario Outline: sequence
    When I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" tag:sample04061424_chart | stats count() by hostname,apache.clientip |limit 3 "
    And I click the "SearchButton" button under some element
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the "trend.CreatePage" page
    And I click the "Type" button
    And I click the "Other" button
    And I click the "Sequence" button
    And I click the "Settings" button
    And I click the "TimeSequence" button
    And I choose the "<timeSeq>" from the "FieldValue" in config
    And I click the "Source" button
    And I choose the "<source>" from the "FieldValue" in config
    And I click the "Target" button
    And I choose the "<target>" from the "FieldValue" in config
    And I click the "Divide" button
    And I choose the "<segmentation>" from the "FieldValue" in config
    And I click the "Generate" button
    And I wait for "EnsureButton" will be visible
    And I will see the success message "<message>"

    Examples:
      | timeSeq  | source          | target   | segmentation    | message            |
      |          |                 |          |                 | 请选择时序字段     |
      | hostname |                 |          |                 | 请选择来源字段！   |
      | hostname | apache.clientip |          |                 | 请选择目标字段！   |
      | hostname | apache.clientip | hostname |                 | 请选择分组字段！   |
      | hostname | apache.clientip | hostname | apache.clientip | 请选择标记字段！   |
