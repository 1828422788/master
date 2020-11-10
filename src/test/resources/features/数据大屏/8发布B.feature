@galaxeeRB   @galaxee @galaxeeR
Feature: 数据大屏-所有控件发布

  Scenario Outline: 数据大屏-所有控件发布
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    And I wait for "7000" millsecond
    When the galaxee name is "<name>" then I click the "iconfont icon-fabu" release button
    And switch to window "<name>"
    And I close all tabs except main tab
    And I wait for "Loading" will be invisible
    And I wait for "2000" millsecond
#    Then take a screenshot with name "galaxee/<name>"


    Examples:
      | name |
      | 弧形柱图-样式搜索 |
      |弧形柱图-静态数据   |
      | 弧形柱图-绑定搜索|

      | 旭日图-样式搜索|
      |旭日图-静态数据   |
      | 旭日图-绑定搜索 |

      | 和弦图-样式搜索 |
      |和弦图-静态数据   |
      |和弦图-绑定搜索 |

      |雷达图样式-搜索|
      |雷达图数据之静态数据   |
      |雷达图数据之绑定搜索 |

      | 力图-样式搜索 |
      |力图-静态数据  |
      |力图-绑定搜索|

      | 桑基图-样式搜索  |
      |桑基图-静态数据  |
      |桑基图-绑定搜索 |

      |字符云图样式-搜索    |
      |字符云图数据之静态数据  |
      |字符云图数据之绑定搜索 |

      |栅格百分图样式-搜索    |
      |栅格百分图数据之静态数据   |
      |栅格百分图数据之绑定搜索 |


      |中国地图-样式搜索   |
      | 中国地图四川-静态数据 |
      |中国地图四川-绑定搜索|

      |热力地图-样式搜索 |
      |热力地图-静态数据   |
      |热力地图-绑定搜索 |

      |中国地图II样式-搜素    |
      |中国地图II数据之静态数据   |
      |中国地图II数据之绑定搜索 |

      | 世界地图-样式搜索 |
      |世界地图-静态数据 |
      |世界地图-绑定搜索|

      | 攻击地图-样式搜索 |
      |攻击地图-静态数据 |
      |攻击地图-绑定搜索|

      | 攻击地图3D样式-搜索 |
      |攻击地图3D-静态数据 |
      |攻击地图3D-绑定搜索|

      |攻击地图3DII样式-搜索    |
      |攻击地图3DII数据之静态数据 |
      |攻击地图3DII数据之绑定数据 |

      | 地理分布样式-搜索 |
      |地理分布-静态数据 |
      |地理分布-绑定搜索 |



















