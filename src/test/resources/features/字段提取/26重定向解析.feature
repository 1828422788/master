@configs @configs26
Feature: 字段提取重定向解析


  Scenario: RZY-2867-1: 副规则
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule" in config
    And I wait for "1000" millsecond
    And I choose the "raw_message" from the "SourceField" in config
    Then I wait for "1000" millsecond
    And I click the "AddField" button
    Then I wait for "1000" millsecond
    And I set the parameter "Key" with value "key"
    And I set the parameter "Value" with value "value"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY2867redirect副规则"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "redirect_fu"
    And I set the parameter "Tag" with value "redirect_fu"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible


  Scenario Outline: RZY-2867: 主规则
    Given open the "configs.ListPage" page for uri "/configs/"
    Then I wait for loading invisible
    And I click the "Create" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "重定向规则" from the "ParseRule" in config
    Then I wait for "2000" millsecond
    And I choose the "RZY2867redirect副规则" from the "RedirectList"
    Then I wait for "2000" millsecond
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button
    When I set the parameter "Name" with value "RZY2868redirect主规则"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I switch the "SwitchButton" button to "enable"
    And I click the "Done" button
    Then I wait for "ConfigDone" will be visible

    Examples:
      | appName      |
      | redirect_zhu |


  Scenario Outline: RZY-2867: 主规则，上传日志，验证结果
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
      | appName      | log              | searchResult          |
      | redirect_zhu | json_sdyd_41.log | {"other.key":"value"} |