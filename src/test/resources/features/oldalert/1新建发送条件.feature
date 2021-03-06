#@alert @all
Feature: 监控新建事件数并填写发送条件（RZY-450、RZY-451）

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"

#  @smoke @alertSmoke
  Scenario Outline: 创建一个发送条件的监控（RZY-450）
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<name>"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "*"
    And I switch the "AlertEnable" button to "disable"
    And I set the parameter "AlertTriggerInput" with value "5"
    And I set the parameter "AlertLevelInput" with value "3"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "100"
    And I click the "AddThresholdButton" button
    And I set the parameter "HighLevelInput" with value "1000"
    And I click the "AlertNoteTypeTab" button
    And I add a "<Type>" with parameter "<Parameter>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name       | Type      | Parameter                                                                                             |
      | AutoTest7  | emailType | {'title':'auto test alert.','email':['autotest@yottabyte.cn'],'condition':['低'],'content':''}         |
      | AutoTest8  | emailType | {'title':'auto test alert.','email':['autotest@yottabyte.cn'],'condition':['中'],'content':''}         |
      | AutoTest9  | emailType | {'title':'auto test alert.','email':['autotest@yottabyte.cn'],'condition':['高'],'content':''}         |
      | AutoTest10 | emailType | {'title':'auto test alert.','email':['autotest@yottabyte.cn'],'condition':[''],'content':''}          |
      | AutoTest11 | emailType | {'title':'auto test alert.','email':['autotest@yottabyte.cn'],'condition':['低','中','高'],'content':''} |


  Scenario Outline: 创建三个相同告警方式不同发送条件的监控（RZY-451）
    Given I click the "CreateAlert" button
    And I will see the "alert.CreatePage" page
    When I set the parameter "AlertName" with value "<name>"
    And I choose the "default_Alert" from the "AlertGroups"
    And I choose the "所有日志" from the "AlertSources"
    And I set the parameter "SearchContent" with value "*"
    And I switch the "AlertEnable" button to "disable"
    And I set the parameter "AlertTriggerInput" with value "5"
    And I set the parameter "AlertLevelInput" with value "3"
    And I click the "AddThresholdButton" button
    And I set the parameter "MiddleLevelInput" with value "100"
    And I click the "AddThresholdButton" button
    And I set the parameter "HighLevelInput" with value "1000"
    And I click the "AlertNoteTypeTab" button
    And I add a "<Type>" with parameter "<Parameter1>"
    And I add a "<Type>" with parameter "<Parameter2>"
    And I add a "<Type>" with parameter "<Parameter3>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | name       | Type        | Parameter1                                                                                    | Parameter2                                                                                     | Parameter3                                                                                     |
      | AutoTest12 | emailType   | {'title':'auto test alert.','email':['autotest@yottabyte.cn'],'condition':['低'],'content':''} | {'title':'auto test alert.','email':['autotest1@yottabyte.cn'],'condition':['中'],'content':''} | {'title':'auto test alert.','email':['autotest2@yottabyte.cn'],'condition':['高'],'content':''} |
      | AutoTest13 | forwardType | {'address':'http://192.168.1.82:511111/','condition':['低']}                                   | {'address':'http://192.168.1.82:511111/','condition':['中']}                                    | {'address':'http://192.168.1.82:511111/','condition':['高']}                                    |