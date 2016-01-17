$(function(){
  $('#search-submit.search-by-name').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('<div id="loader"><img class="center-element margin-top-40" alt="Loading..." src="/assets/ajax-loader-1eb9e7880f723999a4ed63eece6a6e4d4976833d3c16dc18b4ace3971728ab0d.gif" /></div>');

    var name = $('#drug-name').val();
    var fdaReqUri = 'https://api.fda.gov/drug/label.json?search=substance_name:"' + name + '"';
    var lactMedReqUri = 'http://localhost:3000/api/v1/drugs/' + name;

    $.getJSON(lactMedReqUri, function(data) {
      var name = data.name
      var summary = data.summary;
      var drug_levels = data.drug_levels;
      var effects_in_breastfed_infants = data.effects_in_breastfed_infants;
      var effects_on_lactation_and_breastmilk = data.effects_on_lactation_and_breastmilk;
      var drug_classes = data.drug_classes;

      $('#drug-data').html('<div class="margin-top-40">' +
      '<h3>' + name + '</h3><h5>Information from LactMed</h5><p>' +
      '<p>The information below comes from the Drugs and Lactation Database (LactMed), a database of drugs and chemicals from the National Institutes of Health (NIH). All data are derived from fully-referenced, peer-reviewed scientific literature. For even more information on ' + name + 'according to the NIH, visit <a href="http://toxnet.nlm.nih.gov/newtoxnet/lactmed.htm">LactMed</a>.</p>' +
      '<p><strong>Summary: </strong>' + summary + '</p>' +
      '<p><strong>Drug Levels: </strong>' + drug_levels + '</p>' +
      '<p><strong>Effects in Breastfed Infants: </strong>' + effects_in_breastfed_infants + '</p>' +
      '<p><strong>Effects on Lactation and Breastmilk: </strong>' + effects_on_lactation_and_breastmilk + '</p>' +
      '<p><strong>Drug Classes: </strong>' + drug_classes + '</p>')
    })

    $.getJSON(fdaReqUri, function(data) {
      var nursing_mothers = data.results[0].nursing_mothers;
      var substance_name = data.results[0].openfda.substance_name;
      var description = data.results[0].description;
      var indications_and_usage = data.results[0].indications_and_usage;
      var manufacturer = data.results[0].openfda.manufacturer_name;

      $('#drug-data').append('<div class="margin-top-40 margin-bottom-80">' +
      '<h5>Information from the FDA</h5><p>' +
      '<p>The information below is provided by OpenFDA, a research project. This data is not intended for clinical use. While the FDA makes every effort to ensure the data is accurate, you should assume all results are unvalidated.</p>' +
      '<p><strong>Nursing Mothers: </strong>' + nursing_mothers + '</p>' +
      '<p><strong>Drug Description: </strong>' + description + '</p>' +
      '<p><strong>Usage: </strong>' + indications_and_usage + '</p>' +
      '<p><strong>Manufacturer: </strong>' + manufacturer + '</p>')
    })

    .fail(function() {
      console.log(name)
      $('#drug-data').html('<div class="margin-top-40 margin-bottom-80"><p>There is no information on <span class="capitalize">' + name + '</span> from the FDA to display.</p></div>');
      console.log(name)
    });

  });
});
