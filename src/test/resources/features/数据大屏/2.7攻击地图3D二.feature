@galaxeeMap @galaxee
  Feature: 数据大屏-攻击地图3D II

    Background:
      Given I will see the "PublicNavBarPage" page
      And I wait for "Dashboard" will be visible

    Scenario: 攻击地图3DII之样式-搜索
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "攻击地图3DII样式-搜索"
      And I click the "Ensure" button
      #选择上方的地图
      And I click the "Map" button
      #选择攻击地图3D II
      And I click the "attackMapThreeDTwo" button
      And I click the "Style" button
#设置样式
      #1 设置图表尺寸位置
      And I click the "ChartPosition" button
      And I set the parameter "Width" with value "700"
      And I set the parameter "Height" with value "500"
      And I set the parameter "ChartXaxis" with value "600"
      And I set the parameter "ChartYaxis" with value "300"
      #2 设置地图->事件颜色
      And I click the "GlobelabelMapHeader" button
      And I click the "EventColor" button
      And I set the parameter "ColorInput" with value "#F2321D"
      And I click the "EnsureColor" button
      And I wait for "EnsureColor" will be invisible
      #3 全局样式修改名成
      And I click the "globalStyle" button
      And I set the parameter "globalStyleName" with value "攻击地图3DII样式修改"
      #开启背景动画
      And I click the "backgroundAuto" button
       #数据设置（数据源类型默认：搜索）
      And I click the "Data" button
      And I set the parameter "SplInput" with value "logtype:apache | parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" | bucket timestamp span=1h as ts| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address,ts | eval gw_lat=39.5427 | eval gw_lon=116.2317"
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      #修改更新频率为"0.1",这样容易看出变化来
      And I set the parameter "updateFrequency" with value "0.1"
      And I choose the "client_lat" from the "SourceLatitude"
      And I choose the "client_lon" from the "SourceLongitude"
      And I choose the "gw_lat" from the "TargetLatitude"
      And I choose the "gw_lon" from the "TargetLongitude"
      And I choose the "ts" from the "Time"
      And I choose the "cnt" from the "MeasureValue"
      And I click the "Update" button
      #保存
      And I wait for "Save" will be visible
      And I wait for "2000" millsecond
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 攻击地图3DII样式-搜索设置发布并截图
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"
      #删除
      Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-shanchu1" delete button
      Then I click the "Ensure" button

      Examples:
        |name              |
        |攻击地图3DII样式-搜索    |


######################################无耻的分割线################################

    Scenario: 攻击地图3DII之数据设置(数据源类型：静态数据)
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      And I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "攻击地图3DII数据之静态数据"
      And I click the "Ensure" button
      #选择上方的地图
      And I click the "Map" button
      #选择攻击地图3D II
      And I click the "attackMapThreeDTwo" button
      And I click the "Style" button
      #开启背景动画
      And I click the "globalStyle" button
      And I click the "backgroundAuto" button
      #数据设置
      And I click the "Data" button
      And I click the "dataSourceType" button
      #选择静态数据
      And I click the "statisticsData" button
      And I click the "Ensure" button
      And I wait for "3000" millsecond

      And I choose the "start_lat" from the "SourceLatitude"
      And I choose the "start_lon" from the "SourceLongitude"
      And I choose the "target_lat" from the "TargetLatitude"
      And I choose the "target_lon" from the "TargetLongitude"
      And I choose the "timestamp" from the "Time"
      And I choose the "count" from the "MeasureValue"
      And I click the "Update" button
      #保存
      And I wait for "Save" will be visible
      And I wait for "2000" millsecond
      And I click the "Save" button
      Then I will see the success message "保存成功"

    Scenario Outline: 攻击地图3DII数据之静态数据发布并截图
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"
      #删除
      Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-shanchu1" delete button
      Then I click the "Ensure" button

      Examples:
        |name                    |
        |攻击地图3DII数据之静态数据 |

######################################无耻的分割线################################

    Scenario: 攻击地图3DII之数据设置(数据源类型：绑定搜索)

      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      And I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "攻击地图3DII数据之绑定数据"
      And I click the "Ensure" button
      #在【其他】中添加一个【搜索】控件
      And I click the "Other" button
      And I click the "otherSearch" button
      And I set the parameter "SplInput" with value "logtype:apache | parse field=apache.request_query "^gw_address=(?<gw_address>\d+\.\d+\.\d+\.\d+)" | bucket timestamp span=1h as ts| stats count() as cnt, min(apache.geo.latitude) as client_lat, min(apache.geo.longitude) as client_lon by apache.clientip, gw_address,ts | eval gw_lat=39.5427 | eval gw_lon=116.2317"
      And I click the "Search" button
      And I wait for "SearchTip" will be invisible
      And I set the parameter "updateFrequency" with value "0.1"
      #选择上方的地图
      And I click the "Map" button
      #选择攻击地图3D II
      And I click the "attackMapThreeDTwo" button
      And I click the "Style" button
      #开启背景动画
      And I click the "globalStyle" button
      And I click the "backgroundAuto" button
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
     #对中国地图二的参数进行设置
      And I click the "pictureOne" button
      And I click the "Data" button
      And I wait for "3000" millsecond

      And I choose the "client_lat" from the "SourceLatitude"
      And I choose the "client_lon" from the "SourceLongitude"
      And I choose the "gw_lat" from the "TargetLatitude"
      And I choose the "gw_lon" from the "TargetLongitude"
      And I choose the "ts" from the "Time"
      And I choose the "cnt" from the "MeasureValue"
      And I click the "Update" button
      #保存
      And I click the "Save" button
      Then I will see the success message "保存成功"

    Scenario Outline: 攻击地图3DII数据之绑定数据发布并截图
      Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"
      #删除
      Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-shanchu1" delete button
      Then I click the "Ensure" button

      Examples:
        |name                    |
        |攻击地图3DII数据之绑定数据 |










