@dashboard @dashboardSmoke
Feature: 系统设置-时间快捷选项设置

  Background:
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"
    And I wait for loading invisible

  Scenario Outline: 输入关键字搜索相关配置
    When I set the parameter "searchBox" with value "<keyWord>"
    And I wait for "3000" millsecond
    And I will see the text "<keyWord>" exist in page
    And I will see the "WholeTimeText" doesn't exist

    Examples:
      | keyWord                                           |
      | 今天                                             |
      | 最近1天                                             |
      | 本周                                             |
      | 10秒窗口                                             |
      | 前一个交易日                                          |

  Scenario: 返回到系统设置
    And I click the "BackButton" button
    And I wait for "3000" millsecond
    Then the page's title will be "系统配置"

#  Scenario: 编辑所有时间
#    And I click the "WholeTimeEdit" button
#    And I wait for "3000" millsecond
#    Then the page's title will be "系统配置"



