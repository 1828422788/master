@configs @configsSensitiveInfo
Feature: 字段提取脱敏配置

  Scenario Outline: RZY-2827: 新建脱敏配置规则
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "qweqwe15998418361qwe 15998418361"
    And I click the "AddRule" button
    And I choose the "正则解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I set the value "(?<phone>.*)" to the textarea "Regex"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    And I will see the field extraction result "<regexResult>"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "脱敏配置" from the "ParseRule"
    And I choose the "phone" from the "SourceField"
    And I set the value "(\d{3})(\d{4})(\d{4})" to the textarea "Regex"
    And I set the value "$1****$3" to the textarea "ReplaceContent"
    And I set the parameter "Prefix" with value "\w+"
    And I set the parameter "Suffix" with value "\S+"
    And I click the "EnsureAddParseRule" button
    And I wait for loading invisible
    And I click the "ParseButton" button
    And I wait for "CheckSuccess2" will be visible
    And I will see the field extraction result "<result>"
    And I click the "Collapse" button
    And I click the "AddRule" button
    And I choose the "脱敏配置" from the "ParseRule"
    And I choose the "phone" from the "SourceField"
    And I set the value "(\d{3})(\d{4})(\d{4})" to the textarea "Regex"
    And I set the value "$1****$3" to the textarea "ReplaceContent"
    And I set the parameter "Prefix" with value "\s+"
    And I click the "EnsureAddParseRule" button
    And I click the "ParseButton" button
    And I wait for "CheckSuccess3" will be visible
    And I will see the field extraction result "<result1>"
    And I click the "Collapse" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "脱敏"
    And I set the parameter "Logtype" with value "replace"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    And I will see the element "ResultMessage" contains "新建成功"

    Examples:
      | appName  | regexResult                                                                                       | result                                                                                                                                                 | result1                                                                                                                                                |
      | replacer | {'phone':'qweqwe15998418361qwe 15998418361','raw_message':'qweqwe15998418361qwe 15998418361'} | {'phone':'qweqwe159****8361qwe 15998418361','raw_message':'qweqwe15998418361qwe 15998418361','raw_message_r':'qweqwe159****8361qwe 15998418361'} | {'phone':'qweqwe159****8361qwe 159****8361','raw_message':'qweqwe15998418361qwe 15998418361','raw_message_r':'qweqwe159****8361qwe 159****8361'} |

  Scenario Outline: RZY-2827: 新建脱敏配置规则,上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    Then I wait for loading invisible
    And I will see the element "VerifyText" contains "上传完成"

    Examples:
      | log          | appName  |
      | replacer.log | replacer |

  Scenario: 新建搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    Then I wait for loading invisible
    And I click the "Create" button
    And I set the parameter "Name" with value "wymAutoTest搜索权限"
    And I set the parameter "Tag" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "操作成功"
    Then I refresh the website
    Then I wait for loading invisible
    When the data name is "{'column':'0','name':'wymAutoTest搜索权限'}" then i click the "授权" button in more menu
    Then I wait for loading invisible
    And I "check" the checkbox which name is "wym" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And I wait for loading invisible
    And I set the parameter "TextFilter" with value "__user_wym__"
    And I wait for loading invisible
    When the data name is "__user_wym__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I wait for loading invisible
    Then I click the "{'TabButton':'功能'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "可查看敏感内容"
    Then I click the "SaveButton" button
    Then I click the "{'TabButton':'索引'}" button
    And I wait for loading invisible
    And I "checked" the checkbox which name is "yotta" in auth table
    Then I click the "SaveButton" button
    And I wait for "SuccessMessage" will be invisible

  Scenario Outline: 搜索页，验证结果
    Given I login user "wym" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    When I will see the "splSearch.SearchPage" page
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "starttime=\"now/d\" endtime=\"now/d+24h\" appname:<appName> AND tag:<appName>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I move the mouse pointer to the "Result"
    And I click the "RightIcon" button
    Then I will see the spl search result "<searchResult>"
    And I logout current user

    Examples:
      | appName  | searchResult|
      | replacer | {'replace.phone':'qweqwe159****8361qwe 159****8361','raw_message':'qweqwe159****8361qwe 159****8361'}|

  Scenario: 删除搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I wait for loading invisible
    When the data name is "{'column':'0','name':'wymAutoTest搜索权限'}" then i click the "删除" button in more menu
    And I wait for loading invisible
    And I click the "Ensure" button
    Then I will see the success message "删除成功"