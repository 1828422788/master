@alert @all
Feature: 监控最新状态

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

  @smoke @alertSmoke
  Scenario Outline: 按分组和状态搜索
    Given I click the "LatestStatus" button
    And I will see the "alert.MonitorPage" page
    Then search from "<dropdownMenu>" then I will see the result "{'column':'<num>','name':'<name>'}"

    Examples:
      | dropdownMenu                      | num | name          |
      | {'GroupDropdown':'default_Alert'} | 3   | default_Alert |
      | {'StatusDropdown':'待处理'}          | 6   | 待处理           |
      | {'StatusDropdown':'已处理'}          | 6   | 已处理           |
      | {'StatusDropdown':'已忽略'}          | 6   | 已忽略           |

  @smoke @alertSmoke
  Scenario Outline: 按告警时间搜索
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

  @smoke @alertSmoke
  Scenario Outline: 按等级搜索
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When choose from "<dropdownMenu>"
    Then I will see the alert grade is "<gradeColour>"

    Examples:
      | dropdownMenu          | gradeColour |
      | {'GradeDropdown':'低'} | green       |
      | {'GradeDropdown':'高'} | red         |
      | {'GradeDropdown':'中'} | yellow      |

#  @smoke @alertSmoke
  Scenario Outline: 标记为处理/忽略
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When I click the first checkbox in table
    And I click the "MarkDropdown" button
    And I click the "<mark>" button
    Then I will see the success message "<message>"

    Examples:
      | mark   | message |
      | Deal   | 处理成功    |
      | Ignore | 忽略成功    |

  Scenario Outline: 标记/操作失败
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When I click the "<dropdown>" button
    And I click the "<operator>" button
    Then I will see the error message "请先选择告警"

    Examples:
      | dropdown         | operator     |
      | MarkDropdown     | Deal         |
      | MarkDropdown     | Ignore       |
      | OperatorDropdown | PingHost     |
      | OperatorDropdown | RsyslogAlert |
      | OperatorDropdown | EmailAlert   |
      | OperatorDropdown | ForwardAlert |

#  @smoke @alertSmoke
  Scenario Outline: 处理意见
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When choose from "<dropdownMenu>"
    And I set the parameter "HandlingSuggestion" with value "<handlingSuggestion>"
    And I click the first checkbox in table
    And I click the "MarkDropdown" button
    And I click the "<mark>" button
    And I will see the success message "<message>"
    And I wait for "SuccessMessage" will be invisible
    Given search from "<switchDropdown>" then I will see the result contains "{'column':'7','name':'<handlingSuggestion>'}"

    Examples:
      | dropdownMenu             | handlingSuggestion | mark | message | switchDropdown           |
      | {'StatusDropdown':'待处理'} | AutoTestHandling   | Deal | 处理成功    | {'StatusDropdown':'已处理'} |

#  @smoke @alertSmoke
  Scenario Outline: 修改处理意见
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

#  @smoke @alertSmoke
  Scenario Outline: 操作（ping主机）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When I click the first checkbox in table
    And I click the "OperatorDropdown" button
    And I click the "PingHost" button
    And I set the parameter "IpAddress" with value "<ipAddress>"
    And I click the "ExecuteButton" button
    And I wait for "ExecuteResult" will be visible
    Then take a screenshot

    Examples:
      | ipAddress |
      | 10.0.0.1  |

#  @smoke @alertSmoke
  Scenario Outline: 操作（rsyslog告警）
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When I click the first checkbox in table
    And I click the "OperatorDropdown" button
    And I click the "RsyslogAlert" button
    And I set the parameter "SyslogAddress" with value "<syslogAddress>"
    And I click the "ExecuteButton" button
    Then I will see the element "ExecuteResult" name is "<result>"

    Examples:
      | syslogAddress    | result                        |
      | 192.168.1.82:514 | rsyslog plugin run success!!! |

  @smoke @alertSmoke
  Scenario Outline: 在监控中点击今日待处理、已处理以及高级告警
    Given I click the "<status>" button
    And I will see the "alert.MonitorPage" page
    Then I will see the <result>

    Examples:
      | status    | result                                      |
      | Pending   | search result "{'column':'6','name':'待处理'}" |
      | Handled   | search result "{'column':'6','name':'已处理'}" |
      | HighAlert | alert grade is "red"                        |

  @smoke @alertSmoke
  Scenario: 返回到监控页
    Given I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page
    When I click the "ReturnToAlertPage" button
    Then the page's title will be "监控"
