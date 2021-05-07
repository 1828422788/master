@configsSmoke @configs14
Feature: 字段提取内容替换

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible

  Scenario Outline: RZY-1557:不勾选 只替换第一个
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "(\d+)[a-z]+" to the textarea "Regex"
    And I set the value "$1" to the textarea "ReplaceContent"
    And I click the "ReplaceFirst" button
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"

    Examples:
      | result                       |
      | Object\nraw_message:"123456" |


  Scenario Outline: RZY-1556:内容替换搜索页验证

    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "(\d+)[a-z]+" to the textarea "Regex"
    And I set the value "<replaceContent>" to the textarea "ReplaceContent"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY1556内容替换"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
#    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
#    And I set the parameter "AppName" with value "<appName>"
#    And I set the parameter "Tag" with value "<appName>"
#    And I upload a file with name "/src/test/resources/testdata/log/<log>"
#    And I click the "UploadButton" button
#    And I wait for element "VerifyText" change text to "上传完成"
#    Then I wait for "40000" millsecond
#    When open the "splSearch.SearchPage" page for uri "/search/"
#    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I set the parameter "SearchInput" with value "tag:<appName>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I move the mouse pointer to the "Result"
#    And I click the "RightIcon" button
#    Then I will see the spl search result "<searchResult>"


    Examples:
      | appName                 | log                | replaceContent | result                          | searchResult                            |
      | wym_test_replaceContent | replaceContent.log | $1             | Object\nraw_message:"123456qwe" | {'raw_message':'raw_message: 123456qwe'} |


  Scenario Outline: RZY-1556:内容替换详情验证

    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "LogSample" with value "123abc456qwe"
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I set the value "(\d+)[a-z]+" to the textarea "Regex"
    And I set the value "<replaceContent>" to the textarea "ReplaceContent"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    Then I wait for "100" millsecond
    And I click the "ParseButton" button
    And I wait for "CheckSuccess" will be visible
    Then I will see the element value in json "{'Result':'<result>'}"
    And I click the "Collapse" button
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
#    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
#    And I set the parameter "AppName" with value "<appName>"
#    And I set the parameter "Tag" with value "<appName>"
#    And I upload a file with name "/src/test/resources/testdata/log/<log>"
#    And I click the "UploadButton" button
#    And I wait for element "VerifyText" change text to "上传完成"
#    Then I wait for "90000" millsecond
#    Given open the "configs.ListPage" page for uri "/configs/"
#    Then I wait for loading invisible
#    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
#    And I wait for loading invisible
#    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"


    Examples:
      | name     | rule1 | appName               | log                | replaceContent | result                          |
      | 内容替换详情验证 | 内容替换  | replaceContent_detail | replaceContent.log | $1             | Object\nraw_message:"123456qwe" |


  Scenario Outline: RZY-1559:tag替换搜索页验证

    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    And I choose the "@tag" from the "SourceField" in config
    And I set the value "(.*)" to the textarea "Regex"
    And I set the value "$1,newinfo" to the textarea "ReplaceContent"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "RZY1559tag替换"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
#    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
#    And I set the parameter "AppName" with value "<tag>"
#    And I set the parameter "Tag" with value "<tag>"
#    And I upload a file with name "/src/test/resources/testdata/log/<log>"
#    And I click the "UploadButton" button
#    And I wait for element "VerifyText" change text to "上传完成"
#    Then I wait for "40000" millsecond
#    When open the "splSearch.SearchPage" page for uri "/search/"
#    And I wait for element "SearchStatus" change text to "搜索完成!"
#    And I set the parameter "SearchInput" with value "tag:<tag>"
#    And I click the "DateEditor" button
#    And I click the "Today" button
#    And I click the "SearchButton" button
#    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I move the mouse pointer to the "Result"
#    And I click the "RightIcon" button
#    Then I will see the spl search result "<searchResult>" which is selected

    Examples:
      | tag                 | log        | searchResult                                |
      | wym_test_replaceTag | rename.log | {"tag":"tag: wym_test_replaceTag newinfo "} |


  Scenario Outline: tag替换详情验证

    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    Given I wait for loading complete
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "AddRule" button
    And I choose the "内容替换" from the "ParseRule" in config
    And I choose the "@tag" from the "SourceField" in config
    And I set the value "(.*)" to the textarea "Regex"
    And I set the value "$1,newinfo" to the textarea "ReplaceContent"
    And I click the "EnsureAddParseRule" button
    And I wait for "ParseButton" will be visible
    And I click the "NextButton" button under some element
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<tag>"
    And I set the parameter "Tag" with value "<tag>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible
#    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
#    And I set the parameter "AppName" with value "<tag>"
#    And I set the parameter "Tag" with value "<tag>"
#    And I upload a file with name "/src/test/resources/testdata/log/<log>"
#    And I click the "UploadButton" button
#    And I wait for element "VerifyText" change text to "上传完成"
#    Then I wait for "90000" millsecond
#    Given open the "configs.ListPage" page for uri "/configs/"
#    Then I wait for loading invisible
#    When the data name is "{'column':'1','name':'<name>'}" then i click the "详情" button
#    And I wait for loading invisible
#    Then I will see the config element "<rule1>" value is "<rule1> 1 1 0 0 0"
#    Then I will see the config element "<rule2>" value is "<rule2> 1 1 0 0 0"


    Examples:
      | name      | rule1  | rule2 | tag               | log        |
      | tag替换详情验证 | JSON解析 | 内容替换  | replaceTag_detail | rename.log |
