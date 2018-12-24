@all @smoke @reportSmoke @report
Feature: 报表所需趋势图新建

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: 序列图
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "<describe>"
    And I choose the "<group>" from the "GroupDropdown"
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
    And I choose the "<xAxis>" from the "SettingSelect"
    And I click the "<tag>" button
    And I click the "<order>" button
    And I click the "Yaxis" button
    And I choose the "<yAxis>" from the "SettingSelect"
    And I set the parameter "Unit" with value "<unit>"
    And I click the "<smooth>" button
    And I click the "<connectEmptyData>" button
    And I set the parameter "Min" with value "<min>"
    And I set the parameter "Max" with value "<max>"
    And I click the "Group" button
    And I click the "<settingSwitch>" button
    And I choose the "<fieldValue>" from the "SettingSelect"
    And I click the "Example" button
    And I click the "<position>" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name        | describe | group         | spl                                                               | chart   | xAxis   | tag        | order           | yAxis   | unit | smooth | connectEmptyData | min | max   | settingSwitch | fieldValue | position | colour |
      | 曲线图AutoTest | test     | default_Trend | * \|stats count() by appname,logtype                              | Line    | appname | Horizontal | DefaultOrder    | count() |      | Smooth | ConnectEmptyData | 10  | 30000 |               | logtype    |          | Purple |
      | 面积图AutoTest | test     | default_Trend | *\|bucket timestamp span=1d as ts \| stats count() by appname, ts | Area    | appname | Horizontal | DefaultOrder    | count() | 吨    | Smooth | ConnectEmptyData | 10  | 2000  | SettingSwitch | logtype    |          | Purple |
      | 散点图AutoTest | test     | default_Trend | *\|bucket timestamp span=1d as ts \| stats count() by appname, ts | Scatter | appname | Vertical   | DescendingOrder | count() |      |        |                  |     | 2000  |               | logtype    |          | Purple |
      | 柱状图AutoTest | test     | default_Trend | *\|bucket timestamp span=1d as ts \| stats count() by appname, ts | Column  | appname | Vertical   | DescendingOrder | count() |      |        |                  |     | 2000  |               | logtype    |          | Purple |

  Scenario Outline: 维度图（RZY-2099、RZY-2006至2008）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "<describe>"
    And I choose the "<group>" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Yesterday" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Dimension" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "<field>" from the "SettingSelect"
    And I click the "Divide" button
    And I choose the "<divideField1>" from the "SettingSelect"
    And I click the "AddField" button
    And I choose the "<divideField2>" from the "SecondSettingSelect"
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name        | describe | group         | spl                                               | chart | field   | divideField1  | divideField2    |
      | 饼状图AutoTest | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | Pie   | count() | apache.status | apache.geo.city |
      | 玫瑰图AutoTest | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | Rose  | count() | apache.status | apache.geo.city |
      | 条形图AutoTest | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | Bar   | count() | apache.status | apache.geo.city |

  Scenario Outline: 关系图（RZY-2089、RZY-2090、RZY-2092）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "<describe>"
    And I choose the "<group>" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Relation" button
    And I click the "<chart>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "<source>" from the "SettingSelect"
    And I click the "Target" button
    And I choose the "<target>" from the "SettingSelect"
    And I click the "Weight" button
    And I choose the "<weight>" from the "SettingSelect"
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name        | describe | group         | spl                                                               | chart  | source  | target  | weight  |
      | 和弦图AutoTest | test     | default_Trend | *\|stats count() by appname,logtype                               | Chord  | appname | logtype | count() |
      | 桑基图AutoTest | test     | default_Trend | *\|bucket timestamp span=1d as ts \| stats count() by appname, ts | Sankey | appname | ts      | count() |
      | 力图AutoTest  | test     | default_Trend | *\|stats count() by appname,logtype                               | Force  | appname | logtype | count() |

  Scenario Outline: 复合图（区间图）（RZY-2093）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "<describe>"
    And I choose the "<group>" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Compound" button
    And I click the "<chartType>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "<xAxis>" from the "SettingSelect"
    And I click the "Yaxis" button
    And I choose the "<actual>" from the "SettingSelect"
    And I choose the "<predict>" from the "Predict"
    And I choose the "<topLimit>" from the "TopLimit"
    And I choose the "<lowerLimit>" from the "LowerLimit"
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name        | describe | group         | spl                                                                                                        | chartType | xAxis | actual | predict        | topLimit | lowerLimit |
      | 区间图AutoTest | test     | default_Trend | * \| bucket timestamp span=15s as ts \| stats count('appname') as 'count' by ts \| esma count timefield=ts | Rangeline | ts    | count  | _predict_count | upper95  | lower95    |

  Scenario Outline: 复合图（多Y轴图）（RZY-2094）
    When I set the parameter "NameInput" with value "<name>"
    And I set the parameter "DescribeInput" with value "<describe>"
    And I choose the "<group>" from the "GroupDropdown"
    And I click the "NextButton" button
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I click the "ChartType" button
    And I click the "Compound" button
    And I click the "<chartType>" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "<xAxis>" from the "SettingSelect"
    And I click the "Yaxis" button
    And I choose the "<field>" from the "SettingSelect"
    And I choose the "<type>" from the "SecondSettingSelect"
    And I set the parameter "Unit" with value "<unit>"
    And I click the "Group" button
    And I choose the "<groupValue>" from the "SettingSelect"
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name         | describe | group         | spl                                                                                                                                        | chartType | xAxis           | field                  | type | unit | groupValue           |
      | 多Y轴图AutoTest | test     | default_Trend | * \| stats count(apache.resp_len), max(apache.resp_len), min(apache.resp_len), sum(apache.status), avg(apache.resp_len) by apache.geo.city | Multiaxis | apache.geo.city | count(apache.resp_len) | 曲线图  | k    | max(apache.resp_len) |
