@first @reportSmoke
Feature: 报表禁用/启用（RZY-137至138）

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline:
    Then I disabled the data "改为旭日图sample2报表"
    Then I will see the success message "<result>"

    Examples:
      | result |
      | 禁用成功   |
      | 启用成功   |