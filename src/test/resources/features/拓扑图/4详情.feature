@topology
Feature: 拓扑图详情页

  Background:
    Given open the "topology.ListPage" page for uri "/topology/"

  @second @topologySmoke
  Scenario: RZY-2821：新建拓扑图sample
    When I click the detail which name is "auto_topology样例"
    Then I will see the "topology.DetailPage" page
    And I click the "SwitchButton" button
    And I set the parameter "NodeName" with value "node1"
    And I set the parameter "NodeGroup" with value "测试组"
    And I click the "AddNodeButton" button
    And I refresh the website
    And I click the "SwitchButton" button
    And I set the parameter "NodeName" with value "node2"
    And I set the parameter "NodeGroup" with value "g2"
    Then I click the "AddNodeButton" button

  @second @topologySmoke
  Scenario: RZY-2515：标识前后缀
    When I click the detail which name is "测试标识符"
    Then I will see the "topology.DetailPage" page
    And I click the "SwitchButton" button
    And I click the "AddInputButton" button
    And I set the parameter "Title" with value "标识前后缀"
    And I set the parameter "Token" with value "first"
    And I choose the "下拉菜单" from the "InputType"
    And I set the parameter "Optional" with value "stats"
    And I click the "Add" button
    And I choose the "stats" from the "DefaultValueDropdown"
    And I set the parameter "Prefix" with value "* | "
    And I set the parameter "Postfix" with value " avg(apache.resp_len)"
    And I click the "EnsureInputButton" button
    And I set the parameter "NodeName" with value "n1"
    And I set the parameter "NodeGroup" with value "g1"
    And I click the "AddNodeButton" button
    And I click the "SingleValueButton" button
    And I set the parameter "TextArea" with value "${first}"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I will see the success message "搜索完成!"
    And I choose the "avg(apache.resp_len)" from the "FiledInput"
    And I click the "Apply" button
    Then I wait for "SuccessMessage" will be visible

  @second @topologySmoke
  Scenario: RZY-2517：标识分隔符
    When I click the detail which name is "测试标识符"
    Then I will see the "topology.DetailPage" page
    And I click the "SwitchButton" button
    And I click the "AddInputButton" button
    And I set the parameter "Title" with value "标识分隔符"
    And I set the parameter "Token" with value "second"
    And I choose the "下拉菜单" from the "InputType"
    And I set the parameter "Optional" with value "apache.clientip"
    And I click the "Add" button
    And I set the parameter "Optional" with value "apache.status"
    And I click the "Add" button
    And I choose the "apache.clientip" from the "DefaultValueDropdown"
    And I set the parameter "Prefix" with value "tag:sample04061424_chart | stats count() by "
    And I set the parameter "Separate" with value ","
    And I click the "EnsureInputButton" button
    And I set the parameter "NodeName" with value "n2"
    And I set the parameter "NodeGroup" with value "g2"
    And I click the "AddNodeButton" button
    And I click the "SingleValueButton" button
    And I set the parameter "TextArea" with value "${second}"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "1000" millsecond
    And I choose the "count()" from the "FiledInput"
    And I click the "Apply" button

  @second @topologySmoke
  Scenario: RZY-2519：标识值前后缀
    When I click the detail which name is "测试标识符"
    Then I will see the "topology.DetailPage" page
    And I click the "SwitchButton" button
    And I click the "AddInputButton" button
    And I set the parameter "Title" with value "标识值前后缀"
    And I set the parameter "Token" with value "third"
    And I choose the "下拉菜单" from the "InputType"
    And I set the parameter "Optional" with value "count() as cnt by apache.status"
    And I click the "Add" button
    And I set the parameter "Optional" with value "dc(cnt)"
    And I click the "Add" button
    And I choose the "count() as cnt by apache.status,dc(cnt)" from the "DefaultValueDropdown"
    And I set the parameter "Prefix" with value "tag:sample04061424_chart | "
    And I set the parameter "IdentityPrefix" with value "stats "
    And I set the parameter "Separate" with value "|"
    And I click the "EnsureInputButton" button
    And I set the parameter "NodeName" with value "n3"
    And I set the parameter "NodeGroup" with value "g3"
    And I click the "AddNodeButton" button
    And I click the "SingleValueButton" button
    And I set the parameter "TextArea" with value "${third}"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "1000" millsecond
    And I choose the "dc(cnt)" from the "FiledInput"
    And I click the "Apply" button

  @all @topologySmoke
  Scenario: 夜间模式截图（RZY-1230）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I click the "NightMode" button

  @all @smoke @topologySmoke
  Scenario Outline: 添加文本、下拉输入项成功（RZY-1239、RZY-1240）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I click the "AddInputButton" button
    Then I set the parameter "Title" with value "<title>"
    Then I set the parameter "Token" with value "<token>"
    Then I choose the "<inputType>" from the "InputType"
    Then I click the "EnsureInputButton" button

    Examples:
      | title           | token | inputType |
      | apache.resp_len | tag1  |           |
      | apache.resp_len | tag2  | 下拉菜单      |

  Scenario Outline: 添加动态菜单输入项失败
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I click the "AddInputButton" button
    Then I set the parameter "Title" with value "<title>"
    Then I set the parameter "Token" with value "<token>"
    Then I choose the "<inputType>" from the "InputType"
    Then I set the parameter "DynamicFields" with value "<dynamicFields>"
    Then I set the parameter "SearchInput" with value "<searchInput>"
    Then I click the "SearchInputButton" button
    Then I will see the success message "<message>"

  @all
    Examples:
      | title           | token | inputType | dynamicFields   | searchInput                                   | message   |
      | apache.resp_len | tag3  | 动态菜单      |                 |                                               | 请输入动态字段   |
      | apache.resp_len | tag3  | 动态菜单      | apache.resp_len |                                               | 请输入搜索内容   |
      | apache.resp_len | tag3  | 动态菜单      | apache.resp_len | tag:"sample04061424" \| top 1 apache.resp_len | 请输入搜索时间范围 |

  Scenario Outline: 添加动态菜单输入项成功（RZY-1243）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I click the "AddInputButton" button
    Then I set the parameter "Title" with value "<title>"
    Then I set the parameter "Token" with value "<token>"
    Then I choose the "<inputType>" from the "InputType"
    Then I set the parameter "DynamicFields" with value "<dynamicFields>"
    Then I set the parameter "SearchInput" with value "<searchInput>"
    Then I click the "TimeRange" button
    Then I click the "ThisMonth" button
    Then I click the "SearchInputButton" button
    Then I will see the success message "动态字段搜索完成!"
    Then I choose the "69" from the "DynamicDefault"
    Then I click the "SearchInputButton" button

  @all @smoke @topologySmoke
    Examples:
      | title  | token | inputType | dynamicFields   | searchInput                                   |
      | 测试动态字段 | tag4  | 动态菜单      | apache.resp_len | tag:"sample04061424" \| top 1 apache.resp_len |

  Scenario Outline: 添加输入项失败
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I click the "AddInputButton" button
    Then I set the parameter "Title" with value "<title>"
    Then I set the parameter "Token" with value "<token>"
    Then I click the "EnsureInputButton" button
    Then I will see the success message "<message>"

  @all
    Examples:
      | title           | token | message  |
      |                 |       | 请填写标题    |
      | title           |       | 请填写token |
      | apache.resp_len | tag1  | 当前标识已存在! |

  Scenario Outline: 禁用、启用编辑（RZY-356至357）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Then I will see the "<button>" is "<attribute>"
    Then I click the "SwitchButton" button
    And I will see the "<button>" is clickable

  @all @smoke @topologySmoke
    Examples:
      | button                  | attribute |
      | addButton,refreshButton | disabled  |

  Scenario Outline: 节点配置失败提示
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I set the parameter "NodeName" with value "<nodeName>"
    Then I set the parameter "NodeGroup" with value "<nodeGroup>"
    Then I click the "AddNodeButton" button
    Then I will see the alertErrorMessage "<message>"

  @all
    Examples:
      | nodeName | nodeGroup | message |
      |          |           | 请输入节点名称 |
      |          | test      | 请输入节点名称 |

  Scenario Outline: 第一种布局方式（RZY-1146）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I set the parameter "NodeName" with value "<nodeName>"
    Then I set the parameter "NodeGroup" with value "<nodeGroup>"
    Then I click the "AddNodeButton" button
    Then I click the "SingleValueButton" button
    Then I set the parameter "TextArea" with value "<value>"
    Then I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<field>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "1"
    And I set the parameter "ToInput" with value "1000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I will see the success message "保存成功"

  @all @smoke @topologySmoke
    Examples:
      | nodeName | nodeGroup | value            | field   |
      | autotest | testGroup | *\|stats count() | count() |


  Scenario Outline: 第二种布局方式（RZY-1147）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    And I set the parameter "NodeName" with value "<nodeName>"
    And I set the parameter "NodeGroup" with value "<nodeGroup>"
    And I click the "AddNodeButton" button
    And I click the "LeftRightButton" button
    Then I click the "LeftValueButton" button
    Then I set the parameter "TextArea" with value "<leftValue>"
    Then I click the "DateEditor" button
    And I click the "LastWeek" button
    And I click the "SearchButton" button
