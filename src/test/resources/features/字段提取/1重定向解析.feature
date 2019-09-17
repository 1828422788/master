@configsSmoke
Feature: 字段提取重定向解析

  Scenario: RZY-2867：副规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2867redirect副规则"
    And I set the parameter "Logtype" with value "other"
    Then I choose the "default_ParserRule" from the "Group"
    And I choose the "Json解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I click the "AddField" button
    And I set the parameter "Key" with value "key"
    And I set the parameter "Value" with value "value"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "redirect_fu"
    And I set the parameter "Tag" with value "redirect_fu"
    And I click the "NextButton" button
    Then I wait for "ConfigDone" will be visible

  Scenario: RZY-2868：主规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "RZY2868redirect主规则"
    And I set the parameter "Logtype" with value "other"
    Then I choose the "default_ParserRule" from the "Group"
    And I choose the "重定向规则" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "RZY2867redirect副规则" from the "Redirect"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
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

  Scenario Outline: RZY-2864:在搜索页验证严格解析
    When open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I set the parameter "SearchInput" with value "tag:<tag>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "RightIcon" button
    Then I will see the spl search result "<result>"

    Examples:
      | tag                                   | result                |
      | redirect_zhu AND appname:redirect_zhu | {"other.key":"value"} |

  Scenario Outline: 验证详情
    Given open the "configs.ListPage" page for uri "/configs/"
    When the data name is "RZY2868redirect主规则" then i click the "详情" button
    And I wait for "SmallTr" will be visible
    Then I will see the config element "重定向规则" value is "重定向规则<result>"

    Examples:
      | result            |
      | \n82\n82\n0\n0\n0 |
