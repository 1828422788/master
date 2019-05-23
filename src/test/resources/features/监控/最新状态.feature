@alert @all
Feature: 监控最新状态

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  @alertSmoke @third
  Scenario Outline: 按告警时间搜索，并验证搜索结果和搜索内容是否一致（RZY-465）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When I click the "DateEditor" button
    And I click the "<time>" button
    Then I will see the result time in "{'column':'<num>','recently':'<searchTime>'}"

    Examples:
      | time       | num | searchTime |
      | TenMinutes | 5   | 10m        |
      | HalfHour   | 5   | 30m        |
      | OneHour    | 5   | 1h         |
      | OneDay     | 5   | 1d         |
      | TwoDays    | 5   | 2d         |
      | SevenDays  | 5   | 7d         |

  @alertSmoke @third
  Scenario Outline: 按等级搜索（RZY-463）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When choose from "<dropdownMenu>"
    Then I will see the alert grade is "<gradeColour>"

    Examples:
      | dropdownMenu          | gradeColour |
      | {'GradeDropdown':'低'} | green       |
      | {'GradeDropdown':'高'} | red         |
      | {'GradeDropdown':'中'} | yellow      |

  Scenario Outline: 标记为处理/忽略失败（RZY-470、RZY-471）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When I click the first checkbox in table
    And I click the "MarkDropdown" button
    And I click the "<mark>" button
    Then I will see the success message "<message>"

    Examples:
      | mark   | message  |
      | Deal   | 有未填写处理意见 |
      | Ignore | 有未填写处理意见 |

  Scenario Outline: 标记/操作失败（后四个需要新建告警插件，待办）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When I click the "<dropdown>" button
    And I click the "<operator>" button
    Then I will see the error message "请先选择告警"

    Examples:
      | dropdown     | operator |
      | MarkDropdown | Deal     |
      | MarkDropdown | Ignore   |

  @alertSmoke @testAlert
  Scenario Outline: 处理意见（RZY-469）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When choose from "<dropdownMenu>"
    And I set the parameter "HandlingSuggestion" with value "<handlingSuggestion>"
    And I click the first checkbox in table
    And I click the button "No" if exist
    And I click the "MarkDropdown" button
    And I click the "<mark>" button
    And I will see the success message "<message>"
    And I wait for "SuccessMessage" will be invisible
    And I refresh the website
    And I accept alert window
    Given search from "<switchDropdown>" then I will see the result contains "{'column':'7','name':'<handlingSuggestion>'}"

    Examples:
      | dropdownMenu             | handlingSuggestion | mark | message | switchDropdown           |
      | {'StatusDropdown':'待处理'} | AutoTestHandling   | Deal | 处理成功    | {'StatusDropdown':'已处理'} |

  @alertSmoke @third
  Scenario Outline: 处理低级告警
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When choose from "{'StatusDropdown':'待处理'}"
    When choose from "{'GradeDropdown':'低'}"
    And I click the first checkbox in table
    And I click the "MarkDropdown" button
    And I click the "<mark>" button
    Then I will see the success message "处理成功"

    Examples:
      | mark   |
      | Deal   |
      | Ignore |

  @alertSmoke @third
  Scenario Outline: 处理意见关联知识（RZY-3004）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    And I click the "LinkKnowledge" button
    And I click the "ArrowDown" button
    And I click the "CreateKnowledge" button
    And switch to another window
    Then I will see the "knowledge.ListPage" page
    When I set the parameter "EventCode" with value "<name>"
    And I set the parameter "Describe" with value "AutoTest"
    And I click the "Confirm" button
    Then I will see the search result contains "{'column':'0','name':'<name>'}"
    Given open the "alert.MonitorPage" page for uri "/alerts/monitors/"
    And I click the "LinkKnowledge" button
    And I click the "ArrowDown" button
    And I click the "KnowledgeForAlert" button
    Then I display the element "KnowledgeList"
    And I click the "SaveKnowledge" button
    And I set the parameter "HandlingSuggestion" with value "关联知识"
    And I click the first checkbox in table
    And I click the "MarkDropdown" button
    And I click the "Deal" button
    And I will see the success message "处理成功"

    Examples:
      | name              |
      | KnowledgeForAlert |

  @alertSmoke @third
  Scenario: 修改处理意见并校验空格（RZY-469）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When choose from "{'StatusDropdown':'已处理'}"
    And I click the "Handled" button
    And I click the "EditButton" button
    And I set the parameter "HandlingSuggestion" with value " "
    And I click the "Check" button
    And I will see the success message "有未填写处理意见"

  @alertSmoke @third
  Scenario Outline: 修改处理意见（RZY-469）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When choose from "<dropdownMenu>"
    And I click the "Handled" button
    And I click the "EditButton" button
    And I set the parameter "HandlingSuggestion" with value "<handlingSuggestion>"
    And I click the "Check" button
    And I will see the success message "保存成功"
    And I wait for "SuccessMessage" will be invisible
    Given search from "<dropdownMenu>" then I will see the result contains "{'column':'7','name':'<handlingSuggestion>'}"

    Examples:
      | dropdownMenu             | handlingSuggestion |
      | {'StatusDropdown':'已处理'} | already done       |

  @alertSmoke @third
  Scenario Outline: 修改处理意见、关联知识并验证是否保存成功
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When choose from "{'StatusDropdown':'已处理'}"
    And I click the "Handled" button
    And I click the "EditButton" button
    And I click the "LinkKnowledge" button
    And I click the "ArrowDown" button
    And I click the "CreateKnowledge" button
    And switch to another window
    Then I will see the "knowledge.ListPage" page
    When I set the parameter "EventCode" with value "<name>"
    And I set the parameter "Describe" with value "AutoTest"
    And I click the "Confirm" button
    Then I will see the search result contains "{'column':'0','name':'<name>'}"
    Given open the "alert.MonitorPage" page for uri "/alerts/monitors/"
    When choose from "{'StatusDropdown':'已处理'}"
    And I click the "Handled" button
    And I click the "EditButton" button
    And I click the "LinkKnowledge" button
    And I click the "ArrowDown" button
    And I click the "KnowledgeForAlert" button
    And I click the "AlertKnowledge" button
    Then I display the element "KnowledgeList"
    And I click the "SaveKnowledge" button
    And I click the "Check" button
    And I will see the success message "保存成功"
    And I refresh the website
    When choose from "{'StatusDropdown':'已处理'}"
    Then I will see the element "KnowledgeLists" value is "KnowledgeForAl...,AlertKnowledge"

    Examples:
      | name           |
      | AlertKnowledge |

  @alertSmoke @third
  Scenario Outline: 按分组和状态搜索，并验证搜索结果和搜索内容是否一致（RZY-462、RZY-464）
    Given I click the "LatestStatus" button
    And I will see the "alert.MonitorPage" page
    Then search from "<dropdownMenu>" then I will see the result "{'column':'<num>','name':'<name>'}"

    Examples:
      | dropdownMenu                      | num | name          |
      | {'GroupDropdown':'default_Alert'} | 3   | default_Alert |
      | {'StatusDropdown':'待处理'}          | 6   | 待处理           |
      | {'StatusDropdown':'已处理'}          | 6   | 已处理           |
      | {'StatusDropdown':'已忽略'}          | 6   | 已忽略           |

