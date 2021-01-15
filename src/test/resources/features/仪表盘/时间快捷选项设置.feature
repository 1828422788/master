@dashboard11 @dashboardSmoke
Feature: 系统设置所有时间定义（RZY-1818）

  Background:
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"

  Scenario Outline: 输入关键字搜索相关配置
    When I set the parameter "searchBox" with value "<keyWord>"
    And I let element "WholeTime" lose focus
    Then I will see the success message "所有时间输入格式不合法，请参照备注中的提示格式重新输入"

    Examples:
      | keyWord                                           |
      | 今天                                             |
      | 最近1天                                             |
