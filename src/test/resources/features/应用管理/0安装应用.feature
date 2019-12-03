@all @app
Feature: 应用安装（RZY-1988）

  Scenario: 新建数据集
    Given open the "dataset.ListPage" page for uri "/dataset/"
    And I click the "Create" button
    And I set the parameter "Name" with value "AutoTestApp"
    And I set the parameter "Alias" with value "AutoTestApp"
    And I set the parameter "Spl" with value "*"
    And I click the "Save" button

  @smoke @appSmoke
  Scenario Outline: 安装资源成功
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file with name "/target/download-files/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__admin__" from the "Role"
    And I click the "AddDataset" button
    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I click the "SearchIcon" button
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I click the "NextButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "导入成功"

    Examples:
      | appName                     |
      | AutoTestAppWithAllResources |
      | EventApp                    |
      | ReportApp                   |
      | DashboardApp                |
      | AlertApp                    |
#      | ScheduleApp                 |
      | TrendApp                    |
      | SavedsearchesApp            |
      | KnowledgeApp                |
      | MacroApp                    |
      | TopologyApp                 |
      | ConfigsApp                  |
      | AuthApp                     |

  Scenario: 上传APP包失败（上传格式校验）
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    When I upload a file with name "/src/test/resources/testdata/alertPlugins/hengshuiyinhang_socket.py"
    Then I will see the error message "仅支持 .tar 格式文件"

  Scenario: 上传APP包失败（上传内容校验）
    Given open the "app.ListPage" page for uri "/app/list/"
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    When I upload a file with name "/src/test/resources/testdata/resourceGroups/success.tar"
    Then I will see the element "ErrorInfo" name is "读取资源包异常！"



    