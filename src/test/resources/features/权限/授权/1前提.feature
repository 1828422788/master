Feature: 权限-background

  @auth
  Scenario: 新建搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    And I click the "Create" button
    And I set the parameter "Name" with value "AutoTestSearch"
    And I set the parameter "Appname" with value "*"
    And I click the "Ensure" button
    Then I will see the success message "操作成功"

  @auth
  Scenario: 分配搜索权限给AutoTest
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    When the data name is "{'column':'1','name':'AutoTestSearch'}" then i click the "授权" button
    And I wait for loading invisible
    And I "check" the checkbox which name is "__user_AutoTest__" in tiny table
    And I click the "Ensure" button
    Then I will see the message "保存成功"

  @cleanAuth
  Scenario: 删除搜索权限
    Given open the "queryScopes.ListPage" page for uri "/queryscopes/"
    When the data name is "{'column':'1','name':'AutoTestSearch'}" then i click the "删除" button
    And I click the "Ensure" button
    Then I will see the success message "删除成功"
