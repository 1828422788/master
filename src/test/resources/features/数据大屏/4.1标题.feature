@galaxeeWord @galaxee  @galaxee2  @4.1
Feature: 数据大屏-h标题

#  Background:
#     Given I will see the "PublicNavBarPage" page
#     And I wait for "Dashboard" will be visible


  Scenario: 标题
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "标题"
    And I click the "Ensure" button
    And I click the "Word" button
    And I click the "TitleImg" button
    And I hide the element "wordDropdown"
    #样式
    And I click the "Style" button
    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "560"
    And I set the parameter "Height" with value "280"
    And I set the parameter "ChartXaxis" with value "434"
    And I set the parameter "ChartYaxis" with value "390"
    #字体大小
    And I click the "Title" button
    And I set the parameter "WordSize" with value "62"
    #字体颜色
    And I click the "ColorInner" button
    And I wait for "ColorInput" will be visible
    And I set the parameter "ColorInput" with value "#9FF50B"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #字体粗细
    And I choose the "lighter" from the "TitleWordBold"
    #对齐
    And I choose the "居中" from the "TitleHorizontal"
    #角度
    And I set the parameter "TitleAngle" with value "49"
    #动画
    And I click the "dynamic" button
    #数据
    And I click the "Data" button
    And I set the parameter "Content" with value "数据模块"
  #保存
    And I wait for "Save" will be visible
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"

  Scenario Outline: 发布页截图
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"
    #删除
    Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      | name |
      | 标题   |



