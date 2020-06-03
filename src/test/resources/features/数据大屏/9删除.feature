@galaxeeD
Feature: 数据大屏-所有控件删除

  Scenario Outline: 数据大屏-所有控件删除
    Given open the "galaxee.ListPage" page for uri "/app/galaxee/manager/"
    When the galaxee name is "<name>" then I click the "iconfont icon-shanchuxuanting_icon" delete button
    Then I click the "Ensure" button


    Examples:
      | name |
      | 折线图-搜索 |
      |折线图-静态数据|
      |折线图-绑定搜索|

      | 双轴折线图-XY轴-布局-搜索|
      |双轴折线图-静态数据|
      |双轴折线图-绑定搜索|

      | 区间图XY轴布局搜索 |
      |区间图-图例-静态数据|
      |区间图-绑定搜索|


      |散点图XY轴-布局-搜索 |
      |散点图-图例-分组-静态数据 |
      |散点图-绑定搜索|


      |柱图-图例-分组-静态数据 |
      |X轴Y轴布局设置-搜索  |
      |柱图-数值设置-添加Line-绑定搜索|


      |条形图-样式搜索    |
      |条形图-静态数据  |
      |条形图-绑定搜索 |

      |滚动条形图样式-搜索    |
      |滚动条形图数据之静态数据   |
      |滚动条形图数据之绑定搜索 |

      |滚动柱形图样式-搜索    |
      |滚动柱形图数据之静态数据  |
      |滚动柱形图数据之绑定搜索 |

      |滚动列表样式-搜索    |
      |滚动列表数据之静态数据 |
      |滚动列表数据之绑定搜索 |

      |水平胶囊样式-搜索    |
      |水平胶囊数据之静态数据  |
      |水平胶囊数据之绑定搜索 |


      |滚动列表2样式-搜索    |
      |滚动列表2数据之静态数据 |
      |滚动列表2数据之绑定搜索 |

      |滚动列表3样式-搜索    |
      |滚动列表3数据之静态数据 |
      |滚动列表3数据之绑定搜索 |


      |综合列表样式-搜索    |
      |综合列表数据之静态数据  |
      |综合列表数据之绑定搜索 |

      | 饼图-样式搜索 |
      |饼图-静态数据 |
      |饼图-绑定搜索 |

      | 玫瑰图-样式搜索  |
      |玫瑰图-静态数据 |
      |玫瑰图-绑定搜索 |


      |环形柱图样式-搜索   |
      |环形柱图数据之静态数据   |
      |环形柱图数据之绑定搜索 |

      | 环形占比图-样式搜索 |
      |环形占比图-静态数据  |
      |环形占比图-绑定搜索 |


      |占比图3D数据之样式-搜索   |
      |占比图3D数据之静态数据   |
      |占比图3D数据之绑定搜索 |


      |水球图-样式搜索 |
      |水球图-静态数据  |
      | 水球图-绑定搜索 |


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

#      | 力图-样式搜索 |
#      |力图-静态数据  |
#      |力图-绑定搜索|
#
#      | 桑基图-样式搜索  |
#      |桑基图-静态数据  |
#      |桑基图-绑定搜索 |
#
#      |字符云图样式-搜索    |
#      |字符云图数据之静态数据  |
#      |字符云图数据之绑定搜索 |
#
#      |栅格百分图样式-搜索    |
#      |栅格百分图数据之静态数据   |
#      |栅格百分图数据之绑定搜索 |

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

      |数值翻牌器-样式搜索 |
      |数值翻牌器-静态数据  |
      |数值翻牌器-绑定搜索 |

      |状态图demo |
      |状态图值异常-搜索 |
      |状态图值正常-静态数据 |
      |状态图值严重-绑定搜索 |


      |Top3样式-搜索    |
      |Top3数据之静态数据  |
      |Top3数据之绑定搜索 |

      |百分比样式-搜索       |
      |百分比数据之静态数据  |
      |百分比数据之绑定搜索 |

      |揭示牌样式搜索   |
      |揭示牌数据之静态数据   |
      |揭示牌数据之绑定搜索 |


      |动态卡片样式搜索   |
      |动态卡片数据之静态数据  |
      |动态卡片数据之绑定搜索 |

      |动态卡片二样式搜索   |
      |动态卡片二数据之静态数据  |
      |动态卡片二数据之绑定搜索 |

      | 标题   |

      | 表格   |
      |表格数据之静态数据  |
      |表格数据之绑定搜索 |

      |实体数据之搜索值异常   |
      |实体数据之静态数据值严重   |
      |实体数据之绑定搜索 |


      |流程线默认设置      |
      |流程线样式       |


      | 全屏|


      | 边框默认设置样式1 |
      | 边框样式2 |
      | 边框样式3 |


      | 单张图片|


      |时间器默认设置    |
      |时间器样式   |
      |时间器样式2   |
      |时间器样式3   |

      |视频流   |
      |视频流样式   |

      |齿轮组合默认设置    |
      |齿轮组合样式      |



















