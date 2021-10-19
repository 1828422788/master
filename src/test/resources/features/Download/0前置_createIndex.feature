@autoui01
Feature: 新建collect使用索引

  @collect0 @splpre
  Scenario Outline: 新建索引
    Given open the "index.ListPage" page for uri "/indexsettings/"
    Given I click the "AddButton" button
    Then I will see the "index.CreatePage" page
    And I click the "Next" button

    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Desc" with value "<desc>"
    And I set the parameter "SavedTime" with value "<savedTime>"
    And I set the parameter "DivideTime" with value "<divideTime>"
    And I set the parameter "SavedSize" with value "<savedSize>"
#    And I choose the "<savedSizeDropDown>" from the "SavedSizeDropDown"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Finish" button
    And I will see the element "Message" name is "索引配置完成!"
#    And I click the "CreateButton" button
#    And I wait for "3000" millsecond
#    And I will see the element "Message" name is "保存成功"

    Examples: 新建成功
      | name             | desc        | savedTime | divideTime | savedSize | savedSizeDropDown |
      | collectone       | 测试collect前置 | 7         | 1          | 1         | TB                |
      | collecttocollect | 测试collect前置 | 7         | 1          | 1         | TB                |
      | collecttwo       | 测试collect前置 | 7         | 1          | 1         | TB                |
      | collectmodefalse | 测试collect前置 | 7         | 1          | 1         | TB                |
      | collectmodetrue  | 测试collect前置 | 7         | 1          | 1         | TB                |
      | collectmulti     | 测试collect前置 | 7         | 1          | 1         | TB                |
      | collectdelete    | 测试collect前置 | 7         | 1          | 1         | TB                |
      | flinkindex1      | 测试collect前置 | 7         | 1          | 1         | TB                |
      | flinkindex2      | 测试collect前置 | 7         | 1          | 1         | TB                |


  @flinkalert0
  Scenario Outline:新建流式告警topic
    Given open the "index.TopicSetting" page for uri "/indexmatchrules/topicsettings/"
    When I click the "CreateButton" button
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "<describe>"
    And I click the "EnsureButton" button

    Examples:
      | name    | describe   |
      | ftopic1 | 流式告警topic1 |
      | ftopic2 | 流式告警topic2 |


  @flinkalert1
  Scenario Outline: 新建-路由规则
    Given open the "index.ListPage" page for uri "/indexmatchrules/"
    When I click the "AddButton" button
    Then I will see the "index.MatchRuleCreatePage" page
    Given I wait for loading complete
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I set the parameter "Rule" with value "<rule>"
    And I choose the "<topicname>" from the "TopicName"
    When I choose the "<indexname>" from the "IndexName"
    And I click the "CreateButton" button
    And I will see the success message "<message>"

    @indexSettingSmoke
    Examples:
      | appName | tag    | rule | topicname | indexname   | message | desc    |
      | apache  | flink1 |      | ftopic1   | flinkindex1 | 保存成功    | 测试流式告警1 |
      | apache  | flink2 |      | ftopic2   | flinkindex2 | 保存成功    | 测试流式告警2 |


  @flinkalert2
  Scenario Outline: 新建字典
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    When I click the "UploadButton" button
    Then I wait for "PopUpWindow" will be visible
    And I upload a file with name "/src/test/resources/testdata/dictionary/flinkalert.csv"
    And I wait for "FileName" will be visible
    Then I set the parameter "Name" with value "<dictionaryNameWithOutCsv>"
    And I click the "EnsureUpload" button
    Given I wait for loading complete
    Then I wait for "Tip" will be visible
    Then I will see the success message "创建字典成功"
    Then I click the "EnsureButton" button

    Examples:
      | dictionaryNameWithOutCsv |
      | flinkalert            |

