@bvtalert @alertcase @alertbatch
Feature: alert批量操作

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible

  Scenario Outline:  alert批量操作-新建
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>'}" then i click the "复制" button in more menu
    And I wait for "SuccessMessage" will be invisible
    And I set the parameter "TextFilter" with value "<name>(副本)"
    And I wait for loading invisible
    When the data name is "{'column':'1','name':'<name>(副本)'}" then i click the "编辑" button
    Then I will see the "alert.CreatePage" page
    And I wait for loading invisible
    And I set the parameter "AlertName" with value "<newName>"
    When I click the "Save" button

    Examples:
      | name                                      | newName             |
      | api00_all_事件数_扩展chart_all_sample_合并 | test删除_事件计数_设备切分ip1 |
      | api00_all_事件数_扩展chart_all_sample_合并 | test删除_事件计数_设备切分ip2 |


  Scenario Outline:  alert批量操作空操作
    When I click the "BatchControl" button
    And I choose the "<button>" from the "BatchOperation"
    Then I will see the text "请至少选择一个资源进行操作" exist in page

    Examples:
      | button       |
      | 启动         |
      | 停止         |
      | 添加资源标签 |
      | 删除         |

  Scenario:  alert批量操作-启动
    When I set the parameter "TextFilter" with value "test删除_事件计数_设备切分ip"
    And I wait for loading invisible
    When I click the "BatchControl" button
    When I click the "SelectAll" button
    And I choose the "启动" from the "BatchOperation"
    And I will see the message contains "确定启用 2 个资源"
    And I click the "Ensure" button
    Then I will see the success message "更新成功"

  Scenario Outline:  alert批量操作-启动-验证
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Then I will see the element "{'column':'1','name':'<name>'}" is "open"

    Examples:
      | name                |
      | test删除_事件计数_设备切分ip1 |
      | test删除_事件计数_设备切分ip2 |

  Scenario:  alert批量操作-添加资源标签
    And I set the parameter "TextFilter" with value "test删除_事件计数_设备切分ip"
    And I wait for loading invisible
    When I click the "BatchControl" button
    When I click the "SelectAll" button
    And I choose the "添加资源标签" from the "BatchOperation"
    And I choose the "autoui001" from the "TagField"
    When I click the "Ensure" button
    Then I will see the success message "更新成功"

  Scenario Outline:  alert批量操作-添加资源标签-验证
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then I "expand" the item
    And I will see the element "ExpandedRow" contains "autoui001"
    And the data name is "{'column':'1','name':'<name>'}" then I "close" the item

    Examples:
      | name                |
      | test删除_事件计数_设备切分ip1 |
      | test删除_事件计数_设备切分ip2 |

  Scenario:  alert批量操作-删除
    And I set the parameter "TextFilter" with value "test删除_事件计数_设备切分ip"
    And I wait for loading invisible
    When I click the "BatchControl" button
    When I click the "SelectAll" button
    And I choose the "删除" from the "BatchOperation"
    And I will see the message contains "您选中的 2 个资源将被删除，是否继续？"
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
    And I click the "Complete" button

  Scenario Outline:  alert批量操作-删除-验证
    And I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    Then I will see the text "<name>" is not existed in page

    Examples:
      | name                |
      | test删除_事件计数_设备切分ip1 |
      | test删除_事件计数_设备切分ip2 |