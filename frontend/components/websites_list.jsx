var React = require('react'),
    WebsiteListingStore = require('../stores/website_listing_store.js'),
    Table = require('reactable').Table;

var WebsitesList = React.createClass({
  getInitialState: function () {
    return ({websiteListings: WebsiteListingStore.all()});
  },

  websiteListingsChanged: function () {
    var self = this;
    self.setState({websiteListings: WebsiteListingStore.all()});
  },

  componentDidMount: function () {
    WebsiteListingStore.addChangedHandler(this.websiteListingsChanged);
    WebsiteListingStore.fetch();
  },

  render: function () {
    var data = this.state.websiteListings;

    return(
      <Table className="table" data={data} />
    )
  }
});

module.exports = WebsitesList;
