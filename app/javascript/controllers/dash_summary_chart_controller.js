import { Controller } from "@hotwired/stimulus";
import ApexCharts from "apexcharts";

// Connects to data-controller="dash-summary-chart"
export default class extends Controller {
  static targets = ["summaryChart"];
  static values = {
    labels: Array,
    series: Array,
  };

  initialize() {
    const options = {
      chart: {
        type: "line",
        fontFamily: "inherit",
        height: 400,
        parentHeightOffset: 0,
        toolbar: {
          show: false,
        },
        animations: {
          enabled: true,
          easing: "easeinout",
        },
      },
      fill: {
        opacity: 1,
      },
      stroke: {
        width: 2,
        lineCap: "round",
        curve: "smooth",
      },
      series: [
        {
          name: "Debit",
          data: this.seriesValue[0],
        },
        {
          name: "Credit",
          data: this.seriesValue[1],
        },
      ],
      colors: ['#E91E63', '#008FFB'],
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
        type: "String",
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

    const chart = new ApexCharts(this.summaryChartTarget, options);
    chart.render();
  }
}
