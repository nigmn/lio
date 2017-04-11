function show_result(data)
{
  var result = document.getElementById("result");
  result.innerHTML = "<tr><th>Number</th><th>Binary code</th><th>Reversed binary code</th><th>Processed number</th></tr>"
  arr = data.value
  // alert(result.constructor.name)
  for (var i=0; i < arr.length; i++)
  {
    var row = result.insertRow()
    for (var j=0; j < arr[i].length; j++)
    {
      var cell = row.insertCell()
      cell.innerHTML = arr[i][j]
    }
  }
}
 
$(document).ready
  (
    function()
    {
       $("form").bind("ajax:success",function(xhr, data, status)
       {
         show_result(data)
       })
    }
  )