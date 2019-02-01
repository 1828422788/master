@all @event
Feature: 事件操作新建（RZY-1387）

  Background:
    Given open the "event.ListPage" page for uri "/event/action/"

  Scenario Outline: 保存成功
    When I click the "CreateButton" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Field" with value "<field>"
    And I choose the "<display>" from the "Display"
    And I choose the "<action>" from the "Action"
    And I set the parameter "Url" with value "<url>"
    And I choose the "<openUrl>" from the "OpenUrl"
    And I click the "CreateButton" button
    Then I will see the success message "<message>"
    And I click the "EnsureButton" button
    And I refresh the website
    Then I will see the search result contains "{'column':'0','name':'<name>'}"
    Then take a screenshot with name "1387：事件操作-新建get事件操作"

  @smoke @eventSmoke
    Examples:
      | name     | alias              | field | display | action | url                                                                                                                                            | openUrl | message |
      | AutoTest | ${apache.clientip} |       | 两者      | 链接     | http://192.168.1.134/search/?query=${apache.clientip}&time_range=-30m,now&order=desc&size=20&page=1&sourcegroup=all&_t=1530688101882&title=tyf | 新窗口     | 保存成功    |

  Scenario Outline: 保存失败
    When I click the "CreateButton" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Field" with value "<field>"
    And I choose the "<display>" from the "Display"
    And I choose the "<action>" from the "Action"
    And I set the parameter "Url" with value "<url>"
    And I choose the "<openUrl>" from the "OpenUrl"
    And I click the "CreateButton" button
    Then I will see the success message "<message>"

    Examples:
      | name | alias | field | display | action | url | openUrl | message |
      |      |       |       |         |        |     |         | 名称 不能为空 |
      | test |       |       |         |        |     |         | 链接 不能为空 |
