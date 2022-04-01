@recieve @cruxee @autoui02 @testc
Feature: Cruxee上传插件

  Background:
    Given open the "incident.SendPolicyPage" page for uri "/app/incident/settings/"
    When I click the "SendPolicyItem" button

  Scenario Outline: 上传插件(未上传过)
    Given I wait for loading complete
    And I click the "PluginButton" button
    And I click the "UpLoadPluginButton" button
    And I choose the "事件通知" from the "ChoisePluginTypeList"
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/<inputFileName>.py"
    And I will see the text "验证成功!" exist in page
    And I click the Element with text "确认"
    Then I will see the success message "上传成功"
    Then I will see the text "<inputFileName>" exist in page

  Examples:
    | inputFileName  |
    | http_forwarder |
    | incident_email |

  Scenario Outline: 上传插件(已上传过)
    Given I wait for loading complete
    And I click the "PluginButton" button
    And I click the "UpLoadPluginButton" button
    And I choose the "事件通知" from the "ChoisePluginTypeList"
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/<inputFileName>.py"
    And I will see the text "上传完成!存在同名插件" exist in page
    And I click the Element with text "替换"
    Then I will see the success message "上传成功"
    Then I will see the text "<inputFileName>" exist in page

  Examples:
    | inputFileName  |
    | http_forwarder |
    | incident_email |

  Scenario: 未选择插件类型
    Given I wait for loading complete
    And I click the "PluginButton" button
    And I click the "UpLoadPluginButton" button
    And I click the Element with text "确认"
    Then I will see the success message "请选择插件类型！"

  Scenario: 未上传插件
    Given I wait for loading complete
    And I click the "PluginButton" button
    And I click the "UpLoadPluginButton" button
    And I choose the "事件通知" from the "ChoisePluginTypeList"
    And I click the Element with text "确认"
    Then I will see the success message "请务必上传一个插件！"

  Scenario Outline: 上传解析失败的插件
    Given I wait for loading complete
    And I click the "PluginButton" button
    And I click the "UpLoadPluginButton" button
    And I choose the "事件通知" from the "ChoisePluginTypeList"
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/<inputFileName>.py"
    Then I will see the message contains "上传失败: 解析插件失败"
    And I click the Element with text "确定"
    And I will see the text "上传失败" exist in page
    And I click the Element with text "确认"
    Then I will see the success message "请务必上传一个插件！"
    And I click the Element with text "取消"
    Then I will see the text "<inputFileName>" is not existed in page

    Examples:
      | inputFileName  |
      | wrongPlugin    |


