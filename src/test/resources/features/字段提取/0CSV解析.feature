@configsSmoke
Feature: 字段提取CSV解析

  @first
  Scenario Outline: RZY-1544:CSV解析(填写字段列表)
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "192.168.1.200,xmxm,rzy,13800000000"
    And I click the "AddRule" button
    And I choose the "CSV解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Separate" with value "<separate>"
    And I set the parameter "FieldList" with value "<fieldList>"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | separate | fieldList | result                                                                                                          |
      | ,        | 1,2,3,4,5 | Object\n1:"192.168.1.200"\n2:"xmxm"\n3:"rzy"\n4:"13800000000"\nraw_message:"192.168.1.200,xmxm,rzy,13800000000" |

  @second
  Scenario Outline: RZY-3417:多值字段
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "<134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0 | T1/2 down 0 0 0 0 | F2/1 up 0 0 0 0 | F2/2 up 0 0 0 0 | F2/3 down 0 0 0 0 | F2/4 down 0 0 0 0 | F2/5 down 0 0 0 0 | F2/6 down 0 0 0 0 | F2/7 down 0 0 0 0 | F2/8 down 0 0 0 0 |"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "<regex>"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "<parseRule>" from the "ParseRule"
    And I choose the "<sourceField>" from the "SourceField"
    And I set the parameter "<inputElement>" with value "<timeFormat>"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "AddRule" button
    And I choose the "CSV解析" from the "ParseRule"
    And I click the "ChangeToJson" button under some element
    And I set the parameter "{"source": "portinfo[]","split_string": "\\s","add_fields": [],"names": ["1","2","3","4","5","6"],"split_option":null}" to json editor in field parsing
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    Then I will see the element value in json "{'Result':'<result2>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY3417多值字段"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "auto_test_csv"
    And I set the parameter "Tag" with value "auto_test_csv"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | regex                  | parseRule | sourceField | inputElement | timeFormat | result                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | result1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | result2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | .*?:\s+(?<portinfo>.*) | CSV解析     | portinfo    | Separate     | \s*\\\|\s* | Object\nportinfo:"T1/1 down 0 0 0 0 \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \|"\nraw_message:"<134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0 \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \|" | Object\nportinfo:Array[10]\n0:"T1/1 down 0 0 0 0"\n1:"T1/2 down 0 0 0 0"\n2:"F2/1 up 0 0 0 0"\n3:"F2/2 up 0 0 0 0"\n4:"F2/3 down 0 0 0 0"\n5:"F2/4 down 0 0 0 0"\n6:"F2/5 down 0 0 0 0"\n7:"F2/6 down 0 0 0 0"\n8:"F2/7 down 0 0 0 0"\n9:"F2/8 down 0 0 0 0"\nraw_message:"<134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0 \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \|" | Object\nportinfo[]:Object\n1:Array[10]\n0:"T1/1"\n1:"T1/2"\n2:"F2/1"\n3:"F2/2"\n4:"F2/3"\n5:"F2/4"\n6:"F2/5"\n7:"F2/6"\n8:"F2/7"\n9:"F2/8"\n2:Array[10]\n0:"down"\n1:"down"\n2:"up"\n3:"up"\n4:"down"\n5:"down"\n6:"down"\n7:"down"\n8:"down"\n9:"down"\n3:Array[10]\n0:"0"\n1:"0"\n2:"0"\n3:"0"\n4:"0"\n5:"0"\n6:"0"\n7:"0"\n8:"0"\n9:"0"\n4:Array[10]\n0:"0"\n1:"0"\n2:"0"\n3:"0"\n4:"0"\n5:"0"\n6:"0"\n7:"0"\n8:"0"\n9:"0"\n5:Array[10]\n0:"0"\n1:"0"\n2:"0"\n3:"0"\n4:"0"\n5:"0"\n6:"0"\n7:"0"\n8:"0"\n9:"0"\n6:Array[10]\n0:"0"\n1:"0"\n2:"0"\n3:"0"\n4:"0"\n5:"0"\n6:"0"\n7:"0"\n8:"0"\n9:"0"\nraw_message:"<134> Portinfo(Port,State,rx Kpps,tx Kpps,rx Mbps,tx Mbps): T1/1 down 0 0 0 0 \| T1/2 down 0 0 0 0 \| F2/1 up 0 0 0 0 \| F2/2 up 0 0 0 0 \| F2/3 down 0 0 0 0 \| F2/4 down 0 0 0 0 \| F2/5 down 0 0 0 0 \| F2/6 down 0 0 0 0 \| F2/7 down 0 0 0 0 \| F2/8 down 0 0 0 0 \|" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    Then I wait for "2000" millsecond

    Examples:
      | appName       | log     |
      | auto_test_csv | csv.log |

  Scenario Outline: 在搜索页验证CSV

    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | tag           | result                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | auto_test_csv | {'other.portinfo[].1':'other.portinfo[].1：T1/1 T1/2 F2/1 F2/2 F2/3 F2/4 F2/5 F2/6 F2/7 F2/8 ','other.portinfo[].2':'other.portinfo[].2：down down up up down down down down down down ','other.portinfo[].3':'other.portinfo[].3：0 0 0 0 0 0 0 0 0 0 ','other.portinfo[].4':'other.portinfo[].4：0 0 0 0 0 0 0 0 0 0 ','other.portinfo[].5':'other.portinfo[].5：0 0 0 0 0 0 0 0 0 0 ','other.portinfo[].6':'other.portinfo[].6：0 0 0 0 0 0 0 0 0 0 '} |
