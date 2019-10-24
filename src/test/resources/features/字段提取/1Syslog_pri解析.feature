@configsSmoke
Feature: 字段提取Syslog_pri解析

  @second
  Scenario Outline: RZY-1547:syslog_pri解析
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
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

  Scenario Outline: RZY-3420:在搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | tag              | result                                                                                                       |
      | auto_test_syslog | {'other.facility':'other.facility：daemon','other.pri':'other.pri：30','other.severity':'other.severity：info'} |

  Scenario Outline: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading complete
    When the data name is "{'column':'1','name':'RZY1547syslog_pri解析'}" then i click the "详 情" button
    And I wait for "SmallTr" will be visible
    Then I will see the config element "正则解析" value is "正则解析 <result>"
    Then I will see the config element "syslog_pri解析" value is "syslog_pri解析 <result>"

    Examples:
      | result    |
      | 1 1 0 0 0 |