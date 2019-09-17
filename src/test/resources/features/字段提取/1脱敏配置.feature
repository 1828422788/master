@configsSmoke
Feature: 字段提取脱敏配置

  Scenario Outline: RZY-2827：新建脱敏配置规则
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
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "脱敏"
    And I set the parameter "Logtype" with value "replace"
    When I set the parameter "LogSample" with value "qweqwe15998418361qwe 15998418361"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<phone>.*)"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<regexResult>'}"
    And I click the "ContinueButton" button
    And I choose the "脱敏配置" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "phone" from the "SourceField"
    And I set the parameter "Regex" with value "(\d{3})(\d{4})(\d{4})"
    And I set the parameter "ReplaceContent" with value "$1****$3"
    And I set the parameter "Prefix" with value "\w+"
    And I set the parameter "Postfix" with value "\S+"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "ContinueButton" button
    And I choose the "脱敏配置" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "phone" from the "SourceField"
    And I set the parameter "Regex" with value "(\d{3})(\d{4})(\d{4})"
    And I set the parameter "ReplaceContent" with value "$1****$3"
    And I set the parameter "Prefix" with value "\s+"
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "replacer"
    And I set the parameter "Tag" with value "replacer"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | regexResult                                                                                      | result                                                                                                                                             | result1                                                                                                                                            |
      | Object\nphone:"qweqwe15998418361qwe 15998418361"\nraw_message:"qweqwe15998418361qwe 15998418361" | Object\nphone:"qweqwe159****8361qwe 15998418361"\nraw_message:"qweqwe15998418361qwe 15998418361"\nraw_message_r:"qweqwe159****8361qwe 15998418361" | Object\nphone:"qweqwe159****8361qwe 159****8361"\nraw_message:"qweqwe15998418361qwe 15998418361"\nraw_message_r:"qweqwe159****8361qwe 159****8361" |

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName  | log          |
      | replacer | replacer.log |

  @second @configsSmoke
  Scenario: RZY-2830:在搜索页验证是否脱敏
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with properties "userWithResources"
    And I set the parameter "Password" with properties "userWithResourcesPwd"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:replacer"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "{"raw_message":"qweqwe159****8361qwe 159****8361"}"


