@resourceGroups @all @smoke @resourceGroupsSmoke
Feature: 日志来源导入来源结构（RZY-374、RZY-2214）

  Background:
    Given open the "sourceGroup.StructurePage" page for uri "/sources/sourcegroups/structure/"
    And I click the "ImportButton" button

  Scenario: 导入日志来源，无重复资源（RZY-374步骤1、2）
    When I upload a file with name "/src/test/resources/testdata/sourceGroups/AutoUploadTest.yaml"
    And I will see the element "VerifyText" name is "上传完成"
    And I click the "NextButton" button
    And I wait for "Preview" will be visible
    And I click the "NextButton" button
    And I wait for "ImportSuccessMsg" will be visible
    And I click the "CompleteButton" button
    And open the "sourceGroup.ListPage" page for uri "/sources/sourcegroups/"
    And I choose the "未分组" from the "GroupDropdownList"
    And I wait for loading invisible
    Then I will see the special column contains "AutoTestUploadTest"

  Scenario: 导入日志来源并验证层级结构（RZY-374步骤8）
    When I upload a file with name "/src/test/resources/testdata/sourceGroups/AutoUploadTestHierarchy.yaml"
    And I will see the element "VerifyText" name is "上传完成"
    And I click the "NextButton" button
    And I wait for "Preview" will be visible
    And I click the "NextButton" button
    And I wait for "ImportSuccessMsg" will be visible
    And I click the "CompleteButton" button
    Then I will see the element "UploadSubSource" name is "AutoTestUploadSubSource"

  Scenario: 导入重复资源并修改名称（RZY-374步骤4、7）
    When I upload a file with name "/src/test/resources/testdata/sourceGroups/AutoUploadTestHierarchy.yaml"
    And I will see the element "VerifyText" name is "上传完成"
    And I click the "AutoTestUploadSubSource" button
    And I click the "EditButton" button
    And I set the parameter "EditInput" with value "AutoTestEditSubSource"
    And I click the "SaveEditButton" button
    And I wait for "AutoTestEditSource" will be visible
    And I click the "AutoTestUploadFather" button
    And I click the "EditButton" button
    And I set the parameter "EditInput" with value "AutoTestEditFather"
    And I click the "SaveEditButton" button
    And I wait for "AutoTestEditFather" will be visible
    And I click the "NextButton" button
    And I wait for "Preview" will be visible
    And I click the "NextButton" button
    And I wait for "ImportSuccessMsg" will be visible
    And I click the "CompleteButton" button
    Then I will see the element "AutoTestEditSubSource" name is "AutoTestEditSubSource"

  Scenario: 上传非yaml格式的文件（RZY-2214）
    When I upload a file with name "/src/test/resources/testdata/resourceGroups/success.tar"
    Then I will see the error message "请上传.yml或者.yaml格式文件。"