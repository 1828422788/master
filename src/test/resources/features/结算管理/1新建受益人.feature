@payments
Feature: 受益人添加（RZY-380至RZY-384）

  Background:
    Given open the "payments.ListPage" page for uri "/payments/"

  @all
  Scenario Outline:
    Given I click the "CreateButton" button
    Then I will see the "payments.CreatePage" page
    Then I set the parameter "PaymentsName" with value "<name>"
    Then I set the parameter "Describe" with value "<describe>"
    Then I choose the "<appName>" from the "AppName"
    Then I click the "CreateButton" button
    Then I will see the success message "<message>"

  @smoke @paymentsSmoke
    Examples: 保存成功
      | name            | describe | appName | message |
      | sxjautotest     | autotest | apache  | 保存成功    |
      | 测试中文名           |          | json    | 保存成功    |
      | 测试乱码&%¥*        |          |         | 保存成功    |
      | 测试超出长度的名称能否保存成功 |          | apache  | 保存成功    |

    Examples: 保存失败
      | name        | describe | appName | message                     |
      |             |          |         | 请填写受益人                      |
      | sxjautotest |          |         | 保存失败: 受益人名称已存在\n错误码: FE_610 |



