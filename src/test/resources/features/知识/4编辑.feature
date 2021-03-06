@knowledge @knowledge4
Feature: 知识编辑（RZY-879）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible

  @knowledgeSmoke
  Scenario Outline: 编辑知识
    Given the data name is "<NameValue>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I set the parameter "EventCode" with value "<code>"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "编辑成功"

    Examples: 保存成功
      | NameValue | code   |
      | 知识名       | 修改事件代码 |

  Scenario: 验证修改成功
    Then I will see the text "修改事件代码" exist in page
#    When the data name is "知识名" then i will see "修改事件代码" button

  @knowledgeSmoke
  Scenario Outline: 编辑知识上传附件
    Given the data name is "知识名" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    And I wait for loading invisible
    And I upload a file with name "/src/test/resources/testdata/<path>"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I upload a file with name "/src/test/resources/testdata/log/csv.log"
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "编辑成功"

    Examples:
      | path                              |
      | alertPlugins/testAlertPlugins.txt |

  Scenario: 验证知识上传附件成功
    When I click the detail which name is "{'column':'0','name':'知识名'}"
    Then I will see the "knowledge.DetailPage" page
    Then I will see the element "FileName" value is "testAlertPlugins.txt,csv.log"