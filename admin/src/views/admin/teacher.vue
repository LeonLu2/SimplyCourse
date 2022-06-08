<template>
  <div>
    <p>
      <button v-on:click="add()" class="btn btn-white btn-default btn-round">
        <i class="ace-icon fa fa-edit"></i>
        Add
      </button>
      &nbsp;
      <button v-on:click="list(1)" class="btn btn-white btn-default btn-round">
        <i class="ace-icon fa fa-refresh"></i>
        Refresh
      </button>
    </p>

    <pagination ref="pagination" v-bind:list="list" v-bind:itemCount="8"></pagination>

    <div class="row">
      <div v-for="teacher in teachers" class="col-md-3">
        <div>
          <span class="profile-picture">
            <img v-show="!teacher.image" class="editable img-responsive editable-click editable-empty" src="/static/image/teachers image/image 1.jpg" v-bind:title="teacher.intro"/>
            <img v-show="teacher.image" class="editable img-responsive editable-click editable-empty" v-bind:src="teacher.image" v-bind:title="teacher.intro"/>
          </span>

          <div class="space-4"></div>

          <div class="width-85 label label-info label-xlg arrowed-in arrowed-in-right">
            <div class="inline position-relative">
              <a href="javascript:;" class="user-title-label dropdown-toggle" data-toggle="dropdown">
                <i class="ace-icon fa fa-circle light-green"></i>
                &nbsp;
                <span class="white">{{teacher.position}}</span>
              </a>
            </div>
          </div>
        </div>

        <div class="space-6"></div>

        <div class="text-center">
          <a href="javascript:;" class="text-info bigger-110" v-bind:title="teacher.motto">
            <i class="ace-icon fa fa-user"></i>
            {{ teacher.name }}【{{ teacher.nickname }}】
          </a>
        </div>

        <div class="space-6"></div>

        <div class="profile-social-links align-center">
          <button v-on:click="edit(teacher)" class="btn btn-xs btn-info">
            <i class="ace-icon fa fa-pencil bigger-120"></i>
          </button>
          &nbsp;
          <button v-on:click="del(teacher.id)" class="btn btn-xs btn-danger">
            <i class="ace-icon fa fa-trash-o bigger-120"></i>
          </button>
        </div>

        <div class="hr hr16 dotted"></div>

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
                <label class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                  <input v-model="teacher.name" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Nickname</label>
                <div class="col-sm-10">
                  <input v-model="teacher.nickname" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Image</label>
                <div class="col-sm-10">
                  <big-file v-bind:input-id="'image-upload'"
                            v-bind:text="'upload image'"
                            v-bind:suffixs="['jpg', 'jpeg', 'png']"
                            v-bind:use="FILE_USE.TEACHER.key"
                            v-bind:after-upload="afterUpload">
                  </big-file>
                  <div v-show="teacher.image" class="row">
                    <div class="col-md-4">
                      <img v-bind:src="teacher.image" class="img-responsive">
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Position</label>
                <div class="col-sm-10">
                  <input v-model="teacher.position" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Motto</label>
                <div class="col-sm-10">
                  <input v-model="teacher.motto" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Intro</label>
                <div class="col-sm-10">
                  <textarea v-model="teacher.intro" class="form-control" rows="5"></textarea>
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
  import Pagination from "../../components/pagination";
  // import File from "../../components/file";
  import BigFile from "../../components/big-file";
  export default {
    components: {Pagination, BigFile},
    name: "business-teacher",
    data: function() {
      return {
        teacher: {},
        teachers: [],
        FILE_USE: FILE_USE
      }
    },
    mounted: function() {
      let _this = this;
      _this.$refs.pagination.size = 5;
      _this.list(1);
      // sidebar激活样式方法一
      // this.$parent.activeSidebar("business-teacher-sidebar");

    },
    methods: {
      /**
       * click add
       */
      add() {
        let _this = this;
        // 新增讲师，上传头像后不能实时预览，解决方法一
        // _this.teacher = {
        //   image: null
        // };
        _this.teacher = {};
        $("#form-modal").modal("show");
      },

      /**
       * click edit
       */
      edit(teacher) {
        let _this = this;
        _this.teacher = $.extend({}, teacher);
        $("#form-modal").modal("show");
      },

      /**
       * query list
       */
      list(page) {
        let _this = this;
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/teacher/list', {
          page: page,
          size: _this.$refs.pagination.size,
        }).then((response)=>{
          Loading.hide();
          let resp = response.data;
          _this.teachers = resp.content.list;
          _this.$refs.pagination.render(page, resp.content.total);

        })
      },

      /**
       * click save
       */
      save() {
        let _this = this;

        // 保存校验
        if (1 != 1
          || !Validator.require(_this.teacher.name, "Teacher name")
          || !Validator.length(_this.teacher.name, "Teacher name", 1, 50)
          || !Validator.length(_this.teacher.nickname, "Nickname", 1, 50)
          || !Validator.length(_this.teacher.image, "Teacher image", 1, 100)
          || !Validator.length(_this.teacher.position, "Position", 1, 50)
          || !Validator.length(_this.teacher.motto, "Motto", 1, 50)
          || !Validator.length(_this.teacher.intro, "Intro", 1, 500)
        ) {
          return;
        }

        console.log(_this.teacher);
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/teacher/save', _this.teacher).then((response)=>{
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
          _this.$ajax.delete(process.env.VUE_APP_SERVER + '/business/admin/teacher/delete/' + id).then((response)=>{
            Loading.hide();
            let resp = response.data;
            if (resp.success) {
              _this.list(1);
              Toast.success("Delete succeed!");
            }
          })
        });
      },

      afterUpload(resp) {
        let _this = this;
        let image = resp.content.path;
        _this.teacher.image = image;
        // 新增讲师，上传头像后不能实时预览，解决方法二
        _this.$forceUpdate();
      }
    }
  }
</script>