@bvtalert
Feature: alert批量操作

  Background:
    Given open the "alert.ListPage" page for uri "/alerts/"
    And I wait for loading invisible

  Scenario Outline:  alert批量操作空操作
    And I click the "MultiOperate" button
    And I wait for "500" millsecond
    And I click the "MultiChooseButton" button
    And I click the "<btn>" button
    Then I will see the text "请至少选择一个资源进行操作" exist in page


    Examples:
      | btn                    |
      |  MultiStart            |
      | MultiAddResourceTag    |
      | MultiDelete            |

  Scenario:  alert批量操作-启动
    When I set the parameter "AlertListSearchInput" with value "api3"
    And I click the "MultiOperate" button
    And I wait for "500" millsecond
    And I click the "ListItemOne" button
    And I click the "ListItemTwo" button
    And I click the "ListItemThree" button
    And I click the "MultiChooseButton" button
    And I wait for "500" millsecond
    And I click the "MultiStart" button
    Then I will see the text "确定启用 3 个资源" exist in page
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario Outline:  alert批量操作-启动-验证
    When I set the parameter "AlertListSearchInput" with value "api3"
    And I wait for "1000" millsecond
    Then I will see the switch button "<btn>" is "<status>"

    Examples:
      | btn                  |   status      |
      | switchOne            |   enable      |
      | switchTwo            |   enable      |
      | switchThree          |   enable      |
      | switchTen            |   disable     |

  Scenario:  alert批量操作-添加资源标签
    When I set the parameter "AlertListSearchInput" with value "api3"
    And I click the "MultiOperate" button
    And I wait for "500" millsecond
    And I click the "ListHeadCheckbox" button
    And I wait for "500" millsecond
    And I click the "MultiChooseButton" button
    And I wait for "1000" millsecond
    And I click the "MultiAddResourceTag" button
    And I choose the "AutoTest" from the "MultiAddTag"
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"

  Scenario:  alert批量操作-添加资源标签-验证
    When I set the parameter "AlertListSearchInput" with value "api3"
    And I wait for "3000" millsecond
    Then I will see the text "AutoTest, 1pre_package, auto_ui, 基线" exist in page
#    Then I will see the data "api3_字段统计_总和status_邮件" values "{'column':'6','name':'AutoTest, 1pre_package, auto_ui, 字段统计t'}"
    And I click the "PageTwo" button
    And I wait for "3000" millsecond
    Then I will see the text "AutoTest, 1pre_package, auto_ui, 基线" is not existed in page

  Scenario:  alert批量操作-删除
    When I set the parameter "AlertListSearchInput" with value "删除"
    And I wait for "2000" millsecond
    Then I will see the text "删除_api9_all_事件计数_设备切分ip_扩展chart_all_spark" exist in page
    And I click the "MultiOperate" button
    And I wait for "500" millsecond
    And I click the "ListHeadCheckbox" button
    And I wait for "500" millsecond
    And I click the "MultiChooseButton" button
    And I click the "MultiDelete" button
    Then I will see the text "您选中的 2 个资源将被删除，是否继续？" exist in page
    And I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

  Scenario:  alert批量操作-删除-验证
    When I set the parameter "AlertListSearchInput" with value "删除"
    And I wait for "3000" millsecond
    Then I will see the text "删除_api9_all_事件计数_设备切分ip_扩展chart_all_spark" is not existed in page





