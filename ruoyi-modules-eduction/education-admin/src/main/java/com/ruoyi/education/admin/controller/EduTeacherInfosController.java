package com.ruoyi.education.admin.controller;

import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.education.admin.domain.EduTeacherInfos;
import com.ruoyi.education.admin.service.IEduTeacherInfosService;
import com.ruoyi.education.admin.utils.BizUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * 老师信息Controller
 *
 * @author richard
 * @date 2021-12-31
 */
@RestController
@RequestMapping("/teachers/teacherInfos")
public class EduTeacherInfosController extends BaseController {
    @Autowired
    private IEduTeacherInfosService eduTeacherInfosService;

    /**
     * 查询老师信息列表
     */
    @RequiresPermissions("teachers:teacherInfos:list")
    @GetMapping("/list")
    public TableDataInfo list(EduTeacherInfos eduTeacherInfos) {
        startPage();
        List<EduTeacherInfos> list = eduTeacherInfosService.selectEduTeacherInfosList(eduTeacherInfos);
        return getDataTable(list);
    }

    @GetMapping("/dict")
    public AjaxResult listDict(EduTeacherInfos eduTeacherInfos) throws InvocationTargetException, NoSuchMethodException, IllegalAccessException {
        List<EduTeacherInfos> list = eduTeacherInfosService.selectEduTeacherInfosList(eduTeacherInfos);
        return AjaxResult.success(BizUtils.toSysDictData(list));
    }

    /**
     * 导出老师信息列表
     */
    @RequiresPermissions("teachers:teacherInfos:export")
    @Log(title = "老师信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduTeacherInfos eduTeacherInfos) {
        List<EduTeacherInfos> list = eduTeacherInfosService.selectEduTeacherInfosList(eduTeacherInfos);
        ExcelUtil<EduTeacherInfos> util = new ExcelUtil<EduTeacherInfos>(EduTeacherInfos.class);
        util.exportExcel(response, list, "老师信息数据");
    }

    /**
     * 获取老师信息详细信息
     */
    @RequiresPermissions("teachers:teacherInfos:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(eduTeacherInfosService.selectEduTeacherInfosById(id));
    }

    /**
     * 新增老师信息
     */
    @RequiresPermissions("teachers:teacherInfos:add")
    @Log(title = "老师信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduTeacherInfos eduTeacherInfos) {
        return toAjax(eduTeacherInfosService.insertEduTeacherInfos(eduTeacherInfos));
    }

    /**
     * 修改老师信息
     */
    @RequiresPermissions("teachers:teacherInfos:edit")
    @Log(title = "老师信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduTeacherInfos eduTeacherInfos) {
        return toAjax(eduTeacherInfosService.updateEduTeacherInfos(eduTeacherInfos));
    }

    /**
     * 删除老师信息
     */
    @RequiresPermissions("teachers:teacherInfos:remove")
    @Log(title = "老师信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(eduTeacherInfosService.deleteEduTeacherInfosByIds(ids));
    }
}
