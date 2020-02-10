Feature: 编辑Syslog类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page

  Scenario: 新建Syslog数据源
#    When I click the detail which name is "<ip>"
    And I click the "Create" button
    And I click the "SyslogType" button
    And I set the parameter "Listenaddress" with value "192.168.1.161:514"
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "AddNewMap" button
    And I set the parameter "Syslogip" with value "192.168.1.134"
    And I set the parameter "Syslogappname" with value "autohekaSyslog"
    And I set the parameter "Syslogtag" with value "autohekaSyslog"
    And I click the "Next" button
    And I will see the element "CheckListenaddress" name is "192.168.1.161:514"
    And I click the "Finish" button
    And I will see the element "Addsuccessmsg" name is "添加成功"

  Scenario: 修改Syslog数据源禁用
    Given the data name "192.168.1.161:514" in agent table "SyslogTable" then i click the "close" switch
    Then I wait for loading invisible
    Then I will see the element "SyslogSwitchStatus" name is "已禁用"


  Scenario: Syslog数据源启用
    Given the data name "192.168.1.161:514" in agent table "SyslogTable" then i click the "open" switch
    Then I wait for loading invisible
    Then I will see the element "SyslogSwitchStatus" name is "已启用"

  Scenario Outline: 修改Syslog数据源charset
    Given the data name "192.168.1.161:514" in table "SyslogTable" then i click the "编辑" button
    When I choose the "<characterkind>" from the "SyslogChar"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"
    Examples:
      | characterkind |
      |   utf-8    |
#      |    gbk    |

  Scenario Outline: Syslog数据源修改ip成功
    Given the data name "192.168.1.161:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEditip" with value "<ipkind>"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

    Examples:
      | ipkind |
#      |   1:2::3    |
#      |   1:2:3:4:0:*:5:6    |
      |   *.*.*.*    |
      |   192.168.1.19    |

  Scenario Outline: Syslog数据源修改ip失败
    Given the data name "192.168.1.161:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEditip" with value "<ipkind>"
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage" name is "格式错，192.168.1.60 或 *.*.*.* 或 1:2::3 或 1:2:3:4:0:*:5:6"

    Examples:
      | ipkind |
      |   中文    |
      |   192.168.1.19a    |
      |   #.。，   |

  Scenario Outline: Syslog数据源修改appname成功
    Given the data name "192.168.1.161:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEditappname" with value "<appnamekind>"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

    Examples:
      | appnamekind |
      |   changesyslogappname    |
      |   changesyslogappname2    |
      |   change_syslogappname    |


  Scenario Outline: Syslog数据源修改appname失败
    Given the data name "192.168.1.161:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEditappname" with value "<appnamekind>"
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage" name is "请以字母或数字下划线为元素"

    Examples:
      | appnamekind |
      |   中文    |
      |   #.。，   |

  Scenario Outline: Syslog数据源修改tag成功
    Given the data name "192.168.1.161:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEdittag" with value "<tagkind>"
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "修改 Agent 配置成功。"

    Examples:
      | tagkind |
      |   changesyslogtag    |
      |   changesyslogtag,changesyslogtag2    |
      |   change_syslogtag                    |

  Scenario Outline: Syslog数据源修改tag失败
    Given the data name "192.168.1.161:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEdittag" with value "<tagkind>"
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage" name is "请以字母、数字、中文或下划线为元素,tags 之间可用 "," 分隔。"

    Examples:
      | tagkind |
      |   s，s    |
      |   #￥%…&*   |


  Scenario: Syslog数据源删除
    Given the data name "192.168.1.161:514" in table "SyslogTable" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"