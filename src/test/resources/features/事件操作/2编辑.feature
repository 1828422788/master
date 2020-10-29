@event @eventSmoke
Feature: 事件操作编辑（RZY-1390）

  Background:
    Given open the "event.ListPage" page for uri "/event/action/"

  Scenario Outline: 链接类型（RZY-1377）
    And the data name is "{'column':'1','name':'AutoTest'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    When I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Field" with value "<field>"
    And I choose the "<action>" from the "Action"
    And I set the parameter "<inputName>" with value ""
    And I set the parameter "<inputName>" with value "<url>"
    And I choose the "<openUrl>" from the "OpenUrl"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "RightIcon" button
    And I click the "EventOperate" button
    And I click the "EventOperatorAutoTest" button
    And the page's title will contains "_百度搜索"

    Examples:
      | alias | field   | action | inputName | url                                   | openUrl |
      |       | logtype |        | Url       | https://www.baidu.com/s?wd=${logtype} | 当前窗口    |

  Scenario Outline: 搜索类型（RZY-1378）
    And the data name is "{'column':'1','name':'AutoTest'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Field" with value "<field>"
    And I choose the "<action>" from the "Action"
    And I set the parameter "<inputName>" with value "<url>"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Given I set the parameter "SearchInput" with value "hostname:centos"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "RightIcon" button
    And I click the "EventOperate" button
    And I click the "EventOperatorAutoTest" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the input element "SearchInput" value will be "hostname:centos"

    Examples:
      | field   | action | inputName | url                  |
      | logtype | 搜索     | Spl       | hostname:${hostname} |

  Scenario Outline: 美化格式（RZY-1379，RZY-1388）
    And the data name is "{'column':'1','name':'AutoTest'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    When I set the parameter "Field" with value "<name>"
    And I choose the "美化格式" from the "Action"
    And I choose the "<displayMethod>" from the "DisplayMethod"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Given I set the parameter "SearchInput" with value "hostname:centos"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "RightIcon" button
    And I click the "RawMessage" button
    And I click the "EventOperatorAutoTest" button

    Examples:
      | name                             | displayMethod |
      | raw_message                      | JSON          |
      | raw_message,tag,hostname,logtype | XML           |

  Scenario: RZY-1376:显示于-两者
    When the data name is "{'column':'1','name':'查看上下文sample'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    When I set the parameter "Field" with value "raw_message"
    And I choose the "两者" from the "Display"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Given I set the parameter "SearchInput" with value "hostname:centos"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    And I click the "RightIcon" button
    And I click the "EventOperate" button
    Then I wait for "ContextSample" will be visible
    And I click the "RawMessage" button
    Then I wait for "ContextSample" will be visible

