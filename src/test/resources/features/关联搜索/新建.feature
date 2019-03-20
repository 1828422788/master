@second @appSmoke
Feature: 关联搜索新建

  Scenario Outline: RZY-802：新建message字段提取规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "<name>"
    Then I choose the "default_ParserRule" from the "Group"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "^(?<MESSAGE_ID>[^\t]+)[^\t\n]*\t(?<CREATE_DATE>[^\t]+)\t(?<STEP_ID>\d+)\t\S+\"(?<PRE_ENTRY_ID>\d+)\S"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I click the "NextButton" button

    Examples:
      | name    | appName                        | tag              |
      | message | shenzhen_anylysis_test_message | MESSAGE_test0219 |

  Scenario Outline: RZY-802：新建workflow字段提取规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Logtype" with value "<name>"
    Then I choose the "default_ParserRule" from the "Group"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "^(?<ENTRY_ID>[^\t]+)\t(?<STEP_ID>[^\t]+)\t(?<CREATE_DATE>[^\t]+)"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I click the "NextButton" button

    Examples:
      | name     | appName                         | tag               |
      | workflow | shenzhen_anylysis_test_workflow | workflow_test0219 |

  Scenario: RZY-802：新建return字段提取规则
    Given open the "configs.ListPage" page for uri "/configs/"
    And I click the "CreateButton" button
    Then I will see the "configs.CreatePage" page
    When I set the parameter "Name" with value "return"
    And I set the parameter "Logtype" with value "return"
    Then I choose the "default_ParserRule" from the "Group"
    And I choose the "正则解析" from the "ParseRule"
    And I alter the element "ExtractSample" class to "yw-extract-sample yw-extract-sample-container"
    And I choose the "raw_message" from the "SourceField"
    And I set the parameter "Regex" with value "^[^\t\n]*\t(?<CREATE_DATE>[^\t]+)\t(?<EPORT_ID>\d+)\t(?<CUS_ID>\d+)\t(?<MESSAGE_ID>.+)"
    And I click the "NextButton" button under some element
    And I click the "SwitchButton" button
    And I set the parameter "AppName" with value "shenzhen_anylysis_test_return"
    And I set the parameter "Tag" with value "RETURN_test0219"
    And I click the "NextButton" button

  Scenario Outline: RZY-803：上传日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/<log>"
    And I click the "UploadButton" button

    Examples:
      | appName                         | tag               | log                         |
      | shenzhen_anylysis_test_message  | MESSAGE_test0219  | 11.15-11.17MESSAGE_LOG.txt  |
      | shenzhen_anylysis_test_return   | RETURN_test0219   | 11.21RETURN_RECEIPT_BAK.txt |
      | shenzhen_anylysis_test_workflow | workflow_test0219 | 11.15-11.2100000000.txt     |

  Scenario: RZY-804：关联搜索-配置
    Given open the "customApplication.ListPage" page for uri "/app/relate_search/application/"
    And I click the "Create" button
    And I will see the "customApplication.CreatePage" page
    And I set the parameter "Name" with value "shenzhen_anylysis"
    And I set the parameter "Describe" with value "深圳海关日志分析"
    And I click the "AutoSearch" button
    And I set the parameter "StepName" with value "message"
    And I set the parameter "Keyword" with value "tag:MESSAGE_test0219"
    And I set the parameter "Filter" with value "message.PRE_ENTRY_ID:000000001203094955"
    And I click the "DateEditor" button
    And I click the "RecentTwoDays" button
    And I click the "AddDisplayField" button under some element
    And I set the parameter "FieldName" with value "tag"
    And I set the parameter "Alias" with value "tag"
    And I click the "AddDisplayField" button
    And I set the parameter "FieldName" with value "message.PRE_ENTRY_ID"
    And I set the parameter "Alias" with value "PRE_ENTRY_ID"
    And I click the "AddDisplayField" button
    And I set the parameter "FieldName" with value "raw_message"
    And I set the parameter "Alias" with value "raw_message"
    And I click the "AddDisplayField" button
    And I set the parameter "FieldName" with value "message.CREATE_DATE"
    And I set the parameter "Alias" with value "CREATE_DATE"
    And I click the "AddStep" button
    And I set the parameter "StepName" with value "return"
    And I set the parameter "Keyword" with value "tag:RETURN_test0219"
    And I click the "DateEditor" button
    And I click the "RecentTwoDays" button
    And I click the "AddDisplayField" button under some element
    And I set the parameter "FieldName" with value "tag"
    And I set the parameter "Alias" with value "tag"
    And I click the "AddDisplayField" button
    And I set the parameter "FieldName" with value "return.CUS_ID"
    And I set the parameter "Alias" with value "CUS_ID"
    And I click the "AddDisplayField" button
    And I set the parameter "FieldName" with value "return.EPORT_ID"
    And I set the parameter "Alias" with value "EPORT_ID"
    And I click the "AddDisplayField" button
    And I set the parameter "FieldName" with value "raw_message"
    And I set the parameter "Alias" with value "raw_message"
    And I click the "AddReceiveField" button
    And I set the parameter "StepId" with value "step1"
    And I set the parameter "Param" with value "message.PRE_ENTRY_ID"
    And I set the parameter "PassParam" with value "return.EPORT_ID"
    And I click the "AddStep" button
    And I set the parameter "StepName" with value "workflow"
    And I set the parameter "Keyword" with value "tag:workflow_test0219"
    And I click the "DateEditor" button
    And I click the "RecentTwoDays" button
    And I click the "AddDisplayField" button under some element
    And I set the parameter "FieldName" with value "tag"
    And I set the parameter "Alias" with value "tag"
    And I click the "AddDisplayField" button
    And I set the parameter "FieldName" with value "workflow.ENTRY_ID"
    And I set the parameter "Alias" with value "workflow.ENTRY_ID"
    And I click the "AddDisplayField" button
    And I set the parameter "FieldName" with value "raw_message"
    And I set the parameter "Alias" with value "raw_message"
    And I click the "AddReceiveField" button
    And I set the parameter "StepId" with value "step2"
    And I set the parameter "Param" with value "return.CUS_ID"
    And I set the parameter "PassParam" with value "workflow.ENTRY_ID"
    And I click the "AddCollectField" button
    And I set the parameter "Field" with value "tag"
    And I set the parameter "CollectField" with value "tagwhat"
    And I click the "Save" button

  Scenario: RZY-805:使用关联搜索
    Given open the "customApplication.ListPage" page for uri "/app/relate_search/application/"
    When the data name is "shenzhen_anylysis" then i click the "进入" button without paging
    And I will see the "customApplication.CreatePage" page
    And I click the "Search" button
    And I wait element "Message" change text to "搜索 step3 完成"
    Then I will see the element "Key" value is "message.PRE_ENTRY_ID:000000001203094955,return.EPORT_ID:"000000001203094955",workflow.ENTRY_ID:"531620160167359680",workflow.ENTRY_ID:"531620160167365048",workflow.ENTRY_ID:"531620160167365049""