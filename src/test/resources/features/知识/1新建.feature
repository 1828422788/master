@knowledge
Feature: 知识新建（RZY-868）

  @knowledgeSmoke
  Scenario Outline: 新建知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I set the parameter "RichEditor" with value "<Describe>"
    And I click the "Next" button
    And I set the parameter "RichEditor" with value "<Solution>"
    And I click the "Next" button
    When I set the parameter "EventCode" with value "<EventCodeValue>"
    And I set the parameter "KnowledgeName" with value "<NameValue>"
    And I click the "Next" button
    Then I will see the element "SuccessAdd" name is "添加成功"

    Examples: 保存成功
      | Describe | Solution | EventCodeValue | NameValue |
      |          |          | 仅有事件代码         |           |
      | 事件描述     |          | 事件代码+描述        |           |
      | 事件描述     | 解决方案     | 没有名称           |           |
      | 事件描述     | 解决方案     | 全部             | 知识名       |

  Scenario: 新建知识失败
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I click the "Next" button
    And I click the "Next" button
    Then I will see the error message "请输入事件代码"

  @knowledgeSmoke
  Scenario Outline: RZY-2445:通过url参数新建知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/new/?code=<code>&name=<name>&description=AutoTest&solution=没有&rt_names=<tag>/"
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I click the "Next" button
    And I click the "Next" button
    Then I will see the element "SuccessAdd" name is "添加成功"

    Examples:
      | code             | name                | tag      |
      | AutoTestByURL    | AutoTestCreateByURL | 404, 500 |
      | 第一个code, 第二个code | 测试多个code            | 404, 500 |
      | code             | 名称1, 名称2            | 404, 500 |

  Scenario Outline: 验证知识新建
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When I click the detail which name is "<name>"
    Then I will see the "knowledge.DetailPage" page
    And I wait for "Code" will be visible
    And I wait for element "Code" change text to "<code>"
    And I will see the element value in json "{'Code':'<code>'}"
    And I will see the element value in json "{'Tag':'<tag>'}"
    And I will see the element "Desc" name is "<desc>"
    And I will see the element "Solution" name is "<solution>"

    Examples:
      | name                | code             | tag      | desc     | solution |
      | 名称1, 名称2            | code             | 500, 404 | AutoTest | 没有       |
      | 测试多个code            | 第一个code, 第二个code | 500, 404 | AutoTest | 没有       |
      | AutoTestCreateByURL | AutoTestByURL    | 500, 404 | AutoTest | 没有       |

  Scenario Outline: 验证知识新建
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When I click the detail which name is "<name>"
    Then I will see the "knowledge.DetailPage" page
    And I wait for "Code" will be visible
    And I wait for element "Code" change text to "<code>"
    And I will see the element value in json "{'Code':'<code>'}"
    And I will see the element "Desc" name is "<desc> "
    And I will see the element "Solution" name is "<solution> "

    Examples:
      | name    | code    | desc | solution |
      | 知识名     | 全部      | 事件描述 | 解决方案     |
      | 没有名称    | 没有名称    | 事件描述 | 解决方案     |
      | 事件代码+描述 | 事件代码+描述 | 事件描述 |          |
      | 仅有事件代码  | 仅有事件代码  |      |          |
