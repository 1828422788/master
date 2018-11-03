@all @smoke @users @usersSmoke
Feature: 用户禁用

  Background:
    Given open the "users.ListPage" page for uri "/account/users/"

  Scenario: 禁用一个用户成功
    Given I set the parameter "SearchInput" with value "SuccessEditAutoTest"
    And I wait table element "SearchResultTable-1.2" change text to "AutoTest"
    When I click the table "TableDisableButton-1" button
    Then I will see the "UserStatus" result will be "已禁用"