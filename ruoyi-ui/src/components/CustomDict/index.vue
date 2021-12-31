<template>
  <el-select v-model="value" :placeholder="placeholder" clearable size="small">
    <el-option
      v-for="dict in dicts"
      :key="dict.id"
      :label="dict.name"
      :value="dict.id"
    />
  </el-select>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "CustomDict",
  data() {
    return {
      value: "",
      dicts: []
    }
  },
  props: {
    placeholder: {
      required: true,
      type: String
    },
    url: {
      required: true,
      type: String
    }
  },
  computed:{

  },
  created: async function () {
    this.dicts = await request({
      url: `${this.url}`,
      method: 'get'
    });
  }
}
</script>

<style scoped>

</style>
