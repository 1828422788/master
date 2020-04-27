@configsSmoke
Feature: 字段提取脱敏配置

  Scenario Outline: RZY-2827：新建脱敏配置规则

    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "qweqwe15998418361qwe 15998418361"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "(?<phone>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<regexResult>'}"
    And I click the "AddRule" button
    And I choose the "脱敏配置" from the "ParseRule"
    And I choose the "phone" from the "SourceField"
    And I set the parameter "Regex" with value "(\d{3})(\d{4})(\d{4})"
    And I set the parameter "ReplaceContent" with value "$1****$3"
    And I set the parameter "Prefix" with value "\w+"
    And I set the parameter "Postfix" with value "\S+"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "脱敏配置" from the "ParseRule"
    And I choose the "phone" from the "SourceField"
    And I set the parameter "Regex" with value "(\d{3})(\d{4})(\d{4})"
    And I set the parameter "ReplaceContent" with value "$1****$3"
    And I set the parameter "Prefix" with value "\s+"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "脱敏"
    And I set the parameter "Logtype" with value "replace"
    And I set the parameter "AppName" with value "replacer"
    And I set the parameter "Tag" with value "replacer"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
    

    Examples:
      | regexResult                                                                                      | result                                                                                                                                             | result1                                                                                                                                            |
      | Object\nphone:"qweqwe15998418361qwe 15998418361"\nraw_message:"qweqwe15998418361qwe 15998418361" | Object\nphone:"qweqwe159****8361qwe 15998418361"\nraw_message:"qweqwe15998418361qwe 15998418361"\nraw_message_r:"qweqwe159****8361qwe 15998418361" | Object\nphone:"qweqwe159****8361qwe 159****8361"\nraw_message:"qweqwe15998418361qwe 15998418361"\nraw_message_r:"qweqwe159****8361qwe 159****8361" |

  Scenario Outline: 上传日志
    Given I wait for loading complete
    Given I will see the "PublicNavBarPage" page
    And I wait for "Dashboard" will be visible
    Given I logout current user
    And I wait for title change text to "登录"
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "admin"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName  | log          |
      | replacer | replacer.log |


