/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {

    // ALLOW <i></i>
    //config.protectedSource.push(/<i[^>]*><\/i>/g);
    CKEDITOR.dtd.$removeEmpty.i = 0;
    //config.protectedSource.push(/<i[\s\S]*?\>/g); //allows beginning <i> tag
    //config.protectedSource.push(/<\/i[\s\S]*?\>/g); //allows ending </i> tag

    //config.enterMode = CKEDITOR.ENTER_BR;
    config.enterMode = CKEDITOR.ENTER_P;
    config.shiftEnterMode = CKEDITOR.ENTER_BR;
    config.autoParagraph = false;
	//config.language = 'vi';
	config.allowedContent = true;
	config.extraPlugins = 'youtube';
	
	config.entities = false;
	config.youtube_width = '640';
	config.youtube_height = '480';
	config.youtube_related = false;
	config.youtube_older = false;
	config.youtube_privacy = false;
	config.youtube_autoplay = false;
	config.codeSnippet_theme = 'github';
	config.skin = 'Moono_blue';
	config.plugins = 'dialogui,dialog,a11yhelp,dialogadvtab,basicstyles,bidi,clipboard,'
	    +'panelbutton,panel,floatpanel,colorbutton,colordialog,templates,menu,contextmenu,div,resize,toolbar,elementspath,'
        +'enterkey,entities,popup,filebrowser,find,fakeobjects,floatingspace,listblock,richcombo,font,forms,'
        +'format,horizontalrule,htmlwriter,wysiwygarea,image,indent,indentblock,indentlist,smiley,justify,'
        +'menubutton,language,link,list,liststyle,magicline,maximize,newpage,pagebreak,pastetext,pastefromword,'
        +'removeformat,selectall,showblocks,showborders,sourcearea,specialchar,stylescombo,tab,table,tabletools,undo,wsc';
	
	config.toolbarGroups = [
		{ name: 'document', groups: ['mode', 'document', 'doctools', 'clipboard', 'undo'] },
        //{ name: 'clipboard', groups: [] },
        { name: 'links' },
        { name: 'tools' },
        { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
		//{ name: 'editing', groups: ['find', 'selection'] },
		//{ name: 'forms' },
        { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi'] },
		{ name: 'insert', groups: ['video', 'youtube', 'others'] },
		
		{ name: 'styles' },
		{ name: 'colors' },
		
		//{ name: 'others' },
        //{ name: 'about' }
	];

	config.toolbar_Basic =
	[
		//{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
		//{ name: 'insert', items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] },
		//{ name: 'links', items : [ 'Link','Unlink','Anchor' ] },
		//'/',
		//{ name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
		//{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ] },
		//{ name: 'styles', items : [ 'Font', 'FontSize', 'TextColor', 'BGColor' ] },
		//{ name: 'tools', items : ['SwitchBar',  'Maximize'] },
	];
	config.removeButtons = 'Cut,Copy,Paste,Anchor,Language,HiddenField,TextField,Textarea,spellchecker,Checkbox,Radio,CreateDiv,Smiley';
	config.removeDialogTabs = 'link:advanced';
};