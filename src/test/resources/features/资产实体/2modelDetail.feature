@assetsModelSmoke
Feature: 模型详情

  Background:
    Given open the "assets.ModelPage" page for uri "/assets/model/"
    And I click the Element with text "Router"
    And switch to another window
    And I close all tabs except main tab
    And I wait for loading invisible

  Scenario:变更资产分组图标
    And I choose the "编辑" from the "OperateList"
    And I click the Element with text "替换"
    And I click the Element with text "网络"
    And I click the "ConfirmButtonInChoseIcon" button
    And I click the Element with text "确定"
    Then I will see the success message "更新成功"

  Scenario:新建模型字段
    And I click the Element with text "新建字段"
    And I wait for loading invisible
    And I set the parameter "InputForName" with value "测试新建字段"
    And I set the parameter "InputForIdentifier" with value "新建字段的唯一标识"
    And I choose the "文本" from the "FieldTypeList"
    And I choose the "基本信息" from the "FieldGroupList"
    And I click the "SwitchSlider" button
    And I click the Element with text "确定"
    Then I will see the success message "新建成功"

  Scenario:新建重复名称模型字段
    And I click the Element with text "新建字段"
    And I set the parameter "InputForName" with value "测试新建字段"
    And I click the Element with text "确定"
    Then I will see the text "展示名称不能重复" exist in page

  Scenario:编辑模型字段
    And the data name contains "测试新建字段" then i click the "编辑" button
    And I set the parameter "InputForName" with value "测试新建字段Edited"
    And I click the Element with text "确定"
    Then I will see the text "测试新建字段Edited(新建字段的唯一标识)" exist in page

  Scenario:删除模型字段
    And the data name contains "测试新建字段Edited" then i click the "删除" button
    And I wait for element "Message" change text to "删除模型字段会将资产中的对应属性删除,请谨慎操作"
    And I click the Element with text "确定"
    Then I will see the success message "删除成功"
    Then I will see the text "测试新建字段Edited(新建字段的唯一标识)" is not existed in page

  Scenario:新建模型关联
    And I click the "ModelContactButton" button
    And I click the Element with text "新建"
    And I wait for loading invisible
    And I choose the "主机" from the "GroupList"
    And I set the parameter "Input" with value "测试新建connect(连接)"
    And I click the Element with text "保存"
    Then I will see the success message "保存成功"

  Scenario:删除模型关联
    And I click the "ModelContactButton" button
    And I move the mouse pointer to the text "Router"
    And I click the "ModelContactDeleteButton" button
    And I click the Element with text "保存"
    Then I will see the success message "保存成功"

  Scenario:新建字段分组
    And I click the "FieldGroupButton" button
    And I click the "AddSquare" button
    And I set the parameter "Input" with value "测试新建字段分组"
    And I click the Element with text "确定"
    Then I will see the success message "创建成功"

  Scenario:编辑字段分组
    And I click the "FieldGroupButton" button
    And I move the mouse pointer to the text "测试新建字段分组"
    And I move the mouse pointer to the text "编辑"
    And I click the Element with text "重命名"
    And I set the parameter "Input" with value "测试新建字段分组Edited"
    And I click the Element with text "确定"
    And I will see the success message "更新成功"

  Scenario:删除字段分组
    And I click the "FieldGroupButton" button
    And I move the mouse pointer to the text "测试新建字段分组Edited"
    And I click the Element with text "删除"
    And I wait table element "Message" change text to "删除字段分组会将组内字段以及资产中的对应属性全部删除，请谨慎操作。"
    And I click the Element with text "确定"
    Then I will see the success message "删除成功"
    And I will see the text "测试新建字段分组Edited" is not existed in page

  Scenario:删除模型
    And I choose the "删除" from the "OperateList"
    And I wait table element "Message" change text to "删除模型会将模型中数据以及资产实体全部删除，请谨慎操作。"
    And I click the Element with text "确定"
    Then I will see the text "Router" is not existed in page
