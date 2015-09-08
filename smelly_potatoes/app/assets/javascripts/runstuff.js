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
      } // end for loop
    }
    });
  },

  addMovie: function(movie){
    $('#movie-table').append('<tr><td>'+movie.id+' </td><td>'+movie.name+'</td><td>'+movie.release_date + '</td></tr>');
  }
}