#    Then I will see the message "搜索完成!"
    Then I choose the "<leftField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I click the "RightValueButton" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I click the "ThisWeek" button
    And I click the "SearchButton" button
#    Then I will see the message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I will see the message "保存成功"

  @all @smoke @topologySmoke
    Examples:
      | nodeName    | nodeGroup     | leftValue                                                                                                                                                                                                                      | leftField | rightValue                                                               | rightField               |
      | sxjautotest | autotestgroup | tag:sample04061424 \| eval is_resplen_empty=empty(apache.resp_len) \| eval res_str=if(is_resplen_empty,"repslen_empty","resplen_non_null") \| table apache.resp_len, is_resplen_empty, res_str \| where is_resplen_empty==true | res_str   | (* AND ip:192.168.1.134) \|stats pct('json.Load.load15', 25,50,75,95,99) | _pct.json.Load.load15.25 |

  Scenario Outline: 第三种布局方式（RZY-1151）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I set the parameter "NodeName" with value "<nodeName>"
    Then I set the parameter "NodeGroup" with value "<nodeGroup>"
    Then I click the "AddNodeButton" button
    Then I click the "TopBottom" button
    Then I click the "TopValueButton" button
    Then I set the parameter "TextArea" with value "<leftValue>"
    Then I click the "DateEditor" button
    And I click the "LastWeek" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<leftField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I click the "LowerValueButton" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I click the "ThisMonth" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I will see the success message "保存成功"

  @all @smoke @topologySmoke
    Examples:
      | nodeName    | nodeGroup     | leftValue          | leftField | rightValue                                                               | rightField               |
      | sxjautotest | autotestgroup | * \| stats count() | count()   | (* AND ip:192.168.1.134) \|stats pct('json.Load.load15', 25,50,75,95,99) | _pct.json.Load.load15.25 |

  Scenario Outline: 第四种布局方式（RZY-1152）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I set the parameter "NodeName" with value "<nodeName>"
    Then I set the parameter "NodeGroup" with value "<nodeGroup>"
    Then I click the "AddNodeButton" button
    Then I click the "TopLeftRight" button
    Then I click the "TopValueButton" button
    Then I set the parameter "TextArea" with value "<leftValue>"
    Then I click the "DateEditor" button
    And I click the "LastMonth" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<leftField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "LowerLeft" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I click the "TenMinutes" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "LowerRight" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I click the "HalfHour" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I will see the success message "保存成功"

  @all @smoke @topologySmoke
    Examples:
      | nodeName    | nodeGroup     | leftValue          | leftField | rightValue         | rightField |
      | sxjautotest | autotestgroup | * \| stats count() | count()   | * \| stats count() | count()    |

  Scenario Outline: 第五种布局方式（RZY-1153）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I set the parameter "NodeName" with value "<nodeName>"
    Then I set the parameter "NodeGroup" with value "<nodeGroup>"
    Then I click the "AddNodeButton" button

    Then I click the "LeftRightBottom" button
    Then I click the "LeftTop" button
    Then I set the parameter "TextArea" with value "<leftValue>"
    Then I click the "DateEditor" button
    And I click the "OneHour" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<leftField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "RightTop" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I click the "OneDay" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "LowerValueButton" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I click the "TwoDays" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I will see the success message "保存成功"

  @all @smoke @topologySmoke
    Examples:
      | nodeName    | nodeGroup     | leftValue          | leftField | rightValue                                                               | rightField               |
      | sxjautotest | autotestgroup | * \| stats count() | count()   | (* AND ip:192.168.1.134) \|stats pct('json.Load.load15', 25,50,75,95,99) | _pct.json.Load.load15.25 |

  Scenario Outline: 第六种布局方式（RZY-1154）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I set the parameter "NodeName" with value "<nodeName>"
    Then I set the parameter "NodeGroup" with value "<nodeGroup>"
    Then I click the "AddNodeButton" button

    Then I click the "Lefttopbottom" button
    Then I click the "LeftValueButton" button
    Then I set the parameter "TextArea" with value "<leftValue>"
    Then I click the "DateEditor" button
    And I click the "SevenDays" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<leftField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "RightTop" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "LowerRight" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I trigger the button "MinuteAgo"
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I will see the success message "保存成功"

  @all @smoke @topologySmoke
    Examples:
      | nodeName    | nodeGroup     | leftValue                                                                                                       | leftField | rightValue         | rightField |
      | sxjautotest | autotestgroup | tag:"sample04061424" \| eval x_format = format("%s, %s => %s", logtype, tag, apache.clientip) \| table x_format | x_format  | * \| stats count() | count()    |

  Scenario Outline: 第七种布局方式（RZY-1155）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I set the parameter "NodeName" with value "<nodeName>"
    Then I set the parameter "NodeGroup" with value "<nodeGroup>"
    Then I click the "AddNodeButton" button

    Then I click the "Topbottomright" button
    Then I click the "LeftTop" button
    Then I set the parameter "TextArea" with value "<leftValue>"
    Then I click the "DateEditor" button
    And I trigger the button "HourAgo"
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<leftField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "LowerLeft" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I trigger the button "DayAgo"
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "RightValueButton" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I trigger the button "SecondAgo"
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I will see the success message "保存成功"

  @all @smoke @topologySmoke
    Examples:
      | nodeName    | nodeGroup     | leftValue          | leftField | rightValue                                                               | rightField               |
      | sxjautotest | autotestgroup | * \| stats count() | count()   | (* AND ip:192.168.1.134) \|stats pct('json.Load.load15', 25,50,75,95,99) | _pct.json.Load.load15.25 |

  Scenario Outline: 第八种布局方式（RZY-1156）
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I set the parameter "NodeName" with value "<nodeName>"
    Then I set the parameter "NodeGroup" with value "<nodeGroup>"
    Then I click the "AddNodeButton" button

    Then I click the "All" button
    Then I click the "LeftTop" button
    Then I set the parameter "TextArea" with value "<leftValue>"
    Then I click the "DateEditor" button
    And I click the "SevenDays" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<leftField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "RightTop" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "LowerLeft" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I trigger the button "SecondAgo"
    And I click the "SearchButton" button
