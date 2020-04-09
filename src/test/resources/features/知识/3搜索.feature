@knowledge @knowledgeSmoke
Feature: 知识搜索（RZY-884）

  Background:
    Given open the "knowledge.ListPage" page for uri "/knowledge/"

  Scenario Outline: 按分组搜索
    When I choose the "<GroupList>" from the "ResourceDropdown"
    And I wait for loading invisible
    Then I will see the search result contains "sunxj1"
    Then I will see the search result "{'column':'0','name':'AutoTest','contains':'no'}"

    Examples:
      | GroupList |
      | testTag   |

  Scenario Outline: 全文搜索
    When I set the parameter "SearchInput" with value "<search>"
    And I click the "SearchAll" button
    Then I will see the element value in json "<value>"

    Examples:
      | search | value            |
      | sunxj1 | {'Key':'sunxj1'} |