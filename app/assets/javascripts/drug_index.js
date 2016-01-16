$(function(){
  $('.drugs-by-letter #letter-a').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('<div id="loader"><%= image_tag("ajax-loader.gif", class:"center-element margin-top-40", alt:"Loading...") %></div>');
    var letter = 'A';
    var reqUri = 'http://localhost:3000/api/v1/drugs/letter_match/' + letter;

    $.getJSON(reqUri, function(data) {
      $('#drug-data').html('<div class="margin-top-80"><h5>Information from LactMed</h5><p>' +
      '<p>The information below comes from the Drugs and Lactation Database (LactMed), a database of drugs and chemicals from the National Institutes of Health (NIH). All data are derived from fully-referenced, peer-reviewed scientific literature. For even more information on ' + name + 'according to the NIH, visit <a href="http://toxnet.nlm.nih.gov/newtoxnet/lactmed.htm">LactMed</a>.</p></div>');
      var drugs = {};

      $.each(data, function (key, val) {
        var name = val.name;
        var summary = val.summary;
        var drug_levels = val.drug_levels;
        var effects_in_breastfed_infants = val.effects_in_breastfed_infants;
        var effects_on_lactation_and_breastmilk = val.effects_on_lactation_and_breastmilk;
        var drug_classes = val.drug_classes;

        if (drugs[name] == undefined) {
          $('#drug-data').append('<div class="margin-top-40">' +
          '<h3>' + name + '</h3>' +
          '<p><strong>Summary: </strong>' + summary + '</p>' +
          '<p><strong>Drug Classes: </strong>' + drug_classes + '</p>' +
          '<a href=/drugs/' + name + '>View More Information</a>');

          drugs[name] = val;
        }
        }
      );
    })

    .fail(function() {
      console.log(name);
      $('#drug-data').html('<div class="margin-top-40 margin-bottom-80"><p>There is no information on <span class="capitalize">' + name + '</span> from the FDA to display.</p></div>');
      console.log(name);
    });

  });
});
