 @agent_syslog @agent2
Feature: Agent编辑Syslog类型数据源

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible
    And I zoom the browse to full screen
    When I click the detail which column is "0" in agent page
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible
    And I will see the "agent.CreatePage" page

  Scenario: 新建Syslog数据源
    And I click the "Create" button
    And I click the "SyslogType" button
    And I click the "Next" button
    And I set the parameter "Listenaddress" with value "192.168.1.253:514"
    And I click the "Next" button
    And I wait for loading invisible
    And I click the "AddNewMap" button
    And I set the parameter "Syslogip" with value "192.168.1.139"
    And I set the parameter "Syslogappname" with value "autohekaSyslog"
    And I set the parameter "Syslogtag" with value "autohekaSyslog"
    And I click the "Next" button
    And I wait for "Finish" will be visible
#    And I will see the element "CheckListenaddress" name is "192.168.1.139:514"  ！！！！！创建syslog的数据源为进入agent的本机IP
#    And I wait for loading invisible
    And I click the "Finish" button
    And I will see the element "Addsuccessmsg" name is "添加成功"


  Scenario: 修改Syslog数据源禁用
    Given the data name "192.168.1.253:514" in agent table "SyslogTable" then i click the "close" switch
    Then I wait for loading invisible
    And I wait for element "SyslogSwitchStatus" change text to "已禁用"



  Scenario: Syslog数据源启用
    Given the data name "192.168.1.253:514" in agent table "SyslogTable" then i click the "open" switch
    Then I wait for loading invisible
    And I wait for element "SyslogSwitchStatus" change text to "已启用"




  Scenario Outline: 修改Syslog数据源charset
    Given the data name "192.168.1.253:514" in table "SyslogTable" then i click the "编辑" button
    And I choose the "<characterkind>" from the "SyslogChar"
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"
    Examples:
      | characterkind |
      |   utf-8    |
      |    gbk    |

  Scenario Outline: Syslog数据源修改ip成功
    Given the data name "192.168.1.253:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEditip" with value "<ipkind>"
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"
    Examples:
      | ipkind |
      |   1:2::3    |
      |   1:2:3:4:0:*:5:6    |
      |   *.*.*.*    |
#      |   192.168.1.19    |

  Scenario Outline: Syslog数据源修改ip失败
    Given the data name "192.168.1.253:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEditip" with value "<ipkind>"
    And I wait for loading invisible
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage1" name is "格式错，192.168.1.60 或 *.*.*.* 或 1:2::3 或 1:2:3:4:0:*:5:6"

    Examples:
      | ipkind |
      |   中文    |
      |   192.168.1.19a    |
      |   #.。，   |

  Scenario Outline: Syslog数据源修改appname成功
    Given the data name "192.168.1.253:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEditappname" with value "<appnamekind>"
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"


    Examples:
      | appnamekind |
      |   changesyslogappname    |
      |   changesyslogappname2    |
      |   change_syslogappname    |


  Scenario Outline: Syslog数据源修改appname失败
    Given the data name "192.168.1.253:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEditappname" with value "<appnamekind>"
    And I wait for loading invisible
    And I click the "Ensure" button
    Then I will see the element "PreviewMessage1" name is "请以字母或数字下划线为元素"


    Examples:
      | appnamekind |
      |   中文    |
      |   #.。，   |

  Scenario Outline: Syslog数据源修改tag成功
    Given the data name "192.168.1.253:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEdittag" with value "<tagkind>"
    And I wait for loading invisible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element value in json "{'ChangeMemo':'修改 Agent 配置成功。'}"


    Examples:
      | tagkind |
      |   changesyslogtag    |
      |   changesyslogtag,changesyslogtag2    |
      |   change_syslogtag                    |

  Scenario Outline: Syslog数据源修改tag失败
    Given the data name "192.168.1.253:514" in table "SyslogTable" then i click the "编辑" button
    And I set the parameter "SyslogEdittag" with value "<tagkind>"
    And I wait for loading invisible
    And I click the "Ensure" button
    Then I will see the element value in json "{'PreviewMessage1':'请以字母、数字、中文或下划线为元素,tags 之间可用 "," 分隔。'}"


    Examples:
      | tagkind |
      |   s，s    |
      |   #￥%…&*   |


  Scenario: Syslog数据源删除
    Given the data name "192.168.1.253:514" in table "SyslogTable" then i click the "更多" button
    And I click the "Delete" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I wait for "ChangeMemo" will be visible
#    Then I will see the element "ChangeMemo" name is "删除 Agent 配置成功。"

