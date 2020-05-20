@cleanConfigs
Feature: 字段提取删除

  Scenario Outline:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
#    Then I will see the success message "删除成功"

    Examples:
      | name                        |
      | wym按标签过滤                    |
      | wym按名称过滤                    |
      | RZY2868redirect主规则          |
      | RZY2867redirect副规则          |
      | RZY2865支持通配符                |
      | 重命名字段支持通配符详情验证              |
      | RZY2883unicode解析            |
      | RZY2877base64解析             |
      | RZY2875script解析             |
      | RZY2870创建dissect解析          |
      | RZY2819配置自定义字典解析规则          |
      | 自定义字典详情验证                   |
      | 脱敏                          |
      | 脱敏详情                        |
      | RZY2862严格解析                 |
      | RZY2889apache解析优化           |
      | RZY1550格式化处理                |
      | RZY2872正则片段解析               |
      | RZY2823时间戳前缀                |
      | RZY1536数值型字段转换              |
      | 数值型字段转换详情验证                 |
      | RZY2803解析到顶层字段              |
      | 解析到顶层字段详情验证                 |
      | 手机号码解析详情验证                  |
      | RZY2802手机号码解析               |
      | RZY1559tag替换                |
      | RZY1556内容替换                 |
      | 内容替换详情验证                    |
      | tag替换详情验证                   |
      | RZY1540配置UserAgent解析        |
      | UserAgent解析详情验证             |
      | RZY1539添加URL解析              |
      | URL解析详情验证                   |
      | RZY1547syslog_pri解析         |
      | syslog_pri解析详情验证            |
      | RZY2798group_regex          |
      | group_regex详情验证             |
      | RZY1535KeyValue正则匹配         |
      | KeyValue正则匹配详情验证            |
      | 保留key详情                     |
      | RZY1533保留key                |
      | 丢弃key详情                     |
      | RZY1532丢弃key                |
      | RZY1555IP格式转换               |
      | ip格式转换详情                    |
      | RZY2826高级模式下start_offset的使用 |
      | hex详情验证                     |
      | RZY1548添加GEO解析              |
      | GEO解析详情验证                   |
      | 多值字段副本                      |
      | RZY3417多值字段                 |

  Scenario Outline: 删除字典管理
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button

    Examples:
      | name                    |
      | win_sys_sourcename.csv  |
      | win_sys_sourcename1.csv |

#  Scenario: 删除owner下的agent配置
#
#    Given open the "agent.CreatePage" page for uri "/sources/input/agent/"
##    When I click the detail with properties "{'column':'1','name':'rizhiyi_server_host'}"
#    Then I click the detail which column is "1" in agent page
#    And switch to window "Agent 具体配置"
#    When the data name is "auto_test_format" then i click the "删除" button without paging
#    And I click the "Ensure" button
#    Then I will see the success message "删除 Agent 配置成功。"

#  Scenario: 删除搜索权限
#    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
#    When the data name is "{'column':'0','name':'wymAutoTest搜索权限'}" then i click the "删除" button
#    And I click the "Ensure" button
#    Then I wait for "1000" millsecond
#    Then I will see the success message "删除成功"
