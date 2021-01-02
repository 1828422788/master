Feature: 应用安装（RZY-1988）

  @upres1 @extra0
  Scenario:导入监控资源
    When open the "dbConnectionPre.ResListPage" page for uri "/resource/"
    Then I wait for "ImportAndExportButton" will be visible
    And I click the "ImportAndExportButton" button
    And I click the "ImportButton" button

    Then I will see the "dbConnectionPre.ImportResPage" page
    And I wait for "AddDataset" will be visible
    And I wait for "2000" millsecond
    When I upload a file "Upload" with name "/src/test/resources/testdata/app/v35资源包监控60个.tar"
    And I wait for "2000" millsecond

    And I choose the "__admin__" from the "Role"
    And I click the "NextButton" button

    And I click the "NextButton" button
#    And I wait for "Message" will be visible
    And I wait for "AddSuccMessage" will be visible

  @upres2
  Scenario: 验证无资源app的安装
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
#    And I wait for "AddDataset" will be visible
    And I wait for "2000" millsecond
    When I upload a file "Upload" with name "/Users/chs/Desktop/v35资源包监控60个.tar"
    And I wait for "2000" millsecond
    And I will see the element "VerifyText" name is "上传完成"
    And I wait for "2000" millsecond
    And I choose the "__admin__" from the "Role"
    And I click the "NextButton" button
    And I wait for "Message" will be visible

  @upres3
  Scenario: 验证不允许重复资源的安装
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
#    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/Users/chs/Desktop/v35资源包监控60个.tar"
    And I wait for "2000" millsecond
    And I will see the element "VerifyText" name is "上传完成"
    And I wait for "2000" millsecond
    And I choose the "__admin__" from the "Role"
    And I click the "AddDataset" button

    And I set the parameter "SearchInput" with value "AutoTestApp"
    And I click the "SearchIcon" button
    And I drag the scroll bar to the element "ResultDataset"
    And I click the "ResultDataset" button
    And I click the "Ensure" button
    And I click the "NextButton" button under some element
    And I click the "NextButton" button under some element
    And I wait for "ImportSuccess" will be visible
    And I wait for element "ImportSuccess" change text to "添加失败"

  Scenario: 上传APP包失败（上传格式校验）
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    When I upload a file with name "/src/test/resources/testdata/alertPlugins/hengshuiyinhang_socket.py"
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "仅支持 .tar 格式文件"

  Scenario: 上传APP包失败（上传内容校验）
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    When I upload a file with name "/src/test/resources/testdata/resourceGroups/success.tar"
    And I wait for "ErrorMessage" will be visible
    Then I will see the error message "上传失败: 读取资源包异常！"

  Scenario: 取消勾选可查看资源列表
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I click the "Resource" button
    And I "unchecked" the checkbox which name is "可查看资源列表"
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看仪表盘"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"

  Scenario: 勾选可查看资源列表权限
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "__user_AutoTest__" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    And I "checked" the checkbox which name is "全选"
    And I "unchecked" the checkbox which name is "全选"
    And I click the "Resource" button
    And I "checked" the checkbox which name is "可查看资源列表"
    And I click the "SaveButton" button
    Then I will see the success message "更新成功"
