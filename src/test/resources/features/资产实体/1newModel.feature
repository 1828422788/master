@assetsModelSmoke
Feature: 新建模型

  Background:
    Given open the "assets.ModelPage" page for uri "/assets/model/"

  Scenario:点击右上角的新建模型按钮新建模型
    And I click the Element with text "新建模型"
    And I wait for loading invisible
    And I choose the "路由" from the "groupList"
    And I set the parameter "InputForName" with value "Router"
    And I set the parameter "InputForIdentifier" with value "192.168.1.1"
    And I click the Element with text "替换"
    And I click the Element with text "路由器"
    And I click the "ConfirmButtonInChoseIcon" button
    And I click the Element with text "确定"
    Then I will see the text "Router" exist in page
    And I will see the text "192.168.1.1" exist in page

  Scenario:点击"+ 新建模型"按钮新建模型
    And I click the Element with text "+ 新建模型"
    And I wait for loading invisible
    Then I will see the text "nginx" exist in page
    And I set the parameter "InputForName" with value "Nginx"
    And I set the parameter "InputForIdentifier" with value "192.168.1.2"
    And I click the Element with text "替换"
    And I click the Element with text "负载平衡"
    And I click the "ConfirmButtonInChoseIcon" button
    And I click the Element with text "确定"
    Then I will see the text "Nginx" exist in page
    And I will see the text "192.168.1.2" exist in page

  Scenario:点击取消按钮取消新建
    And I click the Element with text "新建模型"
    And I wait for loading invisible
    And I choose the "路由" from the "groupList"
    And I set the parameter "InputForName" with value "cancel"
    And I set the parameter "InputForIdentifier" with value "cancel"
    And I click the Element with text "替换"
    And I click the Element with text "路由器"
    And I click the "CancelButtonInChoseIcon" button
    And I click the Element with text "取消"
    Then I will see the text "cancel" is not existed in page
    
  Scenario:重命名资产分组
    And I move the mouse pointer to the text "路由"
    And I move the mouse pointer to the text "编辑"
    And I click the Element with text "重命名"
    And I set the parameter "Input" with value "路由1"
    And I click the Element with text "确定"
    And I will see the success message "更新成功"
    Then I will see the text "路由1" exist in page
    And I will see the text "路由" is not existed in page

  Scenario:删除资产分组
    And I move the mouse pointer to the text "nginx"
    And I click the Element with text "删除"
    And I wait table element "Message" change text to "删除模型分组会将组内模型以及资产全部删除，请谨慎操作。"
    And I click the Element with text "确定"
    Then I will see the text "路由1" is not existed in page

