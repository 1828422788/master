Feature: 仪表盘关联搜索

  @dashboard @dashboardSmoke
  Scenario Outline: 新建字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "E010000H2K53012016111816330000700447264.DEC    2016/11/18 16:33:52    80000000    PRE_ENTRY_ID="000000001203094755""
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "<regex>"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "<logtype>"
    And I set the parameter "AppName" with value "<appname>"
    And I set the parameter "Tag" with value "<appname>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | regex                                                                                        | name             | logtype  | appname                      |
      | ^(?<MESSAGE_ID>[^\t]+)\t(?<CREATE_DATE>[^\t]+)\t(?<STEP_ID>\d+)\t\S+\"(?<PRE_ENTRY_ID>\d+)\S | 仪表盘关联搜索_message  | message  | auto_test_dashboard_message  |
      | ^[^\t\n]*\t(?<CREATE_DATE>[^\t]+)\t(?<EPORT_ID>\d+)\t(?<CUS_ID>\d+)\t(?<MESSAGE_ID>.+)       | 仪表盘关联搜索_return   | return   | auto_test_dashboard_return   |
      | ^(?<ENTRY_ID>[^\t]+)\t(?<STEP_ID>[^\t]+)\t(?<CREATE_DATE>[^\t]+)                             | 仪表盘关联搜索_workflow | workflow | auto_test_dashboard_workflow |

  @dashboard @dashboardSmoke
  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for "VerifyText" will be visible
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName                      | log                         |
      | auto_test_dashboard_message  | 11.15-11.17MESSAGE_LOG.txt  |
      | auto_test_dashboard_return   | 11.21RETURN_RECEIPT_BAK.txt |
      | auto_test_dashboard_workflow | 11.15-11.2100000000.txt     |

  @dashboard @dashboardSmoke
  Scenario: 新建仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When I click the "Create" button
    And I set the parameter "DashBoardName" with value "仪表盘关联搜索"
    And I click the "Ensure" button
    Then I will see the success message "新建仪表盘成功"

  @dashboard @dashboardSmoke
  Scenario Outline: 新建标签页
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "<name>"
    Then I will see the "dashboard.DetailPage" page
    When I set the parameter "TagName" with value "关联搜索"
    And I click the "EnsureCreateTagButton" button
    And I wait for loading complete

    Examples:
      | name    |
      | 仪表盘关联搜索 |

  @dashboard @dashboardSmoke
  Scenario Outline: 新建趋势图
    And open the "trend.ListPage" page for uri "/trend/"
    And I click the "CreateButton" button
    And I click the "Create" button
    Then I will see the "trend.CreatePage" page
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    And I wait for "Header" will be visible
    And I click the "NextButton" button
    When I set the parameter "NameInput" with value "<name>"
    And I click the "NextButton" button
    And I wait for "SuccessCreate" will be visible

    Examples:
      | name        | spl                                                                                                                                                                               |
      | 仪表盘message  | tag:auto_test_dashboard_message \| table tag ,message.PRE_ENTRY_ID,message.CREATE_DATE \| rename tag as tag, message.PRE_ENTRY_ID as PRE_ENTRY, message.CREATE_DATE as CREAT_DATE |
      | 仪表盘return   | tag:auto_test_dashboard_return \| table tag,return.CUS_ID,return.EPORT_ID \| rename return.CUS_ID as CUS_ID,return.EPORT_ID as EPORT_ID                                           |
      | 仪表盘workflow | tag:auto_test_dashboard_workflow \| table tag,workflow.ENTRY_ID \| rename workflow.ENTRY_ID as ENTRY_ID                                                                           |

  @dashboard @dashboardSmoke
  Scenario: 在仪表盘中添加趋势图
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘关联搜索"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "AddEventButton" will be visible
    When I click the "AddEventButton" button
    And I click the "AddChart" button
    And I wait for "SpinDot" will be invisible
    And I set the parameter "SearchChartInput" with value "仪表盘"
    And I wait for loading invisible
    And I "checked" the checkbox which name is "仪表盘message,仪表盘return,仪表盘workflow"
    And I click the "Ensure" button
    Then I wait for element "SuccessMessage" change text to "添加成功"

  @dashboard @dashboardSmoke
  Scenario: 开启钻取配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘关联搜索"
    Then I will see the "dashboard.DetailPage" page
    And I click the "SettingIcon" button
    And I wait for "OpenDrilldown" will be visible
    And I click the "OpenDrilldown" button
    And I wait for "SuccessMessage" will be visible

  @dashboard @dashboardSmoke
  Scenario Outline: 修改仪表盘配置
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘关联搜索"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "<name>" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Edit" button
    And I set the parameter "<json>" to json editor
    And I click the "Check" button
    Then I will see the success message "校验通过"
    Then I click the "Ensure" button

    Examples:
      | name       | json                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | 仪表盘message | {"title": "仪表盘message","description": "","x": 0,"y": 15,"w": 12,"h": 5,"search": {"query": "tag:auto_test_dashboard_message \| table tag ,message.PRE_ENTRY_ID,message.CREATE_DATE \| rename tag as tag, message.PRE_ENTRY_ID as PRE_ENTRY, message.CREATE_DATE as CREAT_DATE","startTime": "now/d","endTime": "now"},"chart": {"chartType": "table"},"drilldown": {"type": "local","targets": [{"action": "set","name": "return","value": "${click.value2}"}]}} |
      | 仪表盘return  | {"title": "仪表盘return","description": "","x": 0,"y": 20,"w": 12,"h": 5,"search": {"query": "tag:auto_test_dashboard_return AND return.EPORT_ID:${return}\| table return.EPORT_ID,tag,return.CUS_ID \| rename return.CUS_ID as CUS_ID,return.EPORT_ID as EPORT_ID","startTime": "now/d","endTime": "now","done": {"type": "local","targets": [{"action": "eval","name": "workflow","value": "${result.CUS_ID}"}]}},"chart": {"chartType": "table"}}                |

  @dashboard @dashboardSmoke
  Scenario: 修改表格workflow查询语句
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘关联搜索"
    Then I will see the "dashboard.DetailPage" page
    When the chart title is "仪表盘workflow" then I click the button which classname is "anticon css-ifnfqv ant-dropdown-trigger" in dashboard
    And I click the "Configs" button
    And I wait for loading invisible
    And I set the parameter "Spl" with value "tag:auto_test_dashboard_workflow AND workflow.ENTRY_ID:${workflow} | table tag,workflow.ENTRY_ID | rename workflow.ENTRY_ID as ENTRY_ID"
    Then I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "配置成功"

  @dashboard @dashboardSmoke
  Scenario Outline: 添加输入项
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘关联搜索"
    Then I will see the "dashboard.DetailPage" page
    When I click the "AddEventButton" button
    And I click the "AddInput" button
    And I set the parameter "FilterTitle" with value "<name>"
    And I set the parameter "FilterToken" with value "<name>"
    And I choose the "下拉菜单" from the "InputType"
    And I click the "SingleChoice" button
    And I "checked" the checkbox which name is "当过滤项值改变时自动搜索"
    Then I click the "Ensure" button

    Examples:
      | name     |
      | return   |
      | workflow |

  @dashboard @dashboardSmoke
  Scenario: 验证return搜索结果
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:auto_test_dashboard_return AND return.EPORT_ID:000000001203094955 | table return.EPORT_ID,tag,return.CUS_ID | rename return.CUS_ID as CUS_ID,return.EPORT_ID as EPORT_ID"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I set value with element "TableList"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘关联搜索"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I wait for "Entry" will be visible
    And I click the "Entry" button under some element
    And I wait for "ReturnList" will be visible
    And I compare with list "ReturnList"

  @dashboard @dashboardSmoke
  Scenario: 验证workflow搜索结果
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "tag:auto_test_dashboard_workflow AND workflow.ENTRY_ID:531620160167359680 | table tag,workflow.ENTRY_ID | rename workflow.ENTRY_ID as ENTRY_ID"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I set value with element "TableList"
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    And I wait for loading invisible
    And I click the detail which name is "仪表盘关联搜索"
    Then I will see the "dashboard.DetailPage" page
    And I wait for "2000" millsecond
    And I click the "Entry" button under some element
    And I wait for "WorkflowList" will be visible
    And I compare with list "WorkflowList"

  @cleanDashboard
  Scenario Outline: 删除仪表盘
    Given open the "dashboard.ListPage" page for uri "/dashboard/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除仪表盘成功"

    Examples:
      | name    |
      | 仪表盘关联搜索 |

  @cleanDashboard
  Scenario Outline: 删除字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    Then I will see the success message "删除成功"

    Examples:
      | name             |
      | 仪表盘关联搜索_workflow |
      | 仪表盘关联搜索_return   |
      | 仪表盘关联搜索_message  |

  @cleanDashboard
  Scenario Outline: 删除仪表盘所建趋势图
    Given open the "trend.ListPage" page for uri "/trend/"
    When the data name is "<name>" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "500" millsecond
    And I will see the success message "删除成功"

    Examples:
      | name        |
      | 仪表盘workflow |
      | 仪表盘return   |
      | 仪表盘message  |
