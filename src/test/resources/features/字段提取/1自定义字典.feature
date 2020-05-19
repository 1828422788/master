@configsSmoke
Feature: 字段提取自定义字典

  @second @configsSmoke
  Scenario Outline: RZY-2819：配置自定义字典解析规则
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When I click the "UploadButton" button
    Then I wait for "PopUpWindow" will be visible
    And I upload a file with name "/src/test/resources/testdata/dictionary/win_sys_sourcename.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "win_sys_sourcename"
    And I click the "EnsureUpload" button
    Then I wait for "Tip" will be visible
    Then I will see the success message "创建字典成功"
    Then I wait for "70000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "2000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "AddRule" button
    And I choose the "自定义字典" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "SourceName" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I choose the "win_sys_sourcename.csv" from the "Dictionary" in config
    Then I wait for "1000" millsecond
    And I choose the "sourcename" from the "BaseField" in config
    Then I wait for "1000" millsecond
    And I choose the "level,source" from the "ExtendField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2819配置自定义字典解析规则"
    And I set the parameter "Logtype" with value "json"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "40000" millsecond
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<appName>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | appName             | log            | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | searchResult                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | wym_test_dictionary | dictionary.log | Object\nCategory:""\nComputerName:"WIN-999OGBVAHMI"\nEventCode:7036\nEventIdentifier:1073748860\nEventType:3\nLogfile:"System"\nMessage:"Application Experience 服务处于 正在运行 状态。"\nRecordNumber:108343\nSourceName:"Service Control Manager"\nTimeGenerated:"2015-01-04T20:45:09+08:00"\nUser:""\nlevel:"2"\nsource:"sys"\nraw_message:"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}" | Object\nCategory:""\nComputerName:"WIN-999OGBVAHMI"\nEventCode:7036\nEventIdentifier:1073748860\nEventType:3\nLogfile:"System"\nMessage:"Application Experience 服务处于 正在运行 状态。"\nRecordNumber:108343\nSourceName:"Service Control Manager"\nTimeGenerated:"2015-01-04T20:45:09+08:00"\nUser:""\nraw_message:"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}" | {'json.Category':'json.Category： ','json.ComputerName':'json.ComputerName：WIN-999OGBVAHMI ','json.EventCode':'json.EventCode：7036 ','json.EventIdentifier':'json.EventIdentifier：1073748860 ','json.EventType':'json.EventType：3 ','json.Logfile':'json.Logfile：System ','json.Message':'json.Message：Application Experience 服务处于 正在运行 状态。 ','json.RecordNumber':'json.RecordNumber：108343 ','json.SourceName':'json.SourceName：Service Control Manager ','json.TimeGenerated':'json.TimeGenerated：2015-01-04T20:45:09+08:00 ','json.level':'json.level：2 ','json.source':'json.source：sys '} |


  @second @configsSmoke
  Scenario Outline: 自定义字典详情页验证
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    And I wait for loading invisible
    When I click the "UploadButton" button
    Then I wait for "PopUpWindow" will be visible
    And I upload a file with name "/src/test/resources/testdata/dictionary/win_sys_sourcename.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "win_sys_sourcename1"
    And I click the "EnsureUpload" button
    Then I wait for "Tip" will be visible
    Then I will see the success message "创建字典成功"
    Then I wait for "70000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}"
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I choose the "raw_message" from the "SourceField" in config
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "AddRule" button
    And I choose the "自定义字典" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "SourceName" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I choose the "win_sys_sourcename.csv" from the "Dictionary" in config
    Then I wait for "1000" millsecond
    And I choose the "sourcename" from the "BaseField" in config
    Then I wait for "1000" millsecond
    And I choose the "level,source" from the "ExtendField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "1000" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "json"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "90000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name      | rule1 | rule2  | appName           | log            | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | 自定义字典详情验证 | 自定义字典 | JSON解析 | dictionary_detail | dictionary.log | Object\nCategory:""\nComputerName:"WIN-999OGBVAHMI"\nEventCode:7036\nEventIdentifier:1073748860\nEventType:3\nLogfile:"System"\nMessage:"Application Experience 服务处于 正在运行 状态。"\nRecordNumber:108343\nSourceName:"Service Control Manager"\nTimeGenerated:"2015-01-04T20:45:09+08:00"\nUser:""\nlevel:"2"\nsource:"sys"\nraw_message:"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}" | Object\nCategory:""\nComputerName:"WIN-999OGBVAHMI"\nEventCode:7036\nEventIdentifier:1073748860\nEventType:3\nLogfile:"System"\nMessage:"Application Experience 服务处于 正在运行 状态。"\nRecordNumber:108343\nSourceName:"Service Control Manager"\nTimeGenerated:"2015-01-04T20:45:09+08:00"\nUser:""\nraw_message:"{"Category":"","ComputerName":"WIN-999OGBVAHMI","EventCode":7036,"EventIdentifier":1073748860,"EventType":3,"Logfile":"System","Message":"Application Experience 服务处于 正在运行 状态。","RecordNumber":108343,"SourceName":"Service Control Manager","User":"","TimeGenerated":"2015-01-04T20:45:09+08:00"}" |

