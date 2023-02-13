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
        height: 150,
        parentHeightOffset: 0,
        toolbar: {
          show: false,
        },
        animations: {
          enabled: false,
        },
      },
      dataLabels: {
        enabled: true,
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
        padding: {
          top: -20,
          right: 0,
          left: -4,
          bottom: -4,
        },
        strokeDashArray: 4,
      },
      xaxis: {
        labels: {
          padding: 0,
        },
        tooltip: {
          enabled: false,
        },
        axisBorder: {
          show: false,
        },
        type: "string",
      },
      yaxis: {
        labels: {
          padding: 4,
        },
      },
      labels: this.labelsValue,
      legend: {
        show: true,
        position: "bottom",
        offsetY: 12,
        markers: {
          width: 10,
          height: 10,
          radius: 100,
        },
        itemMargin: {
          horizontal: 8,
          vertical: 8,
        },
      },
    };

    const chart = new ApexCharts(this.incomeChartTarget, options);
    chart.render();
  }
}
