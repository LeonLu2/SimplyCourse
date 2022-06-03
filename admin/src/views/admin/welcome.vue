<template>
  <div>
    <div class="space-12"></div>
    <div class="row">
      <div class="col-xs-12">
        <div class="text-center">
            <span class="btn btn-app btn-sm btn-light no-hover">
                <span class="line-height-1 bigger-170 blue"> 214 </span>
                <br>
                <span class="line-height-1 smaller-90"> Courses </span>
            </span>
          <span class="btn btn-app btn-sm btn-yellow no-hover">
                <span class="line-height-1 bigger-170"> 2,221 </span>

                <br>
                <span class="line-height-1 smaller-90"> Chapters </span>
            </span>

          <span class="btn btn-app btn-sm btn-pink no-hover">
                <span class="line-height-1 bigger-170"> 9,192 </span>

                <br>
                <span class="line-height-1 smaller-90"> Sections </span>
            </span>

          <span class="btn btn-app btn-sm btn-success no-hover">
                <span class="line-height-1 bigger-170"> 2.23M </span>

                <br>
                <span class="line-height-1 smaller-90"> Members </span>
            </span>

          <span class="btn btn-app btn-sm btn-primary no-hover">
                <span class="line-height-1 bigger-170"> 6.76M </span>

                <br>
                <span class="line-height-1 smaller-90"> Enroll </span>
            </span>

          <span class="btn btn-app btn-sm btn-grey no-hover">
                <span class="line-height-1 bigger-170"> 1.94M </span>

                <br>
                <span class="line-height-1 smaller-90"> Comments </span>
            </span>

        </div>

        <div class="space-12"></div>

        <div class="hr hr2 hr-double"></div>

        <div class="space-12"></div>

      </div>

      <div class="col-sm-12 infobox-container">
        <div class="infobox infobox-green">
          <div class="infobox-icon">
            <i class="ace-icon fa fa-comments"></i>
          </div>

          <div class="infobox-data">
            <span class="infobox-data-number">332</span>
            <div class="infobox-content">New Comments</div>
          </div>

          <div class="stat stat-success">8%</div>
        </div>

        <div class="infobox infobox-blue">
          <div class="infobox-icon">
            <i class="ace-icon fa fa-twitter"></i>
          </div>

          <div class="infobox-data">
            <span class="infobox-data-number">58</span>
            <div class="infobox-content">New Members</div>
          </div>

          <div class="badge badge-success">
            +10%
            <i class="ace-icon fa fa-arrow-up"></i>
          </div>
        </div>

        <div class="infobox infobox-pink">
          <div class="infobox-icon">
            <i class="ace-icon fa fa-shopping-cart"></i>
          </div>

          <div class="infobox-data">
            <span class="infobox-data-number">108</span>
            <div class="infobox-content">Course Enrolls</div>
          </div>
          <div class="stat stat-important">4%</div>
        </div>

        <div class="space-12"></div>

        <div class="hr hr2 hr-double"></div>

        <div class="space-12"></div>

      </div>

    </div><!-- /.row -->  </div>
</template>

<script>
export default {
  name: "welcome",
  mounted: function () {
    // sidebar激活样式方法一
    // this.$parent.activeSidebar("welcome-sidebar");
  },
  methods: {}
}
</script>