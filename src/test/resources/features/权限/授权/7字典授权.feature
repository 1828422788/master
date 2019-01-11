@authorization @all @smoke @roleSmoke
Feature: 角色授权字典

  Background:
    Given open the "roles.ListPage" page for uri "/account/roles/"
    And the data name is "AutoTestRole" then i click the "授权" button
    And I will see the "roles.AuthorizationPage" page
    Then I click the "{'TabButton':'字典'}" button

  Scenario: 授权新建字典（RZY-620）
    When I "checked" the checkbox which name is "新建字典"
    When I check "读取,分配" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then I click the "UploadButton" button
    And I choose the "AutoTestRoleWithAllResource" from the "Group"
    And I upload a file with name "/src/test/resources/testdata/dictionary/AutoTest.csv"
    And I wait for "FileName" will be visible
    And I click the "UploadFile" button

  Scenario Outline: 赋予读取权限、赋予读取+分配权限（RZY-629、630）
    When I check "<function>" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then I will see the search result contains "{'column':'0','name':'AutoTest.csv'}"

    Examples:
      | function |
      | 读取       |
      | 读取,分配    |

  Scenario Outline: 赋予读取+编辑权限（RZY-631）
    When I check "<function>" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "<name>" then i will see "{'column':'3','name':'<operation>'}" button
    When the data name is "<name>" then i click the "编辑" button
    And I click the "GroupInput" button
    Then I will see the "DisabledLi" is "is-disabled"

    Examples:
      | function | name         | operation |
      | 读取,编辑    | AutoTest.csv | 下载 编辑     |

  Scenario Outline: 赋予读取+删除权限、赋予读取+分配+删除权限（RZY-632、634）
    When I check "<function>" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "AutoTest.csv" then i will see "{'column':'3','name':'删除'}" button

    Examples:
      | function |
      | 读取,删除    |
      | 读取,分配,删除 |

  Scenario Outline: 赋予读取+分配+编辑权限（RZY-633）
    When I check "读取,分配,编辑" from the "{'IntraGroupManagement':['<group>']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "<name>" then i will see "{'column':'3','name':'下载 编辑'}" button
    When the data name is "<name>" then i click the "编辑" button
    And I cancel selection "<group>" from the "Group"
    And I click the "Update" button
    Then I will see the error message "字典分组 不能为空"

    Examples:
      | name         | group                       |
      | AutoTest.csv | AutoTestRoleWithAllResource |

  Scenario Outline: 赋予读取+编辑+删除权限（RZY-635）
    When I check "<function>" from the "{'IntraGroupManagement':['AutoTestRoleWithAllResource']}"
    And I click the "SaveButton" button
    And I will see the success message "保存成功"
    And I logout current user
    And open the "LoginPage" page for uri "/auth/login/"
    When I set the parameter "Username" with value "AutoTest"
    And I set the parameter "Password" with value "qqqqq11111"
    And I click the "LoginButton" button
    And I wait for "2000" millsecond
    Given open the "dictionary.ListPage" page for uri "/dictionary/"
    Then the data name is "<name>" then i will see "{'column':'3','name':'<operation>'}" button
    When the data name is "<name>" then i click the "编辑" button
    And I click the "GroupInput" button
    Then I will see the "DisabledLi" is "is-disabled"
    And open the "dictionary.ListPage" page for uri "/dictionary/"
    When the data name is "<name>" then i click the "删除" button
    And I click the "EnsureButton" button
    Then I will see the success message "删除成功"

    Examples:
      | function | name         | operation |
      | 读取,编辑,删除 | AutoTest.csv | 下载 编辑 删除  |