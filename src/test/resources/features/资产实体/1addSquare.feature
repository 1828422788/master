@assetsModel
Feature: 新建分组

  Background:
    Given open the "assets.ModelPage" page for uri "/assets/model/"
    And I wait for loading invisible

  Scenario:将鼠标移动到"+"号上时有"新建分组"提示气泡 RZY-5579
    And I move the mouse pointer to the "AddSquare"
    Then I will see the "Tooltip" result will be "新建分组"

  @assetsModelSmoke
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

  Scenario Outline:分组名称校验 RZY-5602
    And I click the "AddSquare" button
    And I set the parameter "Input" with value "<name>"
    And I click the Element with text "确定"
    Then I will see the success message "创建成功"

    Examples:
      | name    |
      | 99acbd   |
      | -acbd     |
      | awdjaijfjeifjsdjkfhsjhfuiasjkdahshdjakhsdkjad12312312412asdasdaczxczvdffsdfasd2我 |
      | ～！@#¥%……&*（）BNM《》？OP「」  |

  Scenario Outline:删除多余分组
    And I move the mouse pointer to the text "<name>"
    And I click the Element with text "删除"
    And I wait table element "Message" change text to "删除模型分组会将组内模型以及资产全部删除，请谨慎操作。"
    And I click the Element with text "确定"
    Then I will see the text "<name>" is not existed in page

    Examples:
      | name    |
      | 99acbd   |
      | -acbd     |
      | awd|
      | ～！@#¥%……&*（）BNM《》？OP「」  |