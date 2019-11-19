@configsSmoke
Feature: 字段提取Syslog_pri解析

  @second
  Scenario Outline: RZY-1547:syslog_pri解析
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting."
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "<(?<pri>\d+)>.*"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "syslog_pri解析" from the "ParseRule"
    And I choose the "pri" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY1547syslog_pri解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_syslog"
    And I set the parameter "Tag" with value "auto_test_syslog"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                                                                 | result1                                                                                                                                    |
      | Object\npri:"30"\nraw_message:"<30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting." | Object\nfacility:"daemon"\npri:"30"\nseverity:"info"\nraw_message:"<30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting." |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName          | log        |
      | auto_test_syslog | syslog.log |