@knowledge
Feature: 知识新建（RZY-868）

  @knowledgeSmoke
  Scenario Outline: 新建知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    When I set the parameter "EventCode" with value "<EventCodeValue>"
    And I set the parameter "KnowledgeName" with value "<NameValue>"
    And I set the parameter "TagInput" with value "<TagType>"
    And I choose the "<TagType>" from the "TagComboBox"
    And I set the parameter "Describe" with value "<Describe>"
    And I set the parameter "Solution" with value "<Solution>"
    And I click the "Confirm" button
    Then I will see the search result contains "{'column':'0','name':'<NameValue>'}"

    Examples: 保存成功
      | EventCodeValue | NameValue | TagType | Describe  | Solution   |
      | sxjautotest    | sunxj1    | 404     | sunxjTest | do nothing |

  Scenario Outline: 新建知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "CreateKnowledge" button
    When I set the parameter "EventCode" with value "<EventCodeValue>"
    And I set the parameter "KnowledgeName" with value "<NameValue>"
    And I choose the "<Type>" from the "GroupComboBox"
    And I set the parameter "Describe" with value "<Describe>"
    And I set the parameter "Solution" with value "<Solution>"
    And I click the "Confirm" button
    Then I will see the <Result>

  @knowledgeSmoke
    Examples: 保存成功
      | EventCodeValue | NameValue | Type              | Describe   | Solution      | Result                                                       |
      | sxjautotest    |           | default_Knowledge | 第二个自动化测试用例 |               | search result contains "{'column':'0','name':'sxjautotest'}" |
      | sxjautotest    |           | default_Knowledge | 第三个自动化测试用例 | do everything | search result contains "{'column':'0','name':'sxjautotest'}" |

    Examples: 保存失败
      | EventCodeValue | NameValue | Type              | Describe | Solution | Result                  |
      |                |           |                   |          |          | error message "请输入事件代码" |
      |                |           | default_Knowledge | 22       |          | error message "请输入事件代码" |
      |                |           | default_Knowledge |          |          | error message "请输入事件代码" |
      |                |           |                   | 22       |          | error message "请输入事件代码" |
      | newCode        |           | default_Knowledge |          |          | error message "请输入描述"   |

  @knowledgeSmoke
  Scenario Outline: RZY-2445:通过url参数新建知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/new/?code=<code>&name=<name>&description=AutoTest&solution=没有&tags=<tag>/"
    And I click the "Confirm" button
    And I will see the search result contains "{'column':'0','name':'<name>'}"
    And I will see the search result contains "{'column':'1','name':'<code>'}"

    Examples:
      | code             | name                | tag      |
      | AutoTestByURL    | AutoTestCreateByURL | 404, 500 |
      | 第一个code, 第二个code | 测试多个code            | 404, 500 |
      | code             | 名称1, 名称2            | 404, 500 |