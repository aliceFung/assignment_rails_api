var movieObj = {
  init: function(){
    movieObj.attachListener();
    movieObj.getMovies();
  },

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
  },

  attachListener: function(){
    // document.getElementById("submit-movie").addEventListener("click", function(event){
    //   event.preventDefault();
    //   $.ajax({
    //     type: 'POST',
    //     url: 'http://localhost:3000/movies.json',
    //     dataType: 'json',
    //     success: function(json){
    //       movieObj.addMovie(json);
    //     }
    //   });
    // });
    $("#submit-movie").click(function(event){
      var str = $("#movie-name").val();
      console.log(str)
      event.preventDefault();
      $.ajax({
        type: 'POST',
        url: 'http://localhost:3000/movies.json',
        data: {movie: {name: str}},
        dataType: 'json',
        success: function(json){
          movieObj.addMovie(json);
        }
      });
    });
  }
};