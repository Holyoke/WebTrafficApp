var React = require('react'),
    ReactDOM = require('react-dom');

var FirstComponent = React.createClass({
  render: function () {
    return(
      <div>Hello Again</div>
    )
  }
});

document.addEventListener("DOMContentLoaded", function () {
  ReactDOM.render(<FirstComponent />, document.getElementById('main'));
})
