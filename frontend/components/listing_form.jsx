var React = require('react');

var ListingForm = React.createClass({
  getInitialState: function () {
    return ({name: "", url: "", note: ""});
  },

  handleChange: function(e) {
    //Name
    if (e.target.name === 'name')
    {
      this.setState({name: e.target.value});
    }

    //Note
    if (e.target.name === 'note'){
      this.setState({note: e.target.value});
    }

    console.log("name:", this.state.name, "note: ", this.state.note);
  },

  render: function () {
    return(
      <form>Form:

        <label> Name</label>
        <input type="text"
          value={this.state.name}
          onChange={this.handleChange}
          name="name" />

        <span>Note</span>
        <input type="text"
          value={this.state.note}
          onChange={this.handleChange}
          name="note" />

      </form>
    )
  }
});

module.exports = ListingForm;
