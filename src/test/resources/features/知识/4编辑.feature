@knowledge
Feature: 知识编辑（RZY-879）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  @knowledgeSmoke
  Scenario Outline:
    Given the data name is "<NameValue>" then i click the "编辑" button
    When I set the parameter "EventCode" with value "<EventCodeValue>"
    And I set the parameter "KnowledgeName" with value "<newNameValue>"
    And I choose the "<TagType>" from the "TagComboBox"
    And I set the parameter "Describe" with value "<Describe>"
    And I set the parameter "Solution" with value "<Solution>"
    And I click the "Confirm" button

    Examples: 保存成功
      | EventCodeValue | NameValue   | newNameValue | TagType | Describe           | Solution |
      | sxjautotest1   | sxjautotest | autotest     | 200     | the first autotest | test     |

  Scenario Outline:
    Given the data name is "<NameValue>" then i click the "编辑" button
    When I set the parameter "EventCode" with value "<EventCodeValue>"
    And I set the parameter "KnowledgeName" with value "<newNameValue>"
    And I choose the "<TagType>" from the "TagComboBox"
    And I set the parameter "Describe" with value "<Describe>"
    And I set the parameter "Solution" with value "<Solution>"
    And I click the "Confirm" button
    Then I will see the <Result>

    Examples: 保存失败
      | EventCodeValue | NameValue   | TagType | Describe | Solution | Result                  | newNameValue |
      |                | sxjautotest |         |          |          | error message "请输入事件代码" |              |
      | sxjautotest1   | sxjautotest |         |          |          | error message "请输入描述"   |              |

  @knowledgeSmoke
  Scenario Outline: 编辑知识上传附件
    Given the data name is "autotest" then i click the "编辑" button
    And I upload a file with name "/src/test/resources/testdata/<path>"
    And I click the "Confirm" button

    Examples:
      | path                              |
      | sourceGroups/AutoUpload.yaml      |
      | log/autotest.csv                  |
      | alertPlugins/testAlertPlugins.txt |
      | alertPlugins/testAlertPlugins.py  |
      | resourceGroups/success.tar        |

  @knowledgeSmoke
  Scenario Outline: 验证附件是否上传成功
    When I click the detail which name is "autotest"
    Then I will see the element "Attachment" name is "<name>"

    Examples:
      | name                                                                             |
      | 附件:\ntestAlertPlu...\nAutoUpload.y...\nautotest.csv\ntestAlertPlu...\nsuccess.tar |

