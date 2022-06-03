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

      <div class="col-sm-12">
        <div class="widget-box transparent">
          <div class="widget-header widget-header-flat">
            <h4 class="widget-title lighter">
              <i class="ace-icon fa fa-signal"></i>
              Sales
            </h4>

          </div>

          <div class="widget-body">
            <div class="widget-main padding-4">
              <div id="sales-charts"></div>
            </div><!-- /.widget-main -->
          </div><!-- /.widget-body -->
        </div><!-- /.widget-box -->

        <div class="space-12"></div>

        <div class="hr hr2 hr-double"></div>

        <div class="space-12"></div>
      </div><!-- /.col -->

      <div class="col-sm-6">
        <div class="widget-box transparent">
          <div class="widget-header widget-header-flat">
            <h4 class="widget-title lighter">
              <i class="ace-icon fa fa-star orange"></i>
              Course Sales Rating
            </h4>

          </div>

          <div class="widget-body">
            <div class="widget-main no-padding">
              <table class="table table-bordered table-striped">
                <thead class="thin-border-bottom">
                <tr>
                  <th>
                    <i class="ace-icon fa fa-caret-right blue"></i>Course names
                  </th>

                  <th>
                    <i class="ace-icon fa fa-caret-right blue"></i>Price
                  </th>

                  <th>
                    <i class="ace-icon fa fa-caret-right blue"></i>Enrolls
                  </th>
                </tr>
                </thead>

                <tbody>
                <tr>
                  <td>Intro Java</td>

                  <td>
                    <b class="green">$29.00</b>
                  </td>

                  <td>
                    <span class="label label-warning arrowed arrowed-right">172</span>
                  </td>
                </tr>

                <tr>
                  <td>High level C++</td>

                  <td>
                    <b class="red">$88.00</b>
                  </td>

                  <td>
                    <span class="label label-warning arrowed arrowed-right">932</span>
                  </td>
                </tr>

                <tr>
                  <td>Python application</td>

                  <td>
                    <b class="green">$19.00</b>
                  </td>

                  <td>
                    <span class="label label-warning arrowed arrowed-right">2,932</span>
                  </td>
                </tr>

                <tr>
                  <td>HTML+CSS Combo</td>

                  <td>
                    <b class="green">$49.00</b>
                  </td>

                  <td>
                    <span class="label label-success arrowed arrowed-right">654</span>
                  </td>
                </tr>

                <tr>
                  <td>Basic Algorithms</td>

                  <td>
                    <b class="green">$9.99</b>
                  </td>

                  <td>
                    <span class="label label-success arrowed arrowed-right">9,019</span>
                  </td>
                </tr>
                </tbody>
              </table>
            </div><!-- /.widget-main -->
          </div><!-- /.widget-body -->
        </div><!-- /.widget-box -->
      </div><!-- /.col -->
      <div class="col-sm-6">
        <div class="widget-box transparent">
          <div class="widget-header widget-header-flat">
            <h4 class="widget-title lighter">
              <i class="ace-icon fa fa-star orange"></i>
              Categories Rating
            </h4>

          </div>

          <div class="widget-body">
            <div class="widget-main">
              <div id="piechart-placeholder"></div>

            </div><!-- /.widget-main -->
          </div><!-- /.widget-body -->
        </div><!-- /.widget-box -->
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div>
</template>

<script>
export default {
  name: "welcome",
  mounted: function () {
    let _this = this;
    // sidebar激活样式方法一
    // this.$parent.activeSidebar("welcome-sidebar");
    _this.drawSaleChart();
    _this.drawPieChart();
  },
  methods: {
    drawSaleChart() {
      // 生成随机两组数据
      let d1 = [];
      for (let i = 0; i < 30; i += 1) {
        d1.push([i + 1, 2000 + Math.floor((Math.random() * 100) + 1)]);
      }
      let d2 = [];
      for (let i = 0; i < 30; i += 1) {
        d2.push([i + 1, 1900 + Math.floor((Math.random() * 100) + 1)]);
      }

      let sales_charts = $('#sales-charts').css({'width': '100%', 'height': '220px'});
      $.plot("#sales-charts", [
        {label: "Last 30 days", data: d1},
        {label: "Last sales period", data: d2},
      ], {
        hoverable: true,
        shadowSize: 0,
        series: {
          lines: {show: true},
          points: {show: true}
        },
        xaxis: {
          tickLength: 0
        },
        yaxis: {
          tickLength: 0
        },
        grid: {
          backgroundColor: {colors: ["#fff", "#fff"]},
          borderWidth: 1,
          borderColor: '#555'
        }
      });
    },

    drawPieChart() {
      let placeholder = $('#piechart-placeholder').css({'width': '90%', 'min-height': '180px'});
      let data = [
        {label: "Java", data: 38.7, color: "#68BC31"},
        {label: "Python", data: 24.5, color: "#2091CF"},
        {label: "Android", data: 18.6, color: "#DA5430"},
        {label: "Others", data: 10, color: "#FEE074"},
      ];
      $.plot(placeholder, data, {
        series: {
          pie: {
            show: true,
            tilt: 0.8,
            highlight: {
              opacity: 0.25
            },
            stroke: {
              color: '#fff',
              width: 2
            },
            startAngle: 2
          }
        },
        legend: {
          show: true,
          position: "ne",
          labelBoxBorderColor: null,
          margin: [-30, 15]
        }
        ,
        grid: {
          hoverable: true,
          clickable: true
        }
      })
    },
  }
}
</script>