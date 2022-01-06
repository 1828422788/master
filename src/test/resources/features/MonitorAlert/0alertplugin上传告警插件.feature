@autoui01 @uplugins
Feature: 监控上传告警插件

  Background:
    Given open the "alert.PluginPage" page for uri "/plugins/"

  @uplugin1
  Scenario Outline: 上传告警插件成功
    When I click the "Upload" button
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/<inputFileName>.py"
    And I wait for "VerifyText" will be visible
    And I click the "EnsureButton" button

    Examples:
      | inputFileName  |
      | ping_host      |
      | incident_email |

  @uplugin2
  Scenario: 上传同名告警插件
    When I click the "Upload" button
    And I upload a file with name "/src/test/resources/testdata/alertPlugins/http_forwarder.py"
    And I wait for "VerifyTextNameDup" will be visible
    And I click the "EnsureButton" button
    And I will see the error message "上传的告警插件【http_forwarder】已存在，您需要替换吗？"
    And I click the "EnsureReplace" button
    Then I will see the success message "上传成功"

#  @uplugin3
#  Scenario Outline: RZY-1192:监控-上传非.py插件
#    Given I click the "Upload" button
#    When I upload a file with name "<inputFileName>"
#    Then I will see the error message "<errorMessage>"
#
#    Examples:
#      | inputFileName                                                  | errorMessage |
#      | /src/test/resources/testdata/alertPlugins/testAlertPlugins.txt | 仅支持 .py 格式文件 |