#    Then I will see the success message "搜索完成!"
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button

    Then I click the "LowerRight" button
    Then I set the parameter "TextArea" with value "<rightValue>"
    Then I click the "DateEditor" button
    And I trigger the button "CustomTime"
    And I click the "SearchButton" button
    Then I choose the "<rightField>" from the "FiledInput"
    Then I set the parameter "Unit" with value "个"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "-960"
    And I set the parameter "ToInput" with value "140000"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I will see the success message "保存成功"

  @all @smoke @topologySmoke
    Examples:
      | nodeName    | nodeGroup     | leftValue          | leftField | rightValue                                                               | rightField               |
      | sxjautotest | autotestgroup | * \| stats count() | count()   | (* AND ip:192.168.1.134) \|stats pct('json.Load.load15', 25,50,75,95,99) | _pct.json.Load.load15.25 |

  Scenario Outline: 失败提示
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I set the parameter "NodeName" with value "test"
    Then I set the parameter "NodeGroup" with value "group"
    Then I click the "AddNodeButton" button
    Then I click the "LeftRightButton" button
    Then I click the "LeftValueButton" button
    Then I set the parameter "TextArea" with value "<leftValue>"
    Then I click the "<dateEditor>" button
    And I click the "<date>" button
    And I click the "SearchButton" button
    Then I will see the alertErrorMessage "<message>"

  @all
    Examples:
      | leftValue | dateEditor | date  | message    |
      |           |            |       | 请输入搜索内容    |
      | *         |            |       | 请输入搜索时间范围  |
      | *         | DateEditor | Today | 请输入统计类搜索内容 |

  Scenario Outline: 点击应用失败
    And I click the detail which name is "sxjautotest"
    Then I will see the "topology.DetailPage" page
    Given I click the "SwitchButton" button
    Then I set the parameter "NodeName" with value "test"
    Then I set the parameter "NodeGroup" with value "group"
    Then I click the "AddNodeButton" button
    Then I click the "LeftRightButton" button
    Then I click the "LeftValueButton" button
    Then I set the parameter "TextArea" with value "<leftValue>"
    Then I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I will see the success message "搜索完成!"
    Then I choose the "<field>" from the "FiledInput"
    Then I set the parameter "Unit" with value "<unit>"
    Then I click the "AddColourButton" button
    And I set the parameter "FromInput" with value "<lowerLimit>"
    And I set the parameter "ToInput" with value "<topLimit>"
    Then I click the "SetColourButton" button
    And I set the parameter "SetColourInput" with value "#16DDE4"
    Then I click the "EnsureSetColourButton" button
    Then I click the "Apply" button
    Then I will see the alertErrorMessage "<message>"

  @all
    Examples:
      | leftValue        | field   | unit | lowerLimit | topLimit | message         |
      | *\|stats count() |         |      |            |          | 请选择展示字段         |
      | *\|stats count() | count() |      |            |          | 请输入合理的分段颜色数值区间！ |
      | *\|stats count() | count() |      | 1          |          | 请输入合理的分段颜色数值区间！ |
      | *\|stats count() | count() |      | 1          | 1        | 请输入合理的分段颜色数值区间！ |
      | *\|stats count() | count() |      | 1          | -1       | 请输入合理的分段颜色数值区间！ |

