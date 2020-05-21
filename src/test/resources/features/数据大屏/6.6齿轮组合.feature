@galaxeeOther @galaxee @galaxee2  @6.6
  Feature: 数据大屏-齿轮组合
#    Background:
#      Given I will see the "PublicNavBarPage" page
#      And I wait for "Dashboard" will be visible

    Scenario: 齿轮组合默认设置
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "齿轮组合默认设置"
      And I click the "Ensure" button
      #选择齿轮组合
      And I click the "Other" button
      And I wait for "1000" millsecond
      And I wait for "gearCombination" will be visible
      And I click the "gearCombination" button
      #保存
      And I wait for "Save" will be visible
      And I wait for "2000" millsecond
      And I click the "Save" button
      Then I will see the success message "保存成功"


    Scenario Outline: 齿轮组合默认设置发布并截图
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
        |齿轮组合默认设置    |

######################################无耻的分割线################################

    Scenario: 齿轮组合样式
      And open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
      When I click the "Create" button
      Then I will see the "galaxee.CreatePage" page
      When I click the "Create" button
      And I set the parameter "Name" with value "齿轮组合样式"
      And I click the "Ensure" button
      #选择齿轮组合
      And I click the "Other" button
      And I wait for "1000" millsecond
      And I wait for "gearCombination" will be visible
      And I click the "gearCombination" button
#设置样式
      And I wait for "2000" millsecond
      And I click the "Style" button
      #1 设置图表尺寸位置
      And I wait for "ChartPosition" will be visible
      And I click the "ChartPosition" button
      And I set the parameter "Width" with value "400"
      And I set the parameter "Height" with value "400"
      And I set the parameter "ChartXaxis" with value "750"
      And I set the parameter "ChartYaxis" with value "350"
      #2设置齿轮组合外观
      And I click the "styleGearCombination" button
      #光环颜色
     And I click the "haloColor" button
     And I set the parameter "ColorInput" with value "#E8EB1B"
     And I click the "EnsureColor" button
      And I wait for "EnsureColor" will be invisible
      #背景颜色
      And I click the "backgroundColor" button
     And I set the parameter "ColorInput" with value "#C120C4"
     And I click the "EnsureColor" button
      And I wait for "EnsureColor" will be invisible
      #关闭图层1
      And I click the "showLayerOne" button
       #关闭图层2
      And I click the "showLayerTwo" button
      #关闭图层3
      And I click the "showLayerThree" button

       #3 全局样式修改名成
      And I click the "globalStyle" button
      And I set the parameter "globalStyleName" with value "齿轮组合样式修改"
       #保存
      And I click the "Save" button
      Then I will see the success message "保存成功"

    Scenario Outline: 齿轮组合样式发布并截图

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
        |齿轮组合样式      |



