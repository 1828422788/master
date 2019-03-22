Feature: 知识编辑（RZY-879）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  @knowledge
  Scenario Outline:
    Given the data name is "<NameValue>" then i click the "编辑" button
    When I set the parameter "EventCode" with value "<EventCodeValue>"
    And I set the parameter "KnowledgeName" with value "<newNameValue>"
    And I choose the "<TagType>" from the "TagComboBox"
    And I set the parameter "Describe" with value "<Describe>"
    And I set the parameter "Solution" with value "<Solution>"
    And I click the "Confirm" button

  @all @smoke
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

  @all
    Examples: 保存失败
      | EventCodeValue | NameValue   | TagType | Describe | Solution | Result                  | newNameValue |
      |                | sxjautotest |         |          |          | error message "请输入事件代码" |              |
      | sxjautotest1   | sxjautotest |         |          |          | error message "请输入描述"   |              |
