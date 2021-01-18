@delmaintain
Feature:

  Scenario Outline: 清理维护期
    Given open the "alert.MaintenancePage" page for uri "/alerts/maintenance/"
    And I set the parameter "ReasonNameSearchInput" with value "<reasonName>"
    When the data name is "<maintain_name>" then i click the "删除" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功"

    Examples:
      | maintain_name                      |
      | 维护期0_字段统计_独立数status_邮件_每月1-30	|
      | 维护期0_字段统计_独立数status_邮件_单次今天9点开始 |