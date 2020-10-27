@configsSmoke
Feature: 字段提取脱敏配置

  @logout
  Scenario Outline: RZY-2827: 新建脱敏配置规则

    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    Then I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "Name" with value "wymAutoTest搜索权限"
    And I set the parameter "Tag" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "操作成功"
    Then I refresh the website
    Then I wait for loading invisible
    When the data name is "{'column':'0','name':'wymAutoTest搜索权限'}" then i click the "授权" button
    And I wait for "ModalContent" will be visible
    Then I wait for loading invisible
    And I "check" the checkbox which name is "wym" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And the data name is "__user_wym__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I wait for loading invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "可查看敏感内容"
    Then I click the "SaveButton" button
    Then I click the "{'TabButton':'索引'}" button
    And I wait for "Loading" will be invisible
    And I "checked" the checkbox which name is "yotta" in auth table
    Then I click the "SaveButton" button
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "qweqwe15998418361qwe 15998418361"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "(?<phone>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<regexResult>'}"
    And I click the "AddRule" button
    And I choose the "脱敏配置" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "phone" from the "SourceField" in config
    And I set the parameter "Regex" with value "(\d{3})(\d{4})(\d{4})"
    And I set the parameter "ReplaceContent" with value "$1****$3"
    And I set the parameter "Prefix" with value "\w+"
    And I set the parameter "Postfix" with value "\S+"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "脱敏配置" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "phone" from the "SourceField" in config
    And I set the parameter "Regex" with value "(\d{3})(\d{4})(\d{4})"
    And I set the parameter "ReplaceContent" with value "$1****$3"
    And I set the parameter "Prefix" with value "\s+"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "脱敏"
    And I set the parameter "Logtype" with value "replace"
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
    And I logout current user
    And I will see the "LoginPage" page
    When I set the parameter "Username" with value "wym"
    And I set the parameter "Password" with value "All#123456"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "60000" millsecond
    And I refresh the website
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:replacer"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "{"raw_message":"raw_message: qweqwe159****8361qwe 159****8361 ","replace.phone":"replace.phone: qweqwe159****8361qwe 159****8361  "}"


    Examples:
      | log          | appName  | regexResult                                                                                      | result                                                                                                                                             | result1                                                                                                                                            |
      | replacer.log | replacer | Object\nphone:"qweqwe15998418361qwe 15998418361"\nraw_message:"qweqwe15998418361qwe 15998418361" | Object\nphone:"qweqwe159****8361qwe 15998418361"\nraw_message:"qweqwe15998418361qwe 15998418361"\nraw_message_r:"qweqwe159****8361qwe 15998418361" | Object\nphone:"qweqwe159****8361qwe 159****8361"\nraw_message:"qweqwe15998418361qwe 15998418361"\nraw_message_r:"qweqwe159****8361qwe 159****8361" |


  Scenario Outline: 脱敏详情页验证

    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "qweqwe15998418361qwe 15998418361"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    And I set the parameter "Regex" with value "(?<phone>.*)"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<regexResult>'}"
    And I click the "AddRule" button
    And I choose the "脱敏配置" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "phone" from the "SourceField" in config
    And I set the parameter "Regex" with value "(\d{3})(\d{4})(\d{4})"
    And I set the parameter "ReplaceContent" with value "$1****$3"
    And I set the parameter "Prefix" with value "\w+"
    And I set the parameter "Postfix" with value "\S+"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "AddRule" button
    And I choose the "脱敏配置" from the "ParseRule" in config
    Then I wait for "1000" millsecond
    And I choose the "phone" from the "SourceField" in config
    And I set the parameter "Regex" with value "(\d{3})(\d{4})(\d{4})"
    And I set the parameter "ReplaceContent" with value "$1****$3"
    And I set the parameter "Prefix" with value "\s+"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    Then I will see the element value in json "{'Result':'<result1>'}"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "脱敏详情"
    And I set the parameter "Logtype" with value "replace"
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
    Then I wait for "60000" millsecond
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
    And I wait for loading invisible
    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"

    Examples:
      | name | rule1 | rule2 | log          | appName       | regexResult                                                                                      | result                                                                                                                                             | result1                                                                                                                                            |
      | 脱敏详情 | 脱敏配置  | 正则解析  | replacer.log | replacedetail | Object\nphone:"qweqwe15998418361qwe 15998418361"\nraw_message:"qweqwe15998418361qwe 15998418361" | Object\nphone:"qweqwe159****8361qwe 15998418361"\nraw_message:"qweqwe15998418361qwe 15998418361"\nraw_message_r:"qweqwe159****8361qwe 15998418361" | Object\nphone:"qweqwe159****8361qwe 159****8361"\nraw_message:"qweqwe15998418361qwe 15998418361"\nraw_message_r:"qweqwe159****8361qwe 159****8361" |



