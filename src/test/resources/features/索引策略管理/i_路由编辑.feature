@indexSetting @indexSettingSmoke
Feature: 路由编辑

  Background:
    Given open the "index.ListPage" page for uri "/indexmatchrules/"
    And I wait for loading invisible


  Scenario Outline: RZY-1483、1484编辑appname、tag、索引
    When the data name is "{'column':'3','name':'AutoAppName'}" then i click the "编辑" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    And I wait for "1000" millsecond
    When I choose the "<index>" from the "IndexName"
    And I click the "SavedButton" button
    And I will see the success message "保存成功"

    Examples:
      | index | appName | tag  |
      | error | iis1    | heka |

  Scenario: RZY-2442、2443-编辑索引、topic
    When the data name is "{'column':'3','name':'AutoCreateForSxcTest'}" then i click the "编辑" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I wait for "2000" millsecond
    And I choose the "topictest" from the "TopicName"
    And I wait for "1000" millsecond
    And I choose the "indexerror" from the "IndexName"
    And I click the "SavedButton" button
    And I will see the success message "保存成功"

  Scenario Outline: 上传编辑索引所需日志
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I wait for "400000" millsecond
    And I set the parameter "AppName" with value "<appname>"
    And I set the parameter "Tag" with value "<tag>"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.txt"
    And I click the "UploadButton" button
    Then I wait for element "VerifyText" change text to "上传完成"

    Examples:
    | appname | tag   |
    | iis1    |heka   |
    | sunxctest| sunxctest|

  Scenario Outline: 验证RZY-1484搜索结果
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "EventNumbers" change text to "事件(10)"

    Examples:
      | spl           |
      | index=error * AND appname:iis1      |
      | index=indexerror * AND appname:sunxctest |

  Scenario: 编辑indexerror-appname、tag
    When the data name is "{'column':'3','name':'AutoCreateForSxcTest'}" then i click the "编辑" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I set the parameter "AppName" with value "testda"
    And I set the parameter "Tag" with value "testda"
    And I click the "SavedButton" button
    And I will see the success message "保存成功"
