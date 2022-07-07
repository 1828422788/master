@configs @configsCSV
Feature: 字段提取CSV解析

  @configsSmoke
  Scenario Outline: RZY-1544:CSV解析(填写字段列表)
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "AddRule" button
    And I choose the "CSV解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Separate" with value "<separate>"
    And I set the parameter "FieldList" with value "<fieldList>"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<result>"

    Examples:
      | separate | fieldList | result                                                                                                |
      | ,        | 1,2,3,4,5 | {'1':'192.168.1.200','2':'xmxm','3':'rzy','4':'13800000000','raw_message':'192.168.1.200,xmxm,rzy,13800000000'} |


  Scenario: RZY-3417:多值字段
    Given open the "configs.ListPage" page for uri "/configs/"
    And I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0 | T1/2 down 0 0 0 0 | F2/1 up 0 0 0 0 | F2/2 up 0 0 0 0 | F2/3 down 0 0 0 0 | F2/4 down 0 0 0 0 | F2/5 down 0 0 0 0 | F2/6 down 0 0 0 0 | F2/7 down 0 0 0 0 | F2/8 down 0 0 0 0 |"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the value ".*?:\s+(?<portinfo>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the field extraction result "{'portinfo':'T1/1 down 0 0 0 0 | T1/2 down 0 0 0 0 | F2/1 up 0 0 0 0 | F2/2 up 0 0 0 0 | F2/3 down 0 0 0 0 | F2/4 down 0 0 0 0 | F2/5 down 0 0 0 0 | F2/6 down 0 0 0 0 | F2/7 down 0 0 0 0 | F2/8 down 0 0 0 0 |'}"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "CSV解析" from the "ParseRule"
    And I choose the "portinfo" from the "SourceField"
    And I set the parameter "Separate" with value "\s*\|\s*"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the field extraction result "{'portinfo':'T1/1 down 0 0 0 0,T1/2 down 0 0 0 0,F2/1 up 0 0 0 0,F2/2 up 0 0 0 0,F2/3 down 0 0 0 0,F2/4 down 0 0 0 0,F2/5 down 0 0 0 0,F2/6 down 0 0 0 0,F2/7 down 0 0 0 0,F2/8 down 0 0 0 0','raw_message':'<134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0 | T1/2 down 0 0 0 0 | F2/1 up 0 0 0 0 | F2/2 up 0 0 0 0 | F2/3 down 0 0 0 0 | F2/4 down 0 0 0 0 | F2/5 down 0 0 0 0 | F2/6 down 0 0 0 0 | F2/7 down 0 0 0 0 | F2/8 down 0 0 0 0 |'}"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "CSV解析" from the "ParseRule"
    And I click the "ChangeToJson" button
    And I set the parameter "{"source": "portinfo[]","split_string": "\\s","add_fields": [],"names": ["1","2","3","4","5","6"],"split_option":null}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    Then I will see the field extraction result "{'portinfo[].1':'T1/1,T1/2,F2/1,F2/2,F2/3,F2/4,F2/5,F2/6,F2/7,F2/8','portinfo[].2':'down,down,up,up,down,down,down,down,down,down','portinfo[].3':'0,0,0,0,0,0,0,0,0,0','portinfo[].4':'0,0,0,0,0,0,0,0,0,0','portinfo[].5':'0,0,0,0,0,0,0,0,0,0','portinfo[].6':'0,0,0,0,0,0,0,0,0,0','raw_message':'<134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0 | T1/2 down 0 0 0 0 | F2/1 up 0 0 0 0 | F2/2 up 0 0 0 0 | F2/3 down 0 0 0 0 | F2/4 down 0 0 0 0 | F2/5 down 0 0 0 0 | F2/6 down 0 0 0 0 | F2/7 down 0 0 0 0 | F2/8 down 0 0 0 0 |'}"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY3417多值字段"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "wym_test_csv"
    And I set the parameter "Tag" with value "wym_test_csv"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"


  Scenario Outline: RZY-3417:上传日志，验证结果
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
      | appName      | log     | searchResult     |
      | wym_test_csv | csv.log | {'other.portinfo[].1':'T1/1T1/2F2/1F2/2F2/3F2/4F2/5F2/6F2/7F2/8','other.portinfo[].2':'downdownupupdowndowndowndowndowndown','other.portinfo[].3':'0000000000','other.portinfo[].4':'0000000000','other.portinfo[].5':'0000000000','other.portinfo[].6':'0000000000'} |

