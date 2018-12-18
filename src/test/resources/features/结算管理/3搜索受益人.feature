@payments @all @paymentsSmoke
Feature: 受益人搜索（RZY-389）

  Background:
    Given open the "payments.ListPage" page for uri "/payments/"

  Scenario Outline:
    Given I set the search input with "<name>"
    Then I will see the column number "1" contains "<name>"

    Examples:
      | name |
      | auto |