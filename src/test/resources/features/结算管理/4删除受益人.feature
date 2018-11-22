@payments @all
Feature: 受益人删除

  Background:
    Given I insert into table "Beneficiary" with "{'name':'autotest','domain_id':'1'}"
    Then open the "payments.ListPage" page for uri "/payments/"

  Scenario Outline:
    Given the data name is "<name>" then i click the "删除" button
    Then I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"

    Examples:
      | name            |
      | autotest        |
      | 测试中文名           |
      | 测试乱码&%¥*        |
      | 测试超出长度的名称能否保存成功 |