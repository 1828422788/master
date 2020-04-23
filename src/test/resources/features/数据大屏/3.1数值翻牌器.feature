@galaxee
Feature: 数据大屏-数值翻牌器

  Background:
#    Given I wait for title change text to "仪表盘"
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 新建默认类型的数值翻牌器
    When I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "Create" button
    And I set the parameter "Name" with value "数值翻牌器"
    And I click the "Ensure" button
    #选择数值翻牌器
    And I click the "Index" button
    And I click the "FlipNumber" button
    And I hide the element "IndexDropdown"
    #样式尺寸
    And I click the "Style" button
    And I click the "ChartPosition" button
    And I set the parameter "Width" with value "760"
    And I set the parameter "Height" with value "370"
    And I set the parameter "ChartXaxis" with value "360"
    And I set the parameter "ChartYaxis" with value "350"
    #数据
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample* | stats count() by apache.clientip,apache.method,apache.resp_len"
    And I click the "DataSearch" button
    And I wait for "SearchTip" will be invisible
    And I choose the "count()" from the "Type"
    And I wait for "Save" will be visible
    And I click the "Save" button
#    Then I will see the success message "保存成功"

  Scenario Outline: 样式设置
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    And I close all tabs except main tab
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
    #样式
    And I click the "Style" button
    And I click the "Flip" button
      #字体
    And I choose the "DINPro-Bold" from the "FlipWord"
    #字体大小
    And I set the parameter "FlipWordSize" with value "62"
    #字体颜色
    And I click the "numberFontColor" button
    And I set the parameter "ColorInput" with value "#D74B7A"
    And I click the "EnsureColor" button
    And I wait for "EnsureColor" will be invisible
    #字体粗细
    And I choose the "bold" from the "FlipNumberWordBold"
    #对齐
     And I choose the "居左" from the "FlipNumberHorizontal"
    #前后缀
    And I set the parameter "Prefix" with value "$"
    And I set the parameter "Suffix" with value "¥"
    #样式1
    And I choose the "样式1" from the "FlipBackgroundStyle"
   #间距
    And I set the parameter "flipSpacing" with value "2"
    And I click the "Save" button
#    Then I will see the success message "保存成功"

    Examples:
      | name  |
      | 数值翻牌器 |




  Scenario Outline: 修改为无样式
    When the galaxee name is "<name>" then I click the "el-button el-button--text" edit button
    And switch to window "<name>"
    And I close all tabs except main tab
    Then I will see the "galaxee.CreatePage" page
    And I click the "pictureOne" button
#    And I click the "Index" button
#    And I click the "FlipNumber" button
    And I wait for "Flip" will be visible
    And I click the "Flip" button
    And I choose the "DINPro-Bold" from the "FlipWord"
    And I set the parameter "FlipWordSize" with value "62"
    And I set the parameter "Prefix" with value "$"
    And I set the parameter "Suffix" with value "¥"
#    And I choose the "K" from the "FlipScaling"
    And I choose the "无" from the "FlipBackgroundStyle"
    And I click the "ChartPosition" button
    And I set the parameter "Height" with value "234"
    And I set the parameter "ChartXaxis" with value "628"
    And I set the parameter "ChartYaxis" with value "400"
    And I click the "Data" button
    And I set the parameter "SplInput" with value "tag:sample* | stats count() by apache.clientip,apache.method,apache.resp_len"
    And I click the "DataSearch" button
    And I wait for "SearchTip" will be invisible
    And I choose the "apache.resp_len" from the "Type"
    And I click the "Save" button
    Then I will see the success message "保存成功"

    Examples:
      | name  |
      | 数值翻牌器 |

  Scenario Outline: 发布页截图
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "1000" millsecond
    Then take a screenshot with name "galaxee/<name>"

    Examples:
      | name  |
      | 数值翻牌器 |


  Scenario Outline: 删除关于| 数值翻牌器 |的大屏
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button

    Examples:
      |name|
      | 数值翻牌器 |