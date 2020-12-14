@1.2  @galaxee @galaxee2
Feature: 数据大屏-b双轴折线图

#  Background:
#    Given I will see the "PublicNavBarPage" page
#    And I wait for "Dashboard" will be visible

  Scenario: 双轴折线图-X轴-布局-搜索 RZY-1905,RZY-2012,RZY-2013,RZY-2016,RZY-2017,RZY-2015
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "双轴折线图-XY轴-布局-搜索"
    And I click the "Ensure" button
    #双轴折线图
    And I wait for "Chart" will be visible
    And I move the mouse pointer to the "Chart"
    And I wait for "Line2y" will be visible
    And I move the mouse pointer to the "Line2y"
    And I click the "Line2y" button
    And I click the "Style" button
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | bucket timestamp span=2h as ts |stats count(apache.status),dc(apache.status) by apache.status"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible

    And I choose the "apache.status" from the "Xaxis"
    And I wait for "1000" millsecond
    And I choose the "count(apache.status)" from the "FirstYaxis"
    And I wait for "1000" millsecond
    And I choose the "dc(apache.status)" from the "SecondYaxis"

     #样式-尺寸
    And I click the "Style" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "1500"
    And I set the parameter "Height" with value "635"
    And I set the parameter "ChartXaxis" with value "90"
    And I set the parameter "ChartYaxis" with value "170"
# x轴
    And I wait for "XaxisHeader" will be visible
    And I click the "XaxisHeader" button
      #文本
    And I wait for "XaxisWordSize" will be visible
    And I set the parameter "XaxisWordSize" with value "20"
#    And I click the "XaxisWordColor" button
    And I wait for "XColorInput" will be visible
    And I set the parameter "XColorInput" with value "#CF3131"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    And I choose the "bolder" from the "XaxisWordBold"
     #轴标签
    And I set the parameter "XaxisShift" with value "5"
    And I choose the "倾斜" from the "XaxisAngle"
     #显示分割线
    And I click the "XaxisSeparator" button
#    And I switch the "XaxisSeparator" button to "enable"
       #分割线的设置
    And I set the parameter "XDividingLineBold" with value "3"

#    And I click the "XDividingLineColor" button
    And I wait for "XDividingLineColor" will be visible
    And I set the parameter "XDividingLineColor" with value "#CD9080"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible

    And I choose the "dotted" from the "XDividingLineType"
     # 轴线
#    And I click the "xLineColor" button
    And I wait for "xLineColor" will be visible
    And I set the parameter "xLineColor" with value "#26CC55"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    And I set the parameter "XLineBold" with value "4"
#Y1轴
    And I click the "YaxisHeader" button
     #文本
    And I wait for "YaxisWordSize" will be visible
    And I set the parameter "YaxisWordSize" with value "20"
#    And I click the "YaxisWordColor" button
    And I wait for "YColorInput" will be visible
    And I set the parameter "YColorInput" with value "#19B535"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    And I choose the "bold" from the "YaxisWordBold"
     # 轴标签
    And I set the parameter "YaxisShift" with value "10"
    And I choose the "倾斜" from the "YaxisAngle"
     #分割线
    #分割线的设置
    And I set the parameter "Y1DividingLineBold" with value "2"

#    And I click the "Y1DividingLineColor" button
    And I wait for "Y1DividingLineColor" will be visible
    And I set the parameter "Y1DividingLineColor" with value "#BBB80B"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible

    And I choose the "dashed" from the "Y1DividingLineType"
    # 轴线
#    And I click the "Y1LineColor" button
    And I wait for "Y1LineColor" will be visible
    And I set the parameter "Y1LineColor" with value "#CBD50D"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    And I set the parameter "Y1LineBold" with value "4"

#布局
    And I click the "Layout" button
    And I wait for "LayoutBottom" will be visible
    And I set the parameter "LayoutBottom" with value "20"
    And I set the parameter "LayoutLeft" with value "20"
    And I set the parameter "LayoutRight" with value "20"

