@configsSmoke
Feature: 字段提取Syslog_pri解析

  @second
  Scenario Outline: RZY-1547:syslog_pri解析
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY1547syslog_pri解析"
    And I set the parameter "Logtype" with value "other"
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "<regex>"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "<parseRule>" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceFieldLabel2"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I wait for "2000" millsecond
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "auto_test_syslog"
    And I set the parameter "Tag" with value "auto_test_syslog"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | logSample                                                              | regex           | parseRule    | sourceField | result                                                                                                 | result1                                                                                                                                    |
      | <30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting. | <(?<pri>\d+)>.* | syslog_pri解析 | pri         | Object\npri:"30"\nraw_message:"<30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting." | Object\nfacility:"daemon"\npri:"30"\nseverity:"info"\nraw_message:"<30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting." |

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

  Scenario Outline: RZY-3420:在搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | tag              | result                                                               |
      | auto_test_syslog | {'other.facility':'daemon','other.pri':'30','other.severity':'info'} |