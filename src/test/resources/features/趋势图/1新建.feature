Feature: 趋势图新建

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: 序列图sample1（RZY-2477、2005、2491、2499、2522）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chart>" button
    And I click the "<chartType>" button
    And I display the element "ChartTypePopover"
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

  @first @trendSmoke
    Examples:
      | name       | spl                                                                          | chart | chartType | reportName   | hour | minute |
      | 曲线图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Order | Line      | 曲线图sample1报表 | 11   | 50     |
      | 柱状图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Order | Column    | 柱状图sample1报表 | 12   | 05     |

  @all @smoke @trendSmoke @trend
    Examples:
      | name       | spl                                                                                                                      | chart | chartType | reportName   | hour | minute |
      | 面积图sample1 | tag:*display \| bucket timestamp span = 30m as ts \| stats count()  as cnt by apache.status,ts \|sort by cnt \| limit 20 | Order | Area      | 面积图sample1报表 | 11   | 55     |
      | 散点图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                             | Order | Scatter   | 散点图sample1报表 | 12   | 00     |

  @second @trendSmoke
    Examples:
      | name       | spl                                                                                                                                                                             | chart    | chartType | reportName    | hour | minute |
      | 多Y轴sample1 | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 | Compound | Multiaxis | 多Y轴图sample1报表 | 12   | 10     |

  @all @smoke @trendSmoke @trend
  Scenario Outline: 序列图（RZY-2479、2483、2500）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Order" button
    And I click the "<chart>" button
    And I click the "Setting" button under some element
    And I click the "<tag>" button under some element
    And I click the "<order>" button under some element
    And I click the "Yaxis" button under some element
    And I set the parameter "Unit" with value "<unit>"
    And I click the "<smooth>" button under some element
    And I click the "<connectEmptyData>" button under some element
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Group" button
    And I click the "<pile>" button
    And I click the "Example" button
    And I click the "<position>" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

    Examples:
      | name       | spl                                                                                                                      | chart  | tag        | order           | unit | smooth | connectEmptyData | min | max | pile | position       | colour |
      | 曲线图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                             | Line   | Right      | DescendingOrder | 吨    | Smooth | ConnectEmptyData |     | 10  |      | SecondPosition | Green  |
      | 面积图sample2 | tag:*display \| bucket timestamp span = 30m as ts \| stats count()  as cnt by apache.status,ts \|sort by cnt \| limit 20 | Area   | Vertical   | AscendingOrder  | 克    | Smooth | ConnectEmptyData | 0   |     | Pile | NoneExample    | Purple |
      | 柱状图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                             | Column | Horizontal | DescendingOrder | 克    |        |                  | 1   |     | Pile | SecondPosition | Purple |

  @second @trendSmoke
  Scenario Outline: 多Y轴图sample2（RZY-2523）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button under some element
    And I click the "<tag>" button under some element
    And I click the "<order>" button under some element
    And I click the "Yaxis" button under some element
    And I choose the "max(apache.resp_len)" from the "SettingSelect"
    And I choose the "面积图" from the "Type"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Unit" with value "面"
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170k"
    And I click the "AddField" button
    And I choose the "min(apache.resp_len)" from the "FiledValue2"
    And I choose the "柱状图" from the "Type"
    And I set the parameter "Unit" with value "柱"
    And I set the parameter "Min" with value "2"
    And I click the "AddField" button
    And I choose the "sum(apache.status)" from the "FiledValue3"
    And I choose the "散点图" from the "Type"
    And I set the parameter "Unit" with value "散"
    And I set the parameter "Max" with value "49k"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Red" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

    Examples:
      | name       | spl                                                                                                                                                                             | chartType | chart     | tag        | order          |
      | 多Y轴sample2 | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 | Compound  | Multiaxis | Horizontal | AscendingOrder |

  @all @smoke @trendSmoke @trend
  Scenario Outline: 散点图sample2（RZY-2492）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Order" button
    And I click the "<chart>" button
    And I click the "Setting" button under some element
    And I click the "<tag>" button under some element
    And I click the "<order>" button under some element
    And I click the "Yaxis" button under some element
    And I set the parameter "Unit" with value "<unit>"
    And I click the "<smooth>" button
    And I click the "<connectEmptyData>" button
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Bubble" button
    And I click the "AccordingField" button
    And I choose the "count()" from the "BubbleSize"
    And I click the "Example" button
    And I click the "<position>" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

    Examples:
      | name       | spl                                                                          | chart   | tag        | order           | unit | smooth | connectEmptyData | min | max | position      | colour |
      | 散点图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Scatter | Horizontal | DescendingOrder | g    |        |                  | 1   | 11  | FirstPosition | Purple |

  Scenario Outline: 和弦桑基力图sample1（RZY-2506、2508、2512）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "apache.x_forward" from the "SettingSelect"
    And I click the "Exhibition" button
    And I click the "<startColour>" button
    And I click the "<colour>" button
    And I click the "Target" button
    And I choose the "apache.resp_len" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

  @all @smoke @trendSmoke @trend
    Examples:
      | name       | spl                                                                                                                                                                                                            | chartType | chart | reportName   | startColour | colour | hour | minute |
      | 和弦图sample1 | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | Relation  | Chord | 和弦图sample1报表 |             |        | 12   | 15     |
      | 力图sample1  | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | Relation  | Force | 力图sample1报表  |             |        | 12   | 25     |

  @second @trendSmoke
    Examples:
      | name       | spl                                                                                                                                                                                                            | chartType | chart  | reportName   | startColour | colour | hour | minute |
      | 桑基图sample1 | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | Relation  | Sankey | 桑基图sample1报表 | StartColour | Purple | 12   | 20     |

  @all @smoke @trendSmoke @trend
  Scenario Outline: 饼状图sample1、条形图sample1（RZY-2504、2677）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I display the element "ChartTypePopover"
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name       | spl                                                                          | chartType | chart | reportName   | hour | minute |
      | 饼状图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Pie   | 饼状图sample1报表 | 12   | 30     |
      | 条形图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Bar   | 条形图sample1报表 | 12   | 32     |

  @second @trendSmoke
  Scenario Outline: 区间图sample1（RZY-2516）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "ts" from the "SettingSelect"
    And I click the "Yaxis" button
    And I choose the "count" from the "SettingSelect"
    And I choose the "_predict_count" from the "Predict"
    And I choose the "upper95" from the "TopLimit"
    And I choose the "lower95" from the "LowerLimit"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "35"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name       | spl                                                                                                                        | chartType | chart     | reportName   |
      | 区间图sample1 | tag:*display \| bucket timestamp span=1h as ts \| stats count('apache.status') as 'count' by ts \| esma count timefield=ts | Compound  | Rangeline | 区间图sample1报表 |

  Scenario Outline: 热力地图、旭日图sample1（RZY-2539、2851）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chart>" button
    And I click the "<type>" button
    And I display the element "ChartTypePopover"
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "40"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

  @first @trendSmoke
    Examples:
      | name        | spl                                                    | chart | type    |
      | 热力地图sample1 | tag:sample04061424 \| stats count() by apache.geo.city | Map   | Heatmap |

  @second @trendSmoke
    Examples:
      | name       | spl                                                                          | chart     | type     |
      | 旭日图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Sunburst |

  @second @trendSmoke
  Scenario Outline: 攻击地图sample1（RZY-2542）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Map" button
    And I click the "Attackmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "apache.clientip" from the "SettingSelect"
    And I choose the "client_lat" from the "Longitude"
    And I choose the "client_lon" from the "Latitude"
    And I click the "Target" button
    And I choose the "gw_address" from the "SettingSelect"
    And I choose the "gw_lat" from the "Longitude"
    And I choose the "gw_lon" from the "Latitude"
    And I click the "Weight" button
    And I choose the "cnt" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "攻击地图sample1报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "45"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name        | spl                                                                                                                                                                                                                                                                                           |
      | 攻击地图sample1 | tag:sample04061424 \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 |

  @second @trendSmoke
  Scenario Outline: 攻击地图sample2（RZY-2543）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Map" button
    And I click the "Attackmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "apache.clientip" from the "SettingSelect"
    And I choose the "client_lat" from the "Longitude"
    And I choose the "client_lon" from the "Latitude"
    And I click the "Target" button
    And I choose the "gw_address" from the "SettingSelect"
    And I choose the "gw_lat" from the "Longitude"
    And I choose the "gw_lon" from the "Latitude"
    And I click the "Weight" button
    And I choose the "cnt" from the "SettingSelect"
    And I click the "Region" button
    And I click the "China" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

    Examples:
      | name        | spl                                                                                                                                                                                                                                                                                           |
      | 攻击地图sample2 | tag:sample04061424 \| parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" \| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address \| eval gw_lat=39.5427 \| eval gw_lon=116.2317 |

  @second @trendSmoke
  Scenario Outline: 区划地图sample1（RZY-2546）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Map" button
    And I click the "Regionmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Region" button
    And I click the "GoingDown" button
    And I choose the "apache.geo.province" from the "Province"
    And I choose the "apache.geo.city" from the "City"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "区划地图sample1报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "50"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name        | spl                                                                                           |
      | 区划地图sample1 | tag:sample04061424 \| stats count() by apache.geo.country,apache.geo.province,apache.geo.city |

  @second @trendSmoke
  Scenario Outline: 区划地图sample2（RZY-2547）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Map" button
    And I click the "Regionmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Divide" button
    And I choose the "apache.geo.province" from the "SettingSelect"
    And I click the "Region" button
    And I click the "China" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

    Examples:
      | name        | spl                                                                                           |
      | 区划地图sample2 | tag:sample04061424 \| stats count() by apache.geo.country,apache.geo.province,apache.geo.city |

  @first @trendSmoke
  Scenario Outline: 单值sample1（RZY-2550）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I click the "<colourFilling>" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "单值sample1报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "12"
    And I set the parameter "Minute" with value "55"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name      | spl                                                                                            | colourFilling |
      | 单值sample1 | tag:*display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | Background    |

  @first @trendSmoke
  Scenario Outline: 单值sample2（RZY-2551）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "AccordingTrend" button
    And I choose the "<time>" from the "CompareTime"
    And I click the "<exhibition>" button
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "icon" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

    Examples:
      | name      | spl                                                                                            | time | exhibition |
      | 单值sample2 | tag:*display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | 一天前  | Percent    |

  @second @trendSmoke
  Scenario Outline: 单值sample3（RZY-2552）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I set the parameter "MinRange" with value "1"
    And I set the parameter "MaxRange" with value "300"
    And I click the "StartColour" button
    And I click the "Yellow" button
    And I click the "Icon" button
    And I click the "AccordingName" button
    And I set the parameter "IconName" with value "search"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

    Examples:
      | name      | spl                                                                                            |
      | 单值sample3 | tag:*display \| stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") |

  Scenario Outline: 水球图sample1、字符云图sample1、饼状图sample2（RZY-2563、RZY-2626、RZY-2663）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<type>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

  @second @trendSmoke
    Examples:
      | name       | spl                                                          | chartType | type       | colour | hour | minute |
      | 水球图sample1 | tag:*display \| stats count() by apache.clientip \| limit 10 | Other     | Liquidfill | Orange | 13   | 00     |

  @third @trendSmoke
    Examples:
      | name        | spl                                                          | chartType | type      | colour | hour | minute |
      | 字符云图sample1 | tag:*display \| stats count() by apache.clientip \| limit 10 | Other     | Wordcloud | Orange | 13   | 05     |

  @first @trendSmoke
    Examples:
      | name       | spl                                                                          | chartType | type | colour | hour | minute |
      | 饼状图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Pie  | Yellow | 13   | 07     |

  @all @smoke @trendSmoke @trend
  Scenario Outline: 饼状图sample3（RZY-2664）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<type>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

    Examples:
      | name       | spl                                                                          | chartType | type | colour |
      | 饼状图sample3 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Pie  | Orange |

  @all @smoke @trendSmoke @trend
  Scenario Outline: 条形图sample2（RZY-2678）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<type>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I choose the "展示全部" from the "Label"
    And I choose the "柱状外左侧" from the "Label"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "13"
    And I set the parameter "Minute" with value "12"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name       | spl                                                                          | chartType | type | colour |
      | 条形图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Bar  | Orange |

  Scenario Outline: 条形图sample3（RZY-2679）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "<chartType>" button
    And I click the "<type>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I choose the "展示全部" from the "Label"
    And I choose the "柱状内中央" from the "Label"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

  @all @smoke @trendSmoke @trend
    Examples:
      | name       | spl                                                                          | chartType | type | colour |
      | 条形图sample3 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Bar  | Yellow |

  @second @trendSmoke
    Examples:
      | name       | spl                                                                          | chartType | type     | colour |
      | 旭日图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Sunburst | Orange |

  @second @trendSmoke
  Scenario Outline: 雷达图sample1、漏斗图sample1（RZY-2635、2658）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "<type>" button
    And I display the element "ChartTypePopover"
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "<hour>"
    And I set the parameter "Minute" with value "<minute>"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name       | spl                                                                        | type   | hour | minute |
      | 雷达图sample1 | tag:*display \| stats count() by apache.clientip,apache.status \| limit 10 | Radar  | 13   | 10     |
      | 漏斗图sample1 | tag:*display \| stats count() by apache.clientip \| limit 8                | Funnel | 13   | 15     |

  @second @trendSmoke
  Scenario Outline: 雷达图sample2（RZY-2646）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Radar" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "Divide" button
    And I click the "SwitchButton" button
    And I click the "Example" button
    And I click the "SecondPosition" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Orange" button
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

    Examples:
      | name       | spl                                                                        |
      | 雷达图sample2 | tag:*display \| stats count() by apache.clientip,apache.status \| limit 10 |

  @second @trendSmoke
  Scenario Outline: 循序图sample1（RZY-2631）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Sequence" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "timestamp" from the "SettingSelect"
    And I click the "Source" button
    And I choose the "sequence.from" from the "SettingSelect"
    And I click the "Target" button
    And I choose the "sequence.to" from the "SettingSelect"
    And I click the "Divide" button
    And I choose the "sequence.msgid" from the "SettingSelect"
    And I click the "Mark" button
    And I choose the "sequence.relatemsg" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "13"
    And I set the parameter "Minute" with value "20"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name       | spl                                                                                         |
      | 循序图sample1 | tag:seq_test \| table timestamp,sequence.from,sequence.to,sequence.relatemsg,sequence.msgid |

  @second @trendSmoke
  Scenario Outline: 矩阵热力图sample1（RZY-2661）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "<type>" button
    And I click the "Setting" button under some element
    And I click the "Horizontal" button under some element
    And I click the "Generate" button under some element
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "13"
    And I set the parameter "Minute" with value "25"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name         | spl                                                         | type          |
      | 矩阵热力图sample1 | tag:*display \| stats count() by apache.clientip \| limit 8 | Matrixheatmap |

  @second @trendSmoke
  Scenario Outline: RZY-2962:pivot_调用链sample1
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:gf_dapper* AND dapper.msg.traceId:"511f8756ce1d0b8a" dapper.msg.duration:>0  | table dapper.msg.id, dapper.msg.parentId, dapper.class, dapper.msg.duration, dapper.msg.timestamp,dapper.msg.binaryAnnotations[].value, collector_recv_timestamp"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Other" button
    And I click the "Tracing" button
    And I click the "Setting" button
    And I choose the "dapper.class" from the "SettingSelect"
    And I choose the "dapper.msg.parentId" from the "ParentId"
    And I choose the "dapper.msg.id" from the "ChildId"
    And I click the "Time" button
    And I choose the "dapper.msg.timestamp" from the "SettingSelect"
    And I choose the "dapper.msg.duration" from the "KeepTime"
    And I click the "Info" button
    And I choose the "dapper.msg.binaryAnnotations[].value" from the "SettingSelect"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button

    Examples:
      | name      |
      | 调用链sample |

  @second @trendSmoke
  Scenario Outline: RZY-3080:pivot_chart指令sample0
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "| makeresults count = 10 | eval app = "test" | eval tag = "t" | append [[ | makeresults count = 10 | eval app = "rcl" | eval tag = "r" ]] | chart rendertype = "sunburst" count() over tag by app"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "10"
    And I set the parameter "Minute" with value "00"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name                 |
      | pivot_chart指令sample0 |

  @second @trendSmoke
  Scenario Outline: RZY-3085:pivot_力图sample2
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "tag:*display | stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method | rename apache.clientip as apache.x_forward_group| rename apache.method as apache.resp_len_group| limit 20"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Relation" button
    And I click the "Force" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "apache.x_forward" from the "SettingSelect"
    And I click the "Target" button
    And I choose the "apache.resp_len" from the "SettingSelect"
    And I click the "Exhibition" button
    And I set the parameter "Repulsion" with value "500"
    And I click the "Generate" button
    And I wait for loading invisible
    And I wait for "1000" millsecond
    And take part of "Canvas" with name "trend/<name>"
    And I click the "Save" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<name>报表"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "10"
    And I set the parameter "Minute" with value "05"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button

    Examples:
      | name            |
      | pivot_力图sample2 |