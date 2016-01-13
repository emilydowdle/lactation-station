$(function(){
  $('#search-submit').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('<div id="loader"><img src="/ajax-loader.gif" alt="Loading..."></div>');

    var name = $('#drug-name').val();
    var requri = 'https://api.fda.gov/drug/label.json?search=substance_name:"' + name + '"';

    $.getJSON(requri, function(data) {
      if(data.message == "Not Found") {
        $('drug-data').html('<h2>There is no information from the FDA to display.</h2>');
      }

      else {
        var nursing_mothers = data.results[0].nursing_mothers
        var substance_name = data.results[0].openfda.substance_name
        var description = data.results[0].description
        var indications_and_usage = data.results[0].indications_and_usage
        var manufacturer = data.results[0].openfda.manufacturer_name

        $('#drug-data').html('<div class="margin-top-40 margin-bottom-80">' +
        '<h3>' + substance_name + '</h3><h5>Information from the FDA</h5><p>' +
        '<p>The information below is provided by OpenFDA, a research project. This data is not intended for clinical use. While the FDA makes every effort to ensure the data is accurate, you should assume all results are unvalidated.</p>' +
        '<p><strong>Nursing Mothers: </strong>' + nursing_mothers + '</p>' +
        '<p><strong>Drug Description: </strong>' + description + '</p>' +
        '<p><strong>Usage: </strong>' + indications_and_usage + '</p>' +
        '<p><strong>Manufacturer: </strong>' + manufacturer + '</p>')
      }
    });
  });
});
