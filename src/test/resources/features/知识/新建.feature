@all @knowledge
Feature: 知识新建

  Background:
    Given I delete from "Knowledge" where "{'code':'sxjautotest'}"
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  Scenario Outline: 新建知识
    Given I click the "CreateKnowledge" button
    When I set the parameter "EventCode" with value "<EventCodeValue>"
    And I set the parameter "KnowledgeName" with value "<NameValue>"
    And I choose the "<Type>" from the "GroupComboBox"
    And I click the "TagInput" button
    And I set the parameter "TagInput" with value "<TagType>"
    And I choose the "<TagType>" from the "TagComboBox"
    And I set the parameter "Describe" with value "<Describe>"
    And I set the parameter "Solution" with value "<Solution>"
    And I click the "Confirm" button
    And I wait for loading invisible
    Then I will see the <Result>

  @smoke
    Examples: 保存成功
      | EventCodeValue | NameValue | Type              | TagType | Describe   | Solution      | Result                                                       |
      | sxjautotest    | sunxj1    | default_Knowledge | 404     | sunxjTest  | do nothing    | search result contains "{'column':'0','name':'sunxj1'}"      |
      | sxjautotest    |           | default_Knowledge |         | 第二个自动化测试用例 |               | search result contains "{'column':'0','name':'sxjautotest'}" |
      | sxjautotest    |           | default_Knowledge |         | 第三个自动化测试用例 | do everything | search result contains "{'column':'0','name':'sxjautotest'}" |

    Examples: 保存失败
      | EventCodeValue | NameValue | Type              | TagType | Describe | Solution | Result                  |
      |                |           |                   |         |          |          | error message "请输入事件代码" |
      |                |           | default_Knowledge |         | 22       |          | error message "请输入事件代码" |
      |                |           | default_Knowledge |         |          |          | error message "请输入事件代码" |
      |                |           |                   |         | 22       |          | error message "请输入事件代码" |
      | newCode        |           |                   |         | test     |          | error message "请选择分组"   |
      | newCode        |           |                   |         |          |          | error message "请选择分组"   |
      | newCode        |           | default_Knowledge |         |          |          | error message "请输入描述"   |

