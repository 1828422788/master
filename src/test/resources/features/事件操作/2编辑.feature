@all @event @smoke @eventSmoke
Feature: 事件操作编辑（RZY-1390）

  Background:
    Given open the "event.ListPage" page for uri "/event/action/"
    And the data name is "AutoTest" then i click the "编辑" button
    Then I will see the "event.CreatePage" page

  Scenario Outline: 链接类型（RZY-1377）
    When I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Field" with value "<field>"
    And I choose the "<action>" from the "Action"
    And I set the parameter "<inputName>" with value "<url>"
    And I choose the "<openUrl>" from the "OpenUrl"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | alias | field   | action | inputName | url                                   | openUrl |
      |       | logtype |        | Url       | https://www.baidu.com/s?wd=${logtype} | 当前窗口    |

  Scenario Outline: 搜索类型（RZY-1378）
    When I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Field" with value "<field>"
    And I choose the "<action>" from the "Action"
    And I set the parameter "<inputName>" with value "<url>"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | alias | field   | action | inputName | url                  |
      |       | logtype | 搜索     | Spl       | hostname:${hostname} |

  Scenario Outline: 美化格式（RZY-1379，RZY-1388）
    When I choose the "美化格式" from the "Action"
    And I choose the "<displayMethod>" from the "DisplayMethod"
    And I click the "SaveButton" button
    Then I will see the success message "保存成功"

    Examples:
      | displayMethod |
      | JSON          |
      | XML           |



