
USE `ry-cloud`;
DELETE
FROM sys_menu
WHERE menu_id >= 3000;

DELETE
FROM sys_menu
WHERE menu_id=4;


        INSERT INTO sys_menu
        VALUES ('3000', '会员管理', '0', '10', 'peoples', '', NULL, 1, 0, 'M', '0',
                '0', '', 'product', 'admin', SYSDATE(), '', NULL, '会员管理-目录');
    
        INSERT INTO sys_menu
        VALUES ('3001', '学校管理', '3000', '1', 'managementSchools', 'peoples/managementSchools/index',
                '', 1, 0, 'C', '0', '0', 'peoples:managementSchools:list', 'product-list', 'admin', SYSDATE(), '', NULL, '学校管理-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3002', '查询', '3001', '1', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:query',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3003', '添加', '3001', '2', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:add',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3004', '编辑', '3001', '3', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:edit',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3005', '删除', '3001', '4', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:remove',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3006', '导入', '3001', '5', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:import',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3007', '导出', '3001', '6', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:export',
                '#', 'admin', SYSDATE(), '', NULL, '学校管理-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3008', '班级管理', '3000', '2', 'managementClasses', 'peoples/managementClasses/index',
                '', 1, 0, 'C', '0', '0', 'peoples:managementClasses:list', 'product-list', 'admin', SYSDATE(), '', NULL, '班级管理-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3009', '查询', '3008', '1', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:query',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3010', '添加', '3008', '2', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:add',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3011', '编辑', '3008', '3', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:edit',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3012', '删除', '3008', '4', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:remove',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3013', '导入', '3008', '5', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:import',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3014', '导出', '3008', '6', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:export',
                '#', 'admin', SYSDATE(), '', NULL, '班级管理-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3015', '学生管理', '3000', '3', 'managementStudents', 'peoples/managementStudents/index',
                '', 1, 0, 'C', '0', '0', 'peoples:managementStudents:list', 'product-list', 'admin', SYSDATE(), '', NULL, '学生管理-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3016', '查询', '3015', '1', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:query',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3017', '添加', '3015', '2', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:add',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3018', '编辑', '3015', '3', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:edit',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3019', '删除', '3015', '4', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:remove',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3020', '导入', '3015', '5', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:import',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3021', '导出', '3015', '6', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:export',
                '#', 'admin', SYSDATE(), '', NULL, '学生管理-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3022', '会员管理', '3000', '4', 'managementMemberships', 'peoples/managementMemberships/index',
                '', 1, 0, 'C', '0', '0', 'peoples:managementMemberships:list', 'product-list', 'admin', SYSDATE(), '', NULL, '会员管理-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3023', '查询', '3022', '1', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:query',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3024', '添加', '3022', '2', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:add',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3025', '编辑', '3022', '3', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:edit',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3026', '删除', '3022', '4', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:remove',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3027', '导入', '3022', '5', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:import',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3028', '导出', '3022', '6', '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:export',
                '#', 'admin', SYSDATE(), '', NULL, '会员管理-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3029', '资料管理', '0', '20', 'material', '', NULL, 1, 0, 'M', '0',
                '0', '', 'upload', 'admin', SYSDATE(), '', NULL, '资料管理-目录');
    
        INSERT INTO sys_menu
        VALUES ('3030', '文件网盘', '3029', '1', 'fileDrive', 'material/fileDrive/index',
                '', 1, 0, 'C', '0', '0', 'material:fileDrive:list', 'dengji', 'admin', SYSDATE(), '', NULL, '文件网盘-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3031', '查询', '3030', '1', '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:query',
                '#', 'admin', SYSDATE(), '', NULL, '文件网盘-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3032', '添加', '3030', '2', '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:add',
                '#', 'admin', SYSDATE(), '', NULL, '文件网盘-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3033', '编辑', '3030', '3', '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:edit',
                '#', 'admin', SYSDATE(), '', NULL, '文件网盘-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3034', '删除', '3030', '4', '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:remove',
                '#', 'admin', SYSDATE(), '', NULL, '文件网盘-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3035', '导入', '3030', '5', '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:import',
                '#', 'admin', SYSDATE(), '', NULL, '文件网盘-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3036', '导出', '3030', '6', '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:export',
                '#', 'admin', SYSDATE(), '', NULL, '文件网盘-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3037', '老师管理', '0', '30', 'teachers', '', NULL, 1, 0, 'M', '0',
                '0', '', 'example', 'admin', SYSDATE(), '', NULL, '老师管理-目录');
    
        INSERT INTO sys_menu
        VALUES ('3038', '老师信息', '3037', '1', 'teacherInfos', 'teachers/teacherInfos/index',
                '', 1, 0, 'C', '0', '0', 'teachers:teacherInfos:list', 'article', 'admin', SYSDATE(), '', NULL, '老师信息-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3039', '查询', '3038', '1', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:query',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3040', '添加', '3038', '2', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:add',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3041', '编辑', '3038', '3', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:edit',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3042', '删除', '3038', '4', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:remove',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3043', '导入', '3038', '5', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:import',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3044', '导出', '3038', '6', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:export',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-导出-按钮');
    