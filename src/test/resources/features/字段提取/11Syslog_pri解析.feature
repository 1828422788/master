@configs @configsSmoke @configs11
Feature: 字段提取Syslog_pri解析


  Scenario Outline: RZY-1547:syslog_pri解析
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting."
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "<(?<pri>\d+)>.*" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "syslog_pri解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "pri" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    And I will see the field extraction result "<result1>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY1547syslog_pri解析"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | appName         | result                                                                                                  | result1                                                                                                                                           |
      | wym_test_syslog | {'pri':'"30"','raw_message':'"<30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting."'} | {'facility':'"daemon"','pri':'"30"','severity':'"info"','raw_message':'"<30>Oct 9 22:33:20 hlfedora auditd[1787]: The audit daemon is exiting."'} |


  Scenario Outline: RZY-1547:syslog_pri解析
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I will see the element "VerifyText" contains "上传完成"
    And I click the "Confirm" button
    And I wait for loading invisible
    When I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I will see the element "SearchInput" contains "appname:"<appName>" AND tag:"<appName>""
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | appName         | log        | searchResult                                                         |
      | wym_test_syslog | syslog.log | {'other.facility':'daemon','other.pri':'30','other.severity':'info'} |