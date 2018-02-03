HTMLWidgets.widget({

  name: 'r3d3',

  type: 'output',

  factory: function(el, width, height) {

    var svg;

    return {

      renderValue: function(x) {

        svg = d3.select(el).append('svg');

        eval(x.script);

        main(svg, HTMLWidgets.dataframeToD3(x.data), x.params, width, height);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
