@alert @all
Feature: 监控上传告警插件

  Background:
#    Given I delete from "AlertPlugin" where "{'name':'hengshuiyinhang_socket'}"
#    And I delete from "{'database':'share','documentName':'alert_plugin.files'}" where "{'filename':'hengshuiyinhang_socket'}" using mongodb
#    Then open the "alert.PluginPage" page for uri "/plugins/"

#  @smoke
#  Scenario: 上传告警插件成功
#    When I click the "Upload" button
#    And I upload a file with name "/src/test/resources/testdata/alertPlugins/hengshuiyinhang_socket.py"
#    And I wait for "VerifyText" will be visible
#    And I click the "EnsureButton" button
#    Then I will see the success message "上传成功"
#    When I click the "Upload" button
#    And I upload a file with name "/src/test/resources/testdata/alertPlugins/hengshuiyinhang_socket.py"
#    And I wait for "VerifyText" will be visible
#    And I click the "EnsureButton" button
#    And I will see the error message "上传的告警插件【hengshuiyinhang_socket】已存在，您需要替换吗？"
#    And I click the "EnsureReplace" button
#    Then I will see the success message "上传成功"

  Scenario Outline: 上传告警插件失败（RZY-1192）
    Given I click the "Upload" button
    When I upload a file with name "<inputFileName>"
    Then I will see the error message "<errorMessage>"

    Examples:
      | inputFileName                                                  | errorMessage |
      | /src/test/resources/testdata/alertPlugins/testAlertPlugins.txt | 仅支持 .py 格式文件 |
      | /src/test/resources/testdata/alertPlugins/testAlertPlugins.py  | 插件有误，请检查后重试。 |