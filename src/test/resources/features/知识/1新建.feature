@knowledge
Feature: 知识新建（RZY-868）

  @knowledgeSmoke
  Scenario Outline: 新建知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    When I set the parameter "EventCode" with value "<EventCodeValue>"
    And I set the parameter "KnowledgeName" with value "<NameValue>"
    And I set the parameter "Describe" with value "<Describe>"
    And I set the parameter "Solution" with value "<Solution>"
    And I click the "Save" button
    Then I wait for loading invisible

    Examples: 保存成功
      | EventCodeValue | NameValue | Describe  | Solution   |
      | sxjautotest    | sunxj1    | sunxjTest | do nothing |
      | AutoTest       | AutoTest  | test      | everything |

  Scenario Outline: 新建知识失败
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    When I set the parameter "EventCode" with value "<EventCodeValue>"
    And I click the "Save" button
    Then I will see the error message "<Result>"

    Examples:
      | EventCodeValue | Result  |
      |                | 请输入事件代码 |
      | newCode        | 请输入描述   |

  @knowledgeSmoke
  Scenario Outline: RZY-2445:通过url参数新建知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/new/?code=<code>&name=<name>&description=AutoTest&solution=没有&tags=<tag>/"
    And I click the "Save" button
    And I will see the search result contains "{'column':'0','name':'<name>'}"
    And I will see the search result contains "{'column':'1','name':'<code>'}"

    Examples:
      | code             | name                | tag      |
      | AutoTestByURL    | AutoTestCreateByURL | 404, 500 |
      | 第一个code, 第二个code | 测试多个code            | 404, 500 |
      | code             | 名称1, 名称2            | 404, 500 |