@configsSmoke
Feature: 字段提取自定义字典

  @second @configsSmoke
  Scenario: RZY-2818：新建字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    And I choose the "default_Dictionary" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/win_sys_sourcename.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadFile" button

  @second @configsSmoke
  Scenario Outline: RZY-2819：配置自定义字典解析规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2819配置自定义字典解析规则"
    And I set the parameter "Logtype" with value "json"
    When I set the parameter "LogSample" with value "{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "ContinueButton" button
    And I choose the "自定义字典" from the "ParseRule"
    And I choose the "SourceName" from the "SourceField"
    And I choose the "win_sys_sourcename.csv" from the "Dictionary"
    And I choose the "sourcename" from the "BaseField"
    And I choose the "level,source" from the "ExtendField"
    And I click the "ParseButton" button
    And I wait for "SuccessMessage" will be visible
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "auto_test_dictionary"
    And I set the parameter "Tag" with value "auto_test_dictionary"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | Object\nCategory:""\nComputerName:"WIN-999OGBVAHMI"\nEventCode:7036\nEventIdentifier:1073748860\nEventType:3\nLogfile:"System"\nMessage:"Application Experience 服务处于 正在运行 状态。"\nRecordNumber:108343\nSourceName:"Service Control Manager"\nTimeGenerated:"2015-01-04T20:45:09+08:00"\nUser:""\nlevel:"2"\nsource:"sys"\nraw_message:"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}" | Object\nCategory:""\nComputerName:"WIN-999OGBVAHMI"\nEventCode:7036\nEventIdentifier:1073748860\nEventType:3\nLogfile:"System"\nMessage:"Application Experience 服务处于 正在运行 状态。"\nRecordNumber:108343\nSourceName:"Service Control Manager"\nTimeGenerated:"2015-01-04T20:45:09+08:00"\nUser:""\nraw_message:"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName              | log            |
      | auto_test_dictionary | dictionary.log |

  Scenario Outline: RZY-2866:在搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | tag                  | result                                                                                                                                                                                                                                                                                                                                                                                   |
      | auto_test_dictionary | {'json.Category':'','json.ComputerName':'WIN-999OGBVAHMI','json.EventCode':'7036','json.EventIdentifier':'1073748860','json.EventType':'3','json.Logfile':'System','json.Message':'Application Experience 服务处于 正在运行 状态。','json.RecordNumber':'108343','json.SourceName':'Service Control Manager','json.TimeGenerated':'2015-01-04T20:45:09+08:00','json.level':'2','json.source':'sys'} |