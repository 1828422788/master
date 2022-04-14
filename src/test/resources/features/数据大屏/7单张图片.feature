@galaxee @galaxee2   @2.11
Feature: 数据大屏-k单张图片
#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 单张图片 RZY-1917,RZY-4337
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "单张图片"
    And I wait for "3000" millsecond
    And I click the "Ensure" button
    Then I will see the "galaxee.NewCreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "1500" millsecond

#    ===============================选择组件
    And I wait for "Module" will be visible
    And I click the "Moudle" button
    And I wait for "1000" millsecond
#    ==============================选择表格
    And I wait for "Media" will be visible
    And I click the "Media" button

#    ==============================单张图片
    And I wait for "Picture" will be visible
    And I click the "Picture" button
#    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
 #    ==============================图表布局
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1140"
    And I wait for "1000" millsecond
    And I set the parameter "Height" with value "890"
    And I wait for "1000" millsecond
    And I set the parameter "ChartXaxis" with value "300"
    And I wait for "1000" millsecond
    And I set the parameter "ChartYaxis" with value "100"
    And I wait for "2000" millsecond

#添加图片
#    And I click the "SinglePicture" button
    And I upload a file with name "/src/test/resources/testdata/image/rizhiyiframe.jpg"
    And I wait for "2000" millsecond
    And I set the parameter "CircleAngle" with value "80"
    And I wait for "2000" millsecond

    #   ==========================================保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存当前大屏成功"



#  Scenario Outline: 单张图片发布并截图
#    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
#    And switch to window "<name>"
#    And I close all tabs except main tab
#    And I wait for loading invisible
#    Then take a screenshot with name "galaxee/<name>"
#    #删除
#    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
#    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
#    Then I click the "Ensure" button
#
#    Examples:
#      |name  |
#      | 单张图片|
#
#
