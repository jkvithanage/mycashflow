import { Controller } from "@hotwired/stimulus";
import ApexCharts from "apexcharts";

// Connects to data-controller="dash-expense-chart"
export default class extends Controller {
  static targets = ["expenseChart"];
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
        sparkline: {
          enabled: true
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
          name: "Expense",
          data: this.seriesValue,
        },
      ],
      tooltip: {
        theme: "dark",
      },
      grid: {
        strokeDashArray: 4,
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

    const chart = new ApexCharts(this.expenseChartTarget, options);
    chart.render();
  }
}
