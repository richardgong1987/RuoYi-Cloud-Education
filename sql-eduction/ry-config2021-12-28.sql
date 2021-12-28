DELETE
FROM `ry-config`.config_info
WHERE id = 6;

INSERT INTO `config_info`
VALUES (6, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP',
        '# spring配置\nspring: \n  redis:\n    host: localhost\n    port: 6379\n    password: \n  datasource: \n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\n    username: root\n    password: password\n\n# mybatis配置\nmybatis:\n    # 搜索指定包别名\n    typeAliasesPackage: com.ruoyi.gen.domain\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\n    mapperLocations: classpath:mapper/**/*.xml\n\n# swagger配置\nswagger:\n  title: 代码生成接口文档\n  license: Powered By ruoyi\n  licenseUrl: https://ruoyi.vip\n\n# 代码生成\ngen: \n  # 作者\n  author: ruoyi\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\n  packageName: com.ruoyi.system\n  # 自动去除表前缀，默认是false\n  autoRemovePre: false\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\n  tablePrefix: sys_\n  \n  #默认插入到项目的java目录\n  genModulePath: /ruoyi-modules-eduction\n  \n  #默认插入到项目的前端目录\n  genUIPath: /ruoyi-ui\n\n',
        'bc3c17177b9f1b9bcff7af100890cfb2', '2020-11-20 00:00:00', '2021-12-28 15:45:00', '', '0:0:0:0:0:0:0:1', '', '',
        '代码生成', 'null', 'null', 'yaml', 'null');
