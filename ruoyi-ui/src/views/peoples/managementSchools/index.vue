<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学校名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入学校名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学校类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择学校类型" clearable size="small">
          <el-option
            v-for="dict in dict.type.school_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="班级数量" prop="allClassesNum">
        <el-input-number
          v-model="queryParams.allClassesNum"
          placeholder="请输入班级数量"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="校长姓名" prop="principalName">
        <el-input
          v-model="queryParams.principalName"
          placeholder="请输入校长姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="电话" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入电话"
          clearable
          size="small" maxlength="11"
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
          v-hasPermi="['peoples:managementSchools:add']"
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
          v-hasPermi="['peoples:managementSchools:edit']"
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
          v-hasPermi="['peoples:managementSchools:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['peoples:managementSchools:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="managementSchoolsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="学校名称" align="center" prop="name" />
      <el-table-column label="学校类型" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.school_type" :value="scope.row.type"/>
        </template>
      </el-table-column>
      <el-table-column label="班级数量" align="center" prop="allClassesNum" />
      <el-table-column label="校长姓名" align="center" prop="principalName" />
      <el-table-column label="电话" align="center" prop="phone" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['peoples:managementSchools:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['peoples:managementSchools:remove']"
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

    <!-- 添加或修改学校管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="学校名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入学校名称" />
        </el-form-item>
        <el-form-item label="学校类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择学校类型">
            <el-option
              v-for="dict in dict.type.school_type"
              :key="dict.value"
              :label="dict.label"
:value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="班级数量" prop="allClassesNum">
          <el-input-number v-model="form.allClassesNum" placeholder="请输入班级数量" />
        </el-form-item>
        <el-form-item label="校长姓名" prop="principalName">
          <el-input v-model="form.principalName" placeholder="请输入校长姓名" />
        </el-form-item>
        <el-form-item label="电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入电话" maxlength="11" />
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
import { listManagementSchools, getManagementSchools, delManagementSchools, addManagementSchools, updateManagementSchools } from "@/api/peoples/managementSchools";

export default {
  name: "ManagementSchools",
  dicts: ['school_type'],
  data() {
    return {
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
      // 学校管理表格数据
      managementSchoolsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        type: null,
        allClassesNum: null,
        principalName: null,
        phone: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "学校名称不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "学校类型不能为空", trigger: "change" }
        ],
        allClassesNum: [
          { required: true, message: "班级数量不能为空", trigger: "blur" }
        ],
        principalName: [
          { required: true, message: "校长姓名不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "更新时间不能为空", trigger: "blur" }
        ],
        updateBy: [
          { required: true, message: "更新者不能为空", trigger: "blur" }
        ],
        phone: [
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ],
        createBy: [
          { required: true, message: "创建者不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询学校管理列表 */
    getList() {
      this.loading = true;
      listManagementSchools(this.queryParams).then(response => {
        this.managementSchoolsList = response.rows;
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
        type: null,
        allClassesNum: null,
        principalName: null,
        phone: null,
        createTime: null,
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
      this.title = "添加学校管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getManagementSchools(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改学校管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateManagementSchools(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addManagementSchools(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除学校管理编号为"' + ids + '"的数据项？').then(function() {
        return delManagementSchools(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('peoples/managementSchools/export', {
        ...this.queryParams
      }, `managementSchools_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
