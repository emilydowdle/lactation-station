$(document).ready(function () {

  var $drugs = $('#all-drugs .collection-item');

  $('#drug_filter_by_name').keyup('change', function () {
    var currentDrug = this.value;
    $drugs.each(function (index, drug) {
      $drug = $(drug);
      $drugName = $(drug).children('h5');
      if ($drugName.data('name').includes(currentDrug)) {
        $drug.show();
      }
      else {
        $drug.hide();
      }
    });
  });

});
