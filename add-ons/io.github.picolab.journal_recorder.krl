ruleset io.github.picolab.journal_recorder {
  meta {
    shares __testing
  }
  global {
    __testing = { "queries":
      [ { "name": "__testing" }
      ], "events":
      [ { "domain": "journal_recorder", "type": "new_url", "attrs": ["url"] }
      ]
    }
    makeMT = function(ts){
      MST = time:add(ts,{"hours": -7});
      MDT = time:add(ts,{"hours": -6});
      MDT > "2020-11-01T02" => MST |
      MST > "2020-03-08T02" => MDT |
                               MST
    }
  }
  rule set_up_url {
    select when journal_recorder new_url url re#^(http.*)# setting(url)
    fired {
      ent:url := url;
      ent:urlInEffectSince := time:now()
    }
  }
  rule record_journal_entry {
    select when journal new_entry
      title re#^(.+)$#
      content re#^(.*)$#
      setting(title,content)
    pre {
      date = event:attr("date")
      data = {
        "timestamp": time:now().makeMT().time:strftime("%F %T"),
        "entry": title,
        "comment": content
      }
    }
    http:post(ent:url,qs=data) setting(response)
    fired {
      ent:lastData := data;
      ent:lastResponse := response;
      raise journal_recorder event "recorded_to_sheet" attributes data
    }
  }
}
