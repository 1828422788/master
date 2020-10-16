 @galaxee  @galaxee2
Feature: 数据大屏-图层及右键

#  Background:
#     Given I will see the "PublicNavBarPage" page
#     And I wait for "Dashboard" will be visible


  Scenario: 图层 RZY-1921
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "图层"
    And I click the "Ensure" button
    #添加折线图/饼图/折线图
    And I click the "Chart" button
    And I wait for "Line" will be visible
    And I click the "Line" button
    And I wait for "Pie" will be visible
    And I click the "Pie" button
    And I wait for "Bar" will be visible
    And I click the "Bar" button
    And I hide the element "ChartDropdown"
    Then I will see the element "PictureOne" value is "柱图"
    And I will see the element "PictureTwo" value is "饼图"
    And I will see the element "PictureThree" value is "折线图"

    And I click the "downMove" button
    And I will see the element "PictureTwo" value is "柱图"

    And I click the "PictureOne" button
    And I click the "downMoveToBottom" button
    Then I will see the element "PictureThree" value is "饼图"

    And I click the "upMoveToTop" button
    Then I will see the element "PictureOne" value is "饼图"

    And I click the "PictureThree" button
    And I click the "upMove" button
    And I will see the element "PictureOne" value is "饼图"
    And I will see the element "PictureTwo" value is "折线图"
    Then I will see the element "PictureThree" value is "柱图"

  Scenario: 背景颜色
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "页面设置"
    And I click the "Ensure" button
    #背景颜色 #0f2a42
    And I wait for loading complete
    And I wait for "PageBackgroundColor" will be visible
    And I set the parameter "PageBackgroundColor" with value "#b3f2d7"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
#    Then I will see the element "PageBackground" attribute "<string>" is "<string>"
    Then I will see the element "PageBackground" style contains "rgb(179, 242, 215)"
    And I wait for "2000" millsecond
    And I wait for "Release" will be visible
    And I click the "Release" button
    And switch to window "页面设置"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I will see the url contains "app/galaxee/show/?name=页面设置"

  Scenario: 编辑大屏流程
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "页面设置"
    And I click the "Ensure" button
    #背景颜色 #0f2a42
    And I wait for loading complete
    And I wait for "PageBackgroundColor" will be visible
    And I set the parameter "PageBackgroundColor" with value "#D74B7A"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
#    Then I will see the element "PageBackground" attribute "<string>" is "<string>"
    Then I will see the element "PageBackground" style contains "rgb(215, 75, 122)"









