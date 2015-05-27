var shell = require('shelljs/global');


/**
 * Add title and arranger's name to our lilypond file
 * @param {String} music  lilypond music code
 * @param {Object} metada sheet's metadata
 * FIXME : To move somewhere else (maybe on a module called "utils" ?)
 */
var _appendTitleAndArranger = function(music,metada){
  var template = '\\header{ title = "${title}" composer="${arranger}" }';

  template = template.replace('${title}',metadata.title);
  template = template.replace('${arranger}',metadata.arranger);
  music += template;
  return music;
}




/**
 * Compile our lilypond data to pdf
 * @param  {String} music    lilypond data
 * @param  {Object} metadata sheet metadata
 *
 */
var compile = function(music,metadata){
  try{
    var title = metadata.title || 'output';
    var musicToCompile = _appendTitleAndArranger(music,metadata);
    mkdir('./.tmp');
    musicToCompile.to('./.tmp/'+title+'.ly');
    mkdir('./output');
    exec('lilypond -o ./output/'+title+' ./.tmp/'+title+'.ly',{async:true});
  }
  catch(e){
    console.error(e);
  }
}



module.exports = {
  compile : compile
}
