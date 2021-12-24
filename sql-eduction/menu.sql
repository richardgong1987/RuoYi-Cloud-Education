
USE `ry-cloud`;
DELETE
FROM sys_menu
WHERE menu_id >= 3000;

DELETE
FROM sys_menu
WHERE menu_id=4;


        INSERT INTO sys_menu
        VALUES ('3000', '会员管理', '0', '10', 'members', '', NULL, 1, 0, 'M', '0',
                '0', '', 'product', 'admin', SYSDATE(), '', NULL, '会员管理-目录');
    
        INSERT INTO sys_menu
        VALUES ('3001', '班级管理', '3000', '1', 'classesManagement', 'members/classesManagement/index',
                '', 1, 0, 'C', '0', '0', 'members:classesManagement:list', 'product-list', 'admin', SYSDATE(), '', NULL, '班级管理-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3002', '查询', '3001', '1', '', '', '', 1, 0, 'F', '0', '0', 'members:classesManagement:query',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3003', '添加', '3001', '2', '', '', '', 1, 0, 'F', '0', '0', 'members:classesManagement:add',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3004', '编辑', '3001', '3', '', '', '', 1, 0, 'F', '0', '0', 'members:classesManagement:edit',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3005', '删除', '3001', '4', '', '', '', 1, 0, 'F', '0', '0', 'members:classesManagement:remove',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3006', '导入', '3001', '5', '', '', '', 1, 0, 'F', '0', '0', 'members:classesManagement:import',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3007', '导出', '3001', '6', '', '', '', 1, 0, 'F', '0', '0', 'members:classesManagement:export',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3008', '学校管理', '3000', '2', 'schoolsManagement', 'members/schoolsManagement/index',
                '', 1, 0, 'C', '0', '0', 'members:schoolsManagement:list', 'product-list', 'admin', SYSDATE(), '', NULL, '学校管理-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3009', '查询', '3008', '1', '', '', '', 1, 0, 'F', '0', '0', 'members:schoolsManagement:query',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3010', '添加', '3008', '2', '', '', '', 1, 0, 'F', '0', '0', 'members:schoolsManagement:add',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3011', '编辑', '3008', '3', '', '', '', 1, 0, 'F', '0', '0', 'members:schoolsManagement:edit',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3012', '删除', '3008', '4', '', '', '', 1, 0, 'F', '0', '0', 'members:schoolsManagement:remove',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3013', '导入', '3008', '5', '', '', '', 1, 0, 'F', '0', '0', 'members:schoolsManagement:import',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3014', '导出', '3008', '6', '', '', '', 1, 0, 'F', '0', '0', 'members:schoolsManagement:export',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3015', '学生管理', '3000', '3', 'studentsManagement', 'members/studentsManagement/index',
                '', 1, 0, 'C', '0', '0', 'members:studentsManagement:list', 'product-list', 'admin', SYSDATE(), '', NULL, '学生管理-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3016', '查询', '3015', '1', '', '', '', 1, 0, 'F', '0', '0', 'members:studentsManagement:query',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3017', '添加', '3015', '2', '', '', '', 1, 0, 'F', '0', '0', 'members:studentsManagement:add',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3018', '编辑', '3015', '3', '', '', '', 1, 0, 'F', '0', '0', 'members:studentsManagement:edit',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3019', '删除', '3015', '4', '', '', '', 1, 0, 'F', '0', '0', 'members:studentsManagement:remove',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3020', '导入', '3015', '5', '', '', '', 1, 0, 'F', '0', '0', 'members:studentsManagement:import',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3021', '导出', '3015', '6', '', '', '', 1, 0, 'F', '0', '0', 'members:studentsManagement:export',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3022', '会员管理', '3000', '4', 'membershipsManagement', 'members/membershipsManagement/index',
                '', 1, 0, 'C', '0', '0', 'members:membershipsManagement:list', 'product-list', 'admin', SYSDATE(), '', NULL, '会员管理-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3023', '查询', '3022', '1', '', '', '', 1, 0, 'F', '0', '0', 'members:membershipsManagement:query',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3024', '添加', '3022', '2', '', '', '', 1, 0, 'F', '0', '0', 'members:membershipsManagement:add',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3025', '编辑', '3022', '3', '', '', '', 1, 0, 'F', '0', '0', 'members:membershipsManagement:edit',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3026', '删除', '3022', '4', '', '', '', 1, 0, 'F', '0', '0', 'members:membershipsManagement:remove',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3027', '导入', '3022', '5', '', '', '', 1, 0, 'F', '0', '0', 'members:membershipsManagement:import',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3028', '导出', '3022', '6', '', '', '', 1, 0, 'F', '0', '0', 'members:membershipsManagement:export',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-导出-按钮');
    