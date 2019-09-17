@configsSmoke
Feature: 字段提取KeyValue分解

  @second
  Scenario Outline: RZY-1531:配置KeyValue分解规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I set the parameter "Logtype" with value "test"
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "KeyValue分解" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "<sourceField>" from the "SourceField"
    And I set the parameter "FieldSeparator" with value "&"
    And I set the parameter "KVSeparator" with value "="
    And I set the parameter "KeepKey" with value "<keepKey>"
    And I set the parameter "DumpKey" with value "<dumpKey>"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | logSample                                                                                                                                              | sourceField | keepKey | dumpKey | result                                                                                                                                                                                                                                                                                                                                                |
      | field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields | raw_message |         |         | Object\nfield:"tag"\norder:"desc"\npage:"1"\nquery:"*"\nsize:"50"\nsourcegroup:"all"\nsourcegroupCn:"%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97"\ntime_range:"-2d,now"\ntype:"fields"\nraw_message:"field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields" |

  @second
  Scenario Outline: RZY-1532、1533
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    When I set the parameter "LogSample" with value "<logSample>"
    And I choose the "KeyValue分解" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "<sourceField>" from the "SourceField"
    And I set the parameter "FieldSeparator" with value "&"
    And I set the parameter "KVSeparator" with value "="
    And I set the parameter "KeepKey" with value "<keepKey>"
    And I set the parameter "DumpKey" with value "<dumpKey>"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
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

  Scenario Outline: RZY-3396、3397
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    And I will see the spl search result data "<field>" doesn't exist
    Then I will see the spl search result "<result>"

    Examples:
      | tag                | field                                                                                                           | result                                                                                                                                                                                                                                              |
      | auto_test_dump_key | other.order                                                                                                     | {'appname':'auto_test_dump_key','other.field':'tag','other.page':'1','other.query':'*','other.size':'50','other.sourcegroup':'all','other.sourcegroupCn':'%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97','other.time_range':'-2d,now','other.type':'fields'} |
      | auto_test_keep_key | other.field,other.page,other.query,other.size,other.sourcegroup,other.sourcegroupCn,other.time_range,other.type | {'other.order':'desc'}                                                                                                                                                                                                                              |

  Scenario Outline: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "<name>" then i click the "详情" button
    And I wait for "SmallTr" will be visible
    Then I will see the element "SmallTr" value contains "<result>"

    Examples:
      | name         | result                                                        |
      | RZY1532丢弃key | 规则名称 总处理量 处理成功 处理失败 处理未命中 处理异常 平均耗时,KeyValue分解\n1\n1\n0\n0\n0 |
      | RZY1533保留key | 规则名称 总处理量 处理成功 处理失败 处理未命中 处理异常 平均耗时,KeyValue分解\n1\n1\n0\n0\n0 |