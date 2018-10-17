@all @resourceGroups
Feature: 资源分组导入

  Background:
    Given open the "resourceGroups.ListPage" page for uri "/account/resourcegroups/"

  @smoke
  Scenario Outline: 导入资源包的正常流程测试
    Given I click the "UploadButton" button
    When I upload a file with name "<InputFileName>"
    And I choose the "<role>" from the "Role"
    And I click the "NextButton" button
    And I click the "SourceGroup" button
    And I click the "Edit" button
    And I set the parameter "GroupNameInput" with value "<groupNameInput>"
    And I click the "ConfirmButton" button
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I wait for "1000" millsecond
    And I click the "NextButton" button
    And I click the "FinishButton" button
    Then I will see the special column contains "<groupNameInput>"

    Examples:
      | InputFileName                                           | role  | groupNameInput |
      | /src/test/resources/testdata/resourceGroups/success.tar | admin | sunxjAutoTest  |

  @all @resourceGroups
  Scenario Outline: 导入资源包的异常流程测试-导入的文件格式/内容不正确
    Given I click the "UploadButton" button
    When I upload a file with name "<InputFileName>"
    Then I will see the error message "<ErrorMessage>"

    Examples:
      | InputFileName                                               | ErrorMessage               |
      | /src/test/resources/testdata/resourceGroups/testcase.txt    | 仅支持 .tar 格式文件              |
      | /src/test/resources/testdata/resourceGroups/testcase.tar.gz | 仅支持 .tar 格式文件              |
      | /src/test/resources/testdata/resourceGroups/testcase.tar    | 未知错误，请检查文件格式及内容是否正确，然后重新上传 |

  @all @resourceGroups
  Scenario Outline: 导入资源包的异常流程测试-为空测试
    Given I click the "UploadButton" button
    When I upload a file with name "<InputFileName>"
    And I choose the "<Owner>" from the "ResourceGroupOwner"
    And I click the "NextButton" button
    Then I will see the error message "<ErrorMessage>"

    Examples:
      | InputFileName                                            | Owner | ErrorMessage |
      | /src/test/resources/testdata/resourceGroups/testcase.tar | admin | 数据格式错误，请重新上传 |
      | /src/test/resources/testdata/resourceGroups/success.tar  |       | 请选择角色        |
      |                                                          |       | 请上传资源包       |
      |                                                          | admin | 请上传资源包       |
