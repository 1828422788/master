@splSmoke
Feature: 搜索页面输入SPL语句，检查搜索完成后的事件数

  Background:
    Given I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "notester"
    And I set the parameter "Password" with value "all123456"
    And I click the "LoginButton" button
    And I wait for "1000" millsecond
    Given open the "splSearch.SearchPage" page for uri "/search/"

  @second
  Scenario Outline:RZY-2959、2960:搜索其他域索引数据
    Given I set the parameter "SearchInput" with value "<splQuery>"
    And I click the "DateEditor" button
    And I click the "WholeTime" button
    And I click the "SearchButton" button
    And I wait for element "SearchStatus" change text to "搜索完成!"
    Then I wait for "NoResult" will be visible

    Examples:
      | splQuery         |
      | index=schedule * |
      | index=monitor *  |
