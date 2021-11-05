ruleset io.picolabs.journal {
  meta {
    shares __testing, getEntry
  }
  
  global {
    __testing = { "queries":
      [ { "name": "__testing" }
      , { "name": "getEntry", "args": [ "title" ] }
      ] , "events":
      [ { "domain": "journal", "type": "new_entry", "attrs": [ "title", "content" ] }
      , { "domain": "journal", "type": "delete_entry", "attrs": [ "timestamp" ] }
      , { "domain": "journal", "type": "edit_entry", "attrs": [ "timestamp", "newContent" ] }
      ]
    }
    
    getEntry = function(title) {
      (title) => ent:entries.filter(function(x){
        x{"title"} == title
      })[0] | ent:entries;
    }
    
    app = {"name":"journal","version":"0.0"/* img: , pre: , ..*/};
    bindings = function(){
      {
        //currently no bindings
      };
    }
    
  }
  
  // icon image from https://image.flaticon.com/icons/svg/201/201642.svg
  rule discovery { select when manifold apps send_directive("app discovered...", {"app": app, "rid": meta:rid, "bindings": bindings(), "iconURL": "data:image/svg+xml;charset=UTF-8,<?xml%20version=%271.0%27%20encoding=%27iso-8859-1%27?%3E%3Csvg%20version=%271.1%27%20id=%27Layer_1%27%20xmlns=%27http://www.w3.org/2000/svg%27%20xmlns:xlink=%27http://www.w3.org/1999/xlink%27%20x=%270px%27%20y=%270px%27%20viewBox=%270%200%20512%20512%27%20style=%27enable-background:new%200%200%20512%20512;%27%20xml:space=%27preserve%27%3E%3Cpath%20style=%27fill:%230E7886;%27%20d=%27M256.001,512C397,512,512,397,512,256.001C512,115,397,0,256.001,0C115,0,0,115,0,256.001%20C0,397,115,512,256.001,512z%27/%3E%3Cpath%20style=%27fill:%2315BDB1;%27%20d=%27M74.099,92.841h282.601v365.467c0,11.169-9.136,20.307-20.302,20.307H94.847%20c-11.413,0-20.745-9.338-20.745-20.745V92.843L74.099,92.841z%27/%3E%3Cpath%20style=%27fill:%23ECF0F1;%27%20d=%27M85.995,87.553h242.228c22.204,0,40.37,18.167,40.37,40.373v305.028%20c0,22.206-18.167,40.373-40.37,40.373H106.297c-11.169,0-20.302-9.138-20.302-20.305V87.555V87.553z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M85.995,83.818h242.228c22.204,0,40.37,18.164,40.37,40.37v305.028%20c0,22.206-18.167,40.373-40.37,40.373H106.297c-11.169,0-20.302-9.138-20.302-20.307V83.815V83.818z%27/%3E%3Cpath%20style=%27fill:%23ECF0F1;%27%20d=%27M85.995,64.426h232.032c21.272,0,38.671,17.401,38.671,38.673v308.43%20c0,21.27-17.398,38.671-38.671,38.671H85.995V64.426z%27/%3E%3Cpath%20style=%27fill:%2315BDB1;%27%20d=%27M74.099,60.234H316.33c22.201,0,40.37,18.167,40.37,40.37v305.028%20c0,22.206-18.167,40.376-40.37,40.376H74.099V60.234z%27/%3E%3Cpath%20style=%27fill:%23FBB429;%27%20d=%27M74.099,60.234h52.232v385.771H74.099V60.234z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,78.375c5.784,0,10.471,4.687,10.471,10.471c0,5.778-4.687,10.468-10.471,10.468%20c-5.778,0-10.468-4.69-10.468-10.468C89.205,83.062,93.893,78.375,99.674,78.375z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,85.793h28.719c1.988,0,3.614,1.626,3.614,3.617s-1.626,3.617-3.614,3.617H68.305%20c-1.988,0-3.614-1.626-3.614-3.617S66.317,85.793,68.305,85.793z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,109.935c5.784,0,10.471,4.687,10.471,10.468s-4.687,10.468-10.471,10.468%20c-5.778,0-10.468-4.69-10.468-10.468C89.205,114.619,93.893,109.935,99.674,109.935z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,117.35h28.719c1.988,0,3.614,1.626,3.614,3.617s-1.626,3.617-3.614,3.617H68.305%20c-1.988,0-3.614-1.626-3.614-3.617S66.317,117.35,68.305,117.35z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,141.489c5.784,0,10.471,4.687,10.471,10.471c0,5.781-4.687,10.468-10.471,10.468%20c-5.778,0-10.468-4.69-10.468-10.468C89.205,146.177,93.893,141.489,99.674,141.489z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,148.91h28.719c1.988,0,3.614,1.624,3.614,3.614c0,1.991-1.626,3.614-3.614,3.614H68.305%20c-1.988,0-3.614-1.626-3.614-3.614C64.691,150.533,66.317,148.91,68.305,148.91z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,173.047c5.784,0,10.471,4.69,10.471,10.471c0,5.781-4.687,10.468-10.471,10.468%20c-5.778,0-10.468-4.69-10.468-10.468C89.205,177.736,93.893,173.047,99.674,173.047z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,180.467h28.719c1.988,0,3.614,1.626,3.614,3.614c0,1.991-1.626,3.614-3.614,3.614H68.305%20c-1.988,0-3.614-1.626-3.614-3.614C64.691,182.091,66.317,180.467,68.305,180.467z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,204.604c5.784,0,10.471,4.69,10.471,10.471c0,5.781-4.687,10.468-10.471,10.468%20c-5.778,0-10.468-4.687-10.468-10.468C89.205,209.294,93.893,204.604,99.674,204.604z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,212.024h28.719c1.988,0,3.614,1.626,3.614,3.614c0,1.991-1.626,3.614-3.614,3.614H68.305%20c-1.988,0-3.614-1.626-3.614-3.614C64.691,213.648,66.317,212.024,68.305,212.024z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,236.164c5.784,0,10.471,4.687,10.471,10.471c0,5.781-4.687,10.468-10.471,10.468%20c-5.778,0-10.468-4.687-10.468-10.468C89.205,240.851,93.893,236.164,99.674,236.164z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,243.579h28.719c1.988,0,3.614,1.626,3.614,3.617c0,1.991-1.626,3.614-3.614,3.614H68.305%20c-1.988,0-3.614-1.626-3.614-3.614C64.691,245.205,66.317,243.579,68.305,243.579z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,267.721c5.784,0,10.471,4.687,10.471,10.471c0,5.778-4.687,10.468-10.471,10.468%20c-5.778,0-10.468-4.687-10.468-10.468C89.205,272.408,93.893,267.721,99.674,267.721z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,275.136h28.719c1.988,0,3.614,1.626,3.614,3.617c0,1.991-1.626,3.614-3.614,3.614H68.305%20c-1.988,0-3.614-1.626-3.614-3.614C64.691,276.762,66.317,275.136,68.305,275.136z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,299.278c5.784,0,10.471,4.687,10.471,10.468s-4.687,10.471-10.471,10.471%20c-5.778,0-10.468-4.69-10.468-10.471S93.893,299.278,99.674,299.278z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,306.693h28.719c1.988,0,3.614,1.626,3.614,3.617s-1.626,3.617-3.614,3.617H68.305%20c-1.988,0-3.614-1.626-3.614-3.617S66.317,306.693,68.305,306.693z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,330.833c5.784,0,10.471,4.69,10.471,10.471c0,5.781-4.687,10.471-10.471,10.471%20c-5.778,0-10.468-4.69-10.468-10.471C89.205,335.523,93.893,330.833,99.674,330.833z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,338.25h28.719c1.988,0,3.614,1.626,3.614,3.615c0,1.991-1.626,3.617-3.614,3.617H68.305%20c-1.988,0-3.614-1.626-3.614-3.617S66.317,338.25,68.305,338.25z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,362.39c5.784,0,10.471,4.69,10.471,10.471s-4.687,10.471-10.471,10.471%20c-5.778,0-10.468-4.69-10.468-10.471S93.893,362.39,99.674,362.39z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,369.81h28.719c1.988,0,3.614,1.626,3.614,3.614c0,1.991-1.626,3.617-3.614,3.617H68.305%20c-1.988,0-3.614-1.626-3.614-3.617C64.691,371.437,66.317,369.81,68.305,369.81z%27/%3E%3Cpath%20style=%27fill:%23F5A209;%27%20d=%27M99.674,393.947c5.784,0,10.471,4.69,10.471,10.471c0,5.781-4.687,10.471-10.471,10.471%20c-5.778,0-10.468-4.69-10.468-10.471C89.205,398.634,93.893,393.947,99.674,393.947z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M68.305,401.367h28.719c1.988,0,3.614,1.626,3.614,3.617s-1.626,3.614-3.614,3.614H68.305%20c-1.988,0-3.614-1.626-3.614-3.614C64.691,402.994,66.317,401.367,68.305,401.367z%27/%3E%3Cpath%20style=%27fill:%2320D0C2;%27%20d=%27M405.779,302.906h30.547V39.164h-30.547V302.906z%27/%3E%3Cpath%20style=%27fill:%2315BDB1;%27%20d=%27M436.327,151.268v-7.622l-30.547-0.05v7.622l30.547,0.052V151.268z%27/%3E%3Cpath%20style=%27fill:%23FF5B61;%27%20d=%27M426.795,338.025l9.529-35.117h-30.547l9.626,35.117h11.389H426.795z%27/%3E%3Cpath%20style=%27fill:%23EC4B53;%27%20d=%27M426.797,337.988l9.527-35.082h-6.623l-5.11,35.117l2.203-0.034H426.797z%27/%3E%3Cpath%20style=%27fill:%23FF5B61;%27%20d=%27M412.048,13.424h18.007c4.952,0,9.002,4.422,9.002,9.82v122.609h-36.014V23.245%20c0-5.401,4.05-9.82,9.002-9.82H412.048z%27/%3E%3Cpath%20style=%27fill:%23EC4B53;%27%20d=%27M435.826,23.242v15.922l-0.003,39.156v67.534h0.504h2.731V80.216V23.245%20c0-5.398-4.053-9.82-9.005-9.82h-0.855c3.827,1.314,6.623,5.228,6.626,9.818H435.826z%27/%3E%3Cpath%20style=%27fill:%23FFFFFF;%27%20d=%27M420.442,363.145h1.272l5.081-25.12h-11.389l5.039,25.12H420.442z%27/%3E%3Cpath%20style=%27fill:%23ECF0F1;%27%20d=%27M403.036,39.744l42.109,0.247c1.422,0.199,2.159,0.989,2.161,2.353v71.219l-0.399,1.348l-3.253,5.07%20c-1.668,2.353-5.144,0.548-3.541-2.696l2.856-4.451V44.685l-39.948-0.231l0.016-4.711H403.036z%27/%3E%3Cpath%20style=%27fill:%2315BDB1;%27%20d=%27M433.796,302.906h2.531V151.26h-2.531V302.906z%27/%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3Cg%3E%3C/g%3E%3C/svg%3E"} ); }
  
  
  rule new_entry {
    select when journal new_entry
    
    pre {
      entry = { "timestamp" : time:now(), "title" : event:attr("title"), "content" : event:attr("content") }
    }
    
    always {
      ent:entries := ent:entries.defaultsTo([]).append(entry);
    }
    
  }
  
  rule delete_entry {
    select when journal delete_entry
    
    pre {
      timestamp = event:attr("timestamp");
      toDelete = ent:entries.filter(function(x) {
        x{"timestamp"} == timestamp
      })[0];
      toDeleteIndex = ent:entries.index(toDelete);
    }
    
    if (toDelete == -1) then noop();
    
    notfired {
      ent:entries := ent:entries.defaultsTo([]).splice(toDeleteIndex, 1);
    }
    
  }
  
  rule edit_entry {
    select when journal edit_entry
    
    pre {
      newContent = event:attr("newContent");
      timestamp = event:attr("timestamp");
      toChange = ent:entries.filter(function(x) {
        x{"timestamp"} == timestamp
      })[0];
    }
    
    if (toChange == -1) then noop();
    
    notfired {
      ent:entries := ent:entries.defaultsTo([]).map(function(x){
        (x == toChange) => x.put("content", newContent) | x;
      })
    }
    
  }
  
  
}
