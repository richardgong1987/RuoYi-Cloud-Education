
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
        VALUES ('3030', '上传文件', '3029', '1', 'managementUpload', 'material/managementUpload/index',
                '', 1, 0, 'C', '0', '0', 'material:managementUpload:list', 'dengji', 'admin', SYSDATE(), '', NULL, '上传文件-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3031', '查询', '3030', '1', '', '', '', 1, 0, 'F', '0', '0', 'material:managementUpload:query',
                '#', 'admin', SYSDATE(), '', NULL, '上传文件-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3032', '添加', '3030', '2', '', '', '', 1, 0, 'F', '0', '0', 'material:managementUpload:add',
                '#', 'admin', SYSDATE(), '', NULL, '上传文件-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3033', '编辑', '3030', '3', '', '', '', 1, 0, 'F', '0', '0', 'material:managementUpload:edit',
                '#', 'admin', SYSDATE(), '', NULL, '上传文件-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3034', '删除', '3030', '4', '', '', '', 1, 0, 'F', '0', '0', 'material:managementUpload:remove',
                '#', 'admin', SYSDATE(), '', NULL, '上传文件-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3035', '导入', '3030', '5', '', '', '', 1, 0, 'F', '0', '0', 'material:managementUpload:import',
                '#', 'admin', SYSDATE(), '', NULL, '上传文件-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3036', '导出', '3030', '6', '', '', '', 1, 0, 'F', '0', '0', 'material:managementUpload:export',
                '#', 'admin', SYSDATE(), '', NULL, '上传文件-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3037', '目录管理', '3029', '2', 'managementDirectory', 'material/managementDirectory/index',
                '', 1, 0, 'C', '0', '0', 'material:managementDirectory:list', 'dengji', 'admin', SYSDATE(), '', NULL, '目录管理-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3038', '查询', '3037', '1', '', '', '', 1, 0, 'F', '0', '0', 'material:managementDirectory:query',
                '#', 'admin', SYSDATE(), '', NULL, '目录管理-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3039', '添加', '3037', '2', '', '', '', 1, 0, 'F', '0', '0', 'material:managementDirectory:add',
                '#', 'admin', SYSDATE(), '', NULL, '目录管理-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3040', '编辑', '3037', '3', '', '', '', 1, 0, 'F', '0', '0', 'material:managementDirectory:edit',
                '#', 'admin', SYSDATE(), '', NULL, '目录管理-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3041', '删除', '3037', '4', '', '', '', 1, 0, 'F', '0', '0', 'material:managementDirectory:remove',
                '#', 'admin', SYSDATE(), '', NULL, '目录管理-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3042', '导入', '3037', '5', '', '', '', 1, 0, 'F', '0', '0', 'material:managementDirectory:import',
                '#', 'admin', SYSDATE(), '', NULL, '目录管理-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3043', '导出', '3037', '6', '', '', '', 1, 0, 'F', '0', '0', 'material:managementDirectory:export',
                '#', 'admin', SYSDATE(), '', NULL, '目录管理-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3044', '绘本管理', '3029', '3', 'managementPicturebook', 'material/managementPicturebook/index',
                '', 1, 0, 'C', '0', '0', 'material:managementPicturebook:list', 'dengji', 'admin', SYSDATE(), '', NULL, '绘本管理-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3045', '查询', '3044', '1', '', '', '', 1, 0, 'F', '0', '0', 'material:managementPicturebook:query',
                '#', 'admin', SYSDATE(), '', NULL, '绘本管理-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3046', '添加', '3044', '2', '', '', '', 1, 0, 'F', '0', '0', 'material:managementPicturebook:add',
                '#', 'admin', SYSDATE(), '', NULL, '绘本管理-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3047', '编辑', '3044', '3', '', '', '', 1, 0, 'F', '0', '0', 'material:managementPicturebook:edit',
                '#', 'admin', SYSDATE(), '', NULL, '绘本管理-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3048', '删除', '3044', '4', '', '', '', 1, 0, 'F', '0', '0', 'material:managementPicturebook:remove',
                '#', 'admin', SYSDATE(), '', NULL, '绘本管理-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3049', '导入', '3044', '5', '', '', '', 1, 0, 'F', '0', '0', 'material:managementPicturebook:import',
                '#', 'admin', SYSDATE(), '', NULL, '绘本管理-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3050', '导出', '3044', '6', '', '', '', 1, 0, 'F', '0', '0', 'material:managementPicturebook:export',
                '#', 'admin', SYSDATE(), '', NULL, '绘本管理-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3051', '老师管理', '0', '30', 'teachers', '', NULL, 1, 0, 'M', '0',
                '0', '', 'example', 'admin', SYSDATE(), '', NULL, '老师管理-目录');
    
        INSERT INTO sys_menu
        VALUES ('3052', '老师班级', '3051', '1', 'teacherClasses', 'teachers/teacherClasses/index',
                '', 1, 0, 'C', '0', '0', 'teachers:teacherClasses:list', 'article', 'admin', SYSDATE(), '', NULL, '老师班级-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3053', '查询', '3052', '1', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherClasses:query',
                '#', 'admin', SYSDATE(), '', NULL, '老师班级-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3054', '添加', '3052', '2', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherClasses:add',
                '#', 'admin', SYSDATE(), '', NULL, '老师班级-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3055', '编辑', '3052', '3', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherClasses:edit',
                '#', 'admin', SYSDATE(), '', NULL, '老师班级-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3056', '删除', '3052', '4', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherClasses:remove',
                '#', 'admin', SYSDATE(), '', NULL, '老师班级-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3057', '导入', '3052', '5', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherClasses:import',
                '#', 'admin', SYSDATE(), '', NULL, '老师班级-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3058', '导出', '3052', '6', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherClasses:export',
                '#', 'admin', SYSDATE(), '', NULL, '老师班级-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3059', '老师信息', '3051', '2', 'teacherInfos', 'teachers/teacherInfos/index',
                '', 1, 0, 'C', '0', '0', 'teachers:teacherInfos:list', 'article', 'admin', SYSDATE(), '', NULL, '老师信息-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3060', '查询', '3059', '1', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:query',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3061', '添加', '3059', '2', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:add',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3062', '编辑', '3059', '3', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:edit',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3063', '删除', '3059', '4', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:remove',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3064', '导入', '3059', '5', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:import',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3065', '导出', '3059', '6', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:export',
                '#', 'admin', SYSDATE(), '', NULL, '老师信息-导出-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3066', '老师讲义', '3051', '3', 'teacherHandouts', 'teachers/teacherHandouts/index',
                '', 1, 0, 'C', '0', '0', 'teachers:teacherHandouts:list', 'article', 'admin', SYSDATE(), '', NULL, '老师讲义-菜单');
    
        INSERT INTO sys_menu
        VALUES ('3067', '查询', '3066', '1', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherHandouts:query',
                '#', 'admin', SYSDATE(), '', NULL, '老师讲义-查询-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3068', '添加', '3066', '2', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherHandouts:add',
                '#', 'admin', SYSDATE(), '', NULL, '老师讲义-添加-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3069', '编辑', '3066', '3', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherHandouts:edit',
                '#', 'admin', SYSDATE(), '', NULL, '老师讲义-编辑-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3070', '删除', '3066', '4', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherHandouts:remove',
                '#', 'admin', SYSDATE(), '', NULL, '老师讲义-删除-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3071', '导入', '3066', '5', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherHandouts:import',
                '#', 'admin', SYSDATE(), '', NULL, '老师讲义-导入-按钮');
    
        INSERT INTO sys_menu
        VALUES ('3072', '导出', '3066', '6', '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherHandouts:export',
                '#', 'admin', SYSDATE(), '', NULL, '老师讲义-导出-按钮');
    