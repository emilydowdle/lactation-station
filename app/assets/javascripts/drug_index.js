function apiRequest(letter) {
  var letter = letter;
  var reqUri = '/api/v1/drugs/letter_match/' + letter;

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
}

$(function(){
  $('.drugs-by-letter #letter-a').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('A');
  });
});

$(function(){
  $('.drugs-by-letter #letter-b').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('<div id="b-drugs"></div>');
    apiRequest('B');
  });
});

$(function(){
  $('.drugs-by-letter #letter-c').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('C');
  });
});

$(function(){
  $('.drugs-by-letter #letter-d').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('D');
  });
});

$(function(){
  $('.drugs-by-letter #letter-e').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('E');
  });
});

$(function(){
  $('.drugs-by-letter #letter-f').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('F');
  });
});

$(function(){
  $('.drugs-by-letter #letter-g').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('G');
  });
});

$(function(){
  $('.drugs-by-letter #letter-h').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('H');
  });
});

$(function(){
  $('.drugs-by-letter #letter-i').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('I');
  });
});

$(function(){
  $('.drugs-by-letter #letter-j').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('J');
  });
});

$(function(){
  $('.drugs-by-letter #letter-k').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('K');
  });
});

$(function(){
  $('.drugs-by-letter #letter-l').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('L');
  });
});

$(function(){
  $('.drugs-by-letter #letter-m').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('M');
  });
});

$(function(){
  $('.drugs-by-letter #letter-n').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('N');
  });
});

$(function(){
  $('.drugs-by-letter #letter-o').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('O');
  });
});

$(function(){
  $('.drugs-by-letter #letter-p').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('P');
  });
});

$(function(){
  $('.drugs-by-letter #letter-q').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('Q');
  });
});

$(function(){
  $('.drugs-by-letter #letter-r').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('R');
  });
});

$(function(){
  $('.drugs-by-letter #letter-s').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('S');
  });
});

$(function(){
  $('.drugs-by-letter #letter-t').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('T');
  });
});

$(function(){
  $('.drugs-by-letter #letter-u').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('U');
  });
});

$(function(){
  $('.drugs-by-letter #letter-v').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('V');
  });
});

$(function(){
  $('.drugs-by-letter #letter-w').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('W');
  });
});

$(function(){
  $('.drugs-by-letter #letter-x').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('X');
  });
});

$(function(){
  $('.drugs-by-letter #letter-y').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('Y');
  });
});

$(function(){
  $('.drugs-by-letter #letter-z').on('click', function(e){
    e.preventDefault();
    $('#drug-data').html('');
    apiRequest('Z');
  });
});
