package com.ruoyi.education.admin.controller;

import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.education.admin.domain.EduMembersManageclasses;
import com.ruoyi.education.admin.service.IEduMembersManageclassesService;
import com.ruoyi.education.admin.utils.BizUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * 班级管理Controller
 *
 * @author richard
 * @date 2022-01-04
 */
@RestController
@RequestMapping("/teachers/teacherClasses")
public class EduTecherTeacherClassesController extends BaseController
{
    @Autowired
    private IEduMembersManageclassesService eduMembersManageclassesService;

    /**
     * 查询班级管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(EduMembersManageclasses eduMembersManageclasses)
    {
        startPage();
        List<EduMembersManageclasses> list = eduMembersManageclassesService.selectEduMembersManageclassesList(eduMembersManageclasses);
        return getDataTable(list);
    }
    @GetMapping("/dict")
    public AjaxResult listDict() throws InvocationTargetException, NoSuchMethodException, IllegalAccessException {
        List<EduMembersManageclasses> list = eduMembersManageclassesService.selectEduMembersManageclassesList(new EduMembersManageclasses());
        return AjaxResult.success(BizUtils.toSysDictData(list));
    }
    /**
     * 导出班级管理列表
     */
    @Log(title = "班级管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduMembersManageclasses eduMembersManageclasses)
    {
        List<EduMembersManageclasses> list = eduMembersManageclassesService.selectEduMembersManageclassesList(eduMembersManageclasses);
        ExcelUtil<EduMembersManageclasses> util = new ExcelUtil<EduMembersManageclasses>(EduMembersManageclasses.class);
        util.exportExcel(response, list, "班级管理数据");
    }

    /**
     * 获取班级管理详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(eduMembersManageclassesService.selectEduMembersManageclassesById(id));
    }

    /**
     * 新增班级管理
     */
    @Log(title = "班级管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduMembersManageclasses eduMembersManageclasses)
    {
        return toAjax(eduMembersManageclassesService.insertEduMembersManageclasses(eduMembersManageclasses));
    }

    /**
     * 修改班级管理
     */
    @Log(title = "班级管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduMembersManageclasses eduMembersManageclasses)
    {
        return toAjax(eduMembersManageclassesService.updateEduMembersManageclasses(eduMembersManageclasses));
    }

    /**
     * 删除班级管理
     */
    @Log(title = "班级管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(eduMembersManageclassesService.deleteEduMembersManageclassesByIds(ids));
    }
}
