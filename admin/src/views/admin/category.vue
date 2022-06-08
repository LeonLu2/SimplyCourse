<template>
  <div>
    <div class="row">
      <div class="col-md-6">
        <p>
          <button v-on:click="add1()" class="btn btn-white btn-default btn-round">
            <i class="ace-icon fa fa-edit"></i>
            Add level 1 category
          </button>
          &nbsp;
          <button v-on:click="all()" class="btn btn-white btn-default btn-round">
            <i class="ace-icon fa fa-refresh"></i>
            Refresh
          </button>
        </p>

        <table id="level1-table" class="table  table-bordered table-hover">
          <thead>
          <tr>
            <th>id</th>
            <th>Name</th>
            <th>Sequence</th>
            <th>Action</th>
          </tr>
          </thead>

          <tbody>
          <tr v-for="category in level1" v-on:click="onClickLevel1(category)" v-bind:class="{'active' : category.id === active.id}">
            <td>{{category.id}}</td>
            <td>{{category.name}}</td>
            <td>{{category.sort}}</td>
            <td>
              <div class="hidden-sm hidden-xs btn-group">
                <button v-on:click="edit(category)" class="btn btn-xs btn-info">
                  <i class="ace-icon fa fa-pencil bigger-120"></i>
                </button>
                <button v-on:click="del(category.id)" class="btn btn-xs btn-danger">
                  <i class="ace-icon fa fa-trash-o bigger-120"></i>
                </button>
              </div>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="col-md-6">
        <p>
          <button v-on:click="add2()" class="btn btn-white btn-default btn-round">
            <i class="ace-icon fa fa-edit"></i>
            Add level 2 category
          </button>
        </p>

        <table id="level2-table" class="table  table-bordered table-hover">
          <thead>
          <tr>
            <th>id</th>
            <th>Name</th>
            <th>Sequence</th>
            <th>Action</th>
          </tr>
          </thead>

          <tbody>
          <tr v-for="category in level2">
            <td>{{category.id}}</td>
            <td>{{category.name}}</td>
            <td>{{category.sort}}</td>
            <td>
              <div class="hidden-sm hidden-xs btn-group">
                <button v-on:click="edit(category)" class="btn btn-xs btn-info">
                  <i class="ace-icon fa fa-pencil bigger-120"></i>
                </button>
                <button v-on:click="del(category.id)" class="btn btn-xs btn-danger">
                  <i class="ace-icon fa fa-trash-o bigger-120"></i>
                </button>
              </div>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>


    <div id="form-modal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Form</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
              <div class="form-group">
                <label class="col-sm-2 control-label">Parent category</label>
                <div class="col-sm-10">
                  <p class="form-control-static">{{active.name || "无"}}</p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                  <input v-model="category.name" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Sequence</label>
                <div class="col-sm-10">
                  <input v-model="category.sort" class="form-control">
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            <button v-on:click="save()" type="button" class="btn btn-primary">Save</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
  </div>
</template>

<script>
  export default {
    name: "business-category",
    data: function() {
      return {
        category: {},
        categorys: [],
        level1: [],
        level2: [],
        active: {},
      }
    },
    mounted: function() {
      let _this = this;
      _this.all();
      // sidebar激活样式方法一
      // this.$parent.activeSidebar("business-category-sidebar");

    },
    methods: {
      /**
       * click add level 1 category
       */
      add1() {
        let _this = this;
        _this.active = {};
        _this.level2 = [];
        _this.category = {
          parent: "00000000"
        };
        $("#form-modal").modal("show");
      },

      /**
       * click add level 2 category
       **/
      add2() {
        let _this = this;
        if (Tool.isEmpty(_this.active)) {
          Toast.warning("Please choose level 1 category first");
          return;
        }
        _this.category = {
          parent: _this.active.id
        };
        $(".modal").modal("show");
      },

      /**
       * click edit
       */
      edit(category) {
        let _this = this;
        _this.category = $.extend({}, category);
        $("#form-modal").modal("show");
      },

      /**
       * list query
       */
      all() {
        let _this = this;
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/category/all').then((response)=>{
          Loading.hide();
          let resp = response.data;
          _this.categorys = resp.content;

          // 将所有记录格式化成树形结构
          _this.level1 = [];
          for (let i = 0; i < _this.categorys.length; i++) {
            let c = _this.categorys[i];
            if (c.parent === '00000000') {
              _this.level1.push(c);
              for (let j = 0; j < _this.categorys.length; j++) {
                let child = _this.categorys[j];
                if (child.parent === c.id) {
                  if (Tool.isEmpty(c.children)) {
                    c.children = [];
                  }
                  c.children.push(child);
                }
              }
            }
          }
          _this.level2 = [];
          // 对当前一级分类中选中的表格触发一次点击事件，以刷新二级菜单列表
          // 注意：界面的渲染需要等vue绑定好变量后才做，所以加延时100ms
          setTimeout(function () {
            $("tr.active").trigger("click");
          }, 100);
        })
      },

      /**
       * click save
       */
      save() {
        let _this = this;

        // 保存校验
        if (1 != 1
          || !Validator.require(_this.category.parent, "Parent id")
          || !Validator.require(_this.category.name, "Category name")
          || !Validator.length(_this.category.name, "Category name", 1, 50)
        ) {
          return;
        }

        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/category/save', _this.category).then((response)=>{
          Loading.hide();
          let resp = response.data;
          if (resp.success) {
            $("#form-modal").modal("hide");
            _this.all();
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
          _this.$ajax.delete(process.env.VUE_APP_SERVER + '/business/admin/category/delete/' + id).then((response)=>{
            Loading.hide();
            let resp = response.data;
            if (resp.success) {
              _this.all();
              Toast.success("Delete success");
            }
          })
        });
      },

      onClickLevel1(category) {
        let _this = this;
        _this.active = category;
        _this.level2 = category.children;
      }
    }
  }
</script>

<style scoped>
  .active td {
    background-color: #d6e9c6 !important;
  }
</style>