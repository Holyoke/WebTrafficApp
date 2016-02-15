var _website_listings = [];
var _callbacks = [];

var WebsiteListingStore = {
  changed: function () {
    //this should be called whenever the collection changes.
    //Calls every callback in _callbacks
      _callbacks.forEach(function(callback){
        callback();
      });
  },

  addChangedHandler: function (callback) {
    _callbacks.push(callback);
  },

  removeChangedHandler: function (callback) {
    var idx = _callbacks.indexOf(callback);

    if ( idx !== -1 ) {
      _callbacks.splice(idx, 1);
    }
  },

  //CRUD
  all: function () {
    return _website_listings.slice();
  },

  fetch: function (page_idx) {
    //api call to website_listings index
    //success allback: set_website_listings and call #changed()
    var page = page_idx || 1;

    var api_url = 'api/website_listings?page=' + page;

    $.get(api_url, {}, function(data){
      _website_listings = data;
      WebsiteListingStore.changed();
    }, "json");
  },

  updateWebsiteListing: function (id, payload) {
    var website_listing = WebsiteListingStore.find(id);

    if (website_listing !== -1 ) {
      $.ajax({
        url: 'api/website_listings/' + id,
        data: {website_listing: payload},
        type: 'PATCH',
        success: function (result) {
          website_listing.name = result.name;
          website_listing.url = result.url;
          website_listing.note = result.note;
          WebsiteListingStore.changed();
        }
      });
    }
  },

  find: function (id) {
    var website_listing, i;
    for(i = 0; i < _website_listings.length; i++){
      website_listing = _website_listings[i];

      if (website_listing.id === id) {
        return website_listing;
      }
    }

    return -1;
  }
};

module.exports = WebsiteListingStore;
