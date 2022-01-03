<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="班级名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入班级名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属学校" prop="schoolId">
        <el-select v-model="queryParams.schoolId" placeholder="请选择所属学校" clearable size="small">
          <el-option
            v-for="dict in dict.type.school_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="学生数量" prop="studentsNum">
        <el-input
          v-model="queryParams.studentsNum"
          placeholder="请输入学生数量"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="班主任" prop="headteacher">
        <el-select v-model="queryParams.headteacher" placeholder="请选择班主任" clearable size="small">
          <el-option
            v-for="dict in dict.type.sys_notice_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="电话" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入电话"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['teachers:teacherClasses:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['teachers:teacherClasses:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['teachers:teacherClasses:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['teachers:teacherClasses:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="teacherClassesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="班级名称" align="center" prop="name" />
      <el-table-column label="所属学校" align="center" prop="schoolId">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.school_type" :value="scope.row.schoolId"/>
        </template>
      </el-table-column>
      <el-table-column label="学生数量" align="center" prop="studentsNum" />
      <el-table-column label="班主任" align="center" prop="headteacher">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_notice_status" :value="scope.row.headteacher"/>
        </template>
      </el-table-column>
      <el-table-column label="电话" align="center" prop="phone" />
      <el-table-column label="班委成员" align="center" prop="committee" />
      <el-table-column label="课代表" align="center" prop="classRepresentative" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['teachers:teacherClasses:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['teachers:teacherClasses:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改班级管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="班级名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入班级名称" />
        </el-form-item>
        <el-form-item label="所属学校" prop="schoolId">
          <el-select v-model="form.schoolId" placeholder="请选择所属学校">
            <el-option
              v-for="dict in dict.type.school_type"
              :key="dict.value"
              :label="dict.label"
:value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="学生数量" prop="studentsNum">
          <el-input v-model="form.studentsNum" placeholder="请输入学生数量" />
        </el-form-item>
        <el-form-item label="班主任" prop="headteacher">
          <el-select v-model="form.headteacher" placeholder="请选择班主任">
            <el-option
              v-for="dict in dict.type.sys_notice_status"
              :key="dict.value"
              :label="dict.label"
:value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入电话" />
        </el-form-item>

        <el-form-item label="班委成员" prop="committee">
          <el-select
            v-model="form.committee"
            multiple
            filterable
            remote
            reserve-keyword
            placeholder="请输入学生名字关键词"
            :remote-method="remoteMethod"
            :loading="loading">
            <el-option
              v-for="item in options"
              :key="item.dictValue"
              :label="item.dictLabel"
              :value="item.dictValue">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="课代表" prop="classRepresentative">
          <el-select
            v-model="form.classRepresentative"
            multiple
            filterable
            remote
            reserve-keyword
            placeholder="请输入学生名字关键词"
            :remote-method="remoteMethod2"
            :loading="loading">
            <el-option
              v-for="item in options2"
              :key="item.dictValue"
              :label="item.dictLabel"
              :value="item.dictValue">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTeacherClasses, getTeacherClasses, delTeacherClasses, addTeacherClasses, updateTeacherClasses } from "@/api/teachers/teacherClasses";
import request from "@/utils/request";
import {deepCopyJson} from "@/utils/ruoyi";

export default {
  name: "TeacherClasses",
  dicts: ['sys_notice_status', 'school_type'],
  data() {
    return {
      options: [],
      options2: [],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 班级管理表格数据
      managementClassesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        schoolId: null,
        studentsNum: null,
        headteacher: null,
        phone: null,
        committee: null,
        classRepresentative: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          {required: true, message: "班级名称不能为空", trigger: "blur"}
        ],
        schoolId: [
          {required: true, message: "所属学校不能为空", trigger: "change"}
        ],
        studentsNum: [
          {required: true, message: "学生数量不能为空", trigger: "blur"}
        ],
        headteacher: [
          {required: true, message: "班主任不能为空", trigger: "change"}
        ],
        phone: [
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ],
        committee: [
          {required: false, message: "班委成员不能为空", trigger: "blur"}
        ],
        classRepresentative: [
          {required: false, message: "课代表不能为空", trigger: "blur"}
        ],
        createTime: [
          {required: true, message: "创建时间不能为空", trigger: "blur"}
        ],
        updateTime: [
          {required: true, message: "更新时间不能为空", trigger: "blur"}
        ],
        updateBy: [
          {required: true, message: "更新者不能为空", trigger: "blur"}
        ],
        createBy: [
          {required: true, message: "创建者不能为空", trigger: "blur"}
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    remoteMethod: async function (query) {
      if (query !== '') {
        this.loading = true;
        let list = await request({
          url: '/edu-admin/peoples/managementStudents/dict',
          method: 'get',
          params: {name: query}
        });

        this.loading = false;
        this.options = list.data;
      } else {
        this.options = [];
      }
    },
    remoteMethod2: async function (query) {
      if (query !== '') {
        this.loading = true;
        let list = await request({
          url: '/edu-admin/peoples/managementStudents/dict',
          method: 'get',
          params: {name: query}
        });

        this.loading = false;
        this.options2 = list.data;
      } else {
        this.options2 = [];
      }
    },

    /** 查询班级管理列表 */
    getList() {
      this.loading = true;
      listTeacherClasses(this.queryParams).then(response => {
        this.teacherClassesList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        schoolId: null,
        studentsNum: null,
        headteacher: null,
        phone: null,
        committee: null,
        createTime: null,
        classRepresentative: null,
        updateTime: null,
        updateBy: null,
        createBy: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加班级管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTeacherClasses(id).then(response => {
        var data = response.data;
        data.committee = data.committee && data.committee.split(',')
        data.classRepresentative = data.classRepresentative && data.classRepresentative.split(',')
        this.form = data;
        this.open = true;
        this.title = "修改班级管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          let form = deepCopyJson(this.form);
          form.committee = this.form.committee && this.form.committee.join(",");
          form.classRepresentative = this.form.classRepresentative && this.form.classRepresentative.join(",");

          if (this.form.id != null) {
            updateTeacherClasses(form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTeacherClasses(form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除班级管理编号为"' + ids + '"的数据项？').then(function() {
        return delTeacherClasses(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('/edu-admin/teachers/teacherClasses/export', {
        ...this.queryParams
      }, `teacherClasses_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
