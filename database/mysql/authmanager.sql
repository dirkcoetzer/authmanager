
CREATE TABLE `vmweb_authmanager_item` (
  `name` varchar(60) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `description` varchar(255),
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vmweb_authmanager_item_child` (
  `parent` varchar(60) NOT NULL,
  `child` varchar(60) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  FOREIGN KEY (`parent`) REFERENCES `vmweb_authmanager_item` (`name`)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
  FOREIGN KEY (`child`) REFERENCES `vmweb_authmanager_item` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vmweb_authmanager_assignment` (
  `itemname` varchar(60) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  FOREIGN KEY (`itemname`) REFERENCES `vmweb_authmanager_item` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `vmweb_oauth_users` (`userid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;