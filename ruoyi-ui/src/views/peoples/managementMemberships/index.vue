<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="会员姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入会员姓名"
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
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="注册类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择注册类型" clearable size="small">
          <el-option
            v-for="dict in dict.type.edu_register_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="所属学校" prop="schoolId">
        <el-select v-model="queryParams.schoolId" placeholder="请选择所属学校" clearable size="small">
          <el-option
            v-for="dict in dict.type.peoples_managementSchools__dict"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="所属班级" prop="classId">
        <el-select v-model="queryParams.classId" placeholder="请选择所属班级" clearable size="small">
          <el-option
            v-for="dict in dict.type.peoples_managementClasses__dict"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="VIP时间" prop="vipTime">
        <el-date-picker clearable size="small"
          v-model="queryParams.vipTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择VIP时间">
        </el-date-picker>
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
          v-hasPermi="['peoples:managementMemberships:add']"
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
          v-hasPermi="['peoples:managementMemberships:edit']"
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
          v-hasPermi="['peoples:managementMemberships:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['peoples:managementMemberships:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['peoples:managementMemberships:add']"
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
          v-hasPermi="['peoples:managementMemberships:edit']"
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
          v-hasPermi="['peoples:managementMemberships:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['peoples:managementMemberships:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="managementMembershipsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="会员姓名" align="center" prop="name" />
      <el-table-column label="电话" align="center" prop="phone" />
      <el-table-column label="注册类型" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.edu_register_type" :value="scope.row.type"/>
        </template>
      </el-table-column>
      <el-table-column label="所属学校" align="center" prop="schoolId">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.peoples_managementSchools__dict" :value="scope.row.schoolId"/>
        </template>
      </el-table-column>
      <el-table-column label="所属班级" align="center" prop="classId">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.peoples_managementClasses__dict" :value="scope.row.classId"/>
        </template>
      </el-table-column>
      <el-table-column label="VIP时间" align="center" prop="vipTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.vipTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['peoples:managementMemberships:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['peoples:managementMemberships:remove']"
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

    <!-- 添加或修改会员管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="会员姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入会员姓名" />
        </el-form-item>
        <el-form-item label="电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入电话" />
        </el-form-item>
        <el-form-item label="注册类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择注册类型">
            <el-option
              v-for="dict in dict.type.edu_register_type"
              :key="dict.value"
              :label="dict.label"
:value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所属学校" prop="schoolId">
          <el-select v-model="form.schoolId" placeholder="请选择所属学校">
            <el-option
              v-for="dict in dict.type.peoples_managementSchools__dict"
              :key="dict.value"
              :label="dict.label"
:value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所属班级" prop="classId">
          <el-select v-model="form.classId" placeholder="请选择所属班级">
            <el-option
              v-for="dict in dict.type.peoples_managementClasses__dict"
              :key="dict.value"
              :label="dict.label"
:value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="VIP时间" prop="vipTime">
          <el-date-picker clearable size="small"
            v-model="form.vipTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择VIP时间">
          </el-date-picker>
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
import { listManagementMemberships, getManagementMemberships, delManagementMemberships, addManagementMemberships, updateManagementMemberships } from "@/api/peoples/managementMemberships";

export default {
  name: "ManagementMemberships",
  dicts: ['peoples_managementSchools__dict', 'edu_register_type', 'peoples_managementClasses__dict'],
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
      // 会员管理表格数据
      managementMembershipsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        phone: null,
        type: null,
        schoolId: null,
        classId: null,
        vipTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "会员姓名不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "注册类型不能为空", trigger: "change" }
        ],
        schoolId: [
          { required: true, message: "所属学校不能为空", trigger: "change" }
        ],
        phone: [
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ],
        classId: [
          { required: true, message: "所属班级不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询会员管理列表 */
    getList() {
      this.loading = true;
      listManagementMemberships(this.queryParams).then(response => {
        this.managementMembershipsList = response.rows;
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
        phone: null,
        type: null,
        schoolId: null,
        classId: null,
        vipTime: null,
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
      this.title = "添加会员管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getManagementMemberships(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改会员管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateManagementMemberships(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addManagementMemberships(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除会员管理编号为"' + ids + '"的数据项？').then(function() {
        return delManagementMemberships(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('/edu-admin/peoples/managementMemberships/export', {
        ...this.queryParams
      }, `managementMemberships_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
