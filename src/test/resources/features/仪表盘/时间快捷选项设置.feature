@dashboard @dashboardSmoke @dashboard16
Feature: 系统设置-时间快捷选项设置

  Scenario Outline: 输入关键字搜索相关配置
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"
    And I wait for loading invisible
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
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"
    And I wait for loading invisible
    And I click the "BackButton" button
    And I wait for "3000" millsecond
    Then the page's title will be "系统配置"

  Scenario: 编辑所有时间
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"
    And I wait for loading invisible
    And I click the "WholeTimeEdit" button
    And I wait for "3000" millsecond
    When I set the parameter "WholeTimeNameInput" with value "WholeTime"
    And I click the "WholeTimeCancel" button
    Then I will see the text "WholeTime" is not existed in page

  Scenario: 新增时间快捷选项-相对
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"
    And I wait for loading invisible
    And I click the "AddRelativeTimeShortcut" button
    And I wait for "1000" millsecond
    And I click the "WholeTimeSave" button
    Then I will see the error message "展示名称不能为空"
#    Then I wait for "NoNameWarn" will be visible
#    And I click the "EnsureButton" button
    And I wait for "NewShowName" will be visible
    And I click the "NewShowName" button
    And I set the parameter "NewShowName" with value "上一个月"
    And I click the "WholeTimeSave" button
    Then I will see the error message "开始时间不能为空"
#    Then I wait for "NoStartTimeWarn" will be visible
#    And I click the "EnsureButton" button
    And I wait for "NewStartTime" will be visible
    And I click the "NewStartTime" button
    And I set the parameter "NewStartTime" with value "-1M/M"
    And I click the "WholeTimeSave" button
    Then I will see the error message "结束时间不能为空"
#    Then I wait for "NoEndTimeWarn" will be visible
#    And I click the "EnsureButton" button
    And I wait for "NewEndTime" will be visible
    And I click the "NewEndTime" button
    And I set the parameter "NewEndTime" with value "now/M"
    And I click the "WholeTimeSave" button
    Then I will see the text "上一个月" exist in page

  Scenario: 新增时间快捷选项-最近
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"
    And I wait for loading invisible
    And I click the "AddRecentTimeShortcut" button
    And I wait for "NewShowNameRecent" will be visible
    And I click the "NewShowNameRecent" button
    And I set the parameter "NewShowNameRecent" with value "最近10天"
    And I click the "NewStartTimeRecent" button
    And I set the parameter "NewStartTimeRecent" with value "-10d"
    And I click the "NewEndTimeRecent" button
    And I set the parameter "NewEndTimeRecent" with value "now"
    And I click the "WholeTimeSave" button
    Then I will see the text "最近10天" exist in page

  Scenario: 新增时间快捷选项-实时
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"
    And I wait for loading invisible
    And I click the "AddActualTimeShortcut" button
    And I wait for "NewShowNameActual" will be visible
    And I click the "NewShowNameActual" button
    And I set the parameter "NewShowNameActual" with value "35分钟窗口"
    And I click the "NewStartTimeActual" button
    And I set the parameter "NewStartTimeActual" with value "35m"
    And I click the "NewEndTimeActual" button
    And I set the parameter "NewEndTimeActual" with value "window"
    And I click the "WholeTimeSave" button
    Then I will see the text "35分钟窗口" exist in page

  Scenario: 新增时间快捷选项-其他
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"
    And I wait for loading invisible
    And I click the "AddOtherTimeShortcut" button
    And I wait for "NewShowNameOther" will be visible
    And I click the "NewShowNameOther" button
    And I set the parameter "NewShowNameOther" with value "前25个交易日"
    And I click the "NewStartTimeOther" button
    And I set the parameter "NewStartTimeOther" with value "-25t/t"
    And I click the "NewEndTimeOther" button
    And I set the parameter "NewEndTimeOther" with value "-1t/t+1d"
    And I click the "WholeTimeSave" button
    Then I will see the text "前25个交易日" exist in page

  Scenario: 验证在搜索界面添加成功
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "DateEditor" button
    Then I will see the text "上一个月" exist in page
    Then I will see the text "最近10天" exist in page
    Then I will see the text "35分钟窗口" exist in page
    Then I will see the text "前25个交易日" exist in page

  Scenario: 验证编辑时添加冲突
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"
    And I wait for loading invisible
    And I click the "AddOtherTimeShortcut" button
    And I click the "AddActualTimeShortcut" button
    Then I will see the error message "请先完成编辑或新增操作"
#    Then I wait for "CreateConflictWarn" will be visible

  Scenario Outline: 删除已添加自定义快捷选项
    Given open the "system.TimeShortcutsConfig" page for uri "/system/shortcuts/"
    And I wait for loading invisible
    And I will see the text "<name>" exist in page
    And I click the "<delete>" button
    And I click the "EnsureButton" button
    Then I will see the text "<name>" is not existed in page

    Examples:
      | name       |    delete    |
      | 上一个月     |    DeleteRelative    |
      | 最近10天    |    DeleteRecent    |
      | 35分钟窗口   |    DeleteActual    |
      | 前25个交易日 |    DeleteOther    |









