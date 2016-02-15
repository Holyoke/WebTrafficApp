var React = require('react'),
    ReactDOM = require('react-dom'),
    WebsitesList = require('./components/websites_list.jsx');


document.addEventListener("DOMContentLoaded", function () {
  ReactDOM.render(<WebsitesList />, document.getElementById('main'));
});

WebsiteListingStore = require('./stores/website_listing_store.js');
