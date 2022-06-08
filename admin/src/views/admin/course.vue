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
      <div v-for="course in courses" class="col-md-4">
        <div class="thumbnail search-thumbnail">
          <img v-show="!course.image" class="media-object" src="/static/image/demo-course.jpg" />
          <img v-show="course.image" class="media-object" v-bind:src="course.image" />
          <div class="caption">
            <div class="clearfix">
              <span class="pull-right label label-primary info-label">
                {{COURSE_LEVEL | optionKV(course.level)}}
              </span>
              <span class="pull-right label label-primary info-label">
                {{COURSE_CHARGE | optionKV(course.charge)}}
              </span>
              <span class="pull-right label label-primary info-label">
                {{COURSE_STATUS | optionKV(course.status)}}
              </span>
            </div>

            <h3 class="search-title">
               <a href="#" class="blue">{{course.name}}</a>
             </h3>

            <div v-for="teacher in teachers.filter(t=>{return t.id===course.teacherId})" class="profile-activity clearfix">
              <div>
                <img v-show="!teacher.image" class="pull-left" src="/ace/assets/images/avatars/avatar5.png">
                <img v-show="teacher.image" class="pull-left" v-bind:src="teacher.image">
                <a class="user" href="#"> {{teacher.name}} </a>
                <br>
                {{teacher.position}}
              </div>
            </div>


             <p>
               <span class="blue bolder bigger-150">{{course.price}}&nbsp;<i class="fa fa-rmb"></i></span>&nbsp;
             </p>
             <p>{{course.summary}}</p>
             <p>
               <span class="badge badge-info">{{course.id}}</span>
               <span class="badge badge-info">Sequence：{{course.sort}}</span>
               <span class="badge badge-info">{{course.time | formatSecond}}</span>
             </p>
             <p>
               <button v-on:click="toChapter(course)" class="btn btn-white btn-xs btn-info btn-round">
                 Chapter
               </button>&nbsp;
               <button v-on:click="toContent(course)" class="btn btn-white btn-xs btn-info btn-round">
                 Content
               </button>&nbsp;
               <button v-on:click="openSortModal(course)" class="btn btn-white btn-xs btn-info btn-round">
                 Sequence
               </button>&nbsp;
               <button v-on:click="edit(course)" class="btn btn-white btn-xs btn-info btn-round">
                 Edit
               </button>&nbsp;
               <button v-on:click="del(course.id)" class="btn btn-white btn-xs btn-warning btn-round">
                 Delete
               </button>
             </p>
           </div>
         </div>
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
                <label class="col-sm-2 control-label">
                  Category
                </label>
                <div class="col-sm-10">
                  <ul id="tree" class="ztree"></ul>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Front-page</label>
                <div class="col-sm-10">
                  <big-file v-bind:input-id="'image-upload'"
                            v-bind:text="'Upload front-page'"
                            v-bind:suffixs="['jpg', 'jpeg', 'png']"
                            v-bind:use="FILE_USE.COURSE.key"
                            v-bind:after-upload="afterUpload">
                  </big-file>
                  <div v-show="course.image" class="row">
                    <div class="col-md-6">
                      <img v-bind:src="course.image" class="img-responsive">
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Course title</label>
                <div class="col-sm-10">
                  <input v-model="course.name" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Teacher</label>
                <div class="col-sm-10">
                  <select v-model="course.teacherId" class="form-control">
                    <option v-for="o in teachers" v-bind:value="o.id">{{o.name}}</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Description</label>
                <div class="col-sm-10">
                  <input v-model="course.summary" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Length</label>
                <div class="col-sm-10">
                  <input v-model="course.time" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Price($)</label>
                <div class="col-sm-10">
                  <input v-model="course.price" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Level</label>
                <div class="col-sm-10">
                  <select v-model="course.level" class="form-control">
                    <option v-for="o in COURSE_LEVEL" v-bind:value="o.key">{{o.value}}</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Charge</label>
                <div class="col-sm-10">
                  <select v-model="course.charge" class="form-control">
                    <option v-for="o in COURSE_CHARGE" v-bind:value="o.key">{{o.value}}</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Status</label>
                <div class="col-sm-10">
                  <select v-model="course.status" class="form-control">
                    <option v-for="o in COURSE_STATUS" v-bind:value="o.key">{{o.value}}</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Enrolled</label>
                <div class="col-sm-10">
                  <input v-model="course.enroll" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Sequence</label>
                <div class="col-sm-10">
                  <input v-model="course.sort" class="form-control" disabled>
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

    <div id="course-sort-modal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">Sequence</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
              <div class="form-group">
                <label class="control-label col-lg-3">
                  Current sequence
                </label>
                <div class="col-lg-9">
                  <input class="form-control" v-model="sort.oldSort" name="oldSort" disabled>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-lg-3">
                  New sequence
                </label>
                <div class="col-lg-9">
                  <input class="form-control" v-model="sort.newSort" name="newSort">
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-white btn-default btn-round" data-dismiss="modal">
              <i class="ace-icon fa fa-times"></i>
              Cancel
            </button>
            <button type="button" class="btn btn-white btn-info btn-round" v-on:click="updateSort()">
              <i class="ace-icon fa fa-plus blue"></i>
              Update sequence
            </button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
  </div>
</template>

