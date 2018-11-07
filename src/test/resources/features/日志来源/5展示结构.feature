@resourceGroups @all @smoke @resourceGroupsSmoke
Feature: 日志来源展示结构

  Background:
    Given open the "splSearch.SearchPage" page for uri "/search/"

  Scenario Outline: 判断日志来源是否可以点击
    Then I click the "ArrowDown" button
    Then I will see the "<nodeName>" node is "<attribute>"

    Examples:
      | nodeName | attribute |
      | 别改我哦     | disabled  |
      | 也别改我     |           |

