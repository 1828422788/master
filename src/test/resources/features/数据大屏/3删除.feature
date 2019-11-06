@cleanGalaxee
Feature: 数据大屏删除

  Background:
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"

  Scenario: 删除模版
    And I click the "Create" button
    Then I will see the "galaxee.CreatePage" page
    And I click the "GalaxeeTest" button
    And I click the "Delete" button
    And I click the "EnsureDelete" button
    Then I will see the success message "删除成功！"

  Scenario Outline: 删除大屏
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" button
    Then I click the "Ensure" button

    Examples:
      | name   |
      | 世界地图   |
      | 中国地图   |
      | 其他组件   |
      | 力图     |
      | 区间图    |
      | 双轴折线图  |
      | 和弦图    |
      | 地理分布   |
      | 弧形柱图   |
      | 折线图    |
      | 攻击地图   |
      | 攻击地图3D |
      | 散点图    |
      | 数值翻牌器  |
      | 旭日图    |
      | 条形图    |
      | 柱图     |
      | 标题     |
      | 桑基图    |
      | 水球图    |
      | 热力地图   |
      | 状态图    |
      | 玫瑰图    |
      | 环形占比图  |
      | 表格     |
      | 饼图     |
