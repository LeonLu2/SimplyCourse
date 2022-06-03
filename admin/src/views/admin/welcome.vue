<template>
  <div>
    <div class="space-12"></div>
    <div class="row">
      <div class="col-xs-12">
        <div class="center">
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