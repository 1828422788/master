 @galaxee  @galaxee1
Feature: 数据大屏-模版

#  Background:
#     Given I will see the "PublicNavBarPage" page
#     And I wait for "Dashboard" will be visible


  Scenario: 银行运维模版 RZY-1926
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "BankTemplate" button
    And I click the "Create" button
    And I set the parameter "Name" with value "银行运维test"
    And I click the "Ensure" button
    Then I wait for title change text to "银行运维test"
    And I will see the element "PictureOne" value is "表格"
    And I will see the element "PictureTwo" value is "表格"
    And I will see the element "PictureThree" value is "折线图"

  Scenario: 保存为模板1 RZY-2885
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "模版test"
    And I click the "Ensure" button

    #折线图
    And I click the "Chart" button
    And I wait for "Line" will be visible
    And I click the "Line" button
    And I click the "Style" button

#布局
    And I click the "Layout" button
    And I wait for "LayoutBottom" will be visible
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"

    And I wait for "ChartPosition" will be visible
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1200"
    And I set the parameter "Height" with value "636"
    And I set the parameter "ChartXaxis" with value "300"
    And I set the parameter "ChartYaxis" with value "240"
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "starttime="now/d" endtime="now/d+24h" tag:sample04061424_chart | bucket timestamp span=2000s as ts| stats count() by ts | sort by +ts"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible


    And I choose the "ts" from the "Xaxis"
    And I wait for "1000" millsecond
    And I choose the "count()" from the "Yaxis"

    And I wait for "SaveAsTemplate" will be visible
    And I wait for "2000" millsecond
    And I click the "SaveAsTemplate" button
    And I wait for "3000" millsecond
    Then I wait for "OprateSuccess" will be visible

  Scenario: 保存为模板2 RZY-2885
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "TemplateTest" button
    And I click the "Create" button
    And I set the parameter "Name" with value "模版test2"
    And I click the "Ensure" button
    Then I wait for title change text to "模版test2"
    And I will see the element "PictureOne" value is "折线图"

  Scenario: 模版管理 RZY-2963
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I move the mouse pointer to the "BankTemplate"
    And I will see the "BankTemplateDelete" doesn't exist
    And I move the mouse pointer to the "TemplateTest"
    And I wait for "TemplateDelete" will be visible
    And I click the "TemplateDelete" button
    And I click the "CancelT" button
    And I move the mouse pointer to the "TemplateTest"
    And I click the "TemplateDelete" button
    And I click the "EnsureT" button
    Then I wait for "DeleteSuccess" will be visible











