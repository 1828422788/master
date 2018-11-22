@payments @all
Feature: 受益人编辑

  Background:
    Given open the "payments.ListPage" page for uri "/payments/"

  Scenario Outline:
    Given the data name is "<oldName>" then i click the "编辑" button
    Then I will see the "payments.CreatePage" page
    Then I set the parameter "PaymentsName" with value "<name>"
    Then I set the parameter "Describe" with value "<describe>"
    Then I choose the "<appName>" from the "AppName"
    Then I click the "EditButton" button
    Then I will see the success message "<message>"

  @smoke
    Examples: 保存成功
      | oldName     | name     | describe | appName | message |
      | sxjautotest | autotest | autotest | apache  | 保存成功    |

    Examples: 保存失败
      | oldName  | name  | describe | appName | message                     |
      | autotest |       |          |         | 请填写受益人                      |
      | autotest | 测试中文名 |          |         | 保存失败: 受益人名称已存在\n错误码: FE_610 |