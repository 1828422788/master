@configsSmoke
Feature: 字段提取KeyValue分解

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

  @second
  Scenario Outline: RZY-1531:配置KeyValue分解规则
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<logSample>"
    And I click the "AddRule" button
    And I choose the "KeyValue分解" from the "ParseRule" in config
    And I choose the "<sourceField>" from the "SourceField" in config
    And I set the parameter "FieldSeparator" with value "&"
    And I set the parameter "KVSeparator" with value "="
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | logSample                                                                                                                                              | sourceField | result                                                                                                                                                                                                                                                                                                                                                |
      | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message | Object\nfield:"tag"\norder:"desc"\npage:"1"\nquery:"*"\nsize:"50"\nsourcegroup:"all"\nsourcegroupCn:"%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97"\ntime_range:"-2d,now"\ntype:"fields"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields" |

  @second
  Scenario Outline: RZY-1532、1533 搜索页验证
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
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/KeyValue.log"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "2000" millsecond
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<appName>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    And I will see the spl search result data "<field>" doesn't exist
    Then I will see the spl search result "<searchResult>"

    Examples:
      | field                                                                                                           | searchResult                                                                                                                                                                                                                                                                                                                                 | appName            | name         | logSample                                                                                                                                              | sourceField | keepKey | dumpKey | result                                                                                                                                                                                                                                                                                                                                  | appName            |
      | other.order                                                                                                     | {'other.field':'other.field：tag ','other.page':'other.page：1 ','other.query':'other.query：* ','other.size':'other.size：50 ','other.sourcegroup':'other.sourcegroup：all ','other.sourcegroupCn':'other.sourcegroupCn：%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97 ','other.time_range':'other.time_range：-2d,now ','other.type':'other.type：fields '} | auto_test_dump_key | RZY1532丢弃key | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message |         | order   | Object\nfield:"tag"\npage:"1"\nquery:"*"\nsize:"50"\nsourcegroup:"all"\nsourcegroupCn:"%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97"\ntime_range:"-2d,now"\ntype:"fields"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields" | auto_test_dump_key |
      | other.field,other.page,other.query,other.size,other.sourcegroup,other.sourcegroupCn,other.time_range,other.type | {'other.order':'other.order：desc '}                                                                                                                                                                                                                                                                                                          | auto_test_keep_key | RZY1533保留key | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message | order   |         | Object\norder:"desc"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"                                                                                                                                              | auto_test_keep_key |


  Scenario Outline: 详情验证
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
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/KeyValue.log"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "60000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"


    Examples:
      | rule1      | appName         | name    | logSample                                                                                                                                              | sourceField | keepKey | dumpKey | result                                                                                                                                                                                                                                                                                                                                  | appName            |
      | KeyValue分解 | dump_key_detail | 丢弃key详情 | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message |         | order   | Object\nfield:"tag"\npage:"1"\nquery:"*"\nsize:"50"\nsourcegroup:"all"\nsourcegroupCn:"%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97"\ntime_range:"-2d,now"\ntype:"fields"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields" | auto_test_dump_key |
      | KeyValue分解 | keep_key_detail | 保留key详情 | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message | order   |         | Object\norder:"desc"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields"                                                                                                                                              | auto_test_keep_key |

