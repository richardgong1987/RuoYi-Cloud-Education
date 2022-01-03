package com.ruoyi.education.admin.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.education.admin.domain.EduTeacherInfos;
import com.ruoyi.education.admin.utils.BizUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.education.admin.domain.EduMembersManagestudents;
import com.ruoyi.education.admin.service.IEduMembersManagestudentsService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 学生管理Controller
 *
 * @author richard
 * @date 2021-12-31
 */
@RestController
@RequestMapping("/peoples/managementStudents")
public class EduMembersManagestudentsController extends BaseController
{
    @Autowired
    private IEduMembersManagestudentsService eduMembersManagestudentsService;

    /**
     * 查询学生管理列表
     */
    @RequiresPermissions("peoples:managementStudents:list")
    @GetMapping("/list")
    public TableDataInfo list(EduMembersManagestudents eduMembersManagestudents)
    {
        startPage();
        List<EduMembersManagestudents> list = eduMembersManagestudentsService.selectEduMembersManagestudentsList(eduMembersManagestudents);
        return getDataTable(list);
    }

    @GetMapping("/dict")
    public AjaxResult listDict(EduMembersManagestudents eduMembersManagestudents) throws InvocationTargetException, NoSuchMethodException, IllegalAccessException {
        List<EduMembersManagestudents> list = eduMembersManagestudentsService.selectEduMembersManagestudentsList(eduMembersManagestudents);
        return AjaxResult.success(BizUtils.toSysDictData(list));
    }
    /**
     * 导出学生管理列表
     */
    @RequiresPermissions("peoples:managementStudents:export")
    @Log(title = "学生管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduMembersManagestudents eduMembersManagestudents)
    {
        List<EduMembersManagestudents> list = eduMembersManagestudentsService.selectEduMembersManagestudentsList(eduMembersManagestudents);
        ExcelUtil<EduMembersManagestudents> util = new ExcelUtil<EduMembersManagestudents>(EduMembersManagestudents.class);
        util.exportExcel(response, list, "学生管理数据");
    }

    /**
     * 获取学生管理详细信息
     */
    @RequiresPermissions("peoples:managementStudents:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(eduMembersManagestudentsService.selectEduMembersManagestudentsById(id));
    }

    /**
     * 新增学生管理
     */
    @RequiresPermissions("peoples:managementStudents:add")
    @Log(title = "学生管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduMembersManagestudents eduMembersManagestudents)
    {
        return toAjax(eduMembersManagestudentsService.insertEduMembersManagestudents(eduMembersManagestudents));
    }

    /**
     * 修改学生管理
     */
    @RequiresPermissions("peoples:managementStudents:edit")
    @Log(title = "学生管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduMembersManagestudents eduMembersManagestudents)
    {
        return toAjax(eduMembersManagestudentsService.updateEduMembersManagestudents(eduMembersManagestudents));
    }

    /**
     * 删除学生管理
     */
    @RequiresPermissions("peoples:managementStudents:remove")
    @Log(title = "学生管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(eduMembersManagestudentsService.deleteEduMembersManagestudentsByIds(ids));
    }
}
