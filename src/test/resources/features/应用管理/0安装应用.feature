@all @app
Feature: 应用安装（RZY-1988）

  Background:
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page

  @smoke @appSmoke
  Scenario Outline: 安装资源成功
    When I upload a file with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "admin" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I click the "SearchIcon" button
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button
    And I click the "NextButton" button
    And I will see the "ResourcePreview" is "active"
    And I click the "NextButton" button
    And I wait for loading invisible
    And I will see the element "ImportSuccess" name is "导入成功"

    Examples:
      | appName                     |
      | AutoTestAppWithAllResources |
      | ReportApp                   |
      | DashboardApp                |
      | AlertApp                    |
      | ScheduleApp                 |
      | TrendApp                    |
      | SavedsearchesApp            |
      | KnowledgeApp                |
      | MacroApp                    |
      | SourceApp                   |
      | TopologyApp                 |
      | ConfigsApp                  |

  Scenario: 上传APP包失败（上传格式校验）
    When I upload a file with name "/src/test/resources/testdata/alertPlugins/hengshuiyinhang_socket.py"
    Then I will see the error message "仅支持 .tar 格式文件"

  Scenario: 上传APP包失败（上传内容校验）
    When I upload a file with name "/src/test/resources/testdata/resourceGroups/success.tar"
    Then I will see the element "ErrorInfo" name is "未知错误，请检查文件格式及内容是否正确，然后重新上传"

  Scenario Outline: 执行下一步失败
    When I upload a file with name "<fileName>"
    And I choose the "<role>" from the "Role"
    And I choose the "<resource>" from the "Resource"
    And I click the "NextButton" button
    Then I will see the error message "<message>"

    Examples:
      | fileName                                                | role  | message      |
      |                                                         |       | 请上传资源包       |
      | /src/test/resources/testdata/resourceGroups/success.tar |       | 数据格式错误，请重新上传 |
      | /target/download-files/AutoTestApp.tar                  |       | 请选择角色        |
      | /target/download-files/AutoTestApp.tar                  | admin | 请选择日志来源      |



    