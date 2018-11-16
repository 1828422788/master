@all @smoke @configs @configsSmoke
Feature: 字段提取删除

  Background:
    Given open the "configs.ListPage" page for uri "/configs/"

  Scenario Outline:
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    And I wait for "Message" will be invisible
    And I wait for "1500" millsecond
    And I will see the message "删除成功"
#    And I refresh the website
#    Then I will see the search result "{'column':'0','name':'<name>','contains':'no'}"

    Examples:
      | name      |
      | AutoTest  |
      | sunxjtest |