@alert @all
Feature: 监控新建事件数并填写高级设置（RZY-440、RZY-1866）

#  @smoke @alertSmoke
  Scenario Outline: 新建所需已存搜索
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "SavedSearch" button
    And I wait for loading invisible
    And I set the parameter "OfflineTaskName" with value "<name>"
    And I choose the "<group>" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Then I will see the success message "<message>"

    Examples: 保存成功
      | splQuery | name             | group               | message |
      | *        | alertSavedSearch | default_SavedSearch | 创建成功    |

  Scenario Outline: 高级配置中已存搜索+固定键值（RZY-440、RZY-1866）
    Given open the "alert.ListPage" page for uri "/alerts/"
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<AlertName>"
    And I set the parameter "AlertDes" with value "<AlertDes>"
    And I choose the "<AlertGroup>" from the "AlertGroups"
    And I choose the "<AlertSource>" from the "AlertSources"
    And I set the parameter "SearchContent" with value "<SearchContent>"
    And I set the parameter "AlertPlanTimeInput" with value "<AlertPlanTime>"
    And I set the parameter "AlertTriggerInput" with value "<AlertTrigger>"
    And I set the parameter "AlertLevelInput" with value "<AlertLevelInput>"
    And I click the "AdvancedConfigTab" button
    And I click the "AdvanceSavedSearch" button
    And I click the "AlertSavedSearch" button
    And I click the "AddKeyValueButton" button
    And I set the parameter "Key" with value "<key>"
    And I set the parameter "Value" with value "<value>"
    And I click the "SaveButton" button
    Then I will see the <Result>

#  @smoke @alertSmoke
    Examples: 创建监控成功
      | AlertName  | AlertDes | AlertGroup    | AlertSource | SearchContent | AlertPlanTime | AlertTrigger | AlertLevelInput | key        | value | Result                 |
      | AutoTest35 | alertDes | default_Alert | 所有日志        | *             | 5             | 5            | 3               | ssue_alert | false | success message "保存成功" |

    Examples: 为空校验
      | AlertName  | AlertDes | AlertGroup    | AlertSource | SearchContent | AlertPlanTime | AlertTrigger | AlertLevelInput | key | value | Result                    |
      | AutoTest35 | alertDes | default_Alert | 所有日志        | *             | 5             | 5            | 3               |     |       | error message "请填写完整的键值对" |
      | AutoTest35 | alertDes | default_Alert | 所有日志        | *             | 5             | 5            | 3               | key |       | error message "请填写完整的键值对" |
