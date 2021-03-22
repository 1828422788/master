@setup1
Feature: 新建数据集all_、安装app

  @newdsall
  Scenario Outline: 新建数据集all_
    Given open the "dataset.ListPage" page for uri "/dataset/"
    When I click the "Create" button

    And I set the parameter "Name" with value "<name>"
    And I set the parameter "Alias" with value "<alias>"
    And I set the parameter "Spl" with value "<Spl>"

    And I click the "Save" button

    Then I will see the "dataset.DetailPage" page
    And I wait for loading invisible
#   #返回列表页验证
    And I click the "BackList" button

    And I wait for loading invisible
    Then I will see the data "{'column':'0','name':'all_'}" values "{'column':'2','name':'all_'}"
    And I will see the data "{'column':'0','name':'all_'}" values "{'column':'3','name':'无'}"

    Examples: 新建成功
      | name | alias | Spl |
      | all_ | all_  | *   |

  Scenario Outline: 安装自动测试用例前置条件
    Given open the "app.ListPage" page for uri "/app/list/"
    And I wait for "CreateButton" will be visible
    And I click the "InstallButton" button
    Then I will see the "app.InstallPage" page
    And I wait for "AddDataset" will be visible
    When I upload a file "Upload" with name "/src/test/resources/testdata/app/<appName>.tar"
    And I will see the element "VerifyText" name is "上传完成"
    And I choose the "__admin__" from the "Role"
    And I click the "NextButton" button under some element
    And I wait for "2000" millsecond
    And I click the "DoneButton" button
    And I wait for "ImportSuccess" will be visible
    And I will see the element "ImportSuccess" name is "添加成功"

    Examples:
      | appName     |
      | app之api全部用例 |





    