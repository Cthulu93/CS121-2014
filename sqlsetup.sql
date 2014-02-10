CREATE TABLE `Translations` (
  `TransID` int(11) NOT NULL AUTO_INCREMENT,
  `English` text,
  `EnglishLen` int(11) DEFAULT NULL,
  `Spanish` text,
  `SpanishLen` int(11) DEFAULT NULL,
  `Image` blob,
  PRIMARY KEY (`TransID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

#username: echoorg1_cs121
#password: cs121

