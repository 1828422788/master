@alert @all
Feature: 监控最新状态

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "LatestStatus" button
    Then I will see the "alert.MonitorPage" page

  Scenario: 展开/收起重复告警
    When I click the expand button "Expand" if exist
    And I click the "Retract" button
    Then take a screenshot

  Scenario Outline: 按分组和状态搜索
    Given search from "<dropdownMenu>" then I will see the result "{'column':'<num>','name':'<name>'}"

    Examples:
      | dropdownMenu                      | num | name          |
      | {'GroupDropdown':'default_Alert'} | 3   | default_Alert |
      | {'StatusDropdown':'待处理'}          | 6   | 待处理           |
      | {'StatusDropdown':'已处理'}          | 6   | 已处理           |
      | {'StatusDropdown':'已忽略'}          | 6   | 已忽略           |

  Scenario Outline: 按告警时间搜索
    Given I click the "DateEditor" button
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

  Scenario Outline: 按等级搜索
    Given choose from "<dropdownMenu>"
    Then I will see the alert grade is "<gradeColour>"

    Examples:
      | dropdownMenu          | gradeColour |
      | {'GradeDropdown':'低'} | green       |
      | {'GradeDropdown':'高'} | red         |
      | {'GradeDropdown':'中'} | yellow      |

  Scenario Outline: 标记为处理/忽略
    When I click the first checkbox in table
    And I click the "MarkDropdown" button
    And I click the "<mark>" button
    Then I will see the success message "<message>"

    Examples:
      | mark   | message |
      | Deal   | 处理成功    |
      | Ignore | 忽略成功    |

#错误提示



