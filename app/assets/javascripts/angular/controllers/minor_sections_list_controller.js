var app = angular.module('obstetrics');

app.controller('MinorSectionsListCtrl', ['$scope', function($scope) {
  $('.minor-sections-list').sortable({handle: '.minor-section-move-icon'}).bind('sortupdate', function(e, ui) {
    var url = $(ui.item).data("url")

    $.ajax({
      url: url,
      method: "POST",
      data: {
        index: ui.index
      }
    })
    /*

    This event is triggered when the user stopped sorting and the DOM position has changed.

    ui.item contains the current dragged element.
    ui.index contains the new index of the dragged element (considering only list items)
    ui.oldindex contains the old index of the dragged element (considering only list items)
    ui.elementIndex contains the new index of the dragged element (considering all items within sortable)
    ui.oldElementIndex contains the old index of the dragged element (considering all items within sortable)
    ui.startparent contains the element that the dragged item comes from
    ui.endparent contains the element that the dragged item was added to (new parent)

    */
  });
}]);