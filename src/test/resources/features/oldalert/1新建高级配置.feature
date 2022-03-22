@alertss @all
Feature: 监控高级配置

#   有bug，待修复后添加验证
  #@alertSmoke @third
  Scenario Outline: RZY-2974、444、2983、2987、3025
    Given open the "alert.ListPage" page for uri "/alerts/"
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "监控高级配置测试"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "*"
    And I choose the "字段统计监控" from the "AlertTypes"
    And I click the "AlertPlanCrontabButton" button
    And I set the parameter "AlertPlanCrontabInput" with value "0 * * * * ?"
    And I set the parameter "AlertTriggerFieldsInput" with value "apache.resp_len"
    And I set the parameter "AlertTriggerInput" with value "50"
    And I choose the "小时内" from the "AlertTriggerHourOrMinute"
    And I set the parameter "AlertLevelInput" with value "0"
    And I click the "AdvancedConfigTab" button
    And I set the parameter "ExSearchContent" with value "<ExSearchContent>"
    And I choose the "所有日志" from the "ExtendSourceGroup"
    And I click the "<chart>" button
    And I click the "AlertNoteTypeTab" button
    And I choose the "邮件告警" from the "AlertDropdown"
    And I click the "Preview" button

    Examples:
      | ExSearchContent                                                                                                                                                                            | chart       |
      | hostname:{{alert.result.hits.0.hostname}}                                                                                                                                                  |             |
      | hostname:{{alert.result.hits.0.hostname}} AND [[ appname:top_info_disk_io_stats \| table hostname, ip ]]                                                                                   |             |
      | * \| timechart count() by hostname                                                                                                                                                         | GraphEnable |
      | * \| timechart sep="1h" count() as cnt max(context_id) as max_ min(context_id) as min_ by context_id bins=2                                                                                | GraphEnable |
      | *\|timechart span=1h rendertype="line" count()                                                                                                                                             | GraphEnable |
      | \| makeresults count=10 \| eval app="test" \| eval tag="t" \| append [[ \| makeresults count=10 \| eval app="rcl" \| eval tag="r"]] \| chart rendertype="sunburst" count() over tag by app | GraphEnable |

  #@alertSmoke @third
  Scenario: 新建已存搜索
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I wait element "SearchStatus" change text to "搜索完成!"
    When I set the parameter "SearchInput" with value "* | timechart count() by hostname"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "SavedSearch" button
    And I wait for loading invisible
    And I set the parameter "OfflineTaskName" with value "监控所需已存搜索"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "创建成功"

  #@alertSmoke @third
  Scenario: RZY-440:新建监控-高级配置-已存搜索-加载
    Given open the "alert.ListPage" page for uri "/alerts/"
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "监控高级配置测试"
    And I set the parameter "AlertDes" with value "AutoCreate"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "*"
    And I choose the "字段统计监控" from the "AlertTypes"
    And I click the "AlertPlanCrontabButton" button
    And I set the parameter "AlertPlanCrontabInput" with value "0 * * * * ?"
    And I set the parameter "AlertTriggerFieldsInput" with value "apache.resp_len"
    And I set the parameter "AlertTriggerInput" with value "50"
    And I choose the "小时内" from the "AlertTriggerHourOrMinute"
    And I set the parameter "AlertLevelInput" with value "0"
    And I click the "AdvancedConfigTab" button
    And I choose the "所有日志" from the "ExtendSourceGroup"
    And I choose the "监控所需已存搜索" from the "SavedSearch"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"
