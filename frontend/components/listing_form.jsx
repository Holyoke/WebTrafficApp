var React = require('react'),
    Modal = require('react-bootstrap').Modal;

var ListingForm = React.createClass({
  getInitialState: function () {
    return ({name: "", url: "", note: "", id: ""});
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
  },

  componentWillReceiveProps: function (nextProps){
    var listing = nextProps.listing;
    this.setState({id: listing.id, name: listing.name, note: listing.note});
  },

  handleSubmit: function (e) {
    e.preventDefault();
    var id = this.state.id;
    var data = {
      name: this.state.name,
      note: this.state.note
    };

    WebsiteListingStore.updateWebsiteListing(id, data);
    this.props.onSubmit();
  },

  render: function () {
    return(
      <Modal show={this.props.show} onHide={this.props.onHide}>
        <form onSubmit={this.handleSubmit}>
          <h4>
            Edit record
          </h4>

          <label>Name: </label>
          <input type="text"
            value={this.state.name}
            onChange={this.handleChange}
            name="name" />

          <span>Note: </span>
          <input type="text"
            value={this.state.note}
            onChange={this.handleChange}
            name="note" />

          <input type="submit" value="submit" />
        </form>
      </Modal>
    )
  }
});

module.exports = ListingForm;
