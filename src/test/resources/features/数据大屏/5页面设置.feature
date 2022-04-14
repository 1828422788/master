 @galaxee  @galaxee2
Feature: 数据大屏-图层及右键

#  Background:
#     Given I will see the "PublicNavBarPage" page
#     And I wait for "Dashboard" will be visible


  Scenario: 图层 RZY-1921
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "图层"
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
    #    ==============================选择常规图表
    And I wait for "Chart" will be visible
    And I click the "Chart" button
  #    ==============================柱状图
    And I wait for "Bar" will be visible
    And I click the "Bar" button
    #    ==============================饼图
    And I wait for "Pie" will be visible
    And I click the "Pie" button
     #    ==============================基本折线图
    And I wait for "Line" will be visible
    And I click the "Line" button
    
    And I wait for "2000" millsecond
    And I click the "Coverage" button
    And I wait for "2000" millsecond
    Then I will see the element "PictureOne" value is "基本折线图"
    And I will see the element "PictureTwo" value is "基本饼状图"
    And I will see the element "PictureThree" value is "基本柱状图"
    And I wait for "2000" millsecond
    
    And I click the "PictureTwo" button
    And I wait for "2000" millsecond
    And I click the "downMove" button
    And I will see the element "PictureTwo" value is "基本柱状图"
    And I wait for "2000" millsecond

    And I click the "PictureOne" button
    And I click the "downMoveToBottom" button
    Then I will see the element "PictureThree" value is "基本折线图"
    And I wait for "2000" millsecond

    And I click the "upMoveToTop" button
    Then I will see the element "PictureOne" value is "基本折线图"
    And I wait for "2000" millsecond

    And I click the "PictureThree" button
    And I click the "upMove" button
    And I will see the element "PictureOne" value is "基本折线图"
    And I will see the element "PictureTwo" value is "基本饼状图"
    Then I will see the element "PictureThree" value is "基本柱状图"
#===================================================

  Scenario: 背景颜色及发布大屏 RZY-1986,RZY-1751
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "2000" millsecond
    And I click the "Create" button
    And I wait for "2000" millsecond
    And I set the parameter "Name" with value "页面设置"
    And I wait for "3000" millsecond
    And I click the "Ensure" button
    Then I will see the "galaxee.NewCreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "1500" millsecond

    #    ==============================选择样式
    And I wait for "Style" will be visible
    And I click the "Style" button
    And I wait for "2000" millsecond
    #背景颜色 #0f2a42
    And I wait for "PageBackgroundColor" will be visible
    And I set the parameter "PageBackgroundColor" with value "#b3f2d7"
    And I wait for "2000" millsecond
    And I set the parameter "ScreenWidth" with value "1300"
    And I wait for "2000" millsecond
    And I set the parameter "ScreenHidth" with value "1100"
    And I wait for "1500" millsecond
    Then I will see the element "PageBackground" style contains "rgb(179, 242, 215)"
    And I wait for "2000" millsecond
    And I wait for "Release" will be visible
    And I click the "Release" button
    Then I will see the "galaxee.CreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "5000" millsecond
    And I will see the url contains "app/galaxee/publish/"
    And the page's title will be "页面设置 | 编辑器"
    And I wait for "4000" millsecond




  Scenario: 编辑大屏流程 RZY-1931,RZY-1922
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I wait for "2000" millsecond
    And I click the "Edit" button
    Then I will see the "galaxee.NewCreatePage" page
    And switch to another window
    And I close all tabs except main tab
    And I wait for "3000" millsecond
    And the page's title will be "页面设置 | 编辑器"
    And I wait for "5000" millsecond
    And I click the "BackGalaxee" button
    And switch to another window
    And I close all tabs except main tab
    And the page's title will be "galaxee | 数据大屏"












