@createEssentialData @second
Feature: 趋势图所需字段提取新建

  Scenario: 创建一个针对sequence的字段提取规则并上传日志（循序图使用）
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "AutoTestForTrend"
    And I set the parameter "Logtype" with value "sequence"
    Then I choose the "default_ParserRule" from the "Group"
    When I set the parameter "LogSample" with value "1511255129000, fred, bob, query1, 111"
    And I choose the "CSV解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I drag the scroll bar to the top
    And I set the parameter "Separate" with value ","
    And I drag the scroll bar to the top
    And I set the parameter "FieldList" with value "time,from,to,relatemsg,msgid"
    And I click the "NextButton" button
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "seq_test"
    And I set the parameter "Tag" with value "seq_test"
    And I click the "NextButton" button
    And open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "seq_test"
    And I set the parameter "Tag" with value "seq_test"
    And I upload a file with name "/src/test/resources/testdata/log/autotest.csv"
    And I click the "UploadButton" button