var MailDemo = {
    PendingCallbacks: { },
    DoCallback: function(sender, callback) {
        if(sender.InCallback()) {
            MailDemo.PendingCallbacks[sender.name] = callback;
            sender.EndCallback.RemoveHandler(MailDemo.DoEndCallback);
            sender.EndCallback.AddHandler(MailDemo.DoEndCallback);
        } else {
            callback();
        }
    },

    DoEndCallback: function(s, e) {
        var pendingCallback = MailDemo.PendingCallbacks[s.name];
        if(pendingCallback) {
            pendingCallback();
            delete MailDemo.PendingCallbacks[s.name];
        }
    },

    // Site master

    ClientThemeSelector_SelectedIndexChanged: function(s, e) {
        ASPxClientUtils.SetCookie("MailDemoCurrentTheme", s.GetValue() || "");
    },

    ClientLayoutSplitter_Init: function(s, e) {
        //document.getElementById("HeaderArea").style.height = 
            //s.GetPaneByName("HeaderPane").GetClientHeight() - ClientHeaderMenu.GetMainElement().offsetHeight + "px";
        
        //s.GetPaneByName("CornerPane").SetSize(ClientCornerMenu.GetMainElement().offsetHeight);
    },

    // Mail page

    ClientMailTree_NodeClick: function(s, e) {
        if(e.node.text === "Inbox" || e.node.parent && e.node.parent.text === "Inbox") {
            ClientSearchBox.SetText("");
            MailDemo.DoCallback(ClientMailPanel, function() { 
                ClientMailPanel.PerformCallback() 
            });
        }
    },

    ClientMailSplitter_PaneResized: function(s, e) {
        if(e.pane.name === "GridPane")
            ClientMailGrid.SetHeight(e.pane.GetClientHeight() - ClientMailMenu.GetMainElement().offsetHeight);
    },

    ClientMailMenu_ItemClick: function(s, e) {
        var name = e.item.name;
        if(name === "compose" || name === "reply" || name === "fwd") {
            if(window.ClientMailEditor)
                ClientMailEditor.SetHtml("");
            ClientMailSendButton.SetEnabled(false);
            ClientMailEditorPopup.Show();

            var key = -1;
            if(name !== "compose")
                key = ClientMailGrid.GetRowKey(ClientMailGrid.GetFocusedRowIndex());
            MailDemo.DoCallback(ClientMailEditorPopup, function() { 
            ClientMailEditorPopup.PerformCallback(key);
            });
            
        }
    },

    ClientMailGrid_Init: function(s, e) {
        s.Focus();
    },

    ClientMailGrid_FocusedRowChanged: function(s, e) {
        var currentRow = s.GetFocusedRowIndex(),
            canReply = !!s.GetVisibleRowsOnPage() && !s.IsGroupRow(currentRow);

        ClientMailMenu.GetItemByName("reply").SetEnabled(canReply);
        ClientMailMenu.GetItemByName("fwd").SetEnabled(canReply);

        MailDemo.DoCallback(ClientMailMessagePanel, function() { 
        ClientMailMessagePanel.PerformCallback(s.GetRowKey(currentRow));
        ClientMailSplitter.GetPaneByName("MessagePane").SetScrollTop(0);
        });
    },

    ClientMailGrid_EndCallback: function(s, e) {
        ClientMailSplitter.GetPaneByName("GridPane").RaiseResizedEvent();
    },

    ClientSearchBox_TextChanged: function(s, e) {
        MailDemo.DoCallback(ClientMailPanel, function() { 
        ClientMailPanel.PerformCallback();
        });
    },

    ClientSearchBox_KeyPress: function(s, e) {
        e = e.htmlEvent;
        if(e.keyCode === 13) {
            // prevent default browser form submission
            if(e.preventDefault)
                e.preventDefault();
            else
                e.returnValue = false;
        }
    },

    ClientMailEditor_Init: function(s, e) {
        window.setTimeout(function() { s.Focus(); }, 0);
        ClientMailSendButton.SetEnabled(true);
    },

    ClientMailSendButton_Click: function(s, e) {
        alert("The functionality of sending messages is not implemented in this demo application.");
        ClientMailEditorPopup.Hide();
    },

    ClientMailCancelButton_Click: function(s, e) {
        ClientMailEditorPopup.Hide();
    },

    // Calendar page

    ClientResourceCheckBox_CheckedChanged: function(s, e) {
        MailDemo.DoCallback(ClientScheduler, function() { 
            ClientScheduler.Refresh();
        });
    },

    ClientScheduler_AppointmentDoubleClick: function(s, e) {
        s.ShowAppointmentFormByClientId(e.appointmentId);
        e.handled = true;
    },

    // Contacts page

    ClientContactSplitter_PaneResized: function(s, e) {
        if(e.pane.name == "GridPane")
            ClientContactGrid.SetHeight(e.pane.GetClientHeight());
    },

    ClientContactGrid_Init: function(s, e) {
        s.Focus();
    },

    ClientContactGrid_FocusedRowChanged: function(s, e) {
        MailDemo.DoCallback(ClientContactDetailsPanel, function() { 
        ClientContactDetailsPanel.PerformCallback();
        });
    },

    ClientContactGrid_EndCallback: function(s, e) {
        ClientContactSplitter.GetPaneByName("GridPane").RaiseResizedEvent();
    },

    ClientContactViewOptions_SelectedIndexChanged: function(s, e) {
        MailDemo.DoCallback(ClientContactPanel, function() { 
        ClientContactPanel.PerformCallback(s.GetSelectedIndex());
        });
        
    },

    // Feeds page

    ClientFeedNavBar_ItemClick: function(s, e) {
        MailDemo.DoCallback(ClientFeedPanel, function() { 
            ClientFeedPanel.PerformCallback();
        });
    },

    ClientFeedSplitter_PaneResized: function(s, e) {
        if(e.pane.name === "GridPane")
            ClientFeedGrid.SetHeight(e.pane.GetClientHeight());
    },

    ClientFeedGrid_Init: function(s, e) {
        s.Focus();
    },

    ClientFeedGrid_FocusedRowChanged: function(s, e) {        
        if(window.ClientFeedDescriptionPanel)
            MailDemo.DoCallback(ClientFeedDescriptionPanel, function() { 
                ClientFeedDescriptionPanel.PerformCallback();
            });
    },

    ClientFeedGrid_EndCallback: function(s, e) {
        ClientFeedSplitter.GetPaneByName("GridPane").RaiseResizedEvent();
    }

};