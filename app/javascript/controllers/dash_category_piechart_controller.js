import { Controller } from "@hotwired/stimulus"
import ApexCharts from "apexcharts";

// Connects to data-controller="dash-category-piechart"
export default class extends Controller {
  static targets = ["categoryChart"];
  static values = {
    labels: Array,
    series: Array
  }
  initialize() {
    console.log(this.data);
    const options = {
      chart: {
  			type: "donut",
  			fontFamily: 'inherit',
  			height: 400,
  			sparkline: {
  				enabled: true
  			},
  			animations: {
  				enabled: true
  			},
  		},
  		fill: {
  			opacity: 1,
  		},
  		series: this.seriesValue,
  		labels: this.labelsValue,
  		tooltip: {
  			theme: 'dark'
  		},
  		grid: {
  			strokeDashArray: 4,
  		},
  		// colors: [tabler.getColor("primary"), tabler.getColor("primary", 0.8), tabler.getColor("primary", 0.6), tabler.getColor("gray-300")],
  		legend: {
  			show: true,
  			position: 'bottom',
  			offsetY: 12,
  			markers: {
  				width: 10,
  				height: 10,
  				radius: 100,
  			},
  			itemMargin: {
  				horizontal: 8,
  				vertical: 8
  			},
  		},
    };

    const chart = new ApexCharts(this.categoryChartTarget, options);
    chart.render();
  }
}