<script>
  import Pagination from "../../components/pagination";
  import BigFile from "../../components/big-file";
  export default {
    components: {Pagination, BigFile},
    name: "business-course",
    data: function() {
      return {
        course: {},
        courses: [],
        COURSE_LEVEL: COURSE_LEVEL,
        COURSE_CHARGE: COURSE_CHARGE,
        COURSE_STATUS: COURSE_STATUS,
        FILE_USE: FILE_USE,
        categorys: [],
        tree: {},
        saveContentLabel: "",
        sort: {
          id: "",
          oldSort: 0,
          newSort: 0
        },
        teachers: [],
      }
    },
    mounted: function() {
      let _this = this;
      _this.$refs.pagination.size = 5;
      _this.allCategory();
      _this.allTeacher();
      _this.list(1);
      // sidebar激活样式方法一
      // this.$parent.activeSidebar("business-course-sidebar");

    },
    methods: {
      /**
       * click add
       */
      add() {
        let _this = this;
        _this.course = {
          sort: _this.$refs.pagination.total + 1
        };
        _this.tree.checkAllNodes(false);
        $("#form-modal").modal("show");
      },

      /**
       * click edit
       */
      edit(course) {
        let _this = this;
        _this.course = $.extend({}, course);
        _this.listCategory(course.id);
        $("#form-modal").modal("show");
      },

      /**
       * list query
       */
      list(page) {
        let _this = this;
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/course/list', {
          page: page,
          size: _this.$refs.pagination.size,
        }).then((response)=>{
          Loading.hide();
          let resp = response.data;
          _this.courses = resp.content.list;
          _this.$refs.pagination.render(page, resp.content.total);

        })
      },

      /**
       * click save
       */
      save(page) {
        let _this = this;

        // 保存校验
        if (1 != 1
          || !Validator.require(_this.course.name, "Name")
          || !Validator.length(_this.course.name, "Name", 1, 50)
          || !Validator.length(_this.course.summary, "Description", 1, 2000)
          || !Validator.length(_this.course.image, "front-page", 1, 100)
        ) {
          return;
        }

        let categorys = _this.tree.getCheckedNodes();
        if (Tool.isEmpty(categorys)) {
          Toast.warning("Please choose category!");
          return;
        }
        _this.course.categorys = categorys;

        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/course/save', _this.course).then((response)=>{
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
          _this.$ajax.delete(process.env.VUE_APP_SERVER + '/business/admin/course/delete/' + id).then((response)=>{
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
       * click chapters
       */
      toChapter(course) {
        let _this = this;
        SessionStorage.set(SESSION_KEY_COURSE, course);
        _this.$router.push("/business/chapter");
      },

      /**
       * click content
       */
      toContent(course) {
        let _this = this;
        SessionStorage.set(SESSION_KEY_COURSE, course);
        _this.$router.push("/business/content");
      },

      allCategory() {
        let _this = this;
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/category/all').then((response)=>{
          Loading.hide();
          let resp = response.data;
          _this.categorys = resp.content;

          _this.initTree();
        })
      },

      initTree() {
        let _this = this;
        let setting = {
          check: {
            enable: true
          },
          data: {
            simpleData: {
              idKey: "id",
              pIdKey: "parent",
              rootPId: "00000000",
              enable: true
            }
          }
        };

        let zNodes = _this.categorys;

        _this.tree = $.fn.zTree.init($("#tree"), setting, zNodes);
        // 展开所有的节点
        //_this.tree.expandAll(true);
      },

      /**
       * find all categories for course
       * @param courseId
       */
      listCategory(courseId) {
        let _this = this;
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/course/list-category/' + courseId).then((res)=>{
          Loading.hide();
          console.log("query all categories for the course: ", res);
          let response = res.data;
          let categorys = response.content;

          // 勾选查询到的分类
          _this.tree.checkAllNodes(false);
          for (let i = 0; i < categorys.length; i++) {
            let node = _this.tree.getNodeByParam("id", categorys[i].categoryId);
            _this.tree.checkNode(node, true);
          }
        })
      },

      openSortModal(course) {
        let _this = this;
        _this.sort = {
          id: course.id,
          oldSort: course.sort,
          newSort: course.sort
        };
        $("#course-sort-modal").modal("show");
      },

      /**
       * Sort
       */
      updateSort() {
        let _this = this;
        if (_this.sort.newSort === _this.sort.oldSort) {
          Toast.warning("Sort does not change");
          return;
        }
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + "/business/admin/course/sort", _this.sort).then((res) => {
          let response = res.data;

          if (response.success) {
            Toast.success("Update succeed!");
            $("#course-sort-modal").modal("hide");
            _this.list(1);
          } else {
            Toast.error("Update failed!");
          }
        });
      },

      allTeacher() {
        let _this = this;
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/teacher/all').then((response)=>{
          Loading.hide();
          let resp = response.data;
          _this.teachers = resp.content;
        })
      },

      afterUpload(resp) {
        let _this = this;
        let image = resp.content.path;
        _this.course.image = image;
        // 解决不能实时预览的问题
        _this.$forceUpdate();
      },
    }
  }
</script>

<style scoped>
  .caption h3 {
    font-size: 20px;
  }

  @media (max-width: 1199px) {
    .caption h3 {
      font-size: 16px;
    }
  }
</style>