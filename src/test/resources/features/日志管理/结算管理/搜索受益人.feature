@payments @all
Feature: 受益人搜索

  Background:
    Given I insert into table "Beneficiary" with "{'name':'autotest','domain_id':'1'}"
    Then open the "payments.ListPage" page for uri "/payments/"

  Scenario Outline:
    Given I set the search input with "<name>"
    Then I will see the column number "1" contains "<name>"

    Examples:
      | name |
      | auto |