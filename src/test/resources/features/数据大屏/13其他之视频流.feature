@galaxee
Feature: 数据大屏-视频流

  Scenario: 视频流
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "视频流"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择视频流
    And I click the "videoFlow" button
    And I wait for loading invisible
      #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"


  Scenario Outline: 视频流发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"

    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |视频流   |


 ######################################无耻的分割线################################

  Scenario: 视频流样式
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "视频流样式"
    And I click the "Ensure" button
      #选择上方的其他
    And I click the "Other" button
      #选择视频流
    And I click the "videoFlow" button
#设置样式
      #1 设置图表尺寸位置
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "700"
    And I set the parameter "Height" with value "400"
    And I set the parameter "ChartXaxis" with value "550"
    And I set the parameter "ChartYaxis" with value "350"
     #修改样式
    And I click the "styleVideoFlow" button
    And I set the parameter "videoAddress" with value "https://media.w3.org/2010/05/sintel/trailer.mp4"
       #3 全局样式修改名成
    And I click the "globalStyle" button
    And I wait for loading invisible
    And I set the parameter "globalStyleName" with value "视频流样式"
       #保存
    And I click the "Save" button
    Then I will see the success message "保存成功"

  Scenario Outline: 视频流样式发布并截图
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"

    And I wait for loading invisible
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      |name            |
      |视频流样式   |


  Scenario Outline: 删除关于视频流的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      |视频流   |
      |视频流样式   |