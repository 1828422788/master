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
      | name | describe | group         | spl                                                               | chart   | xAxis   | tag        | order           | yAxis   | unit | smooth | connectEmptyData | min | max   | settingSwitch | fieldValue | position | colour |
      | 曲线图  | test     | default_Trend | * \|stats count() by appname,logtype                              | Line    | appname | Horizontal | DefaultOrder    | count() |      | Smooth | ConnectEmptyData | 10  | 30000 |               | logtype    |          | Purple |
      | 面积图  | test     | default_Trend | *\|bucket timestamp span=1d as ts \| stats count() by appname, ts | Area    | appname | Horizontal | DefaultOrder    | count() | 吨    | Smooth | ConnectEmptyData | 10  | 2000  | SettingSwitch | logtype    |          | Purple |
      | 散点图  | test     | default_Trend | *\|bucket timestamp span=1d as ts \| stats count() by appname, ts | Scatter | appname | Vertical   | DescendingOrder | count() |      |        |                  |     | 2000  |               | logtype    |          | Purple |
      | 柱状图  | test     | default_Trend | *\|bucket timestamp span=1d as ts \| stats count() by appname, ts | Column  | appname | Vertical   | DescendingOrder | count() |      |        |                  |     | 2000  |               | logtype    |          | Purple |

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
      | name | describe | group         | spl                                               | chart    | field   | divideField1  | divideField2    |
      | 饼状图  | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | Pie      | count() | apache.status | apache.geo.city |
      | 玫瑰图  | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | Rose     | count() | apache.status | apache.geo.city |
      | 条形图  | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | Bar      | count() | apache.status | apache.geo.city |
