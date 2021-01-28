Feature: 监控新建事件数并填写告警方式

#  @alert @all @smoke @alertSmoke
  Scenario Outline: 创建一个事件数监控-一种告警方式（RZY-445、RZY-446、RZY-448、RZY-449）
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "RZY-<AlertName>"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "*"
    And I switch the "AlertEnable" button to "disable"
    And I set the parameter "AlertTriggerInput" with value "5"
    And I set the parameter "AlertLevelInput" with value "3"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "100"
    And I click the "AlertNoteTypeTab" button
    And I add a "<FunctionName>" with parameter "<Parameter>"
    And I click the "SaveButton" button
    Then I will see the <Result>

    Examples: 创建监控成功
      | AlertName     | FunctionName | Parameter                                                                                                                                                                                                                                                                                   | Result                 |
      | 445：rsyslog监控 | rsyslogType  | {'address':'192.168.1.183:514','protocol':['UDP'],'level':['INFO'],'facility':'local0','condition':[''],'content':'{{ alert.name }}\|{{ alert.strategy.trigger.start_time\|date:\'Y-m-d H:i:s\' }}\|{{ alert.strategy.trigger.end_time\|date:\'Y-m-d H:i:s\' }}\|{{ alert.search.query }}'} | success message "保存成功" |
      | 446：邮件监控      | emailType    | {'title':'auto test alert.','email':['autotest@yottabyte.cn'],'condition':[''],'content':''}                                                                                                                                                                                                | success message "保存成功" |
      | 449：ping主机    | pingHostType | {'address':'192.168.1.82','condition':['高','中','低']}                                                                                                                                                                                                                                        | success message "保存成功" |

#  @alert @all @smoke @alertSmoke
  Scenario: RZY-448：告警转发
    Given open the "alert.ListPage" page for uri "/alerts/"
    When I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "RZY-448：告警转发"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "*"
    And I switch the "AlertEnable" button to "disable"
    And I set the parameter "AlertTriggerInput" with value "5"
    And I set the parameter "AlertLevelInput" with value "3"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "100"
    And I click the "AlertNoteTypeTab" button
    And I wait for "IconRight" will be visible
    And I choose the "告警转发" from the "ConfigDropdown"
    And I set the parameter "Url" with value "http://192.168.1.82:511111/"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

  Scenario Outline: 创建一个事件数监控-多种告警方式
    Given open the "splSearch.SearchPage" page for uri "/search/"
    When I set the parameter "SearchInput" with value "*"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "SavedSearch" button
    And I wait for loading invisible
    And I set the parameter "OfflineTaskName" with value "<savedSearch>"
    And I choose the "default_SavedSearch" from the "GroupComboBox"
    And I click the "EnsureCreateSavedSearch" button
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "AutoTest18"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I choose the "<savedSearch>" from the "SavedSearch"
    And I set the parameter "SearchContent" with value "*"
    And I switch the "AlertEnable" button to "disable"
    And I set the parameter "AlertTriggerInput" with value "5"
    And I set the parameter "AlertLevelInput" with value "3"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "100"
    And I click the "AlertNoteTypeTab" button
    And I add a "rsyslogType" with parameter "{'address':'alltest.rizhiyi.com:514','protocol':['UDP'],'level':['INFO'],'facility':'local0','condition':[''],'content':'autotest'}"
    And I add a "emailType" with parameter "{'title':'auto test alert.','email':['autotest@yottabyte.cn'],'condition':[''],'content':''} "
    And I add a "forwardType" with parameter "{'address':'http://192.168.1.82:511111/','condition':['低']}"
    And I add a "pingHostType" with parameter "{'address':'192.168.1.82','condition':['']}"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | savedSearch      |
      | alertSavedSearch |