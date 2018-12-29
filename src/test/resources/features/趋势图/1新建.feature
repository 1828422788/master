@all @smoke @trendSmoke @trend
Feature: 趋势图新建

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: sample0（RZY-2487、2488、2490、2495、2505、2507、2511、2503）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "AutoCreate"
    And I choose the "default_Trend" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    Then I will see "<rowNum>" rows and "<columnNum>" columns in the table
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name       | spl                                                                                                                                                                                                            | rowNum | columnNum |
      | 曲线图sample0 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                                                   | 10     | 3         |
      | 面积图sample0 | tag:*display \| bucket timestamp span = 30m as ts \| stats count()  as cnt by apache.status,ts \|sort by cnt \| limit 20                                                                                       | 20     | 3         |
      | 散点图sample0 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                                                   | 10     | 3         |
      | 柱状图sample0 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                                                   | 10     | 3         |
      | 和弦图sample0 | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | 20     | 5         |
      | 桑基图sample0 | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | 20     | 5         |
      | 力图sample0  | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | 20     | 5         |
      | 饼状图sample0 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                                                   | 10     | 3         |
      | 区间图sample0 | tag:*display \| bucket timestamp span=1h as ts \| stats count('apache.status') as 'count' by ts \| esma count timefield=ts                                                                                     | 20     | 5         |
      | 多Y轴sample0 | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10                                | 5      | 7         |

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
    And I click the "Save" button
    Then I will see the success message "创建成功"
    And I click the "EnsureButton" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "01"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name       | spl                                                                                                                                                                             | chart    | chartType | reportName    |
      | 曲线图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                    |          | Line      | 曲线图sample1报表  |
      | 面积图sample1 | tag:*display \| bucket timestamp span = 30m as ts \| stats count()  as cnt by apache.status,ts \|sort by cnt \| limit 20                                                        |          | Area      | 面积图sample1报表  |
      | 散点图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                    |          | Scatter   | 散点图sample1报表  |
      | 柱状图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10                                                                                                    |          | Column    | 柱状图sample1报表  |
      | 多Y轴sample1 | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 | Compound | Multiaxis | 多Y轴图sample1报表 |

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
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "<tag>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I set the parameter "Unit" with value "<unit>"
    And I click the "<smooth>" button
    And I click the "<connectEmptyData>" button
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
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name       | spl                                                                          | chart  | tag        | order           | unit | smooth | connectEmptyData | min | max | pile | position       | colour |
      | 曲线图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Line   | Right      | DescendingOrder | 吨    | Smooth | ConnectEmptyData |     | 10  |      | SecondPosition | Green  |
      | 面积图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Area   | Vertical   | AscendingOrder  | 克    | Smooth | ConnectEmptyData | 0   |     | Pile | NoneExample    | Purple |
      | 柱状图sample2 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Column | Horizontal | DescendingOrder | 克    |        |                  | 1   |     | Pile | SecondPosition | Purple |

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
    And I click the "Setting" button
    And I click the "<tag>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I choose the "max(apache.resp_len)" from the "SettingSelect"
    And I choose the "面积图" from the "Type"
    And I click the "Smooth" button
    And I click the "ConnectEmptyData" button
    And I set the parameter "Unit" with value "面"
    And I set the parameter "Min" with value "1"
    And I set the parameter "Max" with value "170k"
    And I click the "AddField" button
    And I choose the "柱状图" from the "Type"
    And I choose the "min(apache.resp_len)" from the "FiledValue2"
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
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name       | spl                                                                                                                                                                             | chartType | chart     | tag        | order          |
      | 多Y轴sample2 | tag:*display \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.resp_len,apache.status \| limit 10 | Compound  | Multiaxis | Horizontal | AscendingOrder |

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
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I click the "<tag>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
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
    And I click the "Save" button
    Then I will see the success message "创建成功"

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
    And I click the "Target" button
    And I choose the "apache.resp_len" from the "SettingSelect"
    And I click the "Exhibition" button
    And I click the "<startColour>" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"
    And I click the "EnsureButton" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "01"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name       | spl                                                                                                                                                                                                            | chartType | chart  | reportName   | startColour | colour |
      | 和弦图sample1 | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | Relation  | Chord  | 和弦图sample1报表 |             |        |
      | 桑基图sample1 | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | Relation  | Sankey | 桑基图sample1报表 | StartColour | Purple |
      | 力图sample1  | tag:*display \| stats count() by apache.clientip,apache.x_forward,apache.resp_len,apache.method \| rename apache.clientip as apache.x_forward_group\| rename apache.method as apache.resp_len_group\| limit 20 | Relation  | Force  | 力图sample1报表  |             |        |

  Scenario Outline: 饼状图sample1（RZY-2504）
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
    And I click the "Save" button
    Then I will see the success message "创建成功"
    And I click the "EnsureButton" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "01"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name       | spl                                                                          | chartType | chart | reportName   |
      | 饼状图sample1 | tag:*display \| stats count() by apache.clientip,apache.resp_len \| limit 10 | Dimension | Pie   | 饼状图sample1报表 |

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
    And I click the "Save" button
    Then I will see the success message "创建成功"
    And I click the "EnsureButton" button
    And I click the "Report" button
    And switch to another window
    And I will see the "report.CreatePage" page
    And I set the parameter "Name" with value "<reportName>"
    And I set the parameter "Describe" with value "AutoTest"
    And I set the parameter "EmailInput" with value "wang.yueming@yottabyte.cn"
    And I click the "Email" button
    And I display the element "Scrollbar"
    And I set the parameter "Subject" with value "报表名称：<%report_name%>"
    And I set the parameter "Hour" with value "11"
    And I set the parameter "Minute" with value "01"
    And I click the "NextButton" button
    And I wait for "TrendTitle" will be visible
    And I will see the element "TrendTitle" name is "<name>"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name       | spl                                                                                                                        | chartType | chart     | reportName   |
      | 区间图sample1 | tag:*display \| bucket timestamp span=1h as ts \| stats count('apache.status') as 'count' by ts \| esma count timefield=ts | Compound  | Rangeline | 区间图sample1报表 |




#  Scenario Outline: 维度图（RZY-2099、RZY-2006至2008）
#    When I set the parameter "NameInput" with value "<name>"
#    And I set the parameter "DescribeInput" with value "<describe>"
#    And I choose the "<group>" from the "GroupDropdown"
#    And I click the "NextButton" button
#    And I set the parameter "SearchInput" with value "<spl>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for "Header" will be visible
#    And I click the "NextButton" button
#    And I click the "ChartType" button
#    And I click the "Dimension" button
#    And I click the "<chart>" button
#    And I wait for loading invisible
#    And I click the "Setting" button
#    And I choose the "<field>" from the "SettingSelect"
#    And I click the "Divide" button
#    And I choose the "<divideField1>" from the "SettingSelect"
#    And I click the "AddField" button
#    And I choose the "<divideField2>" from the "SecondSettingSelect"
#    And I click the "Generate" button
#    And I click the "Save" button
#    Then I will see the success message "创建成功"
#
#    Examples:
#      | name | describe | group         | spl                                               | chart    | field   | divideField1  | divideField2    |
#      | 旭日图  | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | Sunburst | count() | apache.status | apache.geo.city |
#
#  Scenario Outline: 热力地图（RZY-2095）
#    When I set the parameter "NameInput" with value "<name>"
#    And I set the parameter "DescribeInput" with value "<describe>"
#    And I choose the "<group>" from the "GroupDropdown"
#    And I click the "NextButton" button
#    And I set the parameter "SearchInput" with value "<spl>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for "Header" will be visible
#    And I click the "NextButton" button
#    And I click the "ChartType" button
#    And I click the "Map" button
#    And I click the "Heatmap" button
#    And I wait for loading invisible
#    And I click the "Setting" button
#    And I choose the "<field>" from the "SettingSelect"
#    And I click the "Divide" button
#    And I choose the "<divide>" from the "SettingSelect"
#    And I click the "Generate" button
#    And I click the "Save" button
#    Then I will see the success message "创建成功"
#
#    Examples:
#      | name       | describe | group         | spl                                 | field                  | divide          |
#      | AutoTest20 | test     | default_Trend | *\|stats count() by apache.geo.city | count(apache.resp_len) | apache.geo.city |
#
##  Scenario Outline: 攻击地图
##    When I set the parameter "NameInput" with value "<name>"
##    And I set the parameter "DescribeInput" with value "<describe>"
##    And I choose the "<group>" from the "GroupDropdown"
##    And I click the "NextButton" button
##    And I set the parameter "SearchInput" with value "<spl>"
##    And I click the "DateEditor" button
##    And I click the "Today" button
##    And I click the "SearchButton" button
##    And I wait for "Header" will be visible
##    And I click the "NextButton" button
##    And I click the "ChartType" button
##    And I click the "Map" button
##    And I click the "Attackmap" button
##    And I wait for loading invisible
##    And I click the "Setting" button
#
##    Scenario Outline: 区划地图
##    When I set the parameter "NameInput" with value "<name>"
##    And I set the parameter "DescribeInput" with value "<describe>"
##    And I choose the "<group>" from the "GroupDropdown"
##    And I click the "NextButton" button
##    And I set the parameter "SearchInput" with value "<spl>"
##    And I click the "DateEditor" button
##    And I click the "Today" button
##    And I click the "SearchButton" button
##    And I wait for "Header" will be visible
##    And I click the "NextButton" button
##    And I click the "ChartType" button
##    And I click the "Map" button
##    And I click the "Regionmap" button
##    And I wait for loading invisible
##    And I click the "Setting" button
#
#  Scenario Outline: 单值（RZY-2104）
#    When I set the parameter "NameInput" with value "<name>"
#    And I set the parameter "DescribeInput" with value "<describe>"
#    And I choose the "<group>" from the "GroupDropdown"
#    And I click the "NextButton" button
#    And I set the parameter "SearchInput" with value "<spl>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for "Header" will be visible
#    And I click the "NextButton" button
#    And I click the "ChartType" button
#    And I click the "Other" button
#    And I click the "Single" button
#    And I click the "Setting" button
#    And I choose the "<field>" from the "SettingSelect"
#    And I click the "Exhibition" button
#    And I click the "StartColour" button
#    And I click the "Green" button
#    And I click the "<colourFilling>" button
#    And I click the "Icon" button
#    And I click the "AccordingField" button
#    And I choose the "<icon>" from the "SettingSelect"
#    And I click the "Generate" button
#    And I click the "Save" button
#    Then I will see the success message "创建成功"
#
#    Examples:
#      | name       | describe | group         | spl                                                                               | field | colourFilling | icon |
#      | AutoTest21 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | Font          | a_   |
#      | AutoTest22 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | Background    | icon |
#
#  Scenario Outline: 单值（按趋势）
#    When I set the parameter "NameInput" with value "<name>"
#    And I set the parameter "DescribeInput" with value "<describe>"
#    And I choose the "<group>" from the "GroupDropdown"
#    And I click the "NextButton" button
#    And I set the parameter "SearchInput" with value "<spl>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for "Header" will be visible
#    And I click the "NextButton" button
#    And I click the "ChartType" button
#    And I click the "Other" button
#    And I click the "Single" button
#    And I click the "Setting" button
#    And I choose the "<field>" from the "SettingSelect"
#    And I click the "Exhibition" button
#    And I click the "AccordingTrend" button
#    And I choose the "<time>" from the "CompareTime"
#    And I click the "<exhibition>" button
#    And I click the "Icon" button
#    And I click the "AccordingName" button
#    And I set the parameter "IconName" with value "<iconName>"
#    And I click the "Generate" button
#    And I click the "Save" button
#    Then I will see the success message "创建成功"
#
#    Examples:
#      | name       | describe | group         | spl                                                                               | field | time | exhibition | iconName      |
#      | AutoTest23 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | 一天前  | Absolute   | adjust        |
#      | AutoTest24 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | 两天前  | Percent    | air-freshener |
#      | AutoTest25 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | 一周前  | Percent    | aws           |
#
#  Scenario Outline: 单值（按区间）
#    When I set the parameter "NameInput" with value "<name>"
#    And I set the parameter "DescribeInput" with value "<describe>"
#    And I choose the "<group>" from the "GroupDropdown"
#    And I click the "NextButton" button
#    And I set the parameter "SearchInput" with value "<spl>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for "Header" will be visible
#    And I click the "NextButton" button
#    And I click the "ChartType" button
#    And I click the "Other" button
#    And I click the "Single" button
#    And I click the "Setting" button
#    And I choose the "<field>" from the "SettingSelect"
#    And I click the "Exhibition" button
#    And I click the "AccordingArea" button
#    And I set the parameter "StartArea" with value "<startArea>"
#    And I set the parameter "EndArea" with value "<endArea>"
#    And I click the "<colourFilling>" button
#    And I click the "Generate" button
#    And I click the "Save" button
#    Then I will see the success message "创建成功"
#
#    Examples:
#      | name       | describe | group         | spl                                                                               | field | startArea | endArea | colourFilling |
#      | AutoTest26 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | 12        | 666     | Font          |
#
#  Scenario Outline: 字符云图（RZY-2107）
#    When I set the parameter "NameInput" with value "<name>"
#    And I set the parameter "DescribeInput" with value "<describe>"
#    And I choose the "<group>" from the "GroupDropdown"
#    And I click the "NextButton" button
#    And I set the parameter "SearchInput" with value "<spl>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for "Header" will be visible
#    And I click the "NextButton" button
#    And I click the "ChartType" button
#    And I click the "Other" button
#    And I click the "Wordcloud" button
#    And I click the "Setting" button
#    And I choose the "<field>" from the "SettingSelect"
#    And I click the "Divide" button
#    And I choose the "<divideValue>" from the "SettingSelect"
#    And I click the "Exhibition" button
#    And I click the "StartColour" button
#    And I click the "Green" button
#    And I click the "Generate" button
#    And I click the "Save" button
#    Then I will see the success message "创建成功"
#
#    Examples:
#      | name       | describe | group         | spl                                 | field   | divideValue |
#      | AutoTest27 | test     | default_Trend | *\|stats count() by appname,logtype | count() | appname     |
#
#  Scenario Outline: 雷达图（RZY-2109）
#    When I set the parameter "NameInput" with value "<name>"
#    And I set the parameter "DescribeInput" with value "<describe>"
#    And I choose the "<group>" from the "GroupDropdown"
#    And I click the "NextButton" button
#    And I set the parameter "SearchInput" with value "<spl>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for "Header" will be visible
#    And I click the "NextButton" button
#    And I click the "ChartType" button
#    And I click the "Other" button
#    And I click the "Radar" button
#    And I wait for loading invisible
#    And I click the "Setting" button
#    And I choose the "<number>" from the "SettingSelect"
#    And I click the "Divide" button
#    And I choose the "<divide>" from the "SettingSelect"
#    And I click the "<switchButton>" button
#    And I click the "Indicator" button
#    And I choose the "<indicator>" from the "SettingSelect"
#    And I click the "Generate" button
#    And I click the "Save" button
#    Then I will see the success message "创建成功"
#
#    Examples:
#      | name       | describe | group         | spl                                               | number  | divide        | switchButton | indicator       |
#      | AutoTest28 | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | count() | apache.status | SwitchButton | apache.geo.city |
#      | AutoTest29 | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | count() | apache.status |              | apache.geo.city |
#
#  Scenario Outline: 漏斗图（RZY-2110）
#    When I set the parameter "NameInput" with value "<name>"
#    And I set the parameter "DescribeInput" with value "<describe>"
#    And I choose the "<group>" from the "GroupDropdown"
#    And I click the "NextButton" button
#    And I set the parameter "SearchInput" with value "<spl>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for "Header" will be visible
#    And I click the "NextButton" button
#    And I click the "ChartType" button
#    And I click the "Other" button
#    And I click the "Funnel" button
#    And I wait for loading invisible
#    And I click the "Setting" button
#    And I choose the "<number>" from the "SettingSelect"
#    And I click the "Divide" button
#    And I choose the "<divide>" from the "SettingSelect"
#    And I click the "Example" button
#    And I click the "<position>" button
#    And I click the "Exhibition" button
#    And I click the "StartColour" button
#    And I click the "<colour>" button
#    And I click the "Generate" button
#    And I click the "Save" button
#    Then I will see the success message "创建成功"
#
#    Examples:
#      | name       | describe | group         | spl                                               | number  | divide        | position       | colour |
#      | AutoTest30 | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | count() | apache.status | BottomPosition | Green  |