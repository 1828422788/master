@knowledge @knowledgeSmoke
Feature: 知识删除（RZY-881）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Then I wait for loading invisible

  Scenario Outline:删除知识
    Given the data name is "<Name>" then i click the "删除" button in more menu
    And I wait for "Ensure" will be visible
    When I click the "Ensure" button
    And I will see the success message "删除知识成功"
#    And I refresh the website
#    Then I will see the search result "{'column':'0','name':'<Name>','contains':'no'}"

    Examples:
      | Name                |
      | 名称1, 名称2            |
      | 测试多个code            |
      | AutoTestCreateByURL |
      | 知识名                 |
      | 没有名称                |
      | 事件代码+描述             |
      | 仅有事件代码              |