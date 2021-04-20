@event
Feature: 事件操作新建（RZY-1387）

  Background:
    Given open the "event.ListPage" page for uri "/event/action/"

  @smoke @eventSmoke
  Scenario Outline: 保存成功
    When I click the "Create" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Field" with value "<field>"
    And I choose the "<display>" from the "Display"
    And I wait for "1500" millsecond
    And I choose the "<action>" from the "Action"
    And I set the parameter "Url" with value "<url>"
    And I choose the "<openUrl>" from the "OpenUrl"
    And I click the "CreateButton" button
    And I wait for "Message" will be visible
    Then I will see the message "<message>"
    Given open the "event.ListPage" page for uri "/event/action/"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'<name>'}"

    Examples:
      | name     | field | display | action | url                                                                                                                                            | openUrl | message  |
      | AutoTest |       | 两者      | 链接     | http://192.168.1.134/search/?query=${apache.clientip}&time_range=-30m,now&order=desc&size=20&page=1&sourcegroup=all&_t=1530688101882&title=tyf | 新窗口     | 提交事件操作成功 |

  @second @eventSmoke
  Scenario Outline: 保存成功
    When I click the "Create" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Url" with value "<url>"
    And I click the "CreateButton" button
    And I wait for "Message" will be visible
    Then I will see the message "<message>"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    #And I click the "RightIcon" button
    #And I click the "EventOperate" button
    #And I click the "ContextSample" button
    #And switch to another window
    #And I close all tabs except main tab
    Then I click the "Expand" button
    Then I click the "Context" button
    And I wait for "2000" millsecond
    Then I will see the "搜索上下文" page

    Examples:
      | name        | url                                                                                                                                                                            | message  |
      | 查看上下文sample | /search/context/?time_field=timestamp&timestamp=${timestamp}&id_field=context_id&context_id=${context_id}&sort_field=timestamp,context_id&filter_field=source&source=${source} | 提交事件操作成功 |

  Scenario Outline: 保存失败
    When I click the "Create" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Field" with value "<field>"
    And I choose the "<display>" from the "Display"
    And I choose the "<action>" from the "Action"
    And I set the parameter "Url" with value "<url>"
    And I choose the "<openUrl>" from the "OpenUrl"
    And I click the "CreateButton" button
    Then I will see the "Explain" is display

    Examples:
      | name | alias | field | display | action | url | openUrl | message       |
      |      |       |       |         |        |     |         | 请确定输入无误再进行提交！ |
      | test |       |       |         |        |     |         | 请确定输入无误再进行提交！ |
