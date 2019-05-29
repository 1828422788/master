@all @resourceGroups @smoke @resourceGroupsSmoke
Feature: 资源分组导出

  Background:
    Given delete file "/target/download-files/resource_group.tar"
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I wait for loading invisible

  Scenario Outline: 按照分组导出资源
    When I choose the "<type>" from the "SearchDropdown"
    And I click the "DownloadButton" button
    And I wait for loading invisible
    And I click the "AllCheck" button
    And I click the "EnsureDownloadButton" button
    And I set the parameter "ResourceTarName" with value "resource_group"
    And I click the "EnsureExportResource" button
    And I wait element "Message" change text to "导出成功，请等待下载完成。"
    Then I will see the message "导出成功，请等待下载完成。"

    Examples:
      | type |
      | 监控   |
      | 仪表盘  |
      | 定时任务 |
      | 已存搜索 |
      | 趋势图  |
      | 字段提取 |
      | 报表   |
      | 知识   |
      | 拓扑图  |
      | 搜索宏  |

  Scenario: 导出全部资源（RZY-857）
    And I click the "DownloadButton" button
    And I wait for loading invisible
    And I click the "AllCheck" button in each page
    And I click the "EnsureDownloadButton" button
    And I set the parameter "ResourceTarName" with value "resource_group"
    And I click the "EnsureExportResource" button
    And I wait element "Message" change text to "导出成功，请等待下载完成。"
    Then I will see the message "导出成功，请等待下载完成。"

  Scenario: 不勾选任何资源时点击导出（RZY-856）
    When I click the "DownloadButton" button
    And I click the "EnsureDownloadButton" button
    Then I will see the error message "请先选择资源分组，然后再重试导出"
