<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
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
      <el-form-item label="班级数量" prop="classesNums">
        <el-input
          v-model="queryParams.classesNums"
          placeholder="请输入班级数量"
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
      <el-form-item label="生日" prop="birthday">
        <el-date-picker clearable size="small"
                        v-model="queryParams.birthday"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="选择生日">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="入职时间" prop="entryTime">
        <el-date-picker clearable size="small"
                        v-model="queryParams.entryTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="选择入职时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="学历" prop="education">
        <el-select v-model="queryParams.education" placeholder="请选择学历" clearable size="small">
          <el-option
            v-for="dict in dict.type.education"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="毕业院校" prop="graduateSchool">
        <el-input
          v-model="queryParams.graduateSchool"
          placeholder="请输入毕业院校"
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
          v-hasPermi="['teachers:teacherInfos:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['teachers:teacherInfos:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['teachers:teacherInfos:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['teachers:teacherInfos:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="teacherInfosList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="id" align="center" prop="id"/>
      <el-table-column label="讲义管理" align="center" class-name="small-padding ">
        <template slot-scope="scope">
          <div class="padding-content">
            <el-button @click="toHandOut(scope.row.id,scope.row.name)"
                       size="small"
                       type="primary"
                       icon="el-icon-edit" v-hasPermi="['teachers:teacherInfos:edit']">讲义管理
            </el-button>
          </div>
          <div class="padding-content">
            <el-button @click="toTeacherClasses(scope.row.id,scope.row.name)"
                       size="small"
                       type="success"
                       icon="el-icon-edit" v-hasPermi="['teachers:teacherInfos:edit']">老师的班级
            </el-button>
          </div>

        </template>

      </el-table-column>
      <el-table-column label="姓名" align="center" prop="name"/>
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
      <el-table-column label="班级数量" align="center" prop="classesNums"/>
      <el-table-column label="电话" align="center" prop="phone"/>
      <el-table-column label="生日" align="center" prop="birthday" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.birthday, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="入职时间" align="center" prop="entryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.entryTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="学历" align="center" prop="education">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.education" :value="scope.row.education"/>
        </template>
      </el-table-column>
      <el-table-column label="毕业院校" align="center" prop="graduateSchool"/>
      <el-table-column label="所获证书" align="center" prop="certificateBotained"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['teachers:teacherInfos:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['teachers:teacherInfos:remove']"
          >删除
          </el-button>
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

    <!-- 添加或修改老师信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名"/>
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
        <el-form-item label="班级数量" prop="classesNums">
          <el-input-number v-model="form.classesNums" placeholder="请输入班级数量"/>
        </el-form-item>
        <el-form-item label="电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入电话"/>
        </el-form-item>
        <el-form-item label="生日" prop="birthday">
          <el-date-picker clearable size="small"
                          v-model="form.birthday"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="选择生日">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="入职时间" prop="entryTime">
          <el-date-picker clearable size="small"
                          v-model="form.entryTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="选择入职时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="学历" prop="education">
          <el-select v-model="form.education" placeholder="请选择学历">
            <el-option
              v-for="dict in dict.type.education"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="毕业院校" prop="graduateSchool">
          <el-input v-model="form.graduateSchool" placeholder="请输入毕业院校"/>
        </el-form-item>
        <el-form-item label="所获证书" prop="certificateBotained">
          <el-input v-model="form.certificateBotained" type="textarea" placeholder="请输入内容"/>
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
import {
  addTeacherInfos,
  delTeacherInfos,
  getTeacherInfos,
  listTeacherInfos,
  updateTeacherInfos
} from "@/api/teachers/teacherInfos";
import cache from '@/plugins/cache'
export default {
  name: "TeacherInfos",
  dicts: ['peoples_managementSchools__dict', 'peoples_managementClasses__dict', 'education'],
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
      // 老师信息表格数据
      teacherInfosList: [],
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
        classId: null,
        classesNums: null,
        phone: null,
        birthday: null,
        entryTime: null,
        education: null,
        graduateSchool: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          {required: true, message: "姓名不能为空", trigger: "blur"}
        ],
        schoolId: [
          {required: true, message: "所属学校不能为空", trigger: "change"}
        ],
        classId: [
          {required: true, message: "所属班级不能为空", trigger: "change"}
        ],
        classesNums: [
          {required: true, message: "班级数量不能为空", trigger: "blur"}
        ],
        phone: [
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ],
        birthday: [
          {required: true, message: "生日不能为空", trigger: "blur"}
        ],
        entryTime: [
          {required: true, message: "入职时间不能为空", trigger: "blur"}
        ],
        education: [
          {required: true, message: "学历不能为空", trigger: "change"}
        ],
        graduateSchool: [
          {required: true, message: "毕业院校不能为空", trigger: "blur"}
        ],
      }
    };
  },
  created() {

    this.getList();
  },
  methods: {
    toHandOut: function (userId,name) {
      this.$router.push({path: `/teachers/teacherHandouts/${userId}`});
      cache.session.set("teacherName", name);
    },
    toTeacherClasses: function (teacherId,name) {
      this.$router.push({path: `/teachers/teacherClasses/teacher/${teacherId}`});
    },
    /** 查询老师信息列表 */
    getList() {
      this.loading = true;
      listTeacherInfos(this.queryParams).then(response => {
        this.teacherInfosList = response.rows;
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
        schoolId: null,
        classId: null,
        classesNums: null,
        phone: null,
        birthday: null,
        entryTime: null,
        education: null,
        graduateSchool: null,
        certificateBotained: null,
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
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加老师信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTeacherInfos(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改老师信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTeacherInfos(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTeacherInfos(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除老师信息编号为"' + ids + '"的数据项？').then(function () {
        return delTeacherInfos(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('/edu-admin/teachers/teacherInfos/export', {
        ...this.queryParams
      }, `teacherInfos_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
