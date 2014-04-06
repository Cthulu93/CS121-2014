from bs4 import BeautifulSoup

htmlPage1 = """<html lang="en" dir="ltr" class="client-nojs">
<head>
<meta charset="UTF-8" />
<title>Category:English phrasebook - Wiktionary</title>
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
<meta name="generator" content="MediaWiki 1.23wmf19" />
<link rel="alternate" type="application/x-wiki" title="Edit" href="/w/index.php?title=Category:English_phrasebook&amp;action=edit" />
<link rel="edit" title="Edit" href="/w/index.php?title=Category:English_phrasebook&amp;action=edit" />
<link rel="apple-touch-icon" href="//bits.wikimedia.org/apple-touch/wiktionary/en.png" />
<link rel="shortcut icon" href="//bits.wikimedia.org/favicon/wiktionary/en.ico" />
<link rel="search" type="application/opensearchdescription+xml" href="/w/opensearch_desc.php" title="Wiktionary (en)" />
<link rel="EditURI" type="application/rsd+xml" href="//en.wiktionary.org/w/api.php?action=rsd" />
<link rel="copyright" href="//creativecommons.org/licenses/by-sa/3.0/" />
<link rel="alternate" type="application/atom+xml" title="Wiktionary Atom feed" href="/w/index.php?title=Special:RecentChanges&amp;feed=atom" />
<link rel="canonical" href="http://en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;pageuntil=I%27ve" />
<link rel="stylesheet" href="//bits.wikimedia.org/en.wiktionary.org/load.php?debug=false&amp;lang=en&amp;modules=ext.categoryTree.css%7Cext.uls.nojs%7Cext.wikihiero%7Cmediawiki.legacy.commonPrint%2Cshared%7Cmediawiki.ui.button%7Cmw.PopUpMediaTransform%7Cskins.common.interface%7Cskins.vector.styles&amp;only=styles&amp;skin=vector&amp;*" />
<meta name="ResourceLoaderDynamicStyles" content="" />
<link rel="stylesheet" href="//bits.wikimedia.org/en.wiktionary.org/load.php?debug=false&amp;lang=en&amp;modules=site&amp;only=styles&amp;skin=vector&amp;*" />
<style>a:lang(ar),a:lang(kk-arab),a:lang(mzn),a:lang(ps),a:lang(ur){text-decoration:none}
/* cache key: enwiktionary:resourceloader:filter:minify-css:7:3dcc16a20ad1c2eae2b6539515116338 */</style>

<script src="//bits.wikimedia.org/en.wiktionary.org/load.php?debug=false&amp;lang=en&amp;modules=startup&amp;only=scripts&amp;skin=vector&amp;*"></script>
<script>if(window.mw){
mw.config.set({"wgCanonicalNamespace":"Category","wgCanonicalSpecialPageName":false,"wgNamespaceNumber":14,"wgPageName":"Category:English_phrasebook","wgTitle":"English phrasebook","wgCurRevisionId":16641196,"wgRevisionId":16641196,"wgArticleId":1974588,"wgIsArticle":true,"wgIsRedirect":false,"wgAction":"view","wgUserName":null,"wgUserGroups":["*"],"wgCategories":["English phrases","Phrasebooks by language","English non-idiomatic translation targets"],"wgBreakFrames":false,"wgPageContentLanguage":"en","wgPageContentModel":"wikitext","wgSeparatorTransformTable":["",""],"wgDigitTransformTable":["",""],"wgDefaultDateFormat":"dmy","wgMonthNames":["","January","February","March","April","May","June","July","August","September","October","November","December"],"wgMonthNamesShort":["","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"wgRelevantPageName":"Category:English_phrasebook","wgIsProbablyEditable":true,"wgRestrictionEdit":[],"wgRestrictionMove":[],"wgWikiEditorEnabledModules":{"toolbar":true,"dialogs":true,"hidesig":true,"templateEditor":false,"templates":false,"preview":false,"previewDialog":false,"publish":false,"toc":false},"wgBetaFeaturesFeatures":[],"wgULSAcceptLanguageList":["en-us","en"],"wgULSCurrentAutonym":"English","wgCategoryTreePageCategoryOptions":"{\"mode\":0,\"hideprefix\":20,\"showcount\":true,\"namespaces\":false}","wgNoticeProject":"wiktionary"});
}</script><script>if(window.mw){
mw.loader.implement("user.options",function(){mw.user.options.set({"ccmeonemails":0,"cols":80,"date":"default","diffonly":0,"disablemail":0,"editfont":"default","editondblclick":0,"editsectiononrightclick":0,"enotifminoredits":0,"enotifrevealaddr":0,"enotifusertalkpages":1,"enotifwatchlistpages":0,"extendwatchlist":0,"fancysig":0,"forceeditsummary":0,"gender":"unknown","hideminor":0,"hidepatrolled":0,"imagesize":2,"math":0,"minordefault":0,"newpageshidepatrolled":0,"nickname":"","norollbackdiff":0,"numberheadings":0,"previewonfirst":0,"previewontop":1,"rcdays":7,"rclimit":50,"rememberpassword":0,"rows":25,"showhiddencats":false,"shownumberswatching":1,"showtoolbar":1,"skin":"vector","stubthreshold":0,"thumbsize":4,"underline":2,"uselivepreview":0,"usenewrc":0,"watchcreations":1,"watchdefault":0,"watchdeletion":0,"watchlistdays":3,"watchlisthideanons":0,"watchlisthidebots":0,"watchlisthideliu":0,"watchlisthideminor":0,"watchlisthideown":0,"watchlisthidepatrolled":0,"watchmoves":0,
"wllimit":250,"useeditwarning":1,"prefershttps":1,"usebetatoolbar":1,"usebetatoolbar-cgd":1,"lqtnotifytalk":false,"lqtdisplaydepth":5,"lqtdisplaycount":25,"lqtcustomsignatures":true,"lqt-watch-threads":true,"echo-notify-show-link":true,"echo-show-alert":true,"echo-email-frequency":0,"echo-email-format":"html","echo-subscriptions-email-system":true,"echo-subscriptions-web-system":true,"echo-subscriptions-email-other":false,"echo-subscriptions-web-other":true,"echo-subscriptions-email-edit-user-talk":false,"echo-subscriptions-web-edit-user-talk":true,"echo-subscriptions-email-reverted":false,"echo-subscriptions-web-reverted":true,"echo-subscriptions-email-article-linked":false,"echo-subscriptions-web-article-linked":false,"echo-subscriptions-email-mention":false,"echo-subscriptions-web-mention":true,"echo-subscriptions-web-edit-thank":true,"echo-subscriptions-email-edit-thank":false,"uls-preferences":"","language":"en","variant-gan":"gan","variant-iu":"iu","variant-kk":"kk","variant-ku":
"ku","variant-shi":"shi","variant-sr":"sr","variant-tg":"tg","variant-uz":"uz","variant-zh":"zh","searchNs0":true,"searchNs1":false,"searchNs2":false,"searchNs3":false,"searchNs4":false,"searchNs5":false,"searchNs6":false,"searchNs7":false,"searchNs8":false,"searchNs9":false,"searchNs10":false,"searchNs11":false,"searchNs12":false,"searchNs13":false,"searchNs14":false,"searchNs15":false,"searchNs90":false,"searchNs91":false,"searchNs92":false,"searchNs93":false,"searchNs100":false,"searchNs101":false,"searchNs102":false,"searchNs103":false,"searchNs104":false,"searchNs105":false,"searchNs106":false,"searchNs107":false,"searchNs108":false,"searchNs109":false,"searchNs110":false,"searchNs111":false,"searchNs114":false,"searchNs115":false,"searchNs116":false,"searchNs117":false,"searchNs828":false,"searchNs829":false,"gadget-PatrollingEnhancements":1,"variant":"en"});},{},{});mw.loader.implement("user.tokens",function(){mw.user.tokens.set({"editToken":"+\\","patrolToken":false,
"watchToken":false});},{},{});
/* cache key: enwiktionary:resourceloader:filter:minify-js:7:4dcccfacf6aa84ac36918117f60ddef1 */
}</script>
<script>if(window.mw){
mw.loader.load(["mediawiki.page.startup","mediawiki.legacy.wikibits","mediawiki.legacy.ajax","ext.centralauth.centralautologin","skins.vector.compactPersonalBar.defaultTracking","ext.uls.init","ext.uls.interface","ext.centralNotice.bannerController","skins.vector.js"]);
}</script>
<link rel="dns-prefetch" href="//meta.wikimedia.org" /><!--[if lt IE 7]><style type="text/css">body{behavior:url("/w/static-1.23wmf19/skins/vector/csshover.min.htc")}</style><![endif]--></head>
<body class="mediawiki ltr sitedir-ltr ns-14 ns-subject page-Category_English_phrasebook skin-vector action-view vector-animateLayout">
		<div id="mw-page-base" class="noprint"></div>
		<div id="mw-head-base" class="noprint"></div>
		<div id="content" class="mw-body" role="main">
			<a id="top"></a>
			<div id="mw-js-message" style="display:none;"></div>
						<div id="siteNotice"><!-- CentralNotice --><script>document.write("\u003Cdiv id=\"localNotice\" lang=\"en\" dir=\"ltr\"\u003E\u003Cp\u003E\u003Cspan\u003E\u003C/span\u003E\n\u003C/p\u003E\u003C/div\u003E");</script></div>
						<h1 id="firstHeading" class="firstHeading" lang="en"><span dir="auto">Category:English phrasebook</span></h1>
						<div id="bodyContent">
								<div id="siteSub">Definition from Wiktionary, the free dictionary</div>
								<div id="contentSub"></div>
												<div id="jump-to-nav" class="mw-jump">
					Jump to:					<a href="#mw-navigation">navigation</a>, 					<a href="#p-search">search</a>
				</div>
				<div id="mw-content-text" lang="en" dir="ltr" class="mw-content-ltr"><p><small>» <a href="/wiki/Category:English_phrases" title="Category:English phrases">English phrases</a> » <b>Phrasebook</b></small></p>
<p>Non-idiomatic phrases in English that are used in common situations, and may be useful to language learners or travellers.<sup class="plainlinks">[<a class="external text" href="//en.wiktionary.org/w/index.php?title=Template:pbcatboiler/ROOT&amp;action=edit">edit</a>]</sup></p>
<table id="toc" class="toc plainlinks" summary="Contents">
<tr>
<td><a class="external text" href="//en.wiktionary.org/wiki/Category:English_phrasebook">Top</a> – <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=A">A</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=B">B</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=C">C</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=D">D</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=E">E</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=F">F</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=G">G</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=H">H</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=I">I</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=J">J</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=K">K</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=L">L</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=M">M</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=N">N</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=O">O</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=P">P</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=Q">Q</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=R">R</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=S">S</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=T">T</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=U">U</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=V">V</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=W">W</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=X">X</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=Y">Y</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=Z">Z</a></td>
</tr>
</table>
<p><br clear="all" />
<span id="catfix" style="display:none;" class="CATFIX-English"><span class="" lang="en" xml:lang="en">&#160;</span></span></p>


<!-- 
NewPP limit report
Parsed by mw1187
CPU time usage: 0.600 seconds
Real time usage: 0.645 seconds
Preprocessor visited node count: 4744/1000000
Preprocessor generated node count: 11262/1500000
Post‐expand include size: 29089/2048000 bytes
Template argument size: 5045/2048000 bytes
Highest expansion depth: 26/40
Expensive parser function count: 2/500
Lua time usage: 0.024/10.000 seconds
Lua memory usage: 1.15 MB/50 MB
-->

<!-- Saved in parser cache with key enwiktionary:pcache:idhash:1974588-0!*!0!*!*!*!* and timestamp 20140324162449
 -->
<div lang="en" dir="ltr"><div id="mw-subcategories">
<h2>Subcategories</h2>
<p>This category has the following 13 subcategories, out of 13 total.
</p><div lang="en" dir="ltr" class="mw-content-ltr"><table style="width: 100%;"><tr style="vertical-align: top;"><td style="width: 33.3%;"><h3>C</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Communication">English phrasebook/Communication</a>‎ <span title="Contains 0 subcategories, 10 pages, and 0 files" dir="ltr">(0 c, 10 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>E</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Emergencies">English phrasebook/Emergencies</a>‎ <span title="Contains 0 subcategories, 9 pages, and 0 files" dir="ltr">(0 c, 9 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li>
<li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:en:Farewells">en:Farewells</a>‎ <span title="Contains 0 subcategories, 26 pages, and 0 files" dir="ltr">(0 c, 26 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li>
<li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_responses">English responses</a>‎ <span title="Contains 0 subcategories, 47 pages, and 0 files" dir="ltr">(0 c, 47 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>F</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Family">English phrasebook/Family</a>‎ <span title="Contains 0 subcategories, 1 page, and 0 files" dir="ltr">(0 c, 1 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul></td>
<td style="width: 33.3%;"><h3>F cont.</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Food_and_drink">English phrasebook/Food and drink</a>‎ <span title="Contains 0 subcategories, 12 pages, and 0 files" dir="ltr">(0 c, 12 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>G</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Greetings">English phrasebook/Greetings</a>‎ <span title="Contains 0 subcategories, 1 page, and 0 files" dir="ltr">(0 c, 1 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>H</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Health">English phrasebook/Health</a>‎ <span title="Contains 0 subcategories, 22 pages, and 0 files" dir="ltr">(0 c, 22 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>L</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Love">English phrasebook/Love</a>‎ <span title="Contains 0 subcategories, 7 pages, and 0 files" dir="ltr">(0 c, 7 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>N</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Needs">English phrasebook/Needs</a>‎ <span title="Contains 0 subcategories, 26 pages, and 0 files" dir="ltr">(0 c, 26 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul></td>
<td style="width: 33.3%;"><h3>R</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Religion">English phrasebook/Religion</a>‎ <span title="Contains 0 subcategories, 13 pages, and 0 files" dir="ltr">(0 c, 13 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>S</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Sex">English phrasebook/Sex</a>‎ <span title="Contains 0 subcategories, 6 pages, and 0 files" dir="ltr">(0 c, 6 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>T</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Travel">English phrasebook/Travel</a>‎ <span title="Contains 0 subcategories, 16 pages, and 0 files" dir="ltr">(0 c, 16 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul></td>
</tr></table></div>
</div><div id="mw-pages">
<h2>Pages in category "English phrasebook"</h2>
<p>The following 200 pages are in this category, out of 335 total.
</p>(previous 200) (<a href="/w/index.php?title=Category:English_phrasebook&amp;pagefrom=I%27ve#mw-pages" title="Category:English phrasebook">next 200</a>)<div lang="en" dir="ltr" class="mw-content-ltr"><table style="width: 100%;"><tr style="vertical-align: top;"><td style="width: 33.3%;"><h3>A</h3>
<ul><li><a href="/wiki/all_the_best" title="all the best">all the best</a></li>
<li><a href="/wiki/are_you_allergic_to_any_medications" title="are you allergic to any medications">are you allergic to any medications</a></li>
<li><a href="/wiki/are_you_married" title="are you married">are you married</a></li>
<li><a href="/wiki/are_you_OK" title="are you OK">are you OK</a></li>
<li><a href="/wiki/are_you_religious" title="are you religious">are you religious</a></li>
<li><a href="/wiki/are_you_single" title="are you single">are you single</a></li>
<li><a href="/wiki/are_you_taking_any_medications" title="are you taking any medications">are you taking any medications</a></li>
<li><a href="/wiki/as_much_as_possible" title="as much as possible">as much as possible</a></li>
<li><a href="/wiki/as_soon_as_possible" title="as soon as possible">as soon as possible</a></li></ul><h3>B</h3>
<ul><li><a href="/wiki/be_called" title="be called">be called</a></li>
<li><a href="/wiki/be_careful" title="be careful">be careful</a></li>
<li><a href="/wiki/best_of_British" title="best of British">best of British</a></li>
<li><a href="/wiki/bon_voyage" title="bon voyage">bon voyage</a></li></ul><h3>C</h3>
<ul><li><a href="/wiki/call_an_ambulance" title="call an ambulance">call an ambulance</a></li>
<li><a href="/wiki/can_I_buy_you_a_drink" title="can I buy you a drink">can I buy you a drink</a></li>
<li><a href="/wiki/can_I_come_in" title="can I come in">can I come in</a></li>
<li><a href="/wiki/can_I_use_your_phone" title="can I use your phone">can I use your phone</a></li>
<li><a href="/wiki/can_you_help_me" title="can you help me">can you help me</a></li>
<li><a href="/wiki/can_you_tell_us" title="can you tell us">can you tell us</a></li>
<li><a href="/wiki/cheers" title="cheers">cheers</a></li>
<li><a href="/wiki/consider_it_done" title="consider it done">consider it done</a></li>
<li><a href="/wiki/could_I_see_the_menu,_please" title="could I see the menu, please">could I see the menu, please</a></li></ul><h3>D</h3>
<ul><li><a href="/wiki/Appendix:Deep_gratitude" title="Appendix:Deep gratitude">Appendix:Deep gratitude</a></li>
<li><a href="/wiki/do_I_know_you" title="do I know you">do I know you</a></li>
<li><a href="/wiki/do_not_disturb" title="do not disturb">do not disturb</a></li>
<li><a href="/wiki/do_not_enter" title="do not enter">do not enter</a></li>
<li><a href="/wiki/do_you_accept_American_dollars" title="do you accept American dollars">do you accept American dollars</a></li>
<li><a href="/wiki/do_you_accept_credit_cards" title="do you accept credit cards">do you accept credit cards</a></li>
<li><a href="/wiki/do_you_believe_in_God" title="do you believe in God">do you believe in God</a></li>
<li><a href="/wiki/do_you_come_here_often" title="do you come here often">do you come here often</a></li>
<li><a href="/wiki/do_you_have_a_boyfriend" title="do you have a boyfriend">do you have a boyfriend</a></li>
<li><a href="/wiki/do_you_have_a_menu_in_English" title="do you have a menu in English">do you have a menu in English</a></li>
<li><a href="/wiki/do_you_have_any_pets" title="do you have any pets">do you have any pets</a></li>
<li><a href="/wiki/do_you_have_children" title="do you have children">do you have children</a></li>
<li><a href="/wiki/do_you_know" title="do you know">do you know</a></li>
<li><a href="/wiki/do_you_need_help" title="do you need help">do you need help</a></li>
<li><a href="/wiki/do_you_speak_English" title="do you speak English">do you speak English</a></li>
<li><a href="/wiki/do_you_speak_something" title="do you speak something">do you speak something</a></li>
<li><a href="/wiki/does_anyone_here_speak_English" title="does anyone here speak English">does anyone here speak English</a></li>
<li><a href="/wiki/don%27t_worry" title="don't worry">don't worry</a></li>
<li><a href="/wiki/down_with" title="down with">down with</a></li></ul><h3>E</h3>
<ul><li><a href="/wiki/Appendix:English_phrasebook" title="Appendix:English phrasebook">Appendix:English phrasebook</a></li>
<li><a href="/wiki/enjoy_your_meal" title="enjoy your meal">enjoy your meal</a></li>
<li><a href="/wiki/excuse_me" title="excuse me">excuse me</a></li></ul><h3>F</h3>
<ul><li><a href="/wiki/forget_it" title="forget it">forget it</a></li></ul><h3>G</h3>
<ul><li><a href="/wiki/get_lost" title="get lost">get lost</a></li>
<li><a href="/wiki/get_well_soon" title="get well soon">get well soon</a></li>
<li><a href="/wiki/give_me" title="give me">give me</a></li>
<li><a href="/wiki/good_afternoon" title="good afternoon">good afternoon</a></li>
<li><a href="/wiki/good_day" title="good day">good day</a></li>
<li><a href="/wiki/good_evening" title="good evening">good evening</a></li>
<li><a href="/wiki/good_luck" title="good luck">good luck</a></li>
<li><a href="/wiki/good_morning" title="good morning">good morning</a></li>
<li><a href="/wiki/good_night" title="good night">good night</a></li>
<li><a href="/wiki/goodnight" title="goodnight">goodnight</a></li>
<li><a href="/wiki/got_it" title="got it">got it</a></li></ul><h3>H</h3>
<ul><li><a href="/wiki/happy_birthday" title="happy birthday">happy birthday</a></li>
<li><a href="/wiki/Happy_Christmas" title="Happy Christmas">Happy Christmas</a></li>
<li><a href="/wiki/Happy_Easter" title="Happy Easter">Happy Easter</a></li>
<li><a href="/wiki/Happy_Holidays" title="Happy Holidays">Happy Holidays</a></li>
<li><a href="/wiki/Happy_New_Year" title="Happy New Year">Happy New Year</a></li>
<li><a href="/wiki/Happy_Ramadan" title="Happy Ramadan">Happy Ramadan</a></li>
<li><a href="/wiki/have_a_nice_day" title="have a nice day">have a nice day</a></li>
<li><a href="/wiki/have_a_seat" title="have a seat">have a seat</a></li>
<li><a href="/wiki/have_fun" title="have fun">have fun</a></li>
<li><a href="/wiki/hello" title="hello">hello</a></li>
<li><a href="/wiki/help" title="help">help</a></li></ul></td>
<td style="width: 33.3%;"><h3>H cont.</h3>
<ul><li><a href="/wiki/here_you_are" title="here you are">here you are</a></li>
<li><a href="/wiki/how_are_you" title="how are you">how are you</a></li>
<li><a href="/wiki/how_do_I_get_to" title="how do I get to">how do I get to</a></li>
<li><a href="/wiki/how_do_I_get_to_the_airport" title="how do I get to the airport">how do I get to the airport</a></li>
<li><a href="/wiki/how_do_I_get_to_the_bus_station" title="how do I get to the bus station">how do I get to the bus station</a></li>
<li><a href="/wiki/how_do_I_get_to_the_train_station" title="how do I get to the train station">how do I get to the train station</a></li>
<li><a href="/wiki/how_do_you_do" title="how do you do">how do you do</a></li>
<li><a href="/wiki/how_do_you_pronounce_this_word" title="how do you pronounce this word">how do you pronounce this word</a></li>
<li><a href="/wiki/how_do_you_say...in_English" title="how do you say...in English">how do you say...in English</a></li>
<li><a href="/wiki/how_do_you_spell_this_word" title="how do you spell this word">how do you spell this word</a></li>
<li><a href="/wiki/how_much_do_you_charge" title="how much do you charge">how much do you charge</a></li>
<li><a href="/wiki/how_much_does_it_cost" title="how much does it cost">how much does it cost</a></li>
<li><a href="/wiki/how_much_is_it" title="how much is it">how much is it</a></li>
<li><a href="/wiki/how_old_are_you" title="how old are you">how old are you</a></li>
<li><a href="/wiki/how%27s_the_weather" title="how's the weather">how's the weather</a></li></ul><h3>I</h3>
<ul><li><a href="/wiki/Appendix:I_am_(ethnicity)" title="Appendix:I am (ethnicity)">Appendix:I am (ethnicity)</a></li>
<li><a href="/wiki/I_am_blind" title="I am blind">I am blind</a></li>
<li><a href="/wiki/I_am_English" title="I am English">I am English</a></li>
<li><a href="/wiki/I_am_HIV_positive" title="I am HIV positive">I am HIV positive</a></li>
<li><a href="/wiki/I_am_hungry" title="I am hungry">I am hungry</a></li>
<li><a href="/wiki/I_am_thirsty" title="I am thirsty">I am thirsty</a></li>
<li><a href="/wiki/I_am_tired" title="I am tired">I am tired</a></li>
<li><a href="/wiki/I_could_eat_a_horse" title="I could eat a horse">I could eat a horse</a></li>
<li><a href="/wiki/I_don%27t_care" title="I don't care">I don't care</a></li>
<li><a href="/wiki/I_don%27t_eat_fish" title="I don't eat fish">I don't eat fish</a></li>
<li><a href="/wiki/I_don%27t_eat_meat" title="I don't eat meat">I don't eat meat</a></li>
<li><a href="/wiki/I_don%27t_eat_pork" title="I don't eat pork">I don't eat pork</a></li>
<li><a href="/wiki/I_don%27t_know" title="I don't know">I don't know</a></li>
<li><a href="/wiki/Appendix:I_don%27t_speak" title="Appendix:I don't speak">Appendix:I don't speak</a></li>
<li><a href="/wiki/I_don%27t_speak_English" title="I don't speak English">I don't speak English</a></li>
<li><a href="/wiki/I_don%27t_think_so" title="I don't think so">I don't think so</a></li>
<li><a href="/wiki/I_don%27t_understand" title="I don't understand">I don't understand</a></li>
<li><a href="/wiki/I_hate_you" title="I hate you">I hate you</a></li>
<li><a href="/wiki/I_have_a_cold" title="I have a cold">I have a cold</a></li>
<li><a href="/wiki/I_have_a_fever" title="I have a fever">I have a fever</a></li>
<li><a href="/wiki/I_have_a_question" title="I have a question">I have a question</a></li>
<li><a href="/wiki/I_have_AIDS" title="I have AIDS">I have AIDS</a></li>
<li><a href="/wiki/I_have_asthma" title="I have asthma">I have asthma</a></li>
<li><a href="/wiki/I_have_cancer" title="I have cancer">I have cancer</a></li>
<li><a href="/wiki/I_have_diabetes" title="I have diabetes">I have diabetes</a></li>
<li><a href="/wiki/I_have_high_blood_pressure" title="I have high blood pressure">I have high blood pressure</a></li>
<li><a href="/wiki/I_have_low_blood_pressure" title="I have low blood pressure">I have low blood pressure</a></li>
<li><a href="/wiki/I_have_no_money" title="I have no money">I have no money</a></li>
<li><a href="/wiki/I_like_you" title="I like you">I like you</a></li>
<li><a href="/wiki/I_live_in_Melbourne" title="I live in Melbourne">I live in Melbourne</a></li>
<li><a href="/wiki/I_lost_my_backpack" title="I lost my backpack">I lost my backpack</a></li>
<li><a href="/wiki/I_lost_my_bag" title="I lost my bag">I lost my bag</a></li>
<li><a href="/wiki/I_lost_my_glasses" title="I lost my glasses">I lost my glasses</a></li>
<li><a href="/wiki/I_lost_my_handbag" title="I lost my handbag">I lost my handbag</a></li>
<li><a href="/wiki/I_lost_my_keys" title="I lost my keys">I lost my keys</a></li>
<li><a href="/wiki/I_lost_my_wallet" title="I lost my wallet">I lost my wallet</a></li>
<li><a href="/wiki/I_love_you" title="I love you">I love you</a></li>
<li><a href="/wiki/I_miss_you" title="I miss you">I miss you</a></li>
<li><a href="/wiki/I_must_go" title="I must go">I must go</a></li>
<li><a href="/wiki/I_need_..." title="I need ...">I need ...</a></li>
<li><a href="/wiki/I_need_a_battery" title="I need a battery">I need a battery</a></li>
<li><a href="/wiki/I_need_a_compass" title="I need a compass">I need a compass</a></li>
<li><a href="/wiki/I_need_a_condom" title="I need a condom">I need a condom</a></li>
<li><a href="/wiki/I_need_a_dictionary" title="I need a dictionary">I need a dictionary</a></li>
<li><a href="/wiki/I_need_a_doctor" title="I need a doctor">I need a doctor</a></li>
<li><a href="/wiki/I_need_a_drink" title="I need a drink">I need a drink</a></li>
<li><a href="/wiki/I_need_a_guide" title="I need a guide">I need a guide</a></li>
<li><a href="/wiki/I_need_a_lawyer" title="I need a lawyer">I need a lawyer</a></li>
<li><a href="/wiki/I_need_a_pen" title="I need a pen">I need a pen</a></li>
<li><a href="/wiki/I_need_a_razor" title="I need a razor">I need a razor</a></li>
<li><a href="/wiki/I_need_a_taxi" title="I need a taxi">I need a taxi</a></li>
<li><a href="/wiki/I_need_a_towel" title="I need a towel">I need a towel</a></li></ul></td>
<td style="width: 33.3%;"><h3>I cont.</h3>
<ul><li><a href="/wiki/I_need_an_interpreter" title="I need an interpreter">I need an interpreter</a></li>
<li><a href="/wiki/I_need_aspirin" title="I need aspirin">I need aspirin</a></li>
<li><a href="/wiki/I_need_food" title="I need food">I need food</a></li>
<li><a href="/wiki/I_need_gas" title="I need gas">I need gas</a></li>
<li><a href="/wiki/I_need_money" title="I need money">I need money</a></li>
<li><a href="/wiki/I_need_petrol" title="I need petrol">I need petrol</a></li>
<li><a href="/wiki/I_need_shampoo" title="I need shampoo">I need shampoo</a></li>
<li><a href="/wiki/I_need_shelter" title="I need shelter">I need shelter</a></li>
<li><a href="/wiki/I_need_sunblock" title="I need sunblock">I need sunblock</a></li>
<li><a href="/wiki/I_need_toilet_paper" title="I need toilet paper">I need toilet paper</a></li>
<li><a href="/wiki/I_need_toothpaste" title="I need toothpaste">I need toothpaste</a></li>
<li><a href="/wiki/I_need_water" title="I need water">I need water</a></li>
<li><a href="/wiki/I_need_your_help" title="I need your help">I need your help</a></li>
<li><a href="/wiki/I_think_so" title="I think so">I think so</a></li>
<li><a href="/wiki/I_want_to_go_to_the_toilet" title="I want to go to the toilet">I want to go to the toilet</a></li>
<li><a href="/wiki/I_want_to_know" title="I want to know">I want to know</a></li>
<li><a href="/wiki/I_was_born_in_..." title="I was born in ...">I was born in ...</a></li>
<li><a href="/wiki/I%27d_like_to_kiss_you" title="I'd like to kiss you">I'd like to kiss you</a></li>
<li><a href="/wiki/I%27d_like_to_know" title="I'd like to know">I'd like to know</a></li>
<li><a href="/wiki/I%27ll_call_the_police" title="I'll call the police">I'll call the police</a></li>
<li><a href="/wiki/I%27m_..._year(s)_old" title="I'm ... year(s) old">I'm ... year(s) old</a></li>
<li><a href="/wiki/I%27m_a_Buddhist" title="I'm a Buddhist">I'm a Buddhist</a></li>
<li><a href="/wiki/I%27m_a_Catholic" title="I'm a Catholic">I'm a Catholic</a></li>
<li><a href="/wiki/I%27m_a_Christian" title="I'm a Christian">I'm a Christian</a></li>
<li><a href="/wiki/I%27m_a_girl" title="I'm a girl">I'm a girl</a></li>
<li><a href="/wiki/I%27m_a_guy" title="I'm a guy">I'm a guy</a></li>
<li><a href="/wiki/I%27m_a_Muslim" title="I'm a Muslim">I'm a Muslim</a></li>
<li><a href="/wiki/I%27m_a_Protestant" title="I'm a Protestant">I'm a Protestant</a></li>
<li><a href="/wiki/I%27m_a_vegetarian" title="I'm a vegetarian">I'm a vegetarian</a></li>
<li><a href="/wiki/I%27m_agnostic" title="I'm agnostic">I'm agnostic</a></li>
<li><a href="/wiki/I%27m_allergic_to_aspirin" title="I'm allergic to aspirin">I'm allergic to aspirin</a></li>
<li><a href="/wiki/I%27m_allergic_to_nuts" title="I'm allergic to nuts">I'm allergic to nuts</a></li>
<li><a href="/wiki/I%27m_allergic_to_penicillin" title="I'm allergic to penicillin">I'm allergic to penicillin</a></li>
<li><a href="/wiki/I%27m_allergic_to_pollen" title="I'm allergic to pollen">I'm allergic to pollen</a></li>
<li><a href="/wiki/I%27m_an_atheist" title="I'm an atheist">I'm an atheist</a></li>
<li><a href="/wiki/I%27m_ashamed" title="I'm ashamed">I'm ashamed</a></li>
<li><a href="/wiki/I%27m_bisexual" title="I'm bisexual">I'm bisexual</a></li>
<li><a href="/wiki/I%27m_bleeding" title="I'm bleeding">I'm bleeding</a></li>
<li><a href="/wiki/I%27m_blind" title="I'm blind">I'm blind</a></li>
<li><a href="/wiki/I%27m_cold" title="I'm cold">I'm cold</a></li>
<li><a href="/wiki/I%27m_deaf" title="I'm deaf">I'm deaf</a></li>
<li><a href="/wiki/I%27m_divorced" title="I'm divorced">I'm divorced</a></li>
<li><a href="/wiki/I%27m_fine" title="I'm fine">I'm fine</a></li>
<li><a href="/wiki/I%27m_fine,_thank_you" title="I'm fine, thank you">I'm fine, thank you</a></li>
<li><a href="/wiki/I%27m_full" title="I'm full">I'm full</a></li>
<li><a href="/wiki/I%27m_gay" title="I'm gay">I'm gay</a></li>
<li><a href="/wiki/I%27m_hot" title="I'm hot">I'm hot</a></li>
<li><a href="/wiki/I%27m_hungry" title="I'm hungry">I'm hungry</a></li>
<li><a href="/wiki/I%27m_illiterate" title="I'm illiterate">I'm illiterate</a></li>
<li><a href="/wiki/I%27m_in_love_with_you" title="I'm in love with you">I'm in love with you</a></li>
<li><a href="/wiki/I%27m_Jewish" title="I'm Jewish">I'm Jewish</a></li>
<li><a href="/wiki/I%27m_looking_for_a_grocery_store" title="I'm looking for a grocery store">I'm looking for a grocery store</a></li>
<li><a href="/wiki/I%27m_looking_for_a_job" title="I'm looking for a job">I'm looking for a job</a></li>
<li><a href="/wiki/I%27m_lost" title="I'm lost">I'm lost</a></li>
<li><a href="/wiki/I%27m_married" title="I'm married">I'm married</a></li>
<li><a href="/wiki/I%27m_mute" title="I'm mute">I'm mute</a></li>
<li><a href="/wiki/I%27m_not_religious" title="I'm not religious">I'm not religious</a></li>
<li><a href="/wiki/I%27m_scared" title="I'm scared">I'm scared</a></li>
<li><a href="/wiki/I%27m_sick" title="I'm sick">I'm sick</a></li>
<li><a href="/wiki/I%27m_single" title="I'm single">I'm single</a></li>
<li><a href="/wiki/I%27m_sorry" title="I'm sorry">I'm sorry</a></li>
<li><a href="/wiki/I%27m_straight" title="I'm straight">I'm straight</a></li>
<li><a href="/wiki/I%27m_thirsty" title="I'm thirsty">I'm thirsty</a></li>
<li><a href="/wiki/I%27m_tired" title="I'm tired">I'm tired</a></li>
<li><a href="/wiki/I%27m_transsexual" title="I'm transsexual">I'm transsexual</a></li>
<li><a href="/wiki/I%27m_twenty_years_old" title="I'm twenty years old">I'm twenty years old</a></li></ul></td>
</tr></table></div>(previous 200) (<a href="/w/index.php?title=Category:English_phrasebook&amp;pagefrom=I%27ve#mw-pages" title="Category:English phrasebook">next 200</a>)
</div></div><noscript><img src="//en.wiktionary.org/wiki/Special:CentralAutoLogin/start?type=1x1" alt="" title="" width="1" height="1" style="border: none; position: absolute;" /></noscript></div>								<div class="printfooter">
				Retrieved from "<a href="http://en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;oldid=16641196">http://en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;oldid=16641196</a>"				</div>
												<div id='catlinks' class='catlinks'><div id="mw-normal-catlinks" class="mw-normal-catlinks"><a href="/wiki/Special:Categories" title="Special:Categories">Categories</a>: <ul><li><a href="/wiki/Category:English_phrases" title="Category:English phrases">English phrases</a></li><li><a href="/wiki/Category:Phrasebooks_by_language" title="Category:Phrasebooks by language">Phrasebooks by language</a></li></ul></div><div id="mw-hidden-catlinks" class="mw-hidden-catlinks mw-hidden-cats-ns-shown">Hidden category: <ul><li><a href="/wiki/Category:English_non-idiomatic_translation_targets" title="Category:English non-idiomatic translation targets">English non-idiomatic translation targets</a></li></ul></div></div>												<div class="visualClear"></div>
							</div>
		</div>
		<div id="mw-navigation">
			<h2>Navigation menu</h2>
			<div id="mw-head">
				<div id="p-personal" role="navigation" class="" aria-labelledby="p-personal-label">
	<h3 id="p-personal-label">Personal tools</h3>
	<ul>
<li id="pt-createaccount"><a href="/w/index.php?title=Special:UserLogin&amp;returnto=Category%3AEnglish+phrasebook&amp;returntoquery=pageuntil%3DI%2527ve&amp;type=signup">Create account</a></li><li id="pt-login"><a href="/w/index.php?title=Special:UserLogin&amp;returnto=Category%3AEnglish+phrasebook&amp;returntoquery=pageuntil%3DI%2527ve" title="You are encouraged to log in; however, it is not mandatory [o]" accesskey="o">Log in</a></li>	</ul>
</div>
				<div id="left-navigation">
					<div id="p-namespaces" role="navigation" class="vectorTabs" aria-labelledby="p-namespaces-label">
	<h3 id="p-namespaces-label">Namespaces</h3>
	<ul>
					<li  id="ca-nstab-category" class="selected"><span><a href="/wiki/Category:English_phrasebook"  title="View the category page [c]" accesskey="c">Category</a></span></li>
					<li  id="ca-talk" class="new"><span><a href="/w/index.php?title=Category_talk:English_phrasebook&amp;action=edit&amp;redlink=1"  title="Discussion about the content page [t]" accesskey="t">Discussion</a></span></li>
			</ul>
</div>
<div id="p-variants" role="navigation" class="vectorMenu emptyPortlet" aria-labelledby="p-variants-label">
	<h3 id="mw-vector-current-variant">
		</h3>
	<h3 id="p-variants-label"><span>Variants</span><a href="#"></a></h3>
	<div class="menu">
		<ul>
					</ul>
	</div>
</div>
				</div>
				<div id="right-navigation">
					<div id="p-views" role="navigation" class="vectorTabs" aria-labelledby="p-views-label">
	<h3 id="p-views-label">Views</h3>
	<ul>
					<li id="ca-view" class="selected"><span><a href="/wiki/Category:English_phrasebook" >Read</a></span></li>
					<li id="ca-edit"><span><a href="/w/index.php?title=Category:English_phrasebook&amp;action=edit"  title="You can edit this page. Please use the preview button before saving [e]" accesskey="e">Edit</a></span></li>
					<li id="ca-history" class="collapsible"><span><a href="/w/index.php?title=Category:English_phrasebook&amp;action=history"  title="Past revisions of this page [h]" accesskey="h">History</a></span></li>
			</ul>
</div>
<div id="p-cactions" role="navigation" class="vectorMenu emptyPortlet" aria-labelledby="p-cactions-label">
	<h3 id="p-cactions-label"><span>Actions</span><a href="#"></a></h3>
	<div class="menu">
		<ul>
					</ul>
	</div>
</div>
<div id="p-search" role="search">
	<h3><label for="searchInput">Search</label></h3>
	<form action="/w/index.php" id="searchform">
					<div id="simpleSearch">
					<input type="search" name="search" placeholder="Search" title="Search Wiktionary [f]" accesskey="f" id="searchInput" /><input type="hidden" value="Special:Search" name="title" /><input type="submit" name="fulltext" value="Search" title="Search the pages for this text" id="mw-searchButton" class="searchButton mw-fallbackSearchButton" /><input type="submit" name="go" value="Go" title="Go to a page with this exact name if exists" id="searchButton" class="searchButton" />		</div>
	</form>
</div>
				</div>
			</div>
			<div id="mw-panel">
					<div id="p-logo" role="banner"><a style="background-image: url(//upload.wikimedia.org/wiktionary/en/b/bc/Wiki.png);" href="/wiki/Wiktionary:Main_Page"  title="Visit the main page"></a></div>
				<div class="portal" role="navigation" id='p-navigation' aria-labelledby='p-navigation-label'>
	<h3 id='p-navigation-label'>Navigation</h3>
	<div class="body">
		<ul>
			<li id="n-mainpage-text"><a href="/wiki/Wiktionary:Main_Page">Main Page</a></li>
			<li id="n-portal"><a href="/wiki/Wiktionary:Community_portal" title="About the project, what you can do, where to find things">Community portal</a></li>
			<li id="n-wiktprefs"><a href="/wiki/Wiktionary:Per-browser_preferences">Preferences</a></li>
			<li id="n-requestedarticles"><a href="/wiki/Wiktionary:Requested_entries">Requested entries</a></li>
			<li id="n-recentchanges"><a href="/wiki/Special:RecentChanges" title="A list of recent changes in the wiki [r]" accesskey="r">Recent changes</a></li>
			<li id="n-randompage"><a href="/wiki/Special:Random" title="Load a random page [x]" accesskey="x">Random entry</a></li>
			<li id="n-help"><a href="/wiki/Help:Contents" title="The place to find out">Help</a></li>
			<li id="n-sitesupport"><a href="//donate.wikimedia.org/wiki/Special:FundraiserRedirector?utm_source=donate&amp;utm_medium=sidebar&amp;utm_campaign=C13_en.wiktionary.org&amp;uselang=en" title="Support us">Donations</a></li>
			<li id="n-contact"><a href="/wiki/Wiktionary:Contact_us">Contact us</a></li>
		</ul>
	</div>
</div>
<div class="portal" role="navigation" id='p-tb' aria-labelledby='p-tb-label'>
	<h3 id='p-tb-label'>Tools</h3>
	<div class="body">
		<ul>
			<li id="t-whatlinkshere"><a href="/wiki/Special:WhatLinksHere/Category:English_phrasebook" title="A list of all wiki pages that link here [j]" accesskey="j">What links here</a></li>
			<li id="t-recentchangeslinked"><a href="/wiki/Special:RecentChangesLinked/Category:English_phrasebook" title="Recent changes in pages linked from this page [k]" accesskey="k">Related changes</a></li>
			<li id="t-upload"><a href="//commons.wikimedia.org/wiki/Special:UploadWizard" title="Upload files [u]" accesskey="u">Upload file</a></li>
			<li id="t-specialpages"><a href="/wiki/Special:SpecialPages" title="A list of all special pages [q]" accesskey="q">Special pages</a></li>
			<li id="t-print"><a href="/w/index.php?title=Category:English_phrasebook&amp;pageuntil=I%27ve&amp;printable=yes" rel="alternate" title="Printable version of this page [p]" accesskey="p">Printable version</a></li>
			<li id="t-permalink"><a href="/w/index.php?title=Category:English_phrasebook&amp;oldid=16641196" title="Permanent link to this revision of the page">Permanent link</a></li>
			<li id="t-info"><a href="/w/index.php?title=Category:English_phrasebook&amp;action=info">Page information</a></li>
		</ul>
	</div>
</div>
<div class="portal" role="navigation" id='p-lang' aria-labelledby='p-lang-label'>
	<h3 id='p-lang-label'>In other languages</h3>
	<div class="body">
		<ul>
			<li class="uls-p-lang-dummy"><a href="#"></a></li>
		</ul>
	</div>
</div>
			</div>
		</div>
		<div id="footer" role="contentinfo">
							<ul id="footer-info">
											<li id="footer-info-lastmod"> This page was last modified on 8 April 2012, at 18:05.</li>
											<li id="footer-info-copyright">Text is available under the <a href="//creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution/Share-Alike License</a>; additional terms may apply.  By using this site, you agree to the <a href="//wikimediafoundation.org/wiki/Terms_of_Use">Terms of Use</a> and <a href="//wikimediafoundation.org/wiki/Privacy_policy">Privacy Policy.</a></li>
									</ul>
							<ul id="footer-places">
											<li id="footer-places-privacy"><a href="//wikimediafoundation.org/wiki/Privacy_policy" title="wikimedia:Privacy policy">Privacy policy</a></li>
											<li id="footer-places-about"><a href="/wiki/Wiktionary:About" title="Wiktionary:About">About Wiktionary</a></li>
											<li id="footer-places-disclaimer"><a href="/wiki/Wiktionary:General_disclaimer" title="Wiktionary:General disclaimer">Disclaimers</a></li>
											<li id="footer-places-developers"><a class="external" href="https://www.mediawiki.org/wiki/Special:MyLanguage/How_to_contribute">Developers</a></li>
											<li id="footer-places-mobileview"><a href="//en.m.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;pageuntil=I%27ve" class="noprint stopMobileRedirectToggle">Mobile view</a></li>
									</ul>
										<ul id="footer-icons" class="noprint">
					<li id="footer-copyrightico">
						<a href="//wikimediafoundation.org/"><img src="//bits.wikimedia.org/images/wikimedia-button.png" width="88" height="31" alt="Wikimedia Foundation"/></a>
					</li>
					<li id="footer-poweredbyico">
						<a href="//www.mediawiki.org/"><img src="//bits.wikimedia.org/static-1.23wmf19/skins/common/images/poweredby_mediawiki_88x31.png" alt="Powered by MediaWiki" width="88" height="31" /></a>
					</li>
				</ul>
						<div style="clear:both"></div>
		</div>
		<script>/*<![CDATA[*/window.jQuery && jQuery.ready();/*]]>*/</script><script>if(window.mw){
mw.loader.state({"site":"loading","user":"ready","user.groups":"ready"});
}</script>
<script src="//bits.wikimedia.org/en.wiktionary.org/load.php?debug=false&amp;lang=en&amp;modules=mw.PopUpMediaTransform&amp;only=scripts&amp;skin=vector&amp;*"></script>
<script>if(window.mw){
mw.loader.load(["mediawiki.action.view.postEdit","ext.categoryTree","mobile.desktop","mediawiki.user","mediawiki.hidpi","mediawiki.page.ready","mediawiki.searchSuggest","mw.MwEmbedSupport.style","ext.navigationTiming","schema.UniversalLanguageSelector","ext.uls.eventlogger","ext.uls.interlanguage","skins.vector.collapsibleNav"],null,true);
}</script>
<script src="//bits.wikimedia.org/en.wiktionary.org/load.php?debug=false&amp;lang=en&amp;modules=site&amp;only=scripts&amp;skin=vector&amp;*"></script>
<!-- Served by mw1053 in 0.413 secs. -->
	</body>
</html>"""