#  @smoke @alertSmoke
#  Scenario Outline: 操作（ping主机）（RZY-476）
#    Given I click the "LatestStatus" button
#    Then I will see the "alert.MonitorPage" page
#    When I click the first checkbox in table
#    And I click the "OperatorDropdown" button
#    And I click the "PingHost" button
#    And I set the parameter "IpAddress" with value "<ipAddress>"
#    And I click the "ExecuteButton" button
#    And I wait for "ExecuteResult" will be visible
#    Then take a screenshot
#
#    Examples:
#      | ipAddress |
#      | 10.0.0.1  |
#
##  @smoke @alertSmoke
#  Scenario Outline: 操作（rsyslog告警）（RZY-475）
#    Given I click the "LatestStatus" button
#    Then I will see the "alert.MonitorPage" page
#    When I click the first checkbox in table
#    And I click the "OperatorDropdown" button
#    And I click the "RsyslogAlert" button
#    And I set the parameter "SyslogAddress" with value "<syslogAddress>"
#    And I click the "ExecuteButton" button
#    Then I will see the element "ExecuteResult" name is "<result>"
#
#    Examples:
#      | syslogAddress    | result                        |
#      | 192.168.1.82:514 | rsyslog plugin run success!!! |
#
##  @smoke @alertSmoke
#  Scenario Outline: 在监控中点击今日待处理、已处理以及高级告警
#    Given I click the "<status>" button
#    And I will see the "alert.MonitorPage" page
#    Then I will see the <result>
#
#    Examples:
#      | status    | result                                      |
#      | Pending   | search result "{'column':'6','name':'待处理'}" |
#      | Handled   | search result "{'column':'6','name':'已处理'}" |
#      | HighAlert | alert grade is "red"                        |

  @alertSmoke @third
  Scenario: 返回到监控页（RZY-482）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When I click the "ReturnToAlertPage" button
    Then the page's title will be "监控"
