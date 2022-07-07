@cleanConfigs
Feature: 字段提取删除

  Scenario Outline:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I set the parameter "TextFilter" with value "<name>"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button in more menu
    And I click the "Ensure" button
    Then I will see the success message "删除成功"

    @configsSmoke
    Examples:
      | name                        |
      | RZY1547syslog_pri解析       |
      | RZY1540配置UserAgent解析    |
      | RZY2870创建dissect解析      |

    Examples:
      | name                                |
      | wym按标签过滤                       |
      | wym按名称过滤                       |
      | RZY2868redirect主规则               |
      | RZY2867redirect副规则               |
      | RZY2865支持通配符                   |
      | RZY2883unicode解析                  |
      | RZY2877base64解析                   |
      | RZY2875script解析                   |
      | RZY2819配置自定义字典解析规则       |
      | 脱敏                                |
      | RZY2862严格解析                     |
      | RZY2889apache解析优化               |
      | RZY1550格式化处理                   |
      | RZY2872正则片段解析                 |
      | RZY2872正则片段解析2                |
      | RZY2823时间戳前缀                   |
      | RZY1536数值型字段转换               |
      | RZY2803解析到顶层字段               |
      | RZY2802手机号码解析                 |
      | RZY1559tag替换                      |
      | RZY1556内容替换                     |
      | RZY1539添加URL解析                  |
      | RZY1548添加GEO解析                  |
      | RZY2798group_regex                  |
      | RZY1535KeyValue正则匹配             |
      | RZY1533保留key                      |
      | RZY1532丢弃key                      |
      | RZY1555IP格式转换                   |
      | RZY2826高级模式下start_offset的使用 |
      | wym复制和编辑                       |
      | wym复制和编辑的副本                 |
      | RZY3417多值字段                     |
      | 禁用和启用                          |
      | wym保存日志样例                     |
      | wym检索日志验证状态                 |
      | wym保存搜索日志                     |