htmlPage2 = """<html lang="en" dir="ltr" class="client-nojs">
<head>
<meta charset="UTF-8" />
<title>Category:English phrasebook - Wiktionary</title>
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
<meta name="generator" content="MediaWiki 1.23wmf19" />
<link rel="alternate" type="application/x-wiki" title="Edit" href="/w/index.php?title=Category:English_phrasebook&amp;action=edit" />
<link rel="edit" title="Edit" href="/w/index.php?title=Category:English_phrasebook&amp;action=edit" />
<link rel="apple-touch-icon" href="//bits.wikimedia.org/apple-touch/wiktionary/en.png" />
<link rel="shortcut icon" href="//bits.wikimedia.org/favicon/wiktionary/en.ico" />
<link rel="search" type="application/opensearchdescription+xml" href="/w/opensearch_desc.php" title="Wiktionary (en)" />
<link rel="EditURI" type="application/rsd+xml" href="//en.wiktionary.org/w/api.php?action=rsd" />
<link rel="copyright" href="//creativecommons.org/licenses/by-sa/3.0/" />
<link rel="alternate" type="application/atom+xml" title="Wiktionary Atom feed" href="/w/index.php?title=Special:RecentChanges&amp;feed=atom" />
<link rel="canonical" href="http://en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;pagefrom=I%27ve" />
<link rel="stylesheet" href="//bits.wikimedia.org/en.wiktionary.org/load.php?debug=false&amp;lang=en&amp;modules=ext.categoryTree.css%7Cext.gadget.DocTabs%7Cext.uls.nojs%7Cext.wikihiero%7Cmediawiki.legacy.commonPrint%2Cshared%7Cmediawiki.ui.button%7Cmw.PopUpMediaTransform%7Cskins.common.interface%7Cskins.vector.styles&amp;only=styles&amp;skin=vector&amp;*" />
<meta name="ResourceLoaderDynamicStyles" content="" />
<link rel="stylesheet" href="//bits.wikimedia.org/en.wiktionary.org/load.php?debug=false&amp;lang=en&amp;modules=site&amp;only=styles&amp;skin=vector&amp;*" />
<style>a:lang(ar),a:lang(kk-arab),a:lang(mzn),a:lang(ps),a:lang(ur){text-decoration:none}
/* cache key: enwiktionary:resourceloader:filter:minify-css:7:3dcc16a20ad1c2eae2b6539515116338 */</style>

<script src="//bits.wikimedia.org/en.wiktionary.org/load.php?debug=false&amp;lang=en&amp;modules=startup&amp;only=scripts&amp;skin=vector&amp;*"></script>
<script>if(window.mw){
mw.config.set({"wgCanonicalNamespace":"Category","wgCanonicalSpecialPageName":false,"wgNamespaceNumber":14,"wgPageName":"Category:English_phrasebook","wgTitle":"English phrasebook","wgCurRevisionId":16641196,"wgRevisionId":16641196,"wgArticleId":1974588,"wgIsArticle":true,"wgIsRedirect":false,"wgAction":"view","wgUserName":null,"wgUserGroups":["*"],"wgCategories":["English phrases","Phrasebooks by language","English non-idiomatic translation targets"],"wgBreakFrames":false,"wgPageContentLanguage":"en","wgPageContentModel":"wikitext","wgSeparatorTransformTable":["",""],"wgDigitTransformTable":["",""],"wgDefaultDateFormat":"dmy","wgMonthNames":["","January","February","March","April","May","June","July","August","September","October","November","December"],"wgMonthNamesShort":["","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"wgRelevantPageName":"Category:English_phrasebook","wgIsProbablyEditable":true,"wgRestrictionEdit":[],"wgRestrictionMove":[],"wgWikiEditorEnabledModules":{"toolbar":true,"dialogs":true,"hidesig":true,"templateEditor":false,"templates":false,"preview":false,"previewDialog":false,"publish":false,"toc":false},"wgBetaFeaturesFeatures":[],"wgULSAcceptLanguageList":["en-us","en"],"wgULSCurrentAutonym":"English","wgCategoryTreePageCategoryOptions":"{\"mode\":0,\"hideprefix\":20,\"showcount\":true,\"namespaces\":false}","wgNoticeProject":"wiktionary"});
}</script><script>if(window.mw){
mw.loader.implement("user.options",function(){mw.user.options.set({"ccmeonemails":0,"cols":80,"date":"default","diffonly":0,"disablemail":0,"editfont":"default","editondblclick":0,"editsectiononrightclick":0,"enotifminoredits":0,"enotifrevealaddr":0,"enotifusertalkpages":1,"enotifwatchlistpages":0,"extendwatchlist":0,"fancysig":0,"forceeditsummary":0,"gender":"unknown","hideminor":0,"hidepatrolled":0,"imagesize":2,"math":0,"minordefault":0,"newpageshidepatrolled":0,"nickname":"","norollbackdiff":0,"numberheadings":0,"previewonfirst":0,"previewontop":1,"rcdays":7,"rclimit":50,"rememberpassword":0,"rows":25,"showhiddencats":false,"shownumberswatching":1,"showtoolbar":1,"skin":"vector","stubthreshold":0,"thumbsize":4,"underline":2,"uselivepreview":0,"usenewrc":0,"watchcreations":1,"watchdefault":0,"watchdeletion":0,"watchlistdays":3,"watchlisthideanons":0,"watchlisthidebots":0,"watchlisthideliu":0,"watchlisthideminor":0,"watchlisthideown":0,"watchlisthidepatrolled":0,"watchmoves":0,
"wllimit":250,"useeditwarning":1,"prefershttps":1,"usebetatoolbar":1,"usebetatoolbar-cgd":1,"lqtnotifytalk":false,"lqtdisplaydepth":5,"lqtdisplaycount":25,"lqtcustomsignatures":true,"lqt-watch-threads":true,"echo-notify-show-link":true,"echo-show-alert":true,"echo-email-frequency":0,"echo-email-format":"html","echo-subscriptions-email-system":true,"echo-subscriptions-web-system":true,"echo-subscriptions-email-other":false,"echo-subscriptions-web-other":true,"echo-subscriptions-email-edit-user-talk":false,"echo-subscriptions-web-edit-user-talk":true,"echo-subscriptions-email-reverted":false,"echo-subscriptions-web-reverted":true,"echo-subscriptions-email-article-linked":false,"echo-subscriptions-web-article-linked":false,"echo-subscriptions-email-mention":false,"echo-subscriptions-web-mention":true,"echo-subscriptions-web-edit-thank":true,"echo-subscriptions-email-edit-thank":false,"uls-preferences":"","language":"en","variant-gan":"gan","variant-iu":"iu","variant-kk":"kk","variant-ku":
"ku","variant-shi":"shi","variant-sr":"sr","variant-tg":"tg","variant-uz":"uz","variant-zh":"zh","searchNs0":true,"searchNs1":false,"searchNs2":false,"searchNs3":false,"searchNs4":false,"searchNs5":false,"searchNs6":false,"searchNs7":false,"searchNs8":false,"searchNs9":false,"searchNs10":false,"searchNs11":false,"searchNs12":false,"searchNs13":false,"searchNs14":false,"searchNs15":false,"searchNs90":false,"searchNs91":false,"searchNs92":false,"searchNs93":false,"searchNs100":false,"searchNs101":false,"searchNs102":false,"searchNs103":false,"searchNs104":false,"searchNs105":false,"searchNs106":false,"searchNs107":false,"searchNs108":false,"searchNs109":false,"searchNs110":false,"searchNs111":false,"searchNs114":false,"searchNs115":false,"searchNs116":false,"searchNs117":false,"searchNs828":false,"searchNs829":false,"gadget-LegacyScripts":1,"gadget-DocTabs":1,"gadget-PatrollingEnhancements":1,"variant":"en"});},{},{});mw.loader.implement("user.tokens",function(){mw.user.tokens.set({
"editToken":"+\\","patrolToken":false,"watchToken":false});},{},{});
/* cache key: enwiktionary:resourceloader:filter:minify-js:7:95c33be83e8eb5528c48e352bb2acdcf */
}</script>
<script>if(window.mw){
mw.loader.load(["mediawiki.page.startup","mediawiki.legacy.wikibits","mediawiki.legacy.ajax","ext.centralauth.centralautologin","skins.vector.compactPersonalBar.defaultTracking","ext.uls.init","ext.uls.interface","ext.centralNotice.bannerController","skins.vector.js"]);
}</script>
<link rel="dns-prefetch" href="//meta.wikimedia.org" /><!--[if lt IE 7]><style type="text/css">body{behavior:url("/w/static-1.23wmf19/skins/vector/csshover.min.htc")}</style><![endif]--></head>
<body class="mediawiki ltr sitedir-ltr ns-14 ns-subject page-Category_English_phrasebook skin-vector action-view vector-animateLayout">
		<div id="mw-page-base" class="noprint"></div>
		<div id="mw-head-base" class="noprint"></div>
		<div id="content" class="mw-body" role="main">
			<a id="top"></a>
			<div id="mw-js-message" style="display:none;"></div>
						<div id="siteNotice"><!-- CentralNotice --><script>document.write("\u003Cdiv id=\"localNotice\" lang=\"en\" dir=\"ltr\"\u003E\u003Cp\u003E\u003Cspan\u003E\u003C/span\u003E\n\u003C/p\u003E\u003C/div\u003E");</script></div>
						<h1 id="firstHeading" class="firstHeading" lang="en"><span dir="auto">Category:English phrasebook</span></h1>
						<div id="bodyContent">
								<div id="siteSub">Definition from Wiktionary, the free dictionary</div>
								<div id="contentSub"></div>
												<div id="jump-to-nav" class="mw-jump">
					Jump to:					<a href="#mw-navigation">navigation</a>, 					<a href="#p-search">search</a>
				</div>
				<div id="mw-content-text" lang="en" dir="ltr" class="mw-content-ltr"><p><small>» <a href="/wiki/Category:English_phrases" title="Category:English phrases">English phrases</a> » <b>Phrasebook</b></small></p>
<p>Non-idiomatic phrases in English that are used in common situations, and may be useful to language learners or travellers.<sup class="plainlinks">[<a class="external text" href="//en.wiktionary.org/w/index.php?title=Template:pbcatboiler/ROOT&amp;action=edit">edit</a>]</sup></p>
<table id="toc" class="toc plainlinks" summary="Contents">
<tr>
<td><a class="external text" href="//en.wiktionary.org/wiki/Category:English_phrasebook">Top</a> – <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=A">A</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=B">B</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=C">C</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=D">D</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=E">E</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=F">F</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=G">G</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=H">H</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=I">I</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=J">J</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=K">K</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=L">L</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=M">M</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=N">N</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=O">O</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=P">P</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=Q">Q</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=R">R</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=S">S</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=T">T</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=U">U</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=V">V</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=W">W</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=X">X</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=Y">Y</a> <a class="external text" href="//en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;from=Z">Z</a></td>
</tr>
</table>
<p><br clear="all" />
<span id="catfix" style="display:none;" class="CATFIX-English"><span class="" lang="en" xml:lang="en">&#160;</span></span></p>


<!-- 
NewPP limit report
Parsed by mw1087
CPU time usage: 0.876 seconds
Real time usage: 0.913 seconds
Preprocessor visited node count: 4744/1000000
Preprocessor generated node count: 11262/1500000
Post‐expand include size: 29089/2048000 bytes
Template argument size: 5045/2048000 bytes
Highest expansion depth: 26/40
Expensive parser function count: 2/500
Lua time usage: 0.029/10.000 seconds
Lua memory usage: 1.15 MB/50 MB
-->

<!-- Saved in parser cache with key enwiktionary:pcache:idhash:1974588-0!*!0!*!*!*!* and timestamp 20140401084418
 -->
<div lang="en" dir="ltr"><div id="mw-subcategories">
<h2>Subcategories</h2>
<p>This category has the following 13 subcategories, out of 13 total.
</p><div lang="en" dir="ltr" class="mw-content-ltr"><table style="width: 100%;"><tr style="vertical-align: top;"><td style="width: 33.3%;"><h3>C</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Communication">English phrasebook/Communication</a>‎ <span title="Contains 0 subcategories, 10 pages, and 0 files" dir="ltr">(0 c, 10 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>E</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Emergencies">English phrasebook/Emergencies</a>‎ <span title="Contains 0 subcategories, 9 pages, and 0 files" dir="ltr">(0 c, 9 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li>
<li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:en:Farewells">en:Farewells</a>‎ <span title="Contains 0 subcategories, 26 pages, and 0 files" dir="ltr">(0 c, 26 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li>
<li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_responses">English responses</a>‎ <span title="Contains 0 subcategories, 47 pages, and 0 files" dir="ltr">(0 c, 47 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>F</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Family">English phrasebook/Family</a>‎ <span title="Contains 0 subcategories, 1 page, and 0 files" dir="ltr">(0 c, 1 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul></td>
<td style="width: 33.3%;"><h3>F cont.</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Food_and_drink">English phrasebook/Food and drink</a>‎ <span title="Contains 0 subcategories, 12 pages, and 0 files" dir="ltr">(0 c, 12 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>G</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Greetings">English phrasebook/Greetings</a>‎ <span title="Contains 0 subcategories, 1 page, and 0 files" dir="ltr">(0 c, 1 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>H</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Health">English phrasebook/Health</a>‎ <span title="Contains 0 subcategories, 22 pages, and 0 files" dir="ltr">(0 c, 22 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>L</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Love">English phrasebook/Love</a>‎ <span title="Contains 0 subcategories, 7 pages, and 0 files" dir="ltr">(0 c, 7 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>N</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Needs">English phrasebook/Needs</a>‎ <span title="Contains 0 subcategories, 26 pages, and 0 files" dir="ltr">(0 c, 26 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul></td>
<td style="width: 33.3%;"><h3>R</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Religion">English phrasebook/Religion</a>‎ <span title="Contains 0 subcategories, 13 pages, and 0 files" dir="ltr">(0 c, 13 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>S</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Sex">English phrasebook/Sex</a>‎ <span title="Contains 0 subcategories, 6 pages, and 0 files" dir="ltr">(0 c, 6 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul><h3>T</h3>
<ul><li><div class="CategoryTreeSection"><div class="CategoryTreeItem"><span class="CategoryTreeEmptyBullet">► </span> <a class="CategoryTreeLabel  CategoryTreeLabelNs14 CategoryTreeLabelCategory" href="/wiki/Category:English_phrasebook/Travel">English phrasebook/Travel</a>‎ <span title="Contains 0 subcategories, 16 pages, and 0 files" dir="ltr">(0 c, 16 e)</span></div>
		<div class="CategoryTreeChildren" style="display:none"></div></div>
		</li></ul></td>
</tr></table></div>
</div><div id="mw-pages">
<h2>Pages in category "English phrasebook"</h2>
<p>The following 135 pages are in this category, out of 335 total.
</p>(<a href="/w/index.php?title=Category:English_phrasebook&amp;pageuntil=I%27ve#mw-pages" title="Category:English phrasebook">previous 200</a>) (next 200)<div lang="en" dir="ltr" class="mw-content-ltr"><table style="width: 100%;"><tr style="vertical-align: top;"><td style="width: 33.3%;"><h3>I</h3>
<ul><li><a href="/wiki/I%27ve" title="I've">I've</a></li>
<li><a href="/wiki/I%27ve_been_raped" title="I've been raped">I've been raped</a></li>
<li><a href="/wiki/I%27ve_been_robbed" title="I've been robbed">I've been robbed</a></li>
<li><a href="/wiki/I%27ve_burned_myself" title="I've burned myself">I've burned myself</a></li>
<li><a href="/wiki/I%27ve_lost_my_keys" title="I've lost my keys">I've lost my keys</a></li>
<li><a href="/wiki/is_anyone_sitting_here" title="is anyone sitting here">is anyone sitting here</a></li>
<li><a href="/wiki/is_it_going_to_rain" title="is it going to rain">is it going to rain</a></li>
<li><a href="/wiki/is_there_a_grocery_store" title="is there a grocery store">is there a grocery store</a></li>
<li><a href="/wiki/is_there_a_smaller_size" title="is there a smaller size">is there a smaller size</a></li>
<li><a href="/wiki/isn%27t_it_so" title="isn't it so">isn't it so</a></li>
<li><a href="/wiki/it_can%27t_be_helped" title="it can't be helped">it can't be helped</a></li>
<li><a href="/wiki/it_doesn%27t_matter" title="it doesn't matter">it doesn't matter</a></li>
<li><a href="/wiki/it_was_delicious" title="it was delicious">it was delicious</a></li>
<li><a href="/wiki/it%27s_a_pleasure" title="it's a pleasure">it's a pleasure</a></li>
<li><a href="/wiki/it%27s_an_emergency" title="it's an emergency">it's an emergency</a></li>
<li><a href="/wiki/it%27s_cold_outside" title="it's cold outside">it's cold outside</a></li>
<li><a href="/wiki/it%27s_raining" title="it's raining">it's raining</a></li>
<li><a href="/wiki/it%27s_snowing" title="it's snowing">it's snowing</a></li>
<li><a href="/wiki/it%27s_too_expensive" title="it's too expensive">it's too expensive</a></li></ul><h3>K</h3>
<ul><li><a href="/wiki/keep_the_change" title="keep the change">keep the change</a></li>
<li><a href="/wiki/kiss_me" title="kiss me">kiss me</a></li></ul><h3>L</h3>
<ul><li><a href="/wiki/leave_me_alone" title="leave me alone">leave me alone</a></li>
<li><a href="/wiki/let%27s_go" title="let's go">let's go</a></li>
<li><a href="/wiki/love" title="love">love</a></li></ul><h3>M</h3>
<ul><li><a href="/wiki/make_yourself_at_home" title="make yourself at home">make yourself at home</a></li>
<li><a href="/wiki/many_thanks" title="many thanks">many thanks</a></li>
<li><a href="/wiki/marry_me" title="marry me">marry me</a></li>
<li><a href="/wiki/me_too" title="me too">me too</a></li>
<li><a href="/wiki/Merry_Christmas" title="Merry Christmas">Merry Christmas</a></li>
<li><a href="/wiki/Merry_Christmas_and_a_Happy_New_Year" title="Merry Christmas and a Happy New Year">Merry Christmas and a Happy New Year</a></li>
<li><a href="/wiki/mind_the_gap" title="mind the gap">mind the gap</a></li>
<li><a href="/wiki/much_to_be_said" title="much to be said">much to be said</a></li>
<li><a href="/wiki/my_name_is" title="my name is">my name is</a></li>
<li><a href="/wiki/my_pleasure" title="my pleasure">my pleasure</a></li></ul><h3>N</h3>
<ul><li><a href="/wiki/Appendix:English_phrasebook/Needs" title="Appendix:English phrasebook/Needs">Appendix:English phrasebook/Needs</a></li>
<li><a href="/wiki/no" title="no">no</a></li>
<li><a href="/wiki/no_hard_feelings" title="no hard feelings">no hard feelings</a></li>
<li><a href="/wiki/no_offense" title="no offense">no offense</a></li>
<li><a href="/wiki/no_parking" title="no parking">no parking</a></li>
<li><a href="/wiki/no_problem" title="no problem">no problem</a></li>
<li><a href="/wiki/no_smoking" title="no smoking">no smoking</a></li>
<li><a href="/wiki/no_trespassing" title="no trespassing">no trespassing</a></li>
<li><a href="/wiki/none_of_someone%27s_business" title="none of someone's business">none of someone's business</a></li>
<li><a href="/wiki/not_at_all" title="not at all">not at all</a></li></ul><h3>O</h3>
<ul><li><a href="/wiki/oh_my_God" title="oh my God">oh my God</a></li></ul></td>
<td style="width: 33.3%;"><h3>O cont.</h3>
<ul><li><a href="/wiki/one_moment,_please" title="one moment, please">one moment, please</a></li></ul><h3>P</h3>
<ul><li><a href="/wiki/pardon_me" title="pardon me">pardon me</a></li>
<li><a href="/wiki/please_repeat_after_me" title="please repeat after me">please repeat after me</a></li>
<li><a href="/wiki/please_say_that_again" title="please say that again">please say that again</a></li>
<li><a href="/wiki/please_sit_down" title="please sit down">please sit down</a></li>
<li><a href="/wiki/please_speak_more_slowly" title="please speak more slowly">please speak more slowly</a></li>
<li><a href="/wiki/please_turn_left" title="please turn left">please turn left</a></li>
<li><a href="/wiki/please_turn_right" title="please turn right">please turn right</a></li>
<li><a href="/wiki/pleased_to_meet_you" title="pleased to meet you">pleased to meet you</a></li></ul><h3>R</h3>
<ul><li><a href="/wiki/regards" title="regards">regards</a></li>
<li><a href="/wiki/right_now" title="right now">right now</a></li></ul><h3>S</h3>
<ul><li><a href="/wiki/salaam_alaikum" title="salaam alaikum">salaam alaikum</a></li>
<li><a href="/wiki/season%27s_greetings" title="season's greetings">season's greetings</a></li>
<li><a href="/wiki/see_you" title="see you">see you</a></li>
<li><a href="/wiki/see_you_later" title="see you later">see you later</a></li>
<li><a href="/wiki/so_long" title="so long">so long</a></li>
<li><a href="/wiki/sorry" title="sorry">sorry</a></li>
<li><a href="/wiki/sorry,_I%27m_late" title="sorry, I'm late">sorry, I'm late</a></li>
<li><a href="/wiki/stop" title="stop">stop</a></li>
<li><a href="/wiki/stop_the_car" title="stop the car">stop the car</a></li>
<li><a href="/wiki/sweet_dreams" title="sweet dreams">sweet dreams</a></li></ul><h3>T</h3>
<ul><li><a href="/wiki/take_it_easy" title="take it easy">take it easy</a></li>
<li><a href="/wiki/thank_you" title="thank you">thank you</a></li>
<li><a href="/wiki/thank_you_very_much" title="thank you very much">thank you very much</a></li>
<li><a href="/wiki/thanks" title="thanks">thanks</a></li>
<li><a href="/wiki/thanks_for_your_help" title="thanks for your help">thanks for your help</a></li>
<li><a href="/wiki/that_is_it" title="that is it">that is it</a></li>
<li><a href="/wiki/that%27s_all" title="that's all">that's all</a></li>
<li><a href="/wiki/that%27s_it" title="that's it">that's it</a></li>
<li><a href="/wiki/the_bill,_please" title="the bill, please">the bill, please</a></li>
<li><a href="/wiki/the_line_is_busy" title="the line is busy">the line is busy</a></li>
<li><a href="/wiki/there_isn%27t_any_easy_way_to_say_this" title="there isn't any easy way to say this">there isn't any easy way to say this</a></li>
<li><a href="/wiki/there%27s_been_an_accident" title="there's been an accident">there's been an accident</a></li>
<li><a href="/wiki/this_evening" title="this evening">this evening</a></li>
<li><a href="/wiki/this_morning" title="this morning">this morning</a></li>
<li><a href="/wiki/time_will_tell" title="time will tell">time will tell</a></li>
<li><a href="/wiki/to_go" title="to go">to go</a></li>
<li><a href="/wiki/to_whom_it_may_concern" title="to whom it may concern">to whom it may concern</a></li>
<li><a href="/wiki/to_whom_this_may_concern" title="to whom this may concern">to whom this may concern</a></li>
<li><a href="/wiki/two_beers,_please" title="two beers, please">two beers, please</a></li></ul><h3>W</h3>
<ul><li><a href="/wiki/well,_I_never" title="well, I never">well, I never</a></li>
<li><a href="/wiki/what_a_lovely_day" title="what a lovely day">what a lovely day</a></li>
<li><a href="/wiki/what_a_pity" title="what a pity">what a pity</a></li>
<li><a href="/wiki/what_are_you_doing" title="what are you doing">what are you doing</a></li>
<li><a href="/wiki/what_date_is_it_today" title="what date is it today">what date is it today</a></li></ul></td>
<td style="width: 33.3%;"><h3>W cont.</h3>
<ul><li><a href="/wiki/what_do_you_mean" title="what do you mean">what do you mean</a></li>
<li><a href="/wiki/what_do_you_say" title="what do you say">what do you say</a></li>
<li><a href="/wiki/what_does_XX_mean" title="what does XX mean">what does XX mean</a></li>
<li><a href="/wiki/what_is_that" title="what is that">what is that</a></li>
<li><a href="/wiki/what_is_your_name" title="what is your name">what is your name</a></li>
<li><a href="/wiki/what_is_your_phone_number" title="what is your phone number">what is your phone number</a></li>
<li><a href="/wiki/what_languages_do_you_speak" title="what languages do you speak">what languages do you speak</a></li>
<li><a href="/wiki/what_time_is_it" title="what time is it">what time is it</a></li>
<li><a href="/wiki/what_was_that" title="what was that">what was that</a></li>
<li><a href="/wiki/what%27s_good" title="what's good">what's good</a></li>
<li><a href="/wiki/what%27s_new" title="what's new">what's new</a></li>
<li><a href="/wiki/what%27s_on_your_mind" title="what's on your mind">what's on your mind</a></li>
<li><a href="/wiki/what%27s_that" title="what's that">what's that</a></li>
<li><a href="/wiki/what%27s_the_matter" title="what's the matter">what's the matter</a></li>
<li><a href="/wiki/what%27s_your_job" title="what's your job">what's your job</a></li>
<li><a href="/wiki/what%27s_your_name" title="what's your name">what's your name</a></li>
<li><a href="/wiki/what%27s_your_phone_number" title="what's your phone number">what's your phone number</a></li>
<li><a href="/wiki/what%27s_your_poison" title="what's your poison">what's your poison</a></li>
<li><a href="/wiki/what%27s_yours" title="what's yours">what's yours</a></li>
<li><a href="/wiki/where_are_we" title="where are we">where are we</a></li>
<li><a href="/wiki/where_are_you_from" title="where are you from">where are you from</a></li>
<li><a href="/wiki/where_can_I_find_a_hotel" title="where can I find a hotel">where can I find a hotel</a></li>
<li><a href="/wiki/where_do_you_live" title="where do you live">where do you live</a></li>
<li><a href="/wiki/where_does_this_bus_go" title="where does this bus go">where does this bus go</a></li>
<li><a href="/wiki/where_does_this_train_go" title="where does this train go">where does this train go</a></li>
<li><a href="/wiki/where_is_the_toilet" title="where is the toilet">where is the toilet</a></li>
<li><a href="/wiki/where_you_at" title="where you at">where you at</a></li>
<li><a href="/wiki/who_are_you" title="who are you">who are you</a></li>
<li><a href="/wiki/who_cares" title="who cares">who cares</a></li>
<li><a href="/wiki/who%27s_calling" title="who's calling">who's calling</a></li>
<li><a href="/wiki/will_you_marry_me" title="will you marry me">will you marry me</a></li>
<li><a href="/wiki/wish_you_well" title="wish you well">wish you well</a></li>
<li><a href="/wiki/with_no_further_ado" title="with no further ado">with no further ado</a></li>
<li><a href="/wiki/without_further_adieu" title="without further adieu">without further adieu</a></li></ul><h3>X</h3>
<ul><li><a href="/wiki/Appendix:X_is_a_beautiful_language" title="Appendix:X is a beautiful language">Appendix:X is a beautiful language</a></li></ul><h3>Y</h3>
<ul><li><a href="/wiki/yes" title="yes">yes</a></li>
<li><a href="/wiki/you_are_welcome" title="you are welcome">you are welcome</a></li>
<li><a href="/wiki/you_have_beautiful_eyes" title="you have beautiful eyes">you have beautiful eyes</a></li>
<li><a href="/wiki/you_have_the_advantage_of_me" title="you have the advantage of me">you have the advantage of me</a></li>
<li><a href="/wiki/you%27re_right" title="you're right">you're right</a></li>
<li><a href="/wiki/you%27re_welcome" title="you're welcome">you're welcome</a></li>
<li><a href="/wiki/your_servant" title="your servant">your servant</a></li>
<li><a href="/wiki/yours_faithfully" title="yours faithfully">yours faithfully</a></li>
<li><a href="/wiki/yours_sincerely" title="yours sincerely">yours sincerely</a></li>
<li><a href="/wiki/yours_truly" title="yours truly">yours truly</a></li></ul></td>
</tr></table></div>(<a href="/w/index.php?title=Category:English_phrasebook&amp;pageuntil=I%27ve#mw-pages" title="Category:English phrasebook">previous 200</a>) (next 200)
</div></div><noscript><img src="//en.wiktionary.org/wiki/Special:CentralAutoLogin/start?type=1x1" alt="" title="" width="1" height="1" style="border: none; position: absolute;" /></noscript></div>								<div class="printfooter">
				Retrieved from "<a href="http://en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;oldid=16641196">http://en.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;oldid=16641196</a>"				</div>
												<div id='catlinks' class='catlinks'><div id="mw-normal-catlinks" class="mw-normal-catlinks"><a href="/wiki/Special:Categories" title="Special:Categories">Categories</a>: <ul><li><a href="/wiki/Category:English_phrases" title="Category:English phrases">English phrases</a></li><li><a href="/wiki/Category:Phrasebooks_by_language" title="Category:Phrasebooks by language">Phrasebooks by language</a></li></ul></div><div id="mw-hidden-catlinks" class="mw-hidden-catlinks mw-hidden-cats-ns-shown">Hidden category: <ul><li><a href="/wiki/Category:English_non-idiomatic_translation_targets" title="Category:English non-idiomatic translation targets">English non-idiomatic translation targets</a></li></ul></div></div>												<div class="visualClear"></div>
							</div>
		</div>
		<div id="mw-navigation">
			<h2>Navigation menu</h2>
			<div id="mw-head">
				<div id="p-personal" role="navigation" class="" aria-labelledby="p-personal-label">
	<h3 id="p-personal-label">Personal tools</h3>
	<ul>
<li id="pt-createaccount"><a href="/w/index.php?title=Special:UserLogin&amp;returnto=Category%3AEnglish+phrasebook&amp;returntoquery=pagefrom%3DI%2527ve&amp;type=signup">Create account</a></li><li id="pt-login"><a href="/w/index.php?title=Special:UserLogin&amp;returnto=Category%3AEnglish+phrasebook&amp;returntoquery=pagefrom%3DI%2527ve" title="You are encouraged to log in; however, it is not mandatory [o]" accesskey="o">Log in</a></li>	</ul>
</div>
				<div id="left-navigation">
					<div id="p-namespaces" role="navigation" class="vectorTabs" aria-labelledby="p-namespaces-label">
	<h3 id="p-namespaces-label">Namespaces</h3>
	<ul>
					<li  id="ca-nstab-category" class="selected"><span><a href="/wiki/Category:English_phrasebook"  title="View the category page [c]" accesskey="c">Category</a></span></li>
					<li  id="ca-talk" class="new"><span><a href="/w/index.php?title=Category_talk:English_phrasebook&amp;action=edit&amp;redlink=1"  title="Discussion about the content page [t]" accesskey="t">Discussion</a></span></li>
			</ul>
</div>
<div id="p-variants" role="navigation" class="vectorMenu emptyPortlet" aria-labelledby="p-variants-label">
	<h3 id="mw-vector-current-variant">
		</h3>
	<h3 id="p-variants-label"><span>Variants</span><a href="#"></a></h3>
	<div class="menu">
		<ul>
					</ul>
	</div>
</div>
				</div>
				<div id="right-navigation">
					<div id="p-views" role="navigation" class="vectorTabs" aria-labelledby="p-views-label">
	<h3 id="p-views-label">Views</h3>
	<ul>
					<li id="ca-view" class="selected"><span><a href="/wiki/Category:English_phrasebook" >Read</a></span></li>
					<li id="ca-edit"><span><a href="/w/index.php?title=Category:English_phrasebook&amp;action=edit"  title="You can edit this page. Please use the preview button before saving [e]" accesskey="e">Edit</a></span></li>
					<li id="ca-history" class="collapsible"><span><a href="/w/index.php?title=Category:English_phrasebook&amp;action=history"  title="Past revisions of this page [h]" accesskey="h">History</a></span></li>
			</ul>
</div>
<div id="p-cactions" role="navigation" class="vectorMenu emptyPortlet" aria-labelledby="p-cactions-label">
	<h3 id="p-cactions-label"><span>Actions</span><a href="#"></a></h3>
	<div class="menu">
		<ul>
					</ul>
	</div>
</div>
<div id="p-search" role="search">
	<h3><label for="searchInput">Search</label></h3>
	<form action="/w/index.php" id="searchform">
					<div id="simpleSearch">
					<input type="search" name="search" placeholder="Search" title="Search Wiktionary [f]" accesskey="f" id="searchInput" /><input type="hidden" value="Special:Search" name="title" /><input type="submit" name="fulltext" value="Search" title="Search the pages for this text" id="mw-searchButton" class="searchButton mw-fallbackSearchButton" /><input type="submit" name="go" value="Go" title="Go to a page with this exact name if exists" id="searchButton" class="searchButton" />		</div>
	</form>
</div>
				</div>
			</div>
			<div id="mw-panel">
					<div id="p-logo" role="banner"><a style="background-image: url(//upload.wikimedia.org/wiktionary/en/b/bc/Wiki.png);" href="/wiki/Wiktionary:Main_Page"  title="Visit the main page"></a></div>
				<div class="portal" role="navigation" id='p-navigation' aria-labelledby='p-navigation-label'>
	<h3 id='p-navigation-label'>Navigation</h3>
	<div class="body">
		<ul>
			<li id="n-mainpage-text"><a href="/wiki/Wiktionary:Main_Page">Main Page</a></li>
			<li id="n-portal"><a href="/wiki/Wiktionary:Community_portal" title="About the project, what you can do, where to find things">Community portal</a></li>
			<li id="n-wiktprefs"><a href="/wiki/Wiktionary:Per-browser_preferences">Preferences</a></li>
			<li id="n-requestedarticles"><a href="/wiki/Wiktionary:Requested_entries">Requested entries</a></li>
			<li id="n-recentchanges"><a href="/wiki/Special:RecentChanges" title="A list of recent changes in the wiki [r]" accesskey="r">Recent changes</a></li>
			<li id="n-randompage"><a href="/wiki/Special:Random" title="Load a random page [x]" accesskey="x">Random entry</a></li>
			<li id="n-help"><a href="/wiki/Help:Contents" title="The place to find out">Help</a></li>
			<li id="n-sitesupport"><a href="//donate.wikimedia.org/wiki/Special:FundraiserRedirector?utm_source=donate&amp;utm_medium=sidebar&amp;utm_campaign=C13_en.wiktionary.org&amp;uselang=en" title="Support us">Donations</a></li>
			<li id="n-contact"><a href="/wiki/Wiktionary:Contact_us">Contact us</a></li>
		</ul>
	</div>
</div>
<div class="portal" role="navigation" id='p-tb' aria-labelledby='p-tb-label'>
	<h3 id='p-tb-label'>Tools</h3>
	<div class="body">
		<ul>
			<li id="t-whatlinkshere"><a href="/wiki/Special:WhatLinksHere/Category:English_phrasebook" title="A list of all wiki pages that link here [j]" accesskey="j">What links here</a></li>
			<li id="t-recentchangeslinked"><a href="/wiki/Special:RecentChangesLinked/Category:English_phrasebook" title="Recent changes in pages linked from this page [k]" accesskey="k">Related changes</a></li>
			<li id="t-upload"><a href="//commons.wikimedia.org/wiki/Special:UploadWizard" title="Upload files [u]" accesskey="u">Upload file</a></li>
			<li id="t-specialpages"><a href="/wiki/Special:SpecialPages" title="A list of all special pages [q]" accesskey="q">Special pages</a></li>
			<li id="t-print"><a href="/w/index.php?title=Category:English_phrasebook&amp;pagefrom=I%27ve&amp;printable=yes" rel="alternate" title="Printable version of this page [p]" accesskey="p">Printable version</a></li>
			<li id="t-permalink"><a href="/w/index.php?title=Category:English_phrasebook&amp;oldid=16641196" title="Permanent link to this revision of the page">Permanent link</a></li>
			<li id="t-info"><a href="/w/index.php?title=Category:English_phrasebook&amp;action=info">Page information</a></li>
		</ul>
	</div>
</div>
<div class="portal" role="navigation" id='p-lang' aria-labelledby='p-lang-label'>
	<h3 id='p-lang-label'>In other languages</h3>
	<div class="body">
		<ul>
			<li class="uls-p-lang-dummy"><a href="#"></a></li>
		</ul>
	</div>
</div>
			</div>
		</div>
		<div id="footer" role="contentinfo">
							<ul id="footer-info">
											<li id="footer-info-lastmod"> This page was last modified on 8 April 2012, at 18:05.</li>
											<li id="footer-info-copyright">Text is available under the <a href="//creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution/Share-Alike License</a>; additional terms may apply.  By using this site, you agree to the <a href="//wikimediafoundation.org/wiki/Terms_of_Use">Terms of Use</a> and <a href="//wikimediafoundation.org/wiki/Privacy_policy">Privacy Policy.</a></li>
									</ul>
							<ul id="footer-places">
											<li id="footer-places-privacy"><a href="//wikimediafoundation.org/wiki/Privacy_policy" title="wikimedia:Privacy policy">Privacy policy</a></li>
											<li id="footer-places-about"><a href="/wiki/Wiktionary:About" title="Wiktionary:About">About Wiktionary</a></li>
											<li id="footer-places-disclaimer"><a href="/wiki/Wiktionary:General_disclaimer" title="Wiktionary:General disclaimer">Disclaimers</a></li>
											<li id="footer-places-developers"><a class="external" href="https://www.mediawiki.org/wiki/Special:MyLanguage/How_to_contribute">Developers</a></li>
											<li id="footer-places-mobileview"><a href="//en.m.wiktionary.org/w/index.php?title=Category:English_phrasebook&amp;pagefrom=I%27ve" class="noprint stopMobileRedirectToggle">Mobile view</a></li>
									</ul>
										<ul id="footer-icons" class="noprint">
					<li id="footer-copyrightico">
						<a href="//wikimediafoundation.org/"><img src="//bits.wikimedia.org/images/wikimedia-button.png" width="88" height="31" alt="Wikimedia Foundation"/></a>
					</li>
					<li id="footer-poweredbyico">
						<a href="//www.mediawiki.org/"><img src="//bits.wikimedia.org/static-1.23wmf19/skins/common/images/poweredby_mediawiki_88x31.png" alt="Powered by MediaWiki" width="88" height="31" /></a>
					</li>
				</ul>
						<div style="clear:both"></div>
		</div>
		<script>/*<![CDATA[*/window.jQuery && jQuery.ready();/*]]>*/</script><script>if(window.mw){
mw.loader.state({"site":"loading","user":"ready","user.groups":"ready"});
}</script>
<script src="//bits.wikimedia.org/en.wiktionary.org/load.php?debug=false&amp;lang=en&amp;modules=mw.PopUpMediaTransform&amp;only=scripts&amp;skin=vector&amp;*"></script>
<script>if(window.mw){
mw.loader.load(["mediawiki.action.view.postEdit","ext.categoryTree","mobile.desktop","mediawiki.user","mediawiki.hidpi","mediawiki.page.ready","mediawiki.searchSuggest","ext.gadget.DocTabs","mw.MwEmbedSupport.style","ext.navigationTiming","schema.UniversalLanguageSelector","ext.uls.eventlogger","ext.uls.interlanguage","skins.vector.collapsibleNav"],null,true);
}</script>
<script src="/w/index.php?title=MediaWiki:Gadget-legacy.js&amp;action=raw&amp;ctype=text/javascript"></script>
<script src="//bits.wikimedia.org/en.wiktionary.org/load.php?debug=false&amp;lang=en&amp;modules=site&amp;only=scripts&amp;skin=vector&amp;*"></script>
<!-- Served by mw1050 in 0.346 secs. -->
	</body>
</html>"""

if __name__ == "__main__":

    # create new phraseFile
    phraseFile = open('englishPhraseFile.txt', 'w')
    
    # navigate to the table of phrases in the first html doc
    soup = BeautifulSoup(htmlPage1)
    tables = soup.find_all('table')
    listOfPhrases = tables[2]
    lists = listOfPhrases.find_all('ul')

    # loop through the table's contents writing
    # each phrase to a newline in phraseFile
    for letterList in lists:
        for anchors in letterList.find_all('a'):
            phraseFile.write(anchors.get('title') + '\n')



    
    # navigate to the table of phrases in the first html doc
    soup = BeautifulSoup(htmlPage2)
    tables = soup.find_all('table')
    listOfPhrases = tables[2]
    lists = listOfPhrases.find_all('ul')

    # loop through the table's contents writing
    # each phrase to a newline in phraseFile
    for letterList in lists:
        for anchors in letterList.find_all('a'):
            phraseFile.write(anchors.get('title') + '\n')


    
    phraseFile.close()

    
