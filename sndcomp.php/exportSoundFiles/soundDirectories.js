(function() {
  'use strict';
  var sources = [];
  process.argv.forEach(function(arg){
    if(/^.*\.json$/.test(arg)){
      sources.push(arg);
    }
  });
  var directorySet = {};
  sources.forEach(function(source){
    var data = require(source);

    Object.keys(data.transcriptions).forEach(function(key){
      var transcription = data.transcriptions[key];
      transcription.soundPaths.forEach(function(soundPath){
        var parts = soundPath.split('/');
        soundPath = parts.slice(0, parts.length - 1).join('/');
        directorySet[soundPath] = true;
      });
    });
  });

  console.log("mkdir sound");
  console.log("cd sound");
  console.log("rsync -r --exclude '*wav' --progress ../../../../nginx/{"+Object.keys(directorySet).join(",")+"} .");
}());
