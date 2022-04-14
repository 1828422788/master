@configs @configs09
Feature: 字段提取KeyValue分解


  @configsSmoke
  Scenario Outline: RZY-1531:配置KeyValue分解规则
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<logSample>"
    And I click the "AddRule" button
    And I choose the "KeyValue分解" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "<sourceField>" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the parameter "FieldSeparator" with value "&"
    And I set the parameter "KVSeparator" with value "="
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"

    Examples:
      | logSample                                                                                                                                              | sourceField | result                                                                                                                                                                                                                                                                                                                                                |
      | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message | {'field':'"tag"','order':'"desc"','page':'"1"','query':'"*"','size':'"50"','sourcegroup':'"all"','sourcegroupCn':'"%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97"','time_range':'"-2d,now"','type':'"fields"','raw_message':'"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"'} |


  Scenario Outline: RZY-1532、1533 添加KeyValue分解规则
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<logSample>"
    And I click the "AddRule" button
    Then I wait for "1000" millsecond
    And I choose the "KeyValue分解" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "<sourceField>" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the parameter "FieldSeparator" with value "&"
    And I set the parameter "KVSeparator" with value "="
    And I set the parameter "KeepKey" with value "<keepKey>"
    And I set the parameter "DumpKey" with value "<dumpKey>"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name           | logSample                                                                                                                                              | sourceField | keepKey | dumpKey | result                                                                                                                                                                                                                                                                                                                                                        | appName           |
      | RZY1532丢弃key | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message |         | order   | {'field':'"tag"','page':'"1"','query':'"*"','size':'"50"','sourcegroup':'"all"','sourcegroupCn':'"%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97"','time_range':'"-2d,now"','type':'"fields"','raw_message':'"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"'} | wym_test_dump_key |
      | RZY1533保留key | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message | order   |         | {'order':'"desc"','raw_message':'"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"'}                                                                                                                                                                   | wym_test_keep_key |


  Scenario Outline: RZY-1532、1533 上传日志，验证结果
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/KeyValue.log"
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
      | searchResult                                                                                                                                                                                                         |  appName           |
      | {'other.field':'tag','other.page':'1','other.query':'*','other.size':'50','other.sourcegroup':'all','other.sourcegroupCn':'%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97','other.time_range':'-2d,now','other.type':'fields'} | wym_test_dump_key  |
      | {'other.order':'desc'}                                                                                                                                                                                               | wym_test_keep_key  |