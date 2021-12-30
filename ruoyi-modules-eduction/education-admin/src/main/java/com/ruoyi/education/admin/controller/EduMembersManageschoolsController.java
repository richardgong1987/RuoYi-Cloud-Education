package com.ruoyi.education.admin.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.education.admin.domain.EduMembersManageschools;
import com.ruoyi.education.admin.service.IEduMembersManageschoolsService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 学校管理Controller
 *
 * @author richard
 * @date 2021-12-30
 */
@RestController
@RequestMapping("/peoples/managementSchools")
public class EduMembersManageschoolsController extends BaseController
{
    @Autowired
    private IEduMembersManageschoolsService eduMembersManageschoolsService;

    /**
     * 查询学校管理列表
     */
    @RequiresPermissions("peoples:managementSchools:list")
    @GetMapping("/list")
    public TableDataInfo list(EduMembersManageschools eduMembersManageschools)
    {
        startPage();
        List<EduMembersManageschools> list = eduMembersManageschoolsService.selectEduMembersManageschoolsList(eduMembersManageschools);
        return getDataTable(list);
    }

    /**
     * 导出学校管理列表
     */
    @RequiresPermissions("peoples:managementSchools:export")
    @Log(title = "学校管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduMembersManageschools eduMembersManageschools)
    {
        List<EduMembersManageschools> list = eduMembersManageschoolsService.selectEduMembersManageschoolsList(eduMembersManageschools);
        ExcelUtil<EduMembersManageschools> util = new ExcelUtil<EduMembersManageschools>(EduMembersManageschools.class);
        util.exportExcel(response, list, "学校管理数据");
    }

    /**
     * 获取学校管理详细信息
     */
    @RequiresPermissions("peoples:managementSchools:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(eduMembersManageschoolsService.selectEduMembersManageschoolsById(id));
    }

    /**
     * 新增学校管理
     */
    @RequiresPermissions("peoples:managementSchools:add")
    @Log(title = "学校管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduMembersManageschools eduMembersManageschools)
    {
        return toAjax(eduMembersManageschoolsService.insertEduMembersManageschools(eduMembersManageschools));
    }

    /**
     * 修改学校管理
     */
    @RequiresPermissions("peoples:managementSchools:edit")
    @Log(title = "学校管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduMembersManageschools eduMembersManageschools)
    {
        return toAjax(eduMembersManageschoolsService.updateEduMembersManageschools(eduMembersManageschools));
    }

    /**
     * 删除学校管理
     */
    @RequiresPermissions("peoples:managementSchools:remove")
    @Log(title = "学校管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(eduMembersManageschoolsService.deleteEduMembersManageschoolsByIds(ids));
    }
}
