@all @smoke @trendSmoke @trend
Feature: 趋势图新建

  Background:
    Given open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    Then I will see the "trend.CreatePage" page

  Scenario Outline: 序列图（RZY-1898、RZY-2005、RZY-1903）
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
      | name      | describe | group         | spl                                                               | chart | xAxis   | tag      | order           | yAxis   | unit | smooth | connectEmptyData | min | max   | settingSwitch | fieldValue | position       | colour |
      | AutoTest2 | test     | default_Trend | * \|stats count() by appname,logtype                              | Line  | appname | Left     | AscendingOrder  | count() | k    |        |                  |     | 30000 |               | logtype    | BottomPosition | Green  |
      | AutoTest3 | test     | default_Trend | * \|stats count() by appname,logtype                              | Line  | appname | Right    | DescendingOrder | count() | 吨    | Smooth | ConnectEmptyData | 10  |       |               | logtype    | FirstPosition  | Orange |
      | AutoTest4 | test     | default_Trend | * \|stats count() by appname,logtype                              | Line  | appname | Vertical | DescendingOrder | count() | 吨    | Smooth |                  |     |       |               | logtype    | SecondPosition | Purple |
      | AutoTest6 | test     | default_Trend | *\|bucket timestamp span=1d as ts \| stats count() by appname, ts | Area  | appname | Left     | AscendingOrder  | count() | kg   |        |                  |     |       |               | logtype    |                | Green  |
      | AutoTest7 | test     | default_Trend | *\|bucket timestamp span=1d as ts \| stats count() by appname, ts | Area  | appname | Right    | DescendingOrder | count() | kg   | Smooth | ConnectEmptyData | 0   |       | SettingSwitch | logtype    |                | Orange |
      | AutoTest8 | test     | default_Trend | *\|bucket timestamp span=1d as ts \| stats count() by appname, ts | Area  | appname | Vertical | DescendingOrder | count() |      |        |                  |     | 2000  |               | logtype    |                | Purple |

  Scenario Outline: 维度图（RZY-2099、RZY-2006至2008）
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
      | 旭日图  | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | Sunburst | count() | apache.status | apache.geo.city |

  Scenario Outline: 热力地图（RZY-2095）
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
    And I click the "Map" button
    And I click the "Heatmap" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "<field>" from the "SettingSelect"
    And I click the "Divide" button
    And I choose the "<divide>" from the "SettingSelect"
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name       | describe | group         | spl                                 | field                  | divide          |
      | AutoTest20 | test     | default_Trend | *\|stats count() by apache.geo.city | count(apache.resp_len) | apache.geo.city |

#  Scenario Outline: 攻击地图
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
#    And I click the "Attackmap" button
#    And I wait for loading invisible
#    And I click the "Setting" button

#    Scenario Outline: 区划地图
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
#    And I click the "Regionmap" button
#    And I wait for loading invisible
#    And I click the "Setting" button

  Scenario Outline: 单值（RZY-2104）
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
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I choose the "<field>" from the "SettingSelect"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Green" button
    And I click the "<colourFilling>" button
    And I click the "Icon" button
    And I click the "AccordingField" button
    And I choose the "<icon>" from the "SettingSelect"
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name       | describe | group         | spl                                                                               | field | colourFilling | icon |
      | AutoTest21 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | Font          | a_   |
      | AutoTest22 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | Background    | icon |

  Scenario Outline: 单值（按趋势）
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
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I choose the "<field>" from the "SettingSelect"
    And I click the "Exhibition" button
    And I click the "AccordingTrend" button
    And I choose the "<time>" from the "CompareTime"
    And I click the "<exhibition>" button
    And I click the "Icon" button
    And I click the "AccordingName" button
    And I set the parameter "IconName" with value "<iconName>"
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name       | describe | group         | spl                                                                               | field | time | exhibition | iconName      |
      | AutoTest23 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | 一天前  | Absolute   | adjust        |
      | AutoTest24 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | 两天前  | Percent    | air-freshener |
      | AutoTest25 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | 一周前  | Percent    | aws           |

  Scenario Outline: 单值（按区间）
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
    And I click the "Other" button
    And I click the "Single" button
    And I click the "Setting" button
    And I choose the "<field>" from the "SettingSelect"
    And I click the "Exhibition" button
    And I click the "AccordingArea" button
    And I set the parameter "StartArea" with value "<startArea>"
    And I set the parameter "EndArea" with value "<endArea>"
    And I click the "<colourFilling>" button
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name       | describe | group         | spl                                                                               | field | startArea | endArea | colourFilling |
      | AutoTest26 | test     | default_Trend | *\|stats avg(apache.status) as a_\|eval icon=if(a_>300,"thumbs-down","thumbs-up") | a_    | 12        | 666     | Font          |

  Scenario Outline: 字符云图（RZY-2107）
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
    And I click the "Other" button
    And I click the "Wordcloud" button
    And I click the "Setting" button
    And I choose the "<field>" from the "SettingSelect"
    And I click the "Divide" button
    And I choose the "<divideValue>" from the "SettingSelect"
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "Green" button
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name       | describe | group         | spl                                 | field   | divideValue |
      | AutoTest27 | test     | default_Trend | *\|stats count() by appname,logtype | count() | appname     |

  Scenario Outline: 雷达图（RZY-2109）
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
    And I click the "Other" button
    And I click the "Radar" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "<number>" from the "SettingSelect"
    And I click the "Divide" button
    And I choose the "<divide>" from the "SettingSelect"
    And I click the "<switchButton>" button
    And I click the "Indicator" button
    And I choose the "<indicator>" from the "SettingSelect"
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name       | describe | group         | spl                                               | number  | divide        | switchButton | indicator       |
      | AutoTest28 | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | count() | apache.status | SwitchButton | apache.geo.city |
      | AutoTest29 | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | count() | apache.status |              | apache.geo.city |

  Scenario Outline: 漏斗图（RZY-2110）
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
    And I click the "Other" button
    And I click the "Funnel" button
    And I wait for loading invisible
    And I click the "Setting" button
    And I choose the "<number>" from the "SettingSelect"
    And I click the "Divide" button
    And I choose the "<divide>" from the "SettingSelect"
    And I click the "Example" button
    And I click the "<position>" button
    And I click the "Exhibition" button
    And I click the "StartColour" button
    And I click the "<colour>" button
    And I click the "Generate" button
    And I click the "Save" button
    Then I will see the success message "创建成功"

    Examples:
      | name       | describe | group         | spl                                               | number  | divide        | position       | colour |
      | AutoTest30 | test     | default_Trend | *\|stats count() by apache.status,apache.geo.city | count() | apache.status | BottomPosition | Green  |