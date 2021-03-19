Feature: 导入监控用例

  @upres1 @pre00
  Scenario:执行导入
    When open the "dbConnectionPre.ResListPage" page for uri "/resource/"
#    Then I wait for "ImportAndExportButton" will be visible
    Then I wait for loading complete
    And I click the "ImportAndExportButton" button
    And I click the "ImportButton" button

    Then I will see the "dbConnectionPre.ImportResPage" page
    And I wait for "AddDataset" will be visible
    And I wait for "2000" millsecond
    When I upload a file "Upload" with name "/src/test/resources/testdata/app/v35资源包监控60个.tar"
    And I wait for "2000" millsecond

    And I choose the "__admin__" from the "RoleList"
    And I click the "NextButton" button

    And I click the "CompleteButton" button
#    And I wait for "Message" will be visible
    And I wait for "AddSuccMessage" will be visible

  @pre00 @newldapconnssl
  Scenario Outline: 新建ssl ldap配置-1个
    Given open the "dbConnectionPre.LdapConnListPage" page for uri "/ldapconnection/"
    And I click the "CreateLdapConn" button

    Then I will see the "dbConnectionPre.EditPage" page
    And I wait for loading complete
    And I wait for "2000" millsecond

    And I set the parameter "NewLdapConnName" with value "<NewLdapConnName>"
    And I set the parameter "NewBaseDName" with value "<NewBaseDName>"
    And I set the parameter "NewLdapHost" with value "<NewLdapHost>"
    And I set the parameter "NewLdapConnPort" with value "<NewLdapConnPort>"
    And I click the "LdapSSlOnOff" button

    When I upload a file "Upload" with name "/src/test/resources/testdata/app/ca.crt"

    And I set the parameter "NewBindDnName" with value "<NewBindDnName>"
    And I set the parameter "LdapUserPassword" with value "<LdapUserPassword>"
    And I click the "LdapConnVerifyButton" button
    And I click the "SaveButton" button

    Examples:
      | NewLdapConnName  | NewBaseDName      | NewLdapHost   | NewLdapConnPort | NewBindDnName              | LdapUserPassword |
      | ldpconnsamplessl | dc=example,dc=org | 192.168.1.221 | 636             | cn=admin,dc=example,dc=org | admin            |

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
