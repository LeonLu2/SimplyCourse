<template>
  <div>
    <p>
      <button v-on:click="list(1)" class="btn btn-white btn-default btn-round">
        <i class="ace-icon fa fa-refresh"></i>
        Refresh
      </button>
    </p>

    <div class="row">
      <div class="col-md-6">
        <textarea id="resource-textarea" class="form-control" v-model="resourceStr" name="resource" rows="10"></textarea>

        <br>
        <button id="save-btn" type="button" class="btn btn-primary" v-on:click="save()">
          Save
        </button>
      </div>
      <div class="col-md-6">
        <ul id="tree" class="ztree"></ul>
      </div>
    </div>

  </div>
</template>

<script>
  export default {
    name: "system-resource",
    data: function() {
      return {
        resource: {},
        resources: [],
        resourceStr: "",
        tree: {},
      }
    },
    mounted: function() {
      let _this = this;
      _this.list();
      // sidebar激活样式方法一
      // this.$parent.activeSidebar("system-resource-sidebar");

    },
    methods: {
      /**
       * query list
       */
      list() {
        let _this = this;
        Loading.show();
        _this.$ajax.get(process.env.VUE_APP_SERVER + '/system/admin/resource/load-tree').then((res) => {
          Loading.hide();
          let response = res.data;
          _this.resources = response.content;
          // 初始化树
          _this.initTree();
        })
      },

      /**
       * click save
       */
      save() {
        let _this = this;

        // 保存校验
        if (Tool.isEmpty(_this.resourceStr)) {
          Toast.warning("Resource cannot be null!");
          return;
        }
        let json = JSON.parse(_this.resourceStr);

        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/system/admin/resource/save', json).then((response)=>{
          Loading.hide();
          let resp = response.data;
          if (resp.success) {
            $("#form-modal").modal("hide");
            _this.list(1);
            Toast.success("Save succeed!");
          } else {
            Toast.warning(resp.message)
          }
        })
      },

      /**
       * click delete
       */
      del(id) {
        let _this = this;
        Confirm.show("Delete is non-revertible, sure?", function () {
          Loading.show();
          _this.$ajax.delete(process.env.VUE_APP_SERVER + '/system/admin/resource/delete/' + id).then((response)=>{
            Loading.hide();
            let resp = response.data;
            if (resp.success) {
              _this.list(1);
              Toast.success("Delete succeed!");
            }
          })
        });
      },

      /**
       * init resource tree
       */
      initTree() {
        let _this = this;
        let setting = {
          data: {
            simpleData: {
              idKey: "id",
              pIdKey: "parent",
              rootPId: "",
              // enable: true
            }
          }
        };

        _this.zTree = $.fn.zTree.init($("#tree"), setting, _this.resources);
        _this.zTree.expandAll(true);
      },
    }
  }
</script>