#数据系列
    And I click the "DataSeries" button
    And I wait for "FirstSeriesBold" will be visible
    And I set the parameter "FirstSeriesBold" with value "5"
    And I click the "Smooth" button
    And I click the "Area" button
    And I set the parameter "SecondSeriesBold" with value "5"
    And I click the "SecondSmooth" button
    And I click the "SecondArea" button

    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


##################################无耻的分割线##############################

  Scenario: 双轴折线图-静态数据 RZY-2014
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "双轴折线图-静态数据"
    And I click the "Ensure" button
    #双轴折线图
    And I click the "Chart" button
    And I wait for "Line2y" will be visible
    And I click the "Line2y" button
    And I click the "Style" button
    #图例
    And I click the "Example" button
    And I set the parameter "ExampleWordSize" with value "20"
#    And I click the "ExampleColor" button
    And I wait for "ExampleColor" will be visible
    And I set the parameter "ExampleColor" with value "#D73535"
    And I click the "EnsureColor" button
#    And I wait for "EnsureColor" will be invisible
    And I choose the "bolder" from the "ExampleWordBold"
    And I choose the "居中" from the "ExampleHorizontal"
    And I choose the "顶部" from the "ExampleVertical"
    #尺寸
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1500"
    And I set the parameter "Height" with value "635"
    And I set the parameter "ChartXaxis" with value "90"
    And I set the parameter "ChartYaxis" with value "170"
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | bucket timestamp span=2h as ts |stats count(apache.status),dc(apache.status) by apache.status"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
      #选择静态数据
    And I click the "dataSourceType" button
    And I click the "statisticsData" button
    And I click the "Ensure" button

    And I wait for "tipsText" will be invisible

    And I choose the "apache.status" from the "Xaxis"
    And I wait for "1000" millsecond
    And I choose the "count(apache.status)" from the "FirstYaxis"
    And I wait for "1000" millsecond
    And I choose the "dc(apache.status)" from the "SecondYaxis"

   #分组
    And I click the "AddGroup" button
    And I choose the "apache.status" from the "Group"
    #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"


##################################无耻的分割线###############################

  Scenario: 双轴折线图-绑定搜索
    And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    When I click the "Create" button
    And I set the parameter "Name" with value "双轴折线图-绑定搜索"
    And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
    And I click the "Other" button
    And I click the "otherSearch" button under some element
    And I hide the element "otherDropdown"
    And I wait for "SplInput" will be visible
    And I set the parameter "SplInput" with value "tag:sample04061424_chart | bucket timestamp span=2h as ts |stats count(apache.status),dc(apache.status) by apache.status"
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
    And I set the parameter "updateFrequency" with value "0.1"
   #双轴折线图
    And I click the "Chart" button
    And I wait for "Line2y" will be visible
    And I click the "Line2y" button
    And I click the "Style" button
    #尺寸
    And I click the "ChartPosition" button
    And I wait for "Width" will be visible
    And I set the parameter "Width" with value "1500"
    And I set the parameter "Height" with value "635"
    And I set the parameter "ChartXaxis" with value "90"
    And I set the parameter "ChartYaxis" with value "170"

      #在数据源类型中选择绑定搜索
    And I click the "Data" button
    And I click the "dataSourceType" button
    And I click the "bindingSearch" button
      #选择上步添加的搜索
    And I click the "bindingSearchChoose" button
    And I click the "search_widget" button
      #再次点击搜索控件中的【搜索按钮】
    And I click the "pictureTwo" button
    And I click the "Search" button
    And I wait for "SearchTip" will be invisible
     #对滚动条形图的参数进行设置
    And I click the "pictureOne" button
    And I click the "Data" button

    And I choose the "apache.status" from the "Xaxis"
    And I wait for "1000" millsecond
    And I choose the "count(apache.status)" from the "FirstYaxis"
    And I wait for "1000" millsecond
    And I choose the "dc(apache.status)" from the "SecondYaxis"


      #保存
    And I wait for "Save" will be visible
    And I wait for "2000" millsecond
    And I click the "Save" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "保存成功"



