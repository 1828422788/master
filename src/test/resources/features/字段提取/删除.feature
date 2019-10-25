@cleanConfigs
Feature: 字段提取删除

  Scenario Outline:
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I click the "Ensure" button

    Examples:
      | name                        |
      | 主规则副本                       |
      | RZY2868redirect主规则          |
      | RZY2867redirect副规则          |
      | RZY2865支持通配符                |
      | RZY2883unicode解析            |
      | RZY2877base64解析             |
      | RZY2875script解析             |
      | RZY2870创建dissect解析          |
      | RZY2819配置自定义字典解析规则          |
      | RZY2862严格解析                 |
      | RZY2889apache解析优化           |
      | RZY2872正则片段解析               |
      | RZY2823时间戳前缀                |
      | RZY1536数值型字段转换              |
      | RZY2803解析到顶层字段              |
      | RZY2802手机号码解析               |
      | RZY1559tag替换                |
      | RZY1556内容替换                 |
      | RZY1540配置UserAgent解析        |
      | RZY1539添加URL解析              |
      | RZY1547syslog_pri解析         |
      | RZY2798group_regex          |
      | RZY1535KeyValue正则匹配         |
      | RZY1533保留key                |
      | RZY1532丢弃key                |
      | RZY1555IP格式转换               |
      | RZY2826高级模式下start_offset的使用 |
      | RZY1548添加GEO解析              |
      | 多值字段副本                      |
      | RZY3417多值字段                 |

  Scenario Outline: 删除字典管理
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureDelete" button

    Examples:
      | name                   |
      | win_sys_sourcename.csv |

  Scenario: 删除AutoTest账号下的字段提取
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "userWithResources"
    And I set the parameter "Password" with properties "userWithResourcesPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "脱敏" then i click the "删除" button
    And I click the "EnsureButton" button

  Scenario: 删除owner下的字段提取
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "owner"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "RZY1550格式化处理" then i click the "删除" button
    And I click the "EnsureButton" button

  Scenario: 删除owner下的agent配置
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "owner"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "agent.CreatePage" page for uri "/sources/input/agent/"
    When I click the detail with properties "{'column':'1','name':'rizhiyi_server_host'}"
    And switch to window "Agent 具体配置"
    When the data name is "auto_test_format" then i click the "删除" button without paging
    And I click the "DeleteConfig" button