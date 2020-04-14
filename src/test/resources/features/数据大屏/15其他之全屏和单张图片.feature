@galaxee
Feature: 数据大屏-全屏和单张图片

  Scenario: 全屏
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "全屏"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择全屏
    And I click the "Fullscreen" button
    And I hide the element "otherDropdown"
 #设置图表尺寸位置
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "560"
    And I set the parameter "Height" with value "560"
    And I set the parameter "ChartXaxis" with value "400"
    And I set the parameter "ChartYaxis" with value "300"

   #全局样式修改名成
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "全屏修改"

      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 全屏发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"

    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      | 全屏|

######################################无耻的分割线################################

  Scenario: 单张图片
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "单张图片"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择单张图片
    And I click the "Picture" button
    And I hide the element "otherDropdown"
 #设置图表尺寸位置
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1140"
    And I set the parameter "Height" with value "890"
    And I set the parameter "ChartXaxis" with value "300"
    And I set the parameter "ChartYaxis" with value "100"
#添加图片
    And I click the "SinglePicture" button
    And I upload a file with name "/src/test/resources/testdata/image/rizhiyiframe.jpg"
   #全局样式修改名称
    And I click the "globalStyle" button
    And I set the parameter "globalStyleName" with value "单张图片修改"

      #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 单张图片发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"

    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name  |
      | 单张图片|


  Scenario Outline: 删除全屏和单张图片大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 全屏|
      | 单张图片|