@indexSetting @indexSettingSmoke @second
Feature: 路由编辑

  Background:
    Given open the "index.ListPage" page for uri "/indexsettings/indexmatchrule/"

  Scenario Outline: RZY-1483、1484
    When the data name is "{'column':'3','name':'AutoAppName'}" then i click the "编辑" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I set the parameter "AppName" with value "<appName>"
    And I set the parameter "Tag" with value "<tag>"
    When I choose the "<index>" from the "IndexName"
    And I click the "SavedButton" button
    Then I will see the message "保存成功"
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "iis1"
    And I set the parameter "Tag" with value "heka"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.dms"
    And I click the "UploadButton" button
    And I wait for element "VerifyText" change text to "上传完成"

    Examples:
      | index | appName | tag  |
      | error | iis1    | heka |

  Scenario: RZY-2442、2443
    When the data name is "{'column':'3','name':'AutoCreateForSxcTest'}" then i click the "编辑" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I choose the "topictest" from the "TopicName"
    When I choose the "indexerror" from the "IndexName"
    And I click the "SavedButton" button
    Then I will see the message "保存成功"
    When open the "localUpload.ListPage" page for uri "/sources/input/os/"
    And I set the parameter "AppName" with value "sunxctest"
    And I set the parameter "Tag" with value "sunxctest"
    And I upload a file with name "/src/test/resources/testdata/log/apache_10.dms"
    And I click the "UploadButton" button
    Then I wait for element "VerifyText" change text to "上传完成"

  Scenario Outline: 验证RZY-1484搜索结果
    Given open the "splSearch.SearchPage" page for uri "/search/"
    And I set the parameter "SearchInput" with value "<spl>"
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
#    Then I will see the element "EventNumber" name is "(10)"

    Examples:
      | spl           |
      | index=indexerror * |

  Scenario: 编辑indexerror
    When the data name is "{'column':'3','name':'AutoCreateForSxcTest'}" then i click the "编辑" button
    Then I will see the "index.MatchRuleCreatePage" page
    And I set the parameter "AppName" with value "testdisable"
    And I set the parameter "Tag" with value "testdisable"
    And I click the "SavedButton" button
    Then I will see the message "保存成功"