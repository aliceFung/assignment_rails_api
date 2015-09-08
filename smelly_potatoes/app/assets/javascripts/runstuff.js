var movieObj = {

  
  getMovies: function(){ 
    $.ajax({
    type: 'GET',
    url: 'http://localhost:3000/movies.json',
    dataType: 'json',
    success: function(json){

      list = json;
      
      var $movieTable = $('#movie-table');
      console.log(list);
      for(var i=0; i<list.length; i++){
         $movieTable.append('<tr><td>'+list[i].id+' </td><td>'+list[i].name+'</td><td>'+list[i].release_date + '</td></tr>'); 
      }
      }   
    })
  }
}