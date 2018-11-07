@indexSetting @all
Feature: 索引新建

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexinfo/"

  Scenario Outline:
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I set the parameter "ColdTime" with value "<coldTime>"
    And I set the parameter "SavedSize" with value "<savedSize>"
    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I click the "CreateButton" button
    Then I will see the <message>

  @smoke
    Examples: 新建成功
      | name     | desc | savedTime | divideTime | coldTime | savedSize | savedSizeDropDown | message                |
      | autotest |      | 2         | 1          | 1        | 100       | MB                | success message "保存成功" |

    Examples: 新建失败
      | name | desc | savedTime | divideTime | coldTime | savedSize | message                                            |
      |      |      |           |            |          |           | error message "名称 不能为空"                            |
      | Test |      |           |            |          |           | error message "索引名应为小写字母开头，小写字母及下划线组成的长度小于32位的字符串" |
      | test |      |           |            |          |           | error message "保存时间 不能为空"                          |
      | test |      | 1         |            |          |           | error message "切分时间 不能为空"                          |
      | test |      | 1         | 1          |          |           | error message "切分时间应小于有效时间"                        |
      | test |      | -1        | 1          |          |           | error message "保存时间应为正整数"                          |
      | test |      | 1         | 0.5        |          |           | error message "切分时间应为正整数"                          |
      | test |      | 2         | 1          |          | 0.1       | error message "保存大小应为正整数"                          |
      | test |      | 2         | 1          |          | 0         | error message "保存大小 不能为零"                          |
      | test |      | 2         | 1          |          | -1        | error message "保存大小应为正整数"                          |
      | test |      | 2         | 1          | 0        |           | error message "冷却时间 不能为零"                          |
      | test |      | 2         | 1          | -1       |           | error message "冷却时间应为正整数"                          |
      | test |      | 2         | 1          | -1       |           | error message "冷却时间应为正整数"                          |
      | test |      | 4         | 2          | 1        |           | error message "冷却时间应大于等于切分时间，小于保存时间"               |

