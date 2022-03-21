@knowledge @knowledge1
Feature: 知识新建（RZY-868）

  Scenario Outline: 新建知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I set the parameter "RichEditor" with value "<Describe>"
    And I click the "Next" button
    And I wait for "2000" millsecond
    And I set the parameter "RichEditor" with value "<Solution>"
    And I click the "Next" button
    And I wait for "2000" millsecond
    When I set the parameter "EventCode" with value "<EventCodeValue>"
    And I set the parameter "KnowledgeName" with value "<NameValue>"
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "新建成功"

    Examples: 保存成功
      | Describe | Solution | EventCodeValue | NameValue |
      |          |          | 仅有事件代码         |           |
      | 事件描述     |          | 事件代码+描述        |           |
      | 事件描述     | 解决方案     | 没有名称           |           |
      | 事件描述     | 解决方案     | 全部             | 知识名       |

    @knowledgeSmoke
    Examples: 保存成功
      | Describe | Solution | EventCodeValue | NameValue |
      | 事件描述     | 解决方案     | 全部             | 知识名       |


  Scenario: 新建知识失败
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I click the "Create" button
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Done" button
    Then I will see the text "事件代码为必填项" exist in page
    And I will see the "SuccessAdd" doesn't exist

  Scenario Outline: RZY-2445:通过url参数新建知识
    Given open the "knowledge.ListPage" page for uri "/knowledge/new/?code=<code>&name=<name>&description=AutoTest&solution=没有&rt_names=<tag>/"
    Then I will see the "knowledge.CreatePage" page
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Next" button
    And I wait for "1000" millsecond
    And I click the "Done" button
    Then I will see the element "SuccessAdd" name is "新建成功"

    Examples:
      | code             | name                | tag      |
      | AutoTestByURL    | AutoTestCreateByURL | 404, 500 |
      | 第一个code, 第二个code | 测试多个code            | 404, 500 |
      | code             | 名称1, 名称2            | 404, 500 |

  Scenario Outline: 验证知识新建
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When I click the detail which name is "{'column':'0','name':'<name>'}"
    Then I will see the "knowledge.DetailPage" page
    And I wait for "Code" will be visible
    And I wait for element "Code" change text to "<code>"
    And I will see the element value in json "{'Code':'<code>'}"
    #And I will see the element value in json "{'Tag':'<tag>'}"
    And I will see the element "Desc" name is "<desc>"
    And I will see the element "Solution" name is "<solution>"
    #And I will see the element "<string>" value contains "<tag>"

    Examples:
      | name                | code             | tag      | desc     | solution |
      | 名称1, 名称2            | code             | 404 500 | AutoTest | 没有       |
      | 测试多个code            | 第一个code, 第二个code | 404 500 | AutoTest | 没有       |
      | AutoTestCreateByURL | AutoTestByURL    | 404 500 | AutoTest | 没有       |

  Scenario Outline: 验证知识新建
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When I click the detail which name is "<name>"
    Then I will see the "knowledge.DetailPage" page
    And I wait for "Code" will be visible
    And I wait for element "Code" change text to "<code>"
    And I will see the element value in json "{'Code':'<code>'}"
    And I will see the element "Desc" value contains "<desc> "
   # And I will see the element "Solution" name is "<solution> "
    And I will see the element "Solution" value contains "<solution> "

    @knowledgeSmoke
    Examples:
      | name | code | desc | solution |
      | 知识名  | 全部   | 事件描述 | 解决方案     |

    Examples:
      | name | code | desc | solution |
      | 没有名称 | 没有名称 | 事件描述 | 解决方案     |

  Scenario Outline: 验证知识新建
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When I click the detail which name is "<name>"
    Then I will see the "knowledge.DetailPage" page
    And I wait for "Code" will be visible
    And I wait for element "Code" change text to "<code>"
    And I will see the element value in json "{'Code':'<code>'}"
   # And I will see the element "Desc" name is "<desc> "
    And I will see the element "Desc" value contains "<desc> "

    Examples:
      | name    | code    | desc |
      | 事件代码+描述 | 事件代码+描述 | 事件描述 |

  Scenario Outline: 验证知识新建
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And I wait for loading invisible
    When I click the detail which name is "<name>"
    Then I will see the "knowledge.DetailPage" page
    And I wait for "Code" will be visible
    And I wait for element "Code" change text to "<code>"
    And I will see the element value in json "{'Code':'<code>'}"

    Examples:
      | name   | code   |
      | 仅有事件代码 | 仅有事件代码 |
