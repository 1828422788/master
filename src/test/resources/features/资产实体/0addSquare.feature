@assetsModelSmoke
Feature: 新建分组

  Background:
    Given open the "assets.ModelPage" page for uri "/assets/model/"

  Scenario Outline:新建分组成功

    And I click the "AddSquare" button
    And I set the parameter "Input" with value "<name>"
    And I click the Element with text "确定"
    Then I will see the text "<name>" exist in page
    Then I will see the success message "创建成功"

    Examples:
      | name    |
      | nginx   |
      | 路由     |

  Scenario:点击取消未新建分组

    And I click the "AddSquare" button
    And I set the parameter "Input" with value "testGroup"
    And I click the Element with text "取消"
    Then I will see the text "testGroup" is not existed in page


  Scenario:分组名称不可重复
    And I click the "AddSquare" button
    And I set the parameter "Input" with value "主机管理"
    And I click the Element with text "确定"
    Then I will see the text "分组名称不可重复" exist in page

  Scenario:分组名称不能为空
    And I click the "AddSquare" button
    And I click the Element with text "确定"
    Then I will see the text "分组名称不能为空" exist in page
