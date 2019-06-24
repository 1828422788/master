@knowledge @knowledgeSmoke
Feature: 知识验证再次导入（RZY-2408）

  Scenario: 新建知识资源分组
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I click the "CreateResourceGroup" button
    Then I will see the "resourceGroups.CreatePage" page
    When I set the parameter "ResourceGroupName" with value "知识临时分组"
    And I choose the "知识" from the "ResourceGroupType"
    And I choose the "admin" from the "ResourceGroupOwner"
    And I click the "CreateButton" button
    Then I will see the success message "创建成功"

  Scenario: 修改知识分组
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    Given the data name is "autotest" then i click the "分组" button
    And I choose the "知识临时分组" from the "GroupComboBox"
    And I click the "Ensure" button
    Then I will see the success message "保存成功"

  Scenario: 导出知识分组
    Given delete file "/target/download-files/tempKnowledge.tar"
    And open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I wait for loading invisible
    Given I set the search input with "知识临时分组"
    And I wait for loading invisible
    And I click the "DownloadButton" button
    And I wait for loading invisible
    And I click the "AllCheck" button
    And I click the "EnsureDownloadButton" button
    And I set the parameter "ResourceTarName" with value "tempKnowledge"
    And I click the "EnsureExportResource" button
    And I wait element "Message" change text to "导出成功，请等待下载完成。"
    Then I will see the message "导出成功，请等待下载完成。"

  Scenario: 修改知识名称
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    And the data name is "autotest" then i click the "编辑" button
    And I set the parameter "KnowledgeName" with value "oldautotest"
    Then I click the "Confirm" button

  Scenario: 导入知识资源分组
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    And I click the "UploadButton" button
    When I upload a file with name "/target/download-files/tempKnowledge.tar"
    And I choose the "admin" from the "Role"
    And I choose the "source" from the "Source" with property
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I click the "FinishButton" button

  Scenario Outline: 验证附件是否上传成功
    Given open the "knowledge.ListPage" page for uri "/knowledge/"
    When I click the detail which name is "autotest"
    Then I will see the element "Attachment" name is "<name>"

    Examples:
      | name                                                                              |
      | 附件:\ntestAlertPlu...\nAutoUpload.y...\nautotest.csv\ntestAlertPlu...\nsuccess.tar |

  Scenario: 删除资源分组
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"
    When the data name is "知识临时分组" then i click the "删除" button
    And I click the "MessageBoxOKButton" button
    Then I will see the success message "删除成功"