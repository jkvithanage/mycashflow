import { Controller } from "@hotwired/stimulus";
import ApexCharts from "apexcharts";

// Connects to data-controller="dash-income-chart"
export default class extends Controller {
  static targets = ["incomeChart"];
  static values = {
    labels: Array,
    series: Array,
  };

  initialize() {
    const options = {
      chart: {
        type: "area",
        fontFamily: "inherit",
        height: 80,
        parentHeightOffset: 0,
        toolbar: {
          show: false,
        },
        animations: {
          enabled: false,
        },
      },
      dataLabels: {
        enabled: false,
      },
      fill: {
        opacity: 0.16,
        type: "solid",
      },
      stroke: {
        width: 2,
        lineCap: "round",
        curve: "smooth",
      },
      series: [
        {
          name: "series1",
          data: this.seriesValue,
        },
      ],
      tooltip: {
        theme: "dark",
      },
      grid: {
        show: false,
        padding: {
          top: -30,
          right: 0,
          left: -10,
          bottom: -35,
        },
      },
      xaxis: {
        labels: {
          show: false,
        },
        tooltip: {
          enabled: false,
        },
        axisBorder: {
          show: false,
        },
        axisTicks: {
          show: false
        },
        type: "string",
      },
      yaxis: {
        labels: {
          show:false,

        },
      },
      labels: this.labelsValue,
      legend: {
        show: false,
      },
    };

    const chart = new ApexCharts(this.incomeChartTarget, options);
    chart.render();
  }
}
