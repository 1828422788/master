@galaxeeNet @galaxee  @galaxee2   @5.2
  Feature: 数据大屏-k流程线
#    Background:
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible

    Scenario: 流程线默认设置

      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "流程线默认设置"
      And I click the "Ensure" button
      #选择上方的网络
      And I click the "net" button
      #选择流程线
      And I click the "flowLine" button
      And I hide the element "netDropdown"
       #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      And I wait for "SuccessMessage" will be visible
      Then I will see the success message "保存成功"


    Scenario Outline: 流程线默认设置发布并截图

      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"
      #删除
      Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
      Then I click the "Ensure" button

      Examples:
        |name            |
        |流程线默认设置      |

######################################无耻的分割线################################

    Scenario: 流程线样式

      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "流程线样式"
      And I click the "Ensure" button
       #选择上方的网络
      And I click the "net" button
      #选择流程线
      And I click the "flowLine" button
      And I hide the element "netDropdown"
      And I click the "Style" button
      And I wait for "ChartPosition" will be visible
#设置样式
      #1 设置图表尺寸位置

      And I click the "ChartPosition" button
      And I wait for "Width" will be visible
      And I set the parameter "Width" with value "400"
      And I set the parameter "Height" with value "400"
      And I set the parameter "ChartXaxis" with value "800"
      And I set the parameter "ChartYaxis" with value "400"
      #2设置流程线外观
      And I click the "styleFlowLine" button
      #流程线大小
      And I set the parameter "flowLineSize" with value "400"
      #流程线粗细
      And I set the parameter "flowLineCoarseness" with value "10"
      #流程线颜色
      And I click the "flowLineColor" button
      And I wait for "ColorInput" will be visible
      And I set the parameter "ColorInput" with value "#9FF50B"
      And I click the "EnsureColor" button
      And I wait for "EnsureColor" will be invisible
      #角度
      And I set the parameter "angle" with value "90"
      #标注颜色
      And I click the "taggingColor" button
      And I wait for "ColorInput" will be visible
      And I set the parameter "ColorInput" with value "#55B11F"
      And I click the "EnsureColor" button
      And I wait for "EnsureColor" will be invisible
      #标注大小
      And I set the parameter "taggingSize" with value "20"
      And I click the "arcs" button
      And I click the "arcsFlip" button
       #3 全局样式修改名成
      And I click the "globalStyle" button
      And I set the parameter "globalStyleName" with value "流程线样式修改"
      #保存
      And I wait for "Save" will be visible
      And I click the "Save" button
      And I wait for "SuccessMessage" will be visible
      Then I will see the success message "保存成功"


    Scenario Outline: 流程线样式发布并截图

      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
      And switch to window "<name>"
      And I close all tabs except main tab
      And I wait for loading invisible
      Then take a screenshot with name "galaxee/<name>"
      #删除
      Then open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
      Then I click the "Ensure" button

      Examples:
        |name           |
        |流程线样式       |



