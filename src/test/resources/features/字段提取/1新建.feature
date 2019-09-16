@configs
Feature: 字段提取新建

  Scenario Outline: 创建规则并关联日志（RZY-1880）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTest"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "{"Name": "John Smith ", "Age": 23, "Employed": true, "Address": {"Street": "324 Chrome St", "City": "Portland, New York,Los Angeles ", "Country": "United States"}}"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "AddField" button
    And I set the parameter "Key" with value "key"
    And I set the parameter "Value" with value "value"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I click the "NextButton" button

    Examples:
      | appName | tag |
      | 108     | 1   |

  Scenario: RZY-2861：新建字段提取
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY-2861新建字段提取"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "192.168.1.139 - - [24/Jan/2015:17:03:49 +0800] "GET /api/v0/search/fields/?field=tag&filters=&order=desc&page=1&query=*&size=50&sourcegroup=all&sourcegroupCn=%E6%89%80%E6%9C%89%E6%97%A5%E5%BF%97&time_range=-2d,now&type=fields HTTP/1.1" 200 363 "http://alltest.rizhiyi.com/search/?query=*&time_range=-2d%2Cnow&order=desc&size=20&page=1&sourcegroup=all&type=timeline&_t=1422088066859&title=%E9%BB%98%E8%AE%A4&index=0" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0""
    And I set the parameter "Source" with value "/var/log/20180821/website"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<clientip>\S+) - - \[\d+/\w+/\d+:(?<time>\S+) \+0800\](.*)"
    And I click the "ParseButton" button
    And I click the "ContinueButton" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "@source" from the "SourceField"
    And I set the parameter "Regex2" with value "/var/log/(?<date>\d{8})/website"
    And I click the "ParseButton" button
    And I click the "ContinueButton" button
    And I choose the "格式化处理" from the "ParseRule"
    And I choose the "date,time" from the "SourceField"
    And I set the parameter "FormatRule" with value "$1$2"
    And I set the parameter "TargetField" with value "timestamp"
    And I click the "ParseButton" button
    And I click the "ContinueButton" button
    And I choose the "时间戳识别" from the "ParseRule"
    And I choose the "timestamp" from the "SourceField"
    And I set the parameter "TimeFormat" with value "yyyyMMddHH:mm:ss"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "date"
    And I set the parameter "Tag" with value "date"
    And I click the "NextButton" button

  Scenario: RZY-2864：在搜索页验证严格解析
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2864在搜索页验证严格解析"
    And I set the parameter "Logtype" with value "test"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "aaa 111"
    And I choose the "结构体解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Struct" with value "name:3,val:4:i"
    And I "checked" the checkbox which name is "是否严格解析"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "codec"
    And I set the parameter "Tag" with value "codec"
    And I click the "NextButton" button


  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button

  @first
    Examples:
      | appName | tag | log              |
      | 108     | 1   | json_sdyd_41.log |

    Examples:
      | appName | tag    | log           |
      | date    | date   | timestamp.log |
      | rename  | rename | rename.log    |

  @second
    Examples:
      | appName      | tag          | log              |
      | codec        | codec        | 结构体解析.log        |
      | redirect_zhu | redirect_zhu | json_sdyd_41.log |
      | dissect      | dissect      | dissect.log      |
      | regex        | 1            | regex1.log       |
      | regex        | 2            | regex2.log       |
      | script       | script       | script.log       |
      | base64       | base64       | base64.log       |
      | unicode      | unicode      | unicode.log      |
      | replacer     | replacer     | replacer.log     |

  Scenario Outline: RZY-2871:搜索页验证
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

  @first
    Examples:
      | spl               | result               |
      | appname:108 tag:1 | {"test.key":"value"} |

    Examples:
      | spl            | result                              |
      | appname:rename | {"test.a.b.h":"d","test.a.e.h":"g"} |

  @second
    Examples:
      | spl                                       | result                                                                 |
      | appname:codec                             | {"test.name":"aaa","test.val":"111"}                                   |
      | appname:redirect_zhu AND tag:redirect_zhu | {"other.key":"value"}                                                  |
      | appname:dissect                           | {"other.id":"123","other.domain":"rizhiyi.com","other.url":"index.do"} |
      | appname:regex AND tag:1                   | {"other.user":"enable_15"}                                             |
      | appname:regex AND tag:2                   | {"other.user":"enable_15"}                                             |
      | appname:script                            | {"other.result.count":"5664","other.result.time":"1516189"}            |
      | appname:base64                            | {"other.code":"hello base64"}                                          |
      | appname:unicode                           | {"other.rr":"PartyBasicInfoService_客户基本信息服务"}                          |

#  @second @configsSmoke
#  Scenario Outline: 上传日志给其他用户
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
#    Given I logout current user
#    And I wait for title change text to "登录"
#    And open the "LoginPage" page for uri "/auth/login/"
#    When I set the parameter "Username" with properties "userWithResources"
#    And I set the parameter "Password" with properties "userWithResourcesPwd"
#    And I click the "LoginButton" button
#    And I wait for "2000" millsecond
#    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
#    And I set the parameter "AppName" with value "<appName>"
#    And I set the parameter "Tag" with value "<tag>"
#    And I upload a file with name "/src/test/resources/testdata/log/<log>"
#    And I click the "UploadButton" button
#
#    Examples:
#      | appName  | tag      | log          |
#      | replacer | replacer | replacer.log |
  Scenario: 删除脱敏规则
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "userWithResources"
    And I set the parameter "Password" with properties "userWithResourcesPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "脱敏" then i click the "删除" button
    And I click the "EnsureButton" button
