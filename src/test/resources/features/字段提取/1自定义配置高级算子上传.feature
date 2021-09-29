@configsSmoke1 @configs24
Feature: 字段提取自定义配置高级算子

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

  @configs24a1
  Scenario Outline: RZY-2870:创建dissect解析+搜索页验证
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    When I click the "Cancelbutton" button
#    Then I wait for "40000" millsecond

    Examples:
      | tag              | log         | result                                                                                                 | searchResult                                                                                                 |
      | wym_test_dissect | dissect.log | Object\ndomain:"rizhiyi.com"\nid:123\nurl:"index.do"\nraw_message:"http://rizhiyi.com/index.do?id=123" | {"other.id":"other.id: 123 ","other.domain":"other.domain: rizhiyi.com ","other.url":"other.url: index.do "} |

  @configs24b1
  Scenario Outline: RZY-2870:创建dissect解析详情验证
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    When I click the "Cancelbutton" button
#    Then I wait for "90000" millsecond

    Examples:
      | name        | rule1 | tag            | log         | result                                                                                                 |
      | dissect解析详情 | 自定义解析 | dissect_detail | dissect.log | Object\ndomain:"rizhiyi.com"\nid:123\nurl:"index.do"\nraw_message:"http://rizhiyi.com/index.do?id=123" |


  @configs24c1
  Scenario Outline: RZY-2875:创建script解析规则+搜索验证
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    When I click the "Cancelbutton" button
#    Then I wait for "40000" millsecond
#    When I click the "Confirmbutton" button

    Examples:
      | log        | tag             | result                                                                                                                                              | result1                                                                                                                                                                                      | searchResult                                                                                         |
      | script.log | wym_test_script | Object\nfields:Array[2]\n0:"time"\n1:"count"\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | Object\nfields:Array[2]\n0:"time"\n1:"count"\nresult:Object\ncount:5664\ntime:1516189\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | {"other.result.count":"other.result.count: 5664 ","other.result.time":"other.result.time: 1516189 "} |


  @configs24d1
  Scenario Outline: RZY-2875:创建script解析详情验证
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    When I click the "Cancelbutton" button
#    Then I wait for "90000" millsecond

    Examples:
      | name       | rule1 | rule2  | log        | tag           | result                                                                                                                                              | result1                                                                                                                                                                                      |
      | script解析详情 | 自定义解析 | JSON解析 | script.log | script_detail | Object\nfields:Array[2]\n0:"time"\n1:"count"\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | Object\nfields:Array[2]\n0:"time"\n1:"count"\nresult:Object\ncount:5664\ntime:1516189\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" |


  @configs24e1
  Scenario Outline: RZY-2877:建立base64解析规则+搜索验证
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    When I click the "Cancelbutton" button
#    Then I wait for "40000" millsecond

    Examples:
      | tag             | log        | result                                                          | result1                                                     | searchResult                               |
      | wym_test_base64 | base64.log | Object\ncode:"aGVsbG8gYmFzZTY0"\nraw_message:"aGVsbG8gYmFzZTY0" | Object\ncode:"hello base64"\nraw_message:"aGVsbG8gYmFzZTY0" | {"other.code":"other.code: hello base64 "} |

  @configs24f1
  Scenario Outline: RZY-2877:建立base64解析规则详情验证
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    When I click the "Cancelbutton" button
#    Then I wait for "90000" millsecond

    Examples:
      | name       | rule1    | rule2 | tag           | log        | result                                                          | result1                                                     |
      | base64解析详情 | base64解析 | 正则解析  | base64_detail | base64.log | Object\ncode:"aGVsbG8gYmFzZTY0"\nraw_message:"aGVsbG8gYmFzZTY0" | Object\ncode:"hello base64"\nraw_message:"aGVsbG8gYmFzZTY0" |


  @configs24g1
  Scenario Outline: RZY-2883:创建unicode解析规则+搜索验证
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"
    When I click the "Cancelbutton" button
    Then I wait for "50000" millsecond

    Examples:
      | tag              | log         | result                                                                                                                                                                                                    | result1                                                                                                                                           | searchResult                                             |
      | wym_test_unicode | unicode.log | Object\nrr:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1"\nraw_message:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1" | Object\nrr:"PartyBasicInfoService_客户基本信息服务"\nraw_message:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1" | {"other.rr":"other.rr: PartyBasicInfoService_客户基本信息服务 "} |


  @configs24a2
  Scenario Outline: RZY-2870:创建dissect解析+搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | tag              | log         | result                                                                                                 | searchResult                                                                                                 |
      | wym_test_dissect | dissect.log | Object\ndomain:"rizhiyi.com"\nid:123\nurl:"index.do"\nraw_message:"http://rizhiyi.com/index.do?id=123" | {"other.id":"other.id: 123 ","other.domain":"other.domain: rizhiyi.com ","other.url":"other.url: index.do "} |

  @configs24b2
  Scenario Outline: RZY-2870:创建dissect解析详情验证
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"

    Examples:
      | name        | rule1 | tag            | log         | result                                                                                                 |
      | dissect解析详情 | 自定义解析 | dissect_detail | dissect.log | Object\ndomain:"rizhiyi.com"\nid:123\nurl:"index.do"\nraw_message:"http://rizhiyi.com/index.do?id=123" |

  @configs24c2
  Scenario Outline: RZY-2875:创建script解析规则+搜索验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | log        | tag             | result                                                                                                                                              | result1                                                                                                                                                                                      | searchResult                                                                                         |
      | script.log | wym_test_script | Object\nfields:Array[2]\n0:"time"\n1:"count"\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | Object\nfields:Array[2]\n0:"time"\n1:"count"\nresult:Object\ncount:5664\ntime:1516189\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | {"other.result.count":"other.result.count: 5664 ","other.result.time":"other.result.time: 1516189 "} |


  @configs24d2
  Scenario Outline: RZY-2875:创建script解析详情验证
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name       | rule1 | rule2  | log        | tag           | result                                                                                                                                              | result1                                                                                                                                                                                      |
      | script解析详情 | 自定义解析 | JSON解析 | script.log | script_detail | Object\nfields:Array[2]\n0:"time"\n1:"count"\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" | Object\nfields:Array[2]\n0:"time"\n1:"count"\nresult:Object\ncount:5664\ntime:1516189\nvalues:Array[2]\n0:1516189\n1:5664\nraw_message:"{"fields":["time","count"],"values":[1516189,5664]}" |


  @configs24e2
  Scenario Outline: RZY-2877:建立base64解析规则+搜索验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | tag             | log        | result                                                          | result1                                                     | searchResult                               |
      | wym_test_base64 | base64.log | Object\ncode:"aGVsbG8gYmFzZTY0"\nraw_message:"aGVsbG8gYmFzZTY0" | Object\ncode:"hello base64"\nraw_message:"aGVsbG8gYmFzZTY0" | {"other.code":"other.code: hello base64 "} |

  @configs24f2
  Scenario Outline: RZY-2877:建立base64解析规则详情验证
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name       | rule1    | rule2 | tag           | log        | result                                                          | result1                                                     |
      | base64解析详情 | base64解析 | 正则解析  | base64_detail | base64.log | Object\ncode:"aGVsbG8gYmFzZTY0"\nraw_message:"aGVsbG8gYmFzZTY0" | Object\ncode:"hello base64"\nraw_message:"aGVsbG8gYmFzZTY0" |

  @configs24g2
  Scenario Outline: RZY-2883:创建unicode解析规则+搜索验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"

    Examples:
      | tag              | log         | result                                                                                                                                                                                                    | result1                                                                                                                                           | searchResult                                             |
      | wym_test_unicode | unicode.log | Object\nrr:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1"\nraw_message:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1" | Object\nrr:"PartyBasicInfoService_客户基本信息服务"\nraw_message:"PartyBasicInfoService_\\\u5ba2\\\u6237\\\u57fa\\\u672c\\\u4fe1\\\u606f\\\u670d\\\u52a1" | {"other.rr":"other.rr: PartyBasicInfoService_客户基本信息服务 "} |
