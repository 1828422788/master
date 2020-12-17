@authtest1
Feature: 权限-模式学习

  Scenario Outline: 取消模式学习
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    When I "checked" the checkbox which name is "可查看搜索页"
    When I "unchecked" the checkbox which name is "可使用模式学习"
    And I click the "Resource" button
    And I wait for "1000" millsecond
    When I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    And I will see the success message "更新成功"

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 验证无模式学习权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchStatus" change text to "搜索完成!"
    Then I will see the "Mode" doesn't exist
    Then I logout current user

  Scenario Outline: 勾选模式学习
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "<name>" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I wait for loading invisible
    When I "checked" the checkbox which name is "可使用模式学习"
    And I click the "SaveButton" button

    Examples:
      | name              |
      | __user_AutoTest__ |

  Scenario: 验证有模式学习权限
    Given I login user "AutoTest" with password "All#123456"
    And open the "splSearch.SearchPage" page for uri "/search/"
    And I click the "DateEditor" button
    And I click the "Today" button
    And I click the "SearchButton" button
    Then I wait for element "SearchStatus" change text to "搜索完成!"
    And I click the "Mode" button
    Then I logout current user
