@configs @configs30
Feature: 字段提取详情验证

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible

  Scenario Outline:两个规则
    Then I set the parameter "TextFilter" with value "<name>"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    @configsSmoke
    Examples:
      | name                         | rule1           | rule2     |
      | RZY1547syslog_pri解析        | syslog_pri解析   | 正则解析 |
      | RZY1540配置UserAgent解析     | user agent解析   | 正则解析 |


    Examples:
      | name                         | rule1           | rule2     |
      | RZY1548添加GEO解析           | geo解析          | 正则解析  |
      | RZY1555IP格式转换            | ip格式转换       | 正则解析   |
      | RZY1535KeyValue正则匹配      | KeyValue正则匹配 | 正则解析   |
      | RZY1539添加URL解析           | URL解析          | 正则解析  |
      | RZY1559tag替换               | JSON解析         | 内容替换  |
      | RZY1536数值型字段转换         | 数值型字段转换   | 正则解析  |
      | RZY2823时间戳前缀             | 时间戳识别       | 正则解析  |
      | 脱敏                         | 脱敏配置         | 正则解析  |
      | RZY2819配置自定义字典解析规则 | 自定义字典       | JSON解析 |
      | RZY2875script解析            | 自定义解析       | JSON解析    |
      | RZY2877base64解析            | base64解析       | 正则解析    |
      | RZY2883unicode解析           | 正则解析         | 自定义解析  |
      | RZY2865支持通配符             | JSON解析        | 字段重命名 |

  Scenario Outline:一个规则
    Then I set the parameter "TextFilter" with value "<name>"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"

    @configsSmoke
    Examples:
      | name                               | rule1           |
      | RZY2870创建dissect解析              | 自定义解析      |

    Examples:
      | name                               | rule1           |
      | RZY3417多值字段                     | CSV解析         |
      | RZY2826高级模式下start_offset的使用 | hex转换          |
      | RZY1532丢弃key                     |  KeyValue分解    |
      | RZY1533保留key                     |  KeyValue分解    |
      | RZY2798group_regex                 | KeyValue正则匹配 |
      | RZY1556内容替换                    | 内容替换          |
      | RZY2802手机号码解析                | 手机号码解析      |
      | RZY2803解析到顶层字段              | 手机号码解析      |
      | RZY2889apache解析优化              | 正则解析         |
      | RZY2862严格解析                    | 结构体解析       |

  Scenario Outline:RZY2868redirect主规则
    Then I set the parameter "TextFilter" with value "<name>"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 82 82 0 0 0"

    Examples:
      | name                        | rule1           |
      | RZY2868redirect主规则       | 重定向规则       |