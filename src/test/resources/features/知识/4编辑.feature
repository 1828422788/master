@knowledge
Feature: 知识编辑（RZY-879）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  @knowledgeSmoke
  Scenario Outline: 编辑知识
    Given the data name is "<NameValue>" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    And I set the parameter "KnowledgeName" with value "<newNameValue>"
    And I click the "Save" button

    Examples: 保存成功
      | NameValue | newNameValue |
      | sunxj1    | sxjAutoTest  |

  @knowledgeSmoke
  Scenario Outline: 编辑知识上传附件
    Given the data name is "sxjAutoTest" then i click the "编辑" button
    Then I will see the "knowledge.CreatePage" page
    And I upload a file with name "/src/test/resources/testdata/<path>"
    Then I wait for element "VerifyText" change text to "上传完成"
    And I click the "Save" button
    And I wait for loading invisible

    Examples:
      | path                              |
      | sourceGroups/AutoUpload.yaml      |
      | log/autotest.csv                  |
      | alertPlugins/testAlertPlugins.txt |
      | alertPlugins/testAlertPlugins.py  |
      | resourceGroups/success.tar        |

  @knowledgeSmoke
  Scenario Outline: 验证附件是否上传成功
    When I click the detail which name is "sxjAutoTest"
    Then I will see the "knowledge.CreatePage" page
    Then I will see the element "Attachment" name is "<name>"

    Examples:
      | name                                                                              |
      | 附件:\nsuccess.tar\ntestAlertPlu...\ntestAlertPlu...\nautotest.csv\nAutoUpload.y... |

