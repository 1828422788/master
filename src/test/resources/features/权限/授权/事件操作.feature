@authtest
Feature: 权限-事件操作

  Scenario Outline: 取消事件操作权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    When I "unchecked" the checkbox which name is "可使用事件操作"
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 无页面访问权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "PageTemplate" page for uri "/event/action/"
    Then the page's title will be "403 Permission Denied"

  Scenario Outline: 勾选事件操作权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    When I "checked" the checkbox which name is "可使用事件操作"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario Outline: 验证事件操作新建
    Given I login user "AutoTest" with password "All#123456"
    And open the "event.ListPage" page for uri "/event/action/"
    When I click the "Create" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Field" with value "<field>"
    And I choose the "<display>" from the "Display" in page
    And I choose the "<action>" from the "Action" in page
    And I set the parameter "Url" with value "<url>"
    And I choose the "<openUrl>" from the "OpenUrl" in page
    And I click the "CreateButton" button
    Then I will see the message "<message>"
    Given open the "event.ListPage" page for uri "/event/action/"
    And I wait for loading invisible
    Then I will see the search result contains "{'column':'1','name':'<name>'}"

    Examples:
      | name         | field | display | action | url                                                                                                                                            | openUrl | message  |
      | AutoAuthTest |       | 两者      | 链接     | http://192.168.1.134/search/?query=${apache.clientip}&time_range=-30m,now&order=desc&size=20&page=1&sourcegroup=all&_t=1530688101882&title=tyf | 新窗口     | 提交事件操作成功 |

  Scenario Outline: 验证事件操作编辑
    Given I login user "AutoTest" with password "All#123456"
    And open the "event.ListPage" page for uri "/event/action/"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'AutoAuthTest'}" then i click the "编辑" button
    Then I will see the "event.CreatePage" page
    And I set the parameter "Field" with value "<field>"
    And I choose the "<action>" from the "Action" in page
    And I set the parameter "<inputName>" with value "<url>"
    And I click the "Save" button
    And I wait for "Message" will be visible
    Then I will see the message "提交事件操作成功"

    Examples:
      | field   | action | inputName | url                  |
      | logtype | 搜索     | Spl       | hostname:${hostname} |

  Scenario Outline: 验证删除
    Given I login user "AutoTest" with password "All#123456"
    And open the "event.ListPage" page for uri "/event/action/"
    And I wait for "2000" millsecond
    When the data name is "{'column':'1','name':'<name>'}" then i click the "删除" button
    And I wait for "Ensure" will be visible
    And I click the "Ensure" button
    And I refresh the website
    And I wait for "2000" millsecond
    Then I will see the search result "{'column':'1','name':'<name>','contains':'no'}"

    Examples:
      | name         |
      | AutoAuthTest |
