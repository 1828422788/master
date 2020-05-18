@configsSmoke
Feature: 字段提取详情验证

  Scenario Outline: 验证详情a
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name                 | rule1        | rule2        |
#      | RZY3417多值字段          | 正则解析         | CSV解析        |
#      | RZY1548添加GEO解析       | geo解析        | 正则解析         |
#      | RZY1555IP格式转换        | ip格式转换       | 正则解析         |
#      | RZY1535KeyValue正则匹配  | KeyValue正则匹配 | 正则解析         |
#      | RZY1547syslog_pri解析  | 正则解析         | syslog_pri解析 |
#      | RZY1539添加URL解析       | URL解析        | 正则解析         |
#      | RZY1540配置UserAgent解析 | 正则解析         | user agent解析 |
#      | RZY1559tag替换         | JSON解析       | 内容替换         |
      | RZY1536数值型字段转换       | 数值型字段转换      | 正则解析         |
      | RZY2823时间戳前缀         | 时间戳识别        | 正则解析         |
#      | RZY2819配置自定义字典解析规则   | 自定义字典        | JSON解析       |
      | RZY2875script解析      | 自定义解析        | JSON解析       |
      | RZY2877base64解析      | base64解析     | 正则解析         |
      | RZY2883unicode解析     | 自定义解析        | 正则解析         |
      | RZY2865支持通配符         | JSON解析       | 字段重命名        |
#      | 脱敏                   | 脱敏配置         | 正则解析         |

  Scenario Outline: 验证详情b
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"

    Examples:
      | name                        | rule1        |
#      | RZY2826高级模式下start_offset的使用 | hex转换        |
#      | RZY1532丢弃key                | KeyValue分解   |
#      | RZY1533保留key                | KeyValue分解   |
#      | RZY2798group_regex          | KeyValue正则匹配 |
#      | RZY1556内容替换                 | 内容替换         |
      | RZY2802手机号码解析               | 手机号码解析       |
      | RZY2803解析到顶层字段              | 手机号码解析       |
      | RZY2889apache解析优化           | 正则解析         |
      | RZY2862严格解析                 | 结构体解析        |
      | RZY2870创建dissect解析          | 自定义解析        |

  Scenario Outline: 验证详情c
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading complete
    When the data name is "{'column':'1','name':'RZY2872正则片段解析'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "正则解析" value is "正则解析 <result>"

    Examples:
      | result    |
      | 2 2 0 0 0 |