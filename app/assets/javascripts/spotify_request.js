// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  return $('#_spotify_search_name').autocomplete({
    source: $('#_spotify_search_name').data('autocomplete-source')
  });
});
