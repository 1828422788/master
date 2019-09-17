@configsSmoke
Feature: 字段提取重命名字段

  @second
  Scenario Outline: 字段重命名（RZY-1590）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I set the parameter "Logtype" with value "test"
    When I set the parameter "LogSample" with value "<log>"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "字段重命名" from the "ParseRule"
    And I set the parameter "SourceFieldInput" with value "a.b.c"
    And I set the parameter "TargetField" with value "c"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"

    Examples:
      | log                   | result                                                                 | result1                                            |
      | {"a":{"b":{"c":"d"}}} | Object\na:Object\nb:Object\nc:"d"\nraw_message:"{"a":{"b":{"c":"d"}}}" | Object\nc:"d"\nraw_message:"{"a":{"b":{"c":"d"}}}" |

  @second @configsSmoke
  Scenario Outline: RZY-2865、2866
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2865支持通配符"
    And I set the parameter "Logtype" with value "other"
    When I set the parameter "LogSample" with value "<log>"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "字段重命名" from the "ParseRule"
    And I set the parameter "SourceFieldInput" with value "a.*.c"
    And I set the parameter "TargetField" with value "a.*.h"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "auto_test_rename"
    And I set the parameter "Tag" with value "auto_test_rename"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | log                                       | result                                                                                                   | result1                                                                                                  |
      | {"a":{"b":\n{"c":"d"}\n,"e":{"c":"g"}}\n} | Object\na:Object\nb:Object\nc:"d"\ne:Object\nc:"g"\nraw_message:"{"a":{"b": {"c":"d"} ,"e":{"c":"g"}} }" | Object\na:Object\nb:Object\nh:"d"\ne:Object\nh:"g"\nraw_message:"{"a":{"b": {"c":"d"} ,"e":{"c":"g"}} }" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName          | log        |
      | auto_test_rename | rename.log |

  Scenario Outline: RZY-2866:在搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | tag              | result                                |
      | auto_test_rename | {'other.a.b.h':'d','other.a.e.h':'g'} |

  Scenario Outline: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "RZY2865支持通配符" then i click the "详情" button
    And I wait for "SmallTr" will be visible
    Then I will see the element "SmallTr" value contains "<result>"

    Examples:
      | result                                                                         |
      | 规则名称 总处理量 处理成功 处理失败 处理未命中 处理异常 平均耗时,Json解析\n1\n1\n0\n0\n0,字段重命名\n1\n1\n0\n0\n0 |
