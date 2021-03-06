var React = require('react'),
    WebsiteListingStore = require('../stores/website_listing_store.js'),
    Table = require('reactable').Table,
    ListingForm = require('./listing_form.jsx');

var WebsitesList = React.createClass({
  getInitialState: function () {
    return ({websiteListings: WebsiteListingStore.all(),
             currentPage: 1,
             currentListing: -1,
             openModal: false
           });
  },

  websiteListingsChanged: function () {
    var self = this;
    self.setState({websiteListings: WebsiteListingStore.all()});
  },

  componentDidMount: function () {
    WebsiteListingStore.addChangedHandler(this.websiteListingsChanged);
    WebsiteListingStore.fetch(this.state.currentPage);
  },

  handleNextPageClick: function () {
    if (this.state.currentPage < 4) {
      this.setState({currentPage: (this.state.currentPage + 1)});
      WebsiteListingStore.fetch(this.state.currentPage + 1);
    }
  },

  handlePrevPageClick: function () {
    if (this.state.currentPage > 1) {
      this.setState({currentPage: (this.state.currentPage - 1)});
      WebsiteListingStore.fetch(this.state.currentPage - 1);
    }
  },

  loadForm: function (e) {
    if (e.target.parentElement.classList[0] === "reactable-column-header") {
      return;
    }

    var id = parseInt(e.target.parentElement.children[0].innerHTML);
    var listing = WebsiteListingStore.find(id);
    this.setState({currentListing: listing, openModal: true});
  },

  //modal
  openModal: function () {
    this.setState({openModal: true});
  },

  closeModal: function () {
    this.setState({openModal: false});
  },

  render: function () {
    var data = this.state.websiteListings;
    var that = this;

    return(
      <div id="list">
        <button onClick={this.handlePrevPageClick}>Prev Page</button>
        <span> {this.state.currentPage} </span>
        <button onClick={this.handleNextPageClick}>Next Page</button>

        <ListingForm listing={this.state.currentListing}
          onSubmit={that.closeModal}
          show={this.state.openModal}
          onHide={that.closeModal} />


        <br></br>
        <p>Click on column headers to sort.</p>
        <span>Filter by name, url, rank, or note below.</span>
        <Table className="table" data={data}
          sortable={true}
          filterable={['name', 'url', 'rank', 'note']}
          onClick={this.loadForm}
        />
      </div>
    )
  }
});

module.exports = WebsitesList;
