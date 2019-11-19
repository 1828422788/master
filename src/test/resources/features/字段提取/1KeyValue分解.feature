@configsSmoke
Feature: 字段提取KeyValue分解

  @second
  Scenario Outline: RZY-1531:配置KeyValue分解规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<logSample>"
    And I click the "AddRule" button
    And I choose the "KeyValue分解" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceField"
    And I set the parameter "FieldSeparator" with value "&"
    And I set the parameter "KVSeparator" with value "="
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | logSample                                                                                                                                              | sourceField | result                                                                                                                                                                                                                                                                                                                                                |
      | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message | Object\nfield:"tag"\norder:"desc"\npage:"1"\nquery:"*"\nsize:"50"\nsourcegroup:"all"\nsourcegroupCn:"%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97"\ntime_range:"-2d,now"\ntype:"fields"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields" |

  @second
  Scenario Outline: RZY-1532、1533
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<logSample>"
    And I click the "AddRule" button
    And I choose the "KeyValue分解" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceField"
    And I set the parameter "FieldSeparator" with value "&"
    And I set the parameter "KVSeparator" with value "="
    And I set the parameter "KeepKey" with value "<keepKey>"
    And I set the parameter "DumpKey" with value "<dumpKey>"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | name         | logSample                                                                                                                                              | sourceField | keepKey | dumpKey | result                                                                                                                                                                                                                                                                                                                                  | appName            |
      | RZY1532丢弃key | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message |         | order   | Object\nfield:"tag"\npage:"1"\nquery:"*"\nsize:"50"\nsourcegroup:"all"\nsourcegroupCn:"%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97"\ntime_range:"-2d,now"\ntype:"fields"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields" | auto_test_dump_key |
      | RZY1533保留key | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message | order   |         | Object\norder:"desc"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"                                                                                                                                              | auto_test_keep_key |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/KeyValue.log"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName            |
      | auto_test_dump_key |
      | auto_test_keep_key |