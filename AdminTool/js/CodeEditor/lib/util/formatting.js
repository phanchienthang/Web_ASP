(function() {

  CodeMirror.extendMode("css", {
    commentStart: "/*",
    commentEnd: "*/",
    newlineAfterToken: function(_type, content) {
      return /^[;{}]$/.test(content);
    }
  });

  CodeMirror.extendMode("javascript", {
    commentStart: "/*",
    commentEnd: "*/",
    // FIXME semicolons inside of for
    newlineAfterToken: function(_type, content, textAfter, state) {
      if (this.jsonMode) {
        return /^[\[,{]$/.test(content) || /^}/.test(textAfter);
      } else {
        if (content == ";" && state.lexical && state.lexical.type == ")") return false;
        return /^[;{}]$/.test(content) && !/^;/.test(textAfter);
      }
    }
  });

  /*CodeMirror.extendMode("xml", {
    commentStart: "<!--",
    commentEnd: "-->",
    newlineAfterToken: function(type, content, textAfter) {
      return type == "tag" && />$/.test(content) || /^</.test(textAfter);
    }
  });*/
  
  CodeMirror.extendMode("xml", {
    commentStart: "<!--",
    commentEnd: "-->",
    noBreak: false,
    noBreakEmpty: null,
    tagType: "",
    tagName: "",
    newlineAfterToken: function(type, content, textAfter) {
      var noBreakTagsInner = ["label","li","option","textarea","title","p","div","h1","h2","h3","h4","h5","h6"];
      var noBreakTagsOuter = ["a","b","bdi","bdo","big","center","cite","del","em","font","i","ins","s","small","strike","strong","sub","sup","u","span"]; 
      var noBreakTagsEither = noBreakTagsInner.concat(noBreakTagsOuter);
      if(type == "tag") {
        if(content.indexOf("<") == 0 && !content.indexOf("</") == 0) {
	  this.tagType = "open";
	  matches = content.match(/^<\s*?([\w]+?)$/);
          if(matches != null) this.tagName = matches[1];
	  if(RegExp("^<\s*?(" + noBreakTagsEither.join("|") + ")$", "i").test(content)) {
	    this.noBreak = true;
	  }
	}
	if(content.indexOf(">") == 0 && this.tagType == "open") {
	  this.tagType = "";
	  if(RegExp("^<\/\s*?" + this.tagName + "\s*?>", "i").test(textAfter)) {
	    this.noBreak = false;
	    this.tagName = "";
	    return false;
	  }
          if(this.noBreak == true) {
	    this.noBreak = false;
	    return false;
	  } else {
	    this.noBreak = false;
	    return true;
	  }
	}
	if(content.indexOf("</") == 0) {
	  this.tagType = "close";
	  if(RegExp("^<\/\s*?(" + noBreakTagsOuter.join("|") + ")(\s|$|>)", "i").test(content)) {
	    this.noBreak = true; 
	  }
	}
	if(content.indexOf(">") == 0 && this.tagType == "close") {
	  this.tagType = "";
          if(this.noBreak) {
	    this.noBreak = false;
            if(textAfter.indexOf("<") == 0 && !RegExp("^<\/?\s*?(" + noBreakTagsEither.join("|") + ")(\s|>)", "i").test(textAfter)) {
	      return true;
	    } else {
	      return false;
	    }
	  }
	  return true;
	}
      } else if(textAfter.indexOf("<") == 0){
        this.noBreak = false;
	if(RegExp("^<\/?\s*?(" + noBreakTagsEither.join("|") + ")(\s|>)", "i").test(textAfter)) {
	  return false;
	} else {
	  return true;
	} 
      }
      return false 
    }
  });
  
  // Comment/uncomment the specified range
  CodeMirror.defineExtension("commentRange", function (isComment, from, to) {
    var cm = this, curMode = CodeMirror.innerMode(cm.getMode(), cm.getTokenAt(from).state).mode;
    cm.operation(function() {
      if (isComment) { // Comment range
        cm.replaceRange(curMode.commentEnd, to);
        cm.replaceRange(curMode.commentStart, from);
        if (from.line == to.line && from.ch == to.ch) // An empty comment inserted - put cursor inside
          cm.setCursor(from.line, from.ch + curMode.commentStart.length);
      } else { // Uncomment range
        var selText = cm.getRange(from, to);
        var startIndex = selText.indexOf(curMode.commentStart);
        var endIndex = selText.lastIndexOf(curMode.commentEnd);
        if (startIndex > -1 && endIndex > -1 && endIndex > startIndex) {
          // Take string till comment start
          selText = selText.substr(0, startIndex)
          // From comment start till comment end
            + selText.substring(startIndex + curMode.commentStart.length, endIndex)
          // From comment end till string end
            + selText.substr(endIndex + curMode.commentEnd.length);
        }
        cm.replaceRange(selText, from, to);
      }
    });
  });

  // Applies automatic mode-aware indentation to the specified range
  CodeMirror.defineExtension("autoIndentRange", function (from, to) {
    var cmInstance = this;
    this.operation(function () {
      for (var i = from.line; i <= to.line; i++) {
        cmInstance.indentLine(i, "smart");
      }
    });
  });

  // Applies automatic formatting to the specified range
  CodeMirror.defineExtension("autoFormatRange", function (from, to) {
    var cm = this;
    var outer = cm.getMode(), text = cm.getRange(from, to).split("\n");
    var state = CodeMirror.copyState(outer, cm.getTokenAt(from).state);
    var tabSize = cm.getOption("tabSize");

    var out = "", lines = 0, atSol = from.ch == 0;
    function newline() {
      out += "\n";
      atSol = true;
      ++lines;
    }

    for (var i = 0; i < text.length; ++i) {
      var stream = new CodeMirror.StringStream(text[i], tabSize);
      while (!stream.eol()) {
        var inner = CodeMirror.innerMode(outer, state);
        var style = outer.token(stream, state), cur = stream.current();
        stream.start = stream.pos;
        if (!atSol || /\S/.test(cur)) {
          out += cur;
          atSol = false;
        }
        if (!atSol && inner.mode.newlineAfterToken &&
            inner.mode.newlineAfterToken(style, cur, stream.string.slice(stream.pos) || text[i+1] || "", inner.state))
          newline();
      }
      if (!stream.pos && outer.blankLine) outer.blankLine(state);
      if (!atSol) {newline();}
    }

    cm.operation(function () {
      cm.replaceRange(out, from, to);
      for (var cur = from.line + 1, end = from.line + lines; cur <= end; ++cur)
        cm.indentLine(cur, "smart");
      cm.setSelection(from, cm.getCursor(false));
    });
  });
})();
