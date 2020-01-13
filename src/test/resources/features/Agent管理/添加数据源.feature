Feature: 操作

  Background:
    Given open the "agent.ListPage" page for uri "/sources/input/agent/"
    And I wait for loading invisible

  Scenario Outline: Agent添加数据源-单一数据源采集
#    And I set the agent parameter "IP" with running ip
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page
    And I click the "Create" button
    And I click the "Next" button
    Then I will see the element "MemoMessage" name is "请检查输入项，确保完整正确再点击下一步。"
    Then I click the "Ensure" button
    Then I will see the element "RootMessage" name is "请务必输入路径"
    Then I will see the element "WhiteListMessage" name is "请务必输入白名单"
    And I set the parameter "WhiteListInput" with value "ntp\.log"
    And I click the "Next" button
    And I wait for loading invisible
    Then I will see the element "MemoMessage" name is "请检查输入项，确保完整正确再点击下一步。"
    Then I click the "Ensure" button
    Then I will see the element "RootMessage" name is "请务必输入路径"
    And I set the parameter "RootListInput" with value "/data/rizhiyi/logs"
    And I click the "Next" button
    And I click the "Back" button
    And I set the parameter "RootListInput" with value "/data/rizhiyi/logs/heka"
    And I set the parameter "WhiteListInput" with value "hekad-daemon\.log"
    And I set the parameter "BlackListInput" with value "hekad\.stderr"
    And I set the parameter "LastChangeTime" with value "10"
    And I click the "Next" button
    And I click the "Next" button
    Then I will see the element "MemoMessage" name is "请检查输入项，确保完整正确再点击下一步。"
    And I click the "Ensure" button
    And I will see the element "PreviewMessage" name is "请务必选择一个文件用来预览。"
    And I click the "ChooseButton" button
    And I click the "Next" button
    And I set the parameter "Appaname" with value "autohekafiletest"
    And I set the parameter "Tag" with value "autohekafiletest"
    And I click the "Next" button
    And I will see the element "InputKind" name is "文件监视"
    And I will see the element "SourceRoot" name is "/data/rizhiyi/logs/heka"
#    And I will see the element "WhitelistRoot" name is "hekad-daemon\.log"
    And I will see the element "Monitoring" name is "是"
    And I will see the element "CheckAppname" name is "autohekafiletest"
    And I will see the element "CheckTag" name is "autohekafiletest"
    And I click the "Next" button
    And I will see the element "Addsuccessmsg" name is "添加成功"
    And I click the "ContinueAdd" button
    And I wait for loading invisible
    And I will see the element "SyslogType" name is "Syslog"
    
    
    Examples: 高级搜索过滤单个ip成功



  Scenario Outline: Agent添加Syslog数据源
    When I click the detail which column is "1" in agent page
    And switch to another window
    And I will see the "agent.CreatePage" page
    And I click the "Create" button
    And I click the "SyslogType" button
    And I set the parameter "Listenaddress" with value "192.168.1.160:514"
    And I click the "Next" button
    And I click the "Next" button
    And I will see the element "MemoMessage" name is "请至少添加一个映射。"
    And I click the "Ensure" button
    And I click the "AddNewMap" button
    And I set the parameter "Syslogip" with value "192.168.1.134"
    And I set the parameter "Syslogappname" with value "autohekaSyslog"
    And I set the parameter "Syslogtag" with value "autohekaSyslog"
    And I click the "Next" button
    And I will see the element "CheckListenaddress" name is "192.168.1.160:514"
#    And I will see the element "CheckMap" name is "[{"ip":"192.168.1.134","appname":"autohekaSyslog","tag":"autohekaSyslog","charset":"utf-8"}]"
    And I click the "Next" button
    And I will see the element "Addsuccessmsg" name is "添加成功"
    And I click the "CurrentConfiguration" button
#    Then I will see the search result "{'column':'2','name':'192.168.1.160:514'}"



    Examples: 高级搜索过滤单个ip成功

