@configsSmoke
Feature: 字段提取IP格式转换

  @second
  Scenario Outline: RZY-1555:IP格式转换
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "3651919938"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<ip>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "ip格式转换" from the "ParseRule"
    And I choose the "ip" from the "SourceField"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY1555IP格式转换"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_ip"
    And I set the parameter "Tag" with value "auto_test_ip"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                            | result1                                               |
      | Object\nip:"3651919938"\nraw_message:"3651919938" | Object\nip:"217.171.224.66"\nraw_message:"3651919938" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName      | log    |
      | auto_test_ip | ip.log |

  Scenario Outline: RZY-3422:在搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | tag          | result                                 |
      | auto_test_ip | {'other.ip':'other.ip：217.171.224.66'} |

  Scenario Outline: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading complete
    When the data name is "{'column':'1','name':'RZY1555IP格式转换'}" then i click the "详 情" button
    And I wait for "SmallTr" will be visible
    Then I will see the config element "ip格式转换" value is "ip格式转换 <result>"
    Then I will see the config element "正则解析" value is "正则解析 <result>"

    Examples:
      | result    |
      | 1 1 0 0 0 |