JSHINT.run = function( src, options ) {
  if ( !JSHINT( src, options ) ) {
    return JSHINT.errors;
  }
};
