@configsSmoke
Feature: 字段提取重定向解析

  Scenario: RZY-2867：副规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "JSON解析" from the "ParseRule"
    And I choose the "raw_message" from the "SourceField"
    And I click the "AddField" button
    And I set the parameter "Key" with value "key"
    And I set the parameter "Value" with value "value"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2867redirect副规则"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "redirect_fu"
    And I set the parameter "Tag" with value "redirect_fu"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

  Scenario: RZY-2868：主规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    And I click the "AddRule" button
    And I choose the "重定向规则" from the "ParseRule"
    And I choose the "RZY2867redirect副规则" from the "Redirect"
    And I choose the "json" from the "Redirect"
    And I click the "EnsureAddParseRule" button
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    When I set the parameter "Name" with value "RZY2868redirect主规则"
    And I set the parameter "Logtype" with value "other"
    And I set the parameter "AppName" with value "redirect_zhu"
    And I set the parameter "Tag" with value "redirect_zhu"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

  Scenario Outline: 上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<appName>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | appName      | log              |
      | redirect_zhu | json_sdyd_41.log |
