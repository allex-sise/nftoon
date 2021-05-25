DROP TABLE assign_module_permissions;

CREATE TABLE `assign_module_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `permission` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `module_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO assign_module_permissions VALUES("1","1","2020-05-20 03:25:09","2020-05-20 03:25:09","1","2","1","1");
INSERT INTO assign_module_permissions VALUES("2","1","2020-05-20 03:25:09","2020-05-20 03:25:09","2","2","1","1");
INSERT INTO assign_module_permissions VALUES("3","1","2020-05-20 03:25:09","2020-05-20 03:25:09","3","2","1","1");
INSERT INTO assign_module_permissions VALUES("4","1","2020-05-20 03:25:09","2020-05-20 03:25:09","4","2","1","1");
INSERT INTO assign_module_permissions VALUES("5","1","2020-05-20 03:25:09","2020-05-20 03:25:09","5","2","1","1");
INSERT INTO assign_module_permissions VALUES("6","1","2020-05-20 03:25:09","2020-05-20 03:25:09","6","2","1","1");
INSERT INTO assign_module_permissions VALUES("7","1","2020-05-20 03:25:09","2020-05-20 03:25:09","7","2","1","1");
INSERT INTO assign_module_permissions VALUES("8","1","2020-05-20 03:25:09","2020-05-20 03:25:09","8","2","1","1");
INSERT INTO assign_module_permissions VALUES("9","1","2020-05-20 03:25:09","2020-05-20 03:25:09","9","2","1","1");
INSERT INTO assign_module_permissions VALUES("10","1","2020-05-20 03:25:09","2020-05-20 03:25:09","10","2","1","1");
INSERT INTO assign_module_permissions VALUES("11","1","2020-05-20 03:25:09","2020-05-20 03:25:09","11","2","1","1");
INSERT INTO assign_module_permissions VALUES("12","1","2020-05-20 03:25:09","2020-05-20 03:25:09","12","2","1","1");
INSERT INTO assign_module_permissions VALUES("13","1","2020-05-20 03:25:09","2020-05-20 03:25:09","13","2","1","1");
INSERT INTO assign_module_permissions VALUES("14","1","2020-05-20 03:25:09","2020-05-20 03:25:09","14","2","1","1");
INSERT INTO assign_module_permissions VALUES("15","1","2020-05-20 03:25:09","2020-05-20 03:25:09","15","2","1","1");
INSERT INTO assign_module_permissions VALUES("16","1","2020-05-20 03:25:09","2020-05-20 03:25:09","16","2","1","1");
INSERT INTO assign_module_permissions VALUES("17","1","2020-05-20 03:25:09","2020-05-20 03:25:09","17","2","1","1");
INSERT INTO assign_module_permissions VALUES("18","1","2020-05-20 03:25:09","2020-05-20 03:25:09","18","2","1","1");
INSERT INTO assign_module_permissions VALUES("19","1","2020-05-20 03:25:09","2020-05-20 03:25:09","19","2","1","1");
INSERT INTO assign_module_permissions VALUES("20","1","2020-05-20 03:25:09","2020-05-20 03:25:09","20","2","1","1");
INSERT INTO assign_module_permissions VALUES("21","1","2020-05-20 03:25:09","2020-05-20 03:25:09","21","2","1","1");
INSERT INTO assign_module_permissions VALUES("22","1","2020-05-20 03:25:09","2020-05-20 03:25:09","22","2","1","1");



DROP TABLE attributes;

CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attributes VALUES("1","Compatible Browsers","compatible_browsers","1","","");
INSERT INTO attributes VALUES("2","Compatible With","compatible_with","1","","");
INSERT INTO attributes VALUES("3","Framework","framework","1","","");
INSERT INTO attributes VALUES("4","Software Version","software_version","1","","");



DROP TABLE author_payout_setups;

CREATE TABLE `author_payout_setups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `payment_method_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payout_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payout_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `active_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payout_user_id_01` (`user_id`),
  CONSTRAINT `payout_user_id_01` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE badges;

CREATE TABLE `badges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` int(11) NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE balance_sheets;

CREATE TABLE `balance_sheets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `tax` double(10,2) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `fee` double(10,2) DEFAULT NULL,
  `service` double(10,2) DEFAULT NULL,
  `income` double(10,2) DEFAULT NULL,
  `expense` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `balance_sheets_01` (`user_id`),
  KEY `balance_sheets_02` (`author_id`),
  KEY `balance_sheets_o3` (`item_id`),
  KEY `balance_sheets_o4` (`order_id`),
  CONSTRAINT `balance_sheets_01` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `balance_sheets_02` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `balance_sheets_o3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `balance_sheets_o4` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE balances;

CREATE TABLE `balances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `balances_fk0` (`user_id`),
  CONSTRAINT `balances_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO balances VALUES("1","1","1","25.00","2021-04-28 12:41:54","2021-04-28 12:41:54");



DROP TABLE bank_deposits;

CREATE TABLE `bank_deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `status` int(11) DEFAULT '0',
  `depositor_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_deposit_01` (`depositor_id`),
  CONSTRAINT `bank_deposit_01` FOREIGN KEY (`depositor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE become_authors;

CREATE TABLE `become_authors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO become_authors VALUES("1","<h2>Let\'s Started</h2><p>These things you need to know become an author</p><p>We live for quality and originality</p><p>Only the best Authors and items make it through our review process.This way we make sure that all products meet our quality standards.</p><p>Make it lcear and meaningfull</p><p>The most successfull Authors put as much love into describing and presenting their items as they do in creating them.</p><p>Great reviews come from great support</p><p>The key to your success is your customers so make sure you help and support them as much as you can.</p>","","");



DROP TABLE blog_categories;

CREATE TABLE `blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE blogs;

CREATE TABLE `blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `blog_category_id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_fk0` (`user_id`),
  KEY `blogs_fk1` (`blog_category_id`),
  CONSTRAINT `blogs_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blogs_fk1` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE buy_packages;

CREATE TABLE `buy_packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `package_plan` int(10) unsigned NOT NULL,
  `package_price` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `totalItem` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `package_buy` (`user_id`),
  KEY `package_buy_plan` (`package_plan`),
  CONSTRAINT `package_buy` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `package_buy_plan` FOREIGN KEY (`package_plan`) REFERENCES `package_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE buyer_fee_types;

CREATE TABLE `buyer_fee_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO buyer_fee_types VALUES("1","Extend Support Fee","extend_support_fee","1","","");
INSERT INTO buyer_fee_types VALUES("2","Coupon Fee","coupon_fee","1","","");



DROP TABLE buyer_fees;

CREATE TABLE `buyer_fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `fee` double(10,2) NOT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `balance_01` (`user_id`),
  KEY `type_serv_01` (`type`),
  CONSTRAINT `balance_01` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `type_serv_01` FOREIGN KEY (`type`) REFERENCES `buyer_fee_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE buyer_item_fees;

CREATE TABLE `buyer_item_fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `fee` double(10,2) NOT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buyer_item_fees_001` (`user_id`),
  CONSTRAINT `buyer_item_fees_001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE comments;

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_fk0` (`user_id`),
  KEY `comments_fk1` (`item_id`),
  KEY `comments_fk2` (`parent_id`),
  CONSTRAINT `comments_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_fk1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_fk2` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE contacts;

CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE coupon_histories;

CREATE TABLE `coupon_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE coupons;

CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(10) unsigned NOT NULL,
  `min_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_type` tinyint(1) DEFAULT NULL,
  `discount_type` tinyint(1) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `from` timestamp NULL DEFAULT NULL,
  `to` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_fk0` (`vendor_id`),
  CONSTRAINT `coupon_fk0` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE customers;

CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `subscription_plan_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_fk0` (`user_id`),
  KEY `customers_fk1` (`subscription_plan_id`),
  CONSTRAINT `customers_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customers_fk1` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE deposits;

CREATE TABLE `deposits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deposits_001` (`user_id`),
  CONSTRAINT `deposits_001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE email_notification_settings;

CREATE TABLE `email_notification_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rating` tinyint(4) DEFAULT NULL,
  `item_update` tinyint(4) DEFAULT NULL,
  `item_comment` tinyint(4) DEFAULT NULL,
  `item_review` tinyint(4) DEFAULT NULL,
  `buyer_review` tinyint(4) DEFAULT NULL,
  `expiring_support` tinyint(4) DEFAULT NULL,
  `daily_summary` tinyint(4) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_notification_settings_0` (`user_id`),
  CONSTRAINT `email_notification_settings_0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE email_templates;

CREATE TABLE `email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `registration` longtext COLLATE utf8mb4_unicode_ci,
  `mail_verify` longtext COLLATE utf8mb4_unicode_ci,
  `product_purchase` longtext COLLATE utf8mb4_unicode_ci,
  `product_refund` longtext COLLATE utf8mb4_unicode_ci,
  `rating` longtext COLLATE utf8mb4_unicode_ci,
  `product_update` longtext COLLATE utf8mb4_unicode_ci,
  `product_comment` longtext COLLATE utf8mb4_unicode_ci,
  `user_suspend` longtext COLLATE utf8mb4_unicode_ci,
  `product_review_by_buyer` longtext COLLATE utf8mb4_unicode_ci,
  `product_expiring_support` longtext COLLATE utf8mb4_unicode_ci,
  `daily_summary` longtext COLLATE utf8mb4_unicode_ci,
  `active_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO email_templates VALUES("1","Dear,[username], thank you for registration","Dear,[username], please verify you email","Dear,[username], thank you for purchase","Dear,[username], your refund request approved!","Dear , [username], your product got rating [rating].","Dear,[username], your bought product [title] updated!","Dear, A new comment has been arraived right now","Dear,[username], you are suspend!","Dear, This item has been reviewed by buyer","Dear, Your product support has been expaired","Dear, Congratulation for salling item. Your daily summery has been attached.","1","","");



DROP TABLE error_logs;

CREATE TABLE `error_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `process_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_message` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE feedback;

CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `feedback_by` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `feedback` longtext COLLATE utf8mb4_unicode_ci,
  `subject` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_001` (`user_id`),
  KEY `feedback_07` (`feedback_by`),
  KEY `feedback_0044` (`item_id`),
  CONSTRAINT `feedback_001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `feedback_0044` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `feedback_07` FOREIGN KEY (`feedback_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE followers;

CREATE TABLE `followers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `follower_id` int(10) unsigned NOT NULL,
  `leader_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `followers_fk0` (`follower_id`),
  KEY `followers_fk1` (`leader_id`),
  CONSTRAINT `followers_fk0` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `followers_fk1` FOREIGN KEY (`leader_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE footer_menus;

CREATE TABLE `footer_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_no` tinyint(4) DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO footer_menus VALUES("1","About Company","http://localhost/minted/about_company","1","1","1","1","2021-04-28 12:42:03","2021-04-28 12:42:03");
INSERT INTO footer_menus VALUES("2","Terms & Conditions","http://localhost/minted/terms-conditions","2","1","1","1","2021-04-28 12:42:03","2021-04-28 12:42:03");
INSERT INTO footer_menus VALUES("3","Privacy Policy","http://localhost/minted/privacy-policy","3","1","1","1","2021-04-28 12:42:03","2021-04-28 12:42:03");



DROP TABLE free_items;

CREATE TABLE `free_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `free_items_02` (`item_id`),
  CONSTRAINT `free_items_02` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE front_coupons;

CREATE TABLE `front_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_coupon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_coupon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_coupon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO front_coupons VALUES("1","We do not sell or share your details without your permission. Find out more in our Privacy Policy. Your username, email and password can be updated via your Codepixar Account settings.","We do not sell or share your details without your permission. Find out more in our Privacy Policy. Your username, email and password can be updated via your Codepixar Account settings.","We do not sell or share your details without your permission. Find out more in our Privacy Policy. Your username, email and password can be updated via your Codepixar Account settings.","We do not sell or share your details without your permission. Find out more in our Privacy Policy. Your username, email and password can be updated via your Codepixar Account settings.","1","1","1","","");



DROP TABLE front_settings;

CREATE TABLE `front_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_limit` int(11) NOT NULL,
  `color1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color3` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO front_settings VALUES("1","6","#b737e0","#27006e","#b737e0","1","1","1","","");



DROP TABLE infix_about_companies;

CREATE TABLE `infix_about_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heading_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_about_companies VALUES("1","About Us","Lorem Ipsum is simply dummy text of the printing and typesetting industry.","Lorem Ipsum is simply dummy text of the printing and typesetting industry.","Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.","Modules/Pages/Assets/image/1.png","0","1","1","","");



DROP TABLE infix_all_languages;

CREATE TABLE `infix_all_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `native` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(4) NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_all_languages VALUES("1","af","Afrikaans","Afrikaans","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("2","am","Amharic","አማርኛ","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("3","ar","Arabic","العربية","1","1","1","1","","");
INSERT INTO infix_all_languages VALUES("4","ay","Aymara","Aymar","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("5","az","Azerbaijani","Azərbaycanca / آذربايجان","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("6","be","Belarusian","Беларуская","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("7","bg","Bulgarian","Български","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("8","bi","Bislama","Bislama","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("9","bn","Bengali","বাংলা","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("10","bs","Bosnian","Bosanski","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("11","ca","Catalan","Català","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("12","ch","Chamorro","Chamoru","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("13","cs","Czech","Česky","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("14","da","Danish","Dansk","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("15","de","German","Deutsch","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("16","dv","Divehi","ދިވެހިބަސް","1","1","1","1","","");
INSERT INTO infix_all_languages VALUES("17","dz","Dzongkha","ཇོང་ཁ","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("18","el","Greek","Ελληνικά","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("19","en","English","English","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("20","es","Spanish","Español","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("21","et","Estonian","Eesti","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("22","eu","Basque","Euskara","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("23","fa","Persian","فارسی","1","1","1","1","","");
INSERT INTO infix_all_languages VALUES("24","ff","Peul","Fulfulde","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("25","fi","Finnish","Suomi","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("26","fj","Fijian","Na Vosa Vakaviti","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("27","fo","Faroese","Føroyskt","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("28","fr","French","Français","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("29","ga","Irish","Gaeilge","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("30","gl","Galician","Galego","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("31","gn","Guarani","Avañe\'ẽ","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("32","gv","Manx","Gaelg","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("33","he","Hebrew","עברית","1","1","1","1","","");
INSERT INTO infix_all_languages VALUES("34","hi","Hindi","हिन्दी","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("35","hr","Croatian","Hrvatski","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("36","ht","Haitian","Krèyol ayisyen","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("37","hu","Hungarian","Magyar","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("38","hy","Armenian","Հայերեն","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("39","id","Indonesian","Bahasa Indonesia","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("40","is","Icelandic","Íslenska","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("41","it","Italian","Italiano","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("42","ja","Japanese","日本語","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("43","ka","Georgian","ქართული","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("44","kg","Kongo","KiKongo","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("45","kk","Kazakh","Қазақша","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("46","kl","Greenlandic","Kalaallisut","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("47","km","Cambodian","ភាសាខ្មែរ","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("48","ko","Korean","한국어","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("49","ku","Kurdish","Kurdî / كوردی","1","1","1","1","","");
INSERT INTO infix_all_languages VALUES("50","ky","Kirghiz","Kırgızca / Кыргызча","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("51","la","Latin","Latina","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("52","lb","Luxembourgish","Lëtzebuergesch","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("53","ln","Lingala","Lingála","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("54","lo","Laotian","ລາວ / Pha xa lao","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("55","lt","Lithuanian","Lietuvių","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("56","lu","","","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("57","lv","Latvian","Latviešu","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("58","mg","Malagasy","Malagasy","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("59","mh","Marshallese","Kajin Majel / Ebon","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("60","mi","Maori","Māori","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("61","mk","Macedonian","Македонски","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("62","mn","Mongolian","Монгол","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("63","ms","Malay","Bahasa Melayu","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("64","mt","Maltese","bil-Malti","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("65","my","Burmese","မြန်မာစာ","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("66","na","Nauruan","Dorerin Naoero","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("67","nb","","","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("68","nd","North Ndebele","Sindebele","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("69","ne","Nepali","नेपाली","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("70","nl","Dutch","Nederlands","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("71","nn","Norwegian Nynorsk","Norsk (nynorsk)","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("72","no","Norwegian","Norsk (bokmål / riksmål)","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("73","nr","South Ndebele","isiNdebele","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("74","ny","Chichewa","Chi-Chewa","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("75","oc","Occitan","Occitan","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("76","pa","Panjabi / Punjabi","ਪੰਜਾਬੀ / पंजाबी / پنجابي","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("77","pl","Polish","Polski","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("78","ps","Pashto","پښتو","1","1","1","1","","");
INSERT INTO infix_all_languages VALUES("79","pt","Portuguese","Português","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("80","qu","Quechua","Runa Simi","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("81","rn","Kirundi","Kirundi","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("82","ro","Romanian","Română","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("83","ru","Russian","Русский","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("84","rw","Rwandi","Kinyarwandi","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("85","sg","Sango","Sängö","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("86","si","Sinhalese","සිංහල","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("87","sk","Slovak","Slovenčina","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("88","sl","Slovenian","Slovenščina","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("89","sm","Samoan","Gagana Samoa","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("90","sn","Shona","chiShona","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("91","so","Somalia","Soomaaliga","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("92","sq","Albanian","Shqip","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("93","sr","Serbian","Српски","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("94","ss","Swati","SiSwati","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("95","st","Southern Sotho","Sesotho","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("96","sv","Swedish","Svenska","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("97","sw","Swahili","Kiswahili","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("98","ta","Tamil","தமிழ்","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("99","tg","Tajik","Тоҷикӣ","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("100","th","Thai","ไทย / Phasa Thai","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("101","ti","Tigrinya","ትግርኛ","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("102","tk","Turkmen","Туркмен / تركمن","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("103","tn","Tswana","Setswana","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("104","to","Tonga","Lea Faka-Tonga","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("105","tr","Turkish","Türkçe","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("106","ts","Tsonga","Xitsonga","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("107","uk","Ukrainian","Українська","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("108","ur","Urdu","اردو","1","1","1","1","","");
INSERT INTO infix_all_languages VALUES("109","uz","Uzbek","Ўзбек","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("110","ve","Venda","Tshivenḓa","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("111","vi","Vietnamese","Tiếng Việt","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("112","xh","Xhosa","isiXhosa","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("113","zh","Chinese","中文","0","1","1","1","","");
INSERT INTO infix_all_languages VALUES("114","zu","Zulu","isiZulu","0","1","1","1","","");



DROP TABLE infix_background_settings;

CREATE TABLE `infix_background_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_text` text COLLATE utf8mb4_unicode_ci,
  `is_default` int(11) NOT NULL DEFAULT '1',
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_background_settings VALUES("1","Logo","image","Modules/Systemsetting/upload_image/3.png","","","1","1","1","1","","");
INSERT INTO infix_background_settings VALUES("2","Favicon","image","Modules/Systemsetting/upload_image/2.png","","","1","1","1","1","","");
INSERT INTO infix_background_settings VALUES("3","Dashboard Background Image","image","Modules/Systemsetting/upload_image/4.jpg","","","1","1","1","1","","");
INSERT INTO infix_background_settings VALUES("4","Login/ Signup Background Image","image","Modules/Systemsetting/upload_image/5.png","","<h3 style=\"margin-right: 0px; margin-bottom: 39px; margin-left: 0px; padding: 0px; font-family: Quicksand, sans-serif; font-weight: 700; line-height: 45px; color: rgb(255, 255, 255); font-size: 32px;\">Tons of premium<br style=\"margin: 0px; padding: 0px;\">Templates are<br style=\"margin: 0px; padding: 0px;\">Waiting for you!</h3><h3 style=\"margin-right: 0px; margin-bottom: 39px; margin-left: 0px; padding: 0px; font-family: Quicksand, sans-serif; font-weight: 700; line-height: 45px; font-size: 32px;\"><p style=\"margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; font-size: 14px; font-weight: 300; line-height: 26px; color: rgb(255, 255, 255); font-family: &quot;Open Sans&quot;, sans-serif;\">There are advances being made in science<br style=\"margin: 0px; padding: 0px;\">and technology everyday, and a good<br style=\"margin: 0px; padding: 0px;\">example of this is the</p></h3><p></p>","1","1","1","1","","");
INSERT INTO infix_background_settings VALUES("5","404 Image","image","Modules/Systemsetting/upload_image/404.png","","<h4 style=\"font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-weight: 600; line-height: 1.2; color: rgb(0, 0, 0); font-size: 30px; text-align: center;\">Page You Are Looking<span style=\"display: block; color: rgb(239, 239, 239);\">Is Not Found</span></h4><p style=\"margin: 20px 0px; font-size: 18px; color: rgb(51, 51, 51); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; text-align: center;\">The page you are looking for does not exist. it may have been moved or removed altogether. Perhaps you can return back to the site homepage and see if you can find what you are looking for.</p>","1","1","1","1","","");
INSERT INTO infix_background_settings VALUES("6","Pre Loader","image","Modules/Systemsetting/upload_image/1.gif","","","1","0","1","1","","");
INSERT INTO infix_background_settings VALUES("7","OOPs Image","image","Modules/Systemsetting/upload_image/7.jpeg","","","1","0","1","1","","");
INSERT INTO infix_background_settings VALUES("8","Success Image","image","Modules/Systemsetting/upload_image/8.jpg","","","1","0","1","1","","");



DROP TABLE infix_backups;

CREATE TABLE `infix_backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` tinyint(4) DEFAULT NULL COMMENT '0=Database, 1=File, 2=Image',
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_backups VALUES("2","Backup_28_04_2021_1619620931_Images.zip","/Applications/AMPPS/www/minted/public/Backup/ImageBackup/Backup_28_04_2021_1619620931_Images.zip","1","1","1","1","2021-04-28 14:42:11","2021-04-28 14:42:11");



DROP TABLE infix_category_question;

CREATE TABLE `infix_category_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `first_question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_category_question VALUES("1","1","Libero quidem non blanditiis blanditiis non. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("2","2","Eveniet eum maiores ducimus qui quia officiis. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("3","3","Inventore accusantium quod possimus aut laborum deleniti. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("4","4","Tempora ut esse labore pariatur blanditiis aut illo. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("5","5","Occaecati molestiae dolor eos qui omnis porro. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("6","1","Architecto aperiam dignissimos non officiis modi et. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("7","2","Blanditiis nulla quaerat repellendus sed voluptatum eum et. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("8","3","Et magnam quia impedit magni cumque vitae. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("9","4","Animi ex omnis minus repudiandae eos optio est. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("10","5","Vel reprehenderit aut consequatur nam iste architecto. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("11","1","Laudantium voluptates libero aliquam non. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("12","2","Distinctio voluptatem dolores eligendi dolorum quibusdam. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("13","3","Nulla enim corporis exercitationem molestiae. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("14","4","Qui rem optio molestias. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("15","5","Aut provident expedita voluptas dolores ipsam voluptas optio. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("16","1","Eveniet aliquid quam ut inventore tenetur in molestiae. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("17","2","Animi quia ipsum nesciunt. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("18","3","Voluptatum molestias delectus quas laudantium. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("19","4","Aut ut sed ut omnis delectus. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("20","5","Ea tenetur et sit neque consequuntur est. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("21","1","Debitis dolores libero sed nostrum dolores quia. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("22","2","Sapiente earum ratione blanditiis et. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("23","3","Ullam autem quidem nobis et rerum quia et. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("24","4","Ea quia laudantium repellendus id exercitationem voluptate dolor a. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("25","5","Dolor quaerat est aut est qui. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("26","1","Et quisquam iure voluptas est voluptatem ex est sed. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("27","2","Et rerum sed cumque et eos ut. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("28","3","Est reprehenderit qui deserunt provident corrupti deleniti. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("29","4","Maiores nobis repellendus qui enim perspiciatis sint. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("30","5","Harum ducimus quis et est porro natus. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("31","1","Molestias totam aliquid saepe et sed molestiae. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("32","2","Cum eaque illo et itaque sequi. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("33","3","Officiis magni et facilis qui voluptatem. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("34","4","Aspernatur sequi eligendi quisquam deleniti. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("35","5","Ut mollitia ea et et nesciunt perferendis. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("36","1","Temporibus velit eum sed mollitia et quas deserunt. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("37","2","Enim earum nemo ea. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("38","3","Dolor sit neque vero expedita consequatur vel. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("39","4","Omnis eum sint delectus sapiente et deleniti eos sunt. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("40","5","Aut corporis molestiae fugit est dolorum quas. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("41","1","Dignissimos et omnis et quidem veniam. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("42","2","Aliquam ut facere minus nemo. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("43","3","Voluptatibus repellendus et aut assumenda voluptatum reiciendis. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("44","4","Vel reiciendis aperiam accusantium. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("45","5","Optio ipsam ipsa in fuga quasi aliquid consequuntur. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("46","1","Rerum est eveniet nemo magnam libero ipsum. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("47","2","Temporibus quibusdam aut et fugiat. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("48","3","Ipsa pariatur ipsum ipsam et. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("49","4","Nam voluptas minus voluptatem ut est ipsum. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_category_question VALUES("50","5","Corrupti non eos nihil. ?","1","2021-04-28 12:41:59","2021-04-28 12:41:59");



DROP TABLE infix_currencies;

CREATE TABLE `infix_currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_currencies VALUES("1","Leke","ALL","Lek","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("2","Dollars","USD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("3","Afghanis","AFN","؋","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("4","Pesos","ARS","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("5","Guilders","AWG","ƒ","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("6","Dollars","AUD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("7","New Manats","AZN","ман","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("8","Dollars","BSD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("9","Dollars","BBD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("10","Rubles","BYR","p.","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("11","Euro","EUR","€","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("12","Dollars","BZD","BZ$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("13","Dollars","BMD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("14","Bolivianos","BOB","$b","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("15","Convertible Marka","BAM","KM","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("16","Pula","BWP","P","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("17","Leva","BGN","лв","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("18","Reais","BRL","R$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("19","Pounds","GBP","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("20","Dollars","BND","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("21","Riels","KHR","៛","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("22","Dollars","CAD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("23","Dollars","KYD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("24","Pesos","CLP","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("25","Yuan Renminbi","CNY","¥","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("26","Pesos","COP","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("27","Colón","CRC","₡","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("28","Kuna","HRK","kn","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("29","Pesos","CUP","₱","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("30","Koruny","CZK","Kč","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("31","Kroner","DKK","kr","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("32","Pesos","DOP ","RD$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("33","Dollars","XCD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("34","Pounds","EGP","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("35","Colones","SVC","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("36","Pounds","FKP","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("37","Dollars","FJD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("38","Cedis","GHC","¢","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("39","Pounds","GIP","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("40","Quetzales","GTQ","Q","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("41","Pounds","GGP","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("42","Dollars","GYD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("43","Lempiras","HNL","L","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("44","Dollars","HKD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("45","Forint","HUF","Ft","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("46","Kronur","ISK","kr","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("47","Rupees","INR","₹","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("48","Rupiahs","IDR","Rp","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("49","Rials","IRR","﷼","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("50","Pounds","IMP","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("51","New Shekels","ILS","₪","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("52","Dollars","JMD","J$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("53","Yen","JPY","¥","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("54","Pounds","JEP","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("55","Tenge","KZT","лв","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("56","Won","KPW","₩","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("57","Won","KRW","₩","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("58","Soms","KGS","лв","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("59","Kips","LAK","₭","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("60","Lati","LVL","Ls","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("61","Pounds","LBP","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("62","Dollars","LRD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("63","Switzerland Francs","CHF","CHF","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("64","Litai","LTL","Lt","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("65","Denars","MKD","ден","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("66","Ringgits","MYR","RM","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("67","Rupees","MUR","₨","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("68","Pesos","MXN","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("69","Tugriks","MNT","₮","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("70","Meticais","MZN","MT","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("71","Dollars","NAD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("72","Rupees","NPR","₨","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("73","Guilders","ANG","ƒ","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("74","Dollars","NZD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("75","Cordobas","NIO","C$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("76","Nairas","NGN","₦","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("77","Krone","NOK","kr","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("78","Rials","OMR","﷼","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("79","Rupees","PKR","₨","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("80","Balboa","PAB","B/.","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("81","Guarani","PYG","Gs","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("82","Nuevos Soles","PEN","S/.","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("83","Pesos","PHP","Php","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("84","Zlotych","PLN","zł","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("85","Rials","QAR","﷼","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("86","New Lei","RON","lei","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("87","Rubles","RUB","руб","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("88","Pounds","SHP","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("89","Riyals","SAR","﷼","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("90","Dinars","RSD","Дин.","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("91","Rupees","SCR","₨","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("92","Dollars","SGD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("93","Dollars","SBD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("94","Shillings","SOS","S","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("95","Rand","ZAR","R","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("96","Rupees","LKR","₨","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("97","Kronor","SEK","kr","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("98","Dollars","SRD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("99","Pounds","SYP","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("100","New Dollars","TWD","NT$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("101","Baht","THB","฿","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("102","Dollars","TTD","TT$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("103","Lira","TRY","TL","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("104","Liras","TRL","£","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("105","Dollars","TVD","$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("106","Hryvnia","UAH","₴","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("107","Pesos","UYU","$U","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("108","Sums","UZS","лв","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("109","Bolivares Fuertes","VEF","Bs","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("110","Dong","VND","₫","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("111","Rials","YER","﷼","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("112","Taka","BDT","৳","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_currencies VALUES("113","Zimbabwe Dollars","ZWD","Z$","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");



DROP TABLE infix_date_format;

CREATE TABLE `infix_date_format` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `normal_view` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_date_format VALUES("1","jS M, Y","17th May, 2019","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("2","Y-m-d","2019-05-17","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("3","Y-d-m","2019-17-05","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("4","d-m-Y","17-05-2019","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("5","m-d-Y","05-17-2019","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("6","Y/m/d","2019/05/17","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("7","Y/d/m","2019/17/05","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("8","d/m/Y","17/05/2019","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("9","m/d/Y","05/17/2019","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("10","l jS \\of F Y","Monday 17th of May 2019","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("11","jS \\of F Y","17th of May 2019","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("12","g:ia \\o\\n l jS F Y","12:00am on Monday 17th May 2019","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("13","F j, Y, g:i a","May 7, 2019, 6:20 pm","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("14","F j, Y","May 17, 2019","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_date_format VALUES("15","\\i\\t \\i\\s \\t\\h\\e jS \\d\\a\\y","it is the 17th day","1","2021-04-28 12:41:59","2021-04-28 12:41:59");



DROP TABLE infix_departments;

CREATE TABLE `infix_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_departments VALUES("1","Production","1","","");
INSERT INTO infix_departments VALUES("2","Purchasing","1","","");
INSERT INTO infix_departments VALUES("3","Marketing","1","","");
INSERT INTO infix_departments VALUES("4","Customer Service","1","","");
INSERT INTO infix_departments VALUES("5","Support","1","","");



DROP TABLE infix_email_settings;

CREATE TABLE `infix_email_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_engine_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_driver` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_encryption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_email_settings VALUES("1","smtp","System Admin","demo@gmail.com","smtp","smtp.gmail.com","587","demo@gmail.com","123456","tls","1","1","1","","");
INSERT INTO infix_email_settings VALUES("2","php","System Admin","admin@infixedu.com","php","","","","","","0","1","1","","");



DROP TABLE infix_faqs;

CREATE TABLE `infix_faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_answer` text COLLATE utf8mb4_unicode_ci,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_faqs VALUES("1","On which orders D-Force will be eligible for bonus?","BDT 100 will be given to D-Force on customer’s first purchase (via Daraz App) made through the link shared","1","1","1","","");
INSERT INTO infix_faqs VALUES("2","Is bonus applicable on sales made using a voucher?","Yes. Bonus is applicable on sales as long as the paid price is equal to or above BDT 500.","1","1","1","","");
INSERT INTO infix_faqs VALUES("3","Is bonus applicable on sales made using a voucher?","Yes. Bonus is applicable on sales as long as the paid price is equal to or above BDT 500.","1","1","1","","");



DROP TABLE infix_footer_menus;

CREATE TABLE `infix_footer_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label13` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href13` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label14` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href14` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label9` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href9` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label10` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href10` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label11` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href11` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_label15` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_href15` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_footer_menus VALUES("1","Company","Community","Help","Terms & Condition","http://localhost/minted/terms-conditions","Licenses","http://localhost/minted/license","Market APIs","http://localhost/minted/market-apis","Forums","","Meetups","","Support Ticket","/support-ticket","FAQ","http://localhost/minted/help/faq","Knowledge Base","http://localhost/minted/help/knowledge-base","Help Center","","About","","Contact","","link_label15","","2021-04-28 12:42:03","2021-04-28 12:42:03");



DROP TABLE infix_footer_settings;

CREATE TABLE `infix_footer_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `copyright_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_footer_settings VALUES("1","Copyright © 2020 All rights reserved | This application is made by Codethemes","fa-facebook","https://www.facebook.com/","fa-twitter","https://www.twitter.com","fa-instagram","https://www.instagram.com","fa-youtube","https://www.youtube.com","fa-pinterest","https://www.pinterest.com","Dhaka","12345678549","info@spondonit.com","","");



DROP TABLE infix_funds;

CREATE TABLE `infix_funds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fund_depositor` int(11) NOT NULL,
  `fund_receiver` int(11) NOT NULL,
  `fund_amount` double NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE infix_general_settings;

CREATE TABLE `infix_general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'USD',
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '$',
  `email_driver` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_updated_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1.0',
  `system_activated_date` date DEFAULT NULL,
  `active_status` int(11) DEFAULT '1',
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'USD',
  `language_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `system_purchase_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `envato_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `envato_item_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_url` int(11) NOT NULL DEFAULT '1',
  `software_version` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ttl_rtl` int(11) NOT NULL DEFAULT '2',
  `time_zone_id` int(11) DEFAULT NULL,
  `is_s3_host` int(11) DEFAULT '0',
  `KnowledgeBase` int(11) NOT NULL DEFAULT '1',
  `MailSystem` int(11) NOT NULL DEFAULT '1',
  `Newsletter` int(11) NOT NULL DEFAULT '1',
  `Pages` int(11) NOT NULL DEFAULT '1',
  `Refund` int(11) NOT NULL DEFAULT '1',
  `Systemsetting` int(11) NOT NULL DEFAULT '1',
  `Tax` int(11) NOT NULL DEFAULT '1',
  `Ticket` int(11) NOT NULL DEFAULT '1',
  `HumanResource` int(11) NOT NULL DEFAULT '1',
  `auto_approve` int(11) DEFAULT '0',
  `auto_update` int(11) DEFAULT '0',
  `google_an` int(11) DEFAULT '1',
  `public_vendor` int(11) DEFAULT '1',
  `language_id` int(10) unsigned DEFAULT '1',
  `date_format_id` int(10) unsigned DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_general_settings VALUES("1","InfixHub","Digital Market Place","360 Ocala Street Winter Park, FL 32789","407-361-6350","support@spondonit.com","USD","$","","public/uploads/settings/logo.png","public/uploads/settings/favicon.png","","1.0","2021-04-28","1","USD","en","","","","http://localhost","Copyright &copy; 2019 All rights reserved | This template is made with <span class=\"ti-heart\"> </span> by Codethemes","1","2.2","2","51","0","1","1","1","1","1","1","1","1","1","0","0","1","1","19","1","1","1","","2021-04-28 12:42:04");



DROP TABLE infix_home_pages;

CREATE TABLE `infix_home_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `homepage_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `homepage_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature_title_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_title_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_home_pages VALUES("1","Thousands of Products are waiting!","crafty is an element gallery for web designers and web developers, anybody using Bootstrap
                                        will find this website essential in their craft.","Featured Items of the week","Lorem Ipsum is simply dummy text of the printing and typesetting industry.","Discover Our Latest Digital Goods","http://localhost/minted/public/frontend/img/banner/banner-img-1.png","Lorem Ipsum is simply dummy text of the printing and typesetting industry.","1","1","1","","");



DROP TABLE infix_image_settings;

CREATE TABLE `infix_image_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pre_loader` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_background_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_signup_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_404` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oops_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE infix_knowledge_base;

CREATE TABLE `infix_knowledge_base` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `sub_question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `answered_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_knowledge_base VALUES("1","1","In earum deleniti et asperiores laboriosam. ?","Perspiciatis eaque quae sint. Tempore est soluta quo repellat eum harum. Fugiat voluptas est ratione odio a id.","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_knowledge_base VALUES("2","2","Officia id delectus ad optio numquam magni est eum. ?","Voluptas quia ipsam aut qui voluptate. Nihil ut non enim repudiandae odio quidem. At autem quaerat praesentium exercitationem nihil.","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_knowledge_base VALUES("3","3","Eveniet tenetur ab doloremque consequatur. ?","Dolorem id quidem qui natus aliquam. Sed id in libero molestias accusantium et dolorem. Mollitia amet natus sit rerum possimus et. Velit ipsam aut quia non.","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_knowledge_base VALUES("4","4","Iste aperiam minus dolorem id qui adipisci. ?","Porro at velit ullam aut. In mollitia saepe enim excepturi. Nesciunt nihil molestias architecto possimus.","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_knowledge_base VALUES("5","5","Quaerat adipisci voluptates ea velit quaerat voluptatem. ?","Ut autem at voluptatem. In sit ut non fuga officiis maxime. Blanditiis eius ipsam et qui at. Quo quam doloremque quisquam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("6","6","Error sequi et rerum atque consequuntur rerum. ?","Voluptatem optio et doloremque fugit. Alias fuga veniam repellendus dolor voluptatum praesentium corrupti. Incidunt delectus temporibus qui sint in.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("7","7","Libero illum quisquam deserunt quae. ?","Rem dicta saepe veniam non. Unde consequatur perspiciatis quisquam reprehenderit odit tenetur porro. Et et ullam rerum natus est molestias iusto.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("8","8","Molestias totam consectetur aliquam repellat. ?","Maiores et aut molestiae non ad aliquid voluptatem. A quo quis at est. Voluptas voluptatem dicta maiores ut earum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("9","9","Totam non ullam eaque tempora ea cumque cupiditate ducimus. ?","Laudantium et quia maiores ratione nostrum. Magni ex ut quod mollitia. Rem molestiae a excepturi. Autem nisi debitis quaerat atque pariatur et blanditiis. Qui magni ut culpa nemo.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("10","10","Magni impedit cupiditate a et velit pariatur dolorum. ?","Consectetur officia dolores doloribus. Vitae suscipit neque commodi ut velit reiciendis voluptatem tempore.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("11","11","Dolores et delectus eligendi aut omnis. ?","Ut rerum voluptatem adipisci non ratione dolores dolores ducimus. Facere architecto id et. Reprehenderit hic est ut. Sit qui est corrupti dicta eos doloremque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("12","12","Temporibus non aut alias sed occaecati placeat inventore. ?","Distinctio hic unde minima laudantium. Voluptates eveniet exercitationem vel ut dolorem quibusdam fugiat. Officiis delectus quo libero iste modi illo natus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("13","13","Saepe impedit dolorum quis impedit laborum illo vero necessitatibus. ?","Quas similique ex voluptas amet cumque eum nobis est. Enim ut et ut voluptatem non asperiores impedit accusamus. Optio id et ut eum a. Omnis nostrum aliquam maxime sit corporis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("14","14","Pariatur vel eius id expedita quasi amet. ?","Expedita voluptatem quaerat aut ipsum ut nemo dignissimos. Quo reprehenderit saepe excepturi aperiam natus molestiae voluptas est. Non voluptatem cupiditate non at.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("15","15","Similique fugit laborum nobis consequatur quidem exercitationem ipsum. ?","Harum quia voluptates ipsum id aut. Ipsa possimus est quae praesentium commodi. Voluptatem minima sed soluta perferendis id. Laborum architecto blanditiis veritatis quod fugiat placeat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("16","16","Quis dolor sint et. ?","Ducimus impedit ratione voluptatem eveniet. Culpa ut deserunt nisi. Consequatur fugiat sequi voluptatem voluptas ullam sunt enim. Perferendis atque vero et minus repudiandae.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("17","17","In odio deleniti vel aperiam enim. ?","Accusamus blanditiis aut ut id temporibus enim. Maxime et soluta voluptatem distinctio et. Incidunt delectus facere voluptatibus aut quidem. Recusandae temporibus dolores ut asperiores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("18","18","Temporibus iste laborum voluptates ea sint. ?","Soluta velit non eaque et. Ex exercitationem alias dolorem aut consectetur. Dignissimos ducimus rerum facere velit qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("19","19","Perferendis qui labore dolore. ?","Omnis occaecati cum voluptatem eos. Placeat repellendus corrupti odio doloremque placeat cupiditate recusandae fugit. Dicta maiores sunt veniam ducimus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("20","20","Odio placeat doloribus id eos. ?","Impedit repellat dolor eius temporibus nihil velit praesentium. Ea quis dolor architecto laborum ut. Velit rem voluptates molestiae pariatur at.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("21","21","Facere distinctio et ut quo aperiam libero pariatur. ?","Reprehenderit enim nihil dolorem odit ratione a nemo ut. Sit accusantium cum et molestiae. Ea similique earum ea voluptatibus nisi neque sint. Omnis debitis excepturi at quaerat omnis omnis sit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("22","22","Repellat illo in ipsum veniam et ex quod. ?","Aut voluptas ut exercitationem voluptas sed ut ad. Eius et non voluptatem non quia quis. Quaerat iure consequatur rerum nesciunt. Assumenda et pariatur distinctio est dicta.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("23","23","Eaque voluptas ut rerum in laboriosam odit libero dolorem. ?","Libero voluptates consectetur fugit. In quo qui vel aliquam similique. Doloribus ut praesentium fugit blanditiis et. Maxime sunt vitae iste modi ut ducimus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("24","24","In eum voluptas qui sed et. ?","Vero et adipisci enim ad. Quia in expedita est aut dolores aut. Mollitia et non repellat. Sed temporibus ut ipsum vitae.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("25","25","Sit sint est et voluptatem. ?","Maxime facere officia inventore placeat. Vel amet et velit incidunt. Dolorum beatae qui autem in. Enim voluptatem quidem non voluptatem. Aut adipisci maxime quidem autem consequatur et aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("26","26","Aut est corrupti dolores. ?","Odit rerum aperiam reiciendis quia. Eos quis vitae nostrum perspiciatis. Assumenda sit eum sit debitis veniam veniam ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("27","27","Rerum maxime maxime facilis qui. ?","Dolores ea eius maxime. Libero nihil ab ad odit mollitia hic.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("28","28","Aperiam nemo aut fugiat harum aut. ?","Perspiciatis perferendis eum et sint ducimus ipsa. Ullam molestiae aliquid illo temporibus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("29","29","Placeat sit ullam pariatur enim. ?","Dolor error quaerat at porro eveniet laboriosam quaerat id. Et numquam officiis velit dignissimos temporibus iure tempore. Ipsa qui tenetur totam impedit. Ullam minima tempora explicabo suscipit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("30","30","Aut molestiae temporibus enim optio eligendi. ?","Officiis magni non hic fugiat. Ab dignissimos ipsam voluptas exercitationem. Et libero dolorem aut possimus. Quam dignissimos nemo enim architecto perspiciatis quos quisquam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("31","31","A ipsa ipsa magni nisi amet itaque. ?","Harum ut repellendus consequatur dolorem. Iusto labore sunt et quo totam. Numquam aliquam tempora est ducimus qui ut. Dolorem voluptatem hic harum quam consequatur autem quibusdam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("32","32","Dolores accusantium est maxime minima. ?","Labore laboriosam maxime voluptas sit. Rerum quisquam sunt rerum molestiae harum. Est quo magni et neque quis. Inventore sunt animi incidunt sed omnis temporibus non. Possimus nobis non earum et rem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("33","33","Commodi qui ex et repellat et nobis. ?","Beatae sunt dolores maxime illo. Tenetur corporis eum voluptas voluptas fugiat labore. Accusantium reiciendis atque maiores totam quia. Quia est quos est expedita.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("34","34","Cupiditate velit et maxime ut impedit temporibus reiciendis. ?","Libero asperiores nesciunt quo maiores. A quia magnam voluptas praesentium. Deserunt eaque soluta magni dolor possimus. Quae nulla officia qui dignissimos aliquam est amet.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("35","35","Occaecati et facilis nam. ?","Ea consequatur facere debitis dolor accusamus id nihil consequatur. Id animi rerum voluptas neque ex nemo nihil enim.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("36","36","Deleniti architecto nesciunt alias. ?","Nihil sit a optio repellendus sit neque assumenda. Explicabo natus nostrum magnam reprehenderit et fuga doloribus. A nulla vel velit est. Odit quasi odit vel dicta.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("37","37","Inventore voluptas beatae perspiciatis amet est. ?","Sed cupiditate iusto velit corrupti ut et sunt. Inventore dicta sint distinctio repudiandae. Praesentium nobis eius architecto ad officiis est dolorem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("38","38","Molestiae iure atque aspernatur necessitatibus cum quia. ?","Consequatur non fugiat vel commodi dicta enim reiciendis. Facilis eum cumque omnis. Et nostrum cumque iure maiores placeat aut ducimus. Dicta dolor et quos. Dolore eos ipsum voluptates commodi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("39","39","Quibusdam aliquid dolorum similique totam natus et placeat. ?","Maiores nostrum maxime dolorum. Explicabo cumque natus id quo. Nesciunt repudiandae culpa architecto minus. Et accusamus dolores dolorem. Voluptatem adipisci iure nisi at atque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("40","40","Maxime non provident dolor eum. ?","Quasi in quasi nihil eum. Sunt voluptatem eligendi at et. Consectetur odio tempora earum ex aperiam explicabo corrupti. Deserunt excepturi vero inventore omnis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("41","41","Rerum vero commodi hic omnis molestias dolores. ?","Reiciendis rerum et quia officia nisi. Voluptatibus in in at nulla voluptas odio. Voluptatem ad voluptatum provident sunt dolorem voluptas ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("42","42","Facere et illum fugiat veniam. ?","Non saepe doloremque est nisi voluptatem illum. Dolorum laudantium quibusdam illum et sequi voluptatibus. Alias iste eveniet autem aut labore id quae facilis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("43","43","Autem rerum tempore dolores rerum nisi facilis excepturi. ?","Omnis adipisci veritatis a eum. Exercitationem et inventore quia nulla laborum officiis dolor debitis. Soluta accusantium distinctio magnam tempore enim. Amet in doloremque unde cum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("44","44","Omnis velit suscipit quisquam ullam voluptate sit magnam eveniet. ?","Excepturi totam omnis nam ut dolorem adipisci iure. Dolorem sed quia consequuntur et eum aut. Est ut labore ut magnam officiis ea.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("45","45","Deleniti error consequuntur harum. ?","Id vel impedit necessitatibus odio consectetur nihil. Dolor iusto neque voluptas provident unde. Dolores quis dolorem labore nobis iusto ex distinctio. Alias dicta doloremque rem et eum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("46","46","Aliquam molestiae consequatur et unde. ?","Enim velit dicta omnis eius sed voluptatem rerum repellat. Porro sunt quia aliquid voluptatem ad quaerat soluta.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("47","47","Laboriosam quos quia dolorem. ?","Qui porro nam qui in harum ut. Ut eveniet laudantium alias accusamus. Delectus non voluptates asperiores neque. Et corrupti neque odit nihil.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("48","48","Animi ab ut aut id rerum. ?","Quod odio reprehenderit officiis eos quaerat. Est quia temporibus debitis enim tempore hic quas. Distinctio est molestias sit facere. Dolor vel quis eum facilis voluptatem aspernatur qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("49","49","Quisquam delectus dignissimos provident commodi quam officiis. ?","Officia quaerat fuga officia possimus. Officia laudantium harum quidem mollitia quidem illum. Exercitationem porro facere doloribus eaque reiciendis. Accusamus sed mollitia est reprehenderit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("50","50","Expedita dolorem nobis fuga sit. ?","Dolore modi sed dolorem. A aut et debitis quae qui nostrum. Officia quis quis quisquam sequi. In perferendis voluptatem sequi error quo tempore enim.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("51","1","Expedita iure ut numquam dolor aut beatae. ?","Qui vero molestiae nisi voluptatem aut. Qui aut dolorum provident corrupti ut voluptas nesciunt. Iusto aliquid laboriosam omnis provident itaque aut. Aperiam ut exercitationem iste.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("52","2","Quaerat quibusdam et autem quos adipisci ut voluptatem aliquid. ?","Libero illum quia maxime corporis modi corporis. Ipsa iure reiciendis illo odit. Et cum ut dolores placeat sed ea excepturi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("53","3","Facere tempore quia eos quidem eligendi aut ad. ?","At rerum dolor repellendus possimus. Ut et est omnis. Iusto quia praesentium consectetur totam quia. Ea libero harum sunt modi. Quia libero corporis vero rem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("54","4","Nam consequatur est aut odit similique quasi consequuntur. ?","Officiis iusto rerum et adipisci. Inventore ex eaque itaque suscipit quasi et qui. Ab fuga atque dolor est tempore qui ullam quis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("55","5","Voluptas et et doloribus voluptatem atque voluptatem. ?","Aut dolores temporibus incidunt perspiciatis. Et est ipsa dignissimos aperiam enim minima. Quas praesentium nisi quis incidunt velit est placeat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("56","6","Totam beatae blanditiis quisquam rerum quaerat quo. ?","Consequatur sed sequi magnam mollitia. Hic in atque voluptas. Quia occaecati porro dolor. Exercitationem quos similique ratione sed quos. Aut expedita autem eligendi est dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("57","7","Rerum eaque et aperiam vel repellat quia. ?","Dolor deleniti aut pariatur fugit. Error et rerum rerum voluptas et ex eius minima.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("58","8","Quis quis aut quos pariatur quod. ?","Neque rerum commodi rerum ab corrupti dolorum adipisci. Qui non id impedit maxime et molestias. Quis quod impedit error rerum maxime et vitae.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("59","9","Illum reprehenderit beatae labore esse dolores voluptatum accusantium. ?","Vitae qui dolore dolorum explicabo maiores odit voluptas. Magni non beatae non et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("60","10","Doloribus eos unde ut culpa voluptatum ea voluptatem. ?","Sint nostrum perspiciatis repellendus vel architecto voluptas. Quasi consequatur dolorem magnam. Molestias culpa facere omnis aperiam aliquam saepe temporibus. Nihil porro et omnis consequatur ea.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("61","11","Ducimus facilis ea a et voluptatibus perspiciatis. ?","Sapiente eius nemo quibusdam quasi est. Optio omnis dolores sint modi magni. Neque quo ut inventore iure qui beatae sequi. Facilis quo iure velit a velit non.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("62","12","Inventore qui error distinctio nulla. ?","Commodi voluptatem quidem tempore consectetur doloribus dolorem omnis. Et quia quia architecto ipsa autem. Ab aperiam est atque est qui maiores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("63","13","Quibusdam ipsam dolorem error esse incidunt debitis doloribus. ?","Qui dolore iusto vel eveniet. Error tempora eum ratione possimus sint quaerat. Voluptatem quae voluptas itaque similique. Et recusandae nostrum reprehenderit consequatur ex ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("64","14","Sunt voluptatum et officia fugiat officia commodi. ?","Dolorem et sit non delectus voluptatum maxime vel. Perspiciatis vitae quaerat quaerat molestiae quod ea deleniti. Aliquid quaerat natus dolore praesentium. Aperiam voluptate possimus nulla nihil.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("65","15","Necessitatibus iusto sed doloremque aperiam et nostrum. ?","Itaque placeat dolorem quidem suscipit sunt et aut vero. Alias rerum vel itaque. Saepe ratione asperiores molestias non architecto. Expedita non facere veniam consequatur quos consequatur eius aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("66","16","Hic consectetur quibusdam perspiciatis earum. ?","Aspernatur neque pariatur aperiam sint perferendis tenetur inventore. Ex enim provident ut ipsum. Eligendi nulla qui fugiat et. Voluptas quia ipsa nobis impedit sed.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("67","17","Corporis et enim corporis ex occaecati voluptatem id. ?","Et praesentium nostrum distinctio sed esse voluptate. At ut architecto in et. Ut sunt accusantium eum et qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("68","18","Soluta voluptatem eos nemo sit. ?","Dolorem commodi dolor ratione possimus et cum. A vel tempora facere omnis qui id. Exercitationem aperiam sapiente sed ad dolorem. Ad qui recusandae officia voluptatum perspiciatis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("69","19","Voluptatem non eligendi alias veritatis praesentium eum esse. ?","Amet id repudiandae dolorem vel architecto tempore. Ab vitae ea et aliquam vel nemo eos. Ea ut nihil sint dignissimos commodi numquam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("70","20","Molestiae deleniti occaecati aut consequuntur eos. ?","Delectus earum perspiciatis sapiente suscipit dolores. Sint excepturi eum debitis enim. Aperiam doloribus sunt alias quis sint nostrum occaecati sit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("71","21","Aut quibusdam corrupti eum quisquam alias sequi. ?","At eum iusto nobis quasi error magni. Dolor et quae ab eos occaecati. Non quasi aliquam ullam eum nihil ut tenetur. Quasi vel ad placeat porro minus vel.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("72","22","Porro possimus assumenda modi corrupti. ?","Harum hic adipisci blanditiis sed. Suscipit molestias aut vero voluptatem perspiciatis odit ab. Excepturi est enim aut eius consequatur soluta.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("73","23","Inventore omnis qui et odio provident expedita. ?","At facere repudiandae sed officiis aspernatur magnam et. Eum et illo excepturi et dolore voluptatibus officiis. Ex eos quidem sint repellat et animi sunt provident.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("74","24","Natus voluptatem ut nobis rem voluptatem. ?","Voluptate quas aut ea commodi. Quia aut animi quis sed pariatur praesentium. Modi et illum consequuntur assumenda facere.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("75","25","Repudiandae eum aut nobis ullam repudiandae voluptas. ?","Facilis excepturi voluptatibus autem. Ut voluptatem labore fugit et ad. Aut impedit aut non nisi et. Dolor ut odit neque sunt at totam dolorum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("76","26","Vero ut debitis temporibus omnis et reiciendis. ?","Fugiat occaecati perferendis nesciunt repudiandae vel. Enim quisquam necessitatibus qui atque maxime. Iure veniam nam sed sunt adipisci nostrum quis. Velit enim sint voluptas tenetur reiciendis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("77","27","Quae ipsa aut sapiente vero. ?","Soluta pariatur maiores aut ad distinctio sequi eum. Nemo repudiandae beatae qui nemo non qui dolorem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("78","28","Sequi ea voluptatem reprehenderit reiciendis voluptas. ?","Facere est sint maxime id. Blanditiis distinctio nulla voluptas. Temporibus voluptates nisi beatae saepe eligendi delectus a et. Et et quia ratione enim qui possimus et rerum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("79","29","Sit non non praesentium dolores culpa rerum neque optio. ?","Eligendi sed dolore pariatur dignissimos enim dolores omnis. Omnis non in eos. Debitis maxime placeat nostrum dignissimos laudantium.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("80","30","Nesciunt quo dicta facilis omnis. ?","Deserunt et tempora inventore quam et beatae sit qui. Quasi iste fugit maxime ad. Expedita quibusdam et reprehenderit et quo quis vitae. Placeat et dolores rerum omnis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("81","31","Vel rerum rerum nam rerum pariatur tempora. ?","Accusantium laudantium odit eos voluptatum. Ipsum iste facere maiores aperiam inventore.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("82","32","Expedita cum voluptates rerum sit sapiente. ?","Quo ad eum cupiditate. Repellendus dolor quod molestiae quo iure omnis. Illo autem nostrum quasi. Quidem voluptas laboriosam sequi voluptas.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("83","33","Non magnam dicta fugit perspiciatis. ?","Iure ut dolorum odit voluptates sunt. Mollitia aut omnis in enim. Et quibusdam consequatur eum enim. Et accusantium facilis sunt odio. Enim enim itaque aut ut aut ut praesentium.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("84","34","Quasi tempore tenetur repellat. ?","Labore quisquam enim nobis sint modi. Voluptatem quia et accusantium. Iusto dignissimos facere sint fugit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("85","35","Ex similique porro ut iusto odit id placeat. ?","Tempora similique veritatis numquam. Id numquam et rerum neque. Ut voluptatem est quae ipsum soluta magni.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("86","36","Recusandae est eaque rerum minima consectetur unde. ?","Enim incidunt sapiente commodi voluptatem numquam beatae. Repudiandae totam quas recusandae qui. Quasi enim quia quaerat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("87","37","Quidem ipsa doloribus esse labore animi. ?","Quos quis perferendis nulla tempore ut porro repellat. Deserunt ut voluptas aut et possimus nam. Illum ratione sit aut sed. Distinctio tenetur aspernatur laboriosam quae hic commodi fugit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("88","38","Neque ut incidunt amet dolores molestias. ?","Reprehenderit eaque asperiores quia nulla voluptatem dolor harum ut. In et autem ea et saepe.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("89","39","Vitae quisquam est numquam aut eligendi. ?","Voluptatem nisi qui et rerum quis quasi corrupti dolorem. Dolores rerum qui sit delectus sequi ut ad optio. Sit eos optio facere nesciunt quisquam doloribus quia. Quia eum dolor nostrum sit maiores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("90","40","Ipsam ex enim temporibus omnis error. ?","Et ea aspernatur quis dignissimos perspiciatis. Eligendi iusto dicta quia temporibus omnis et saepe nihil. Est fugit ea tenetur velit voluptas et. Qui sit illum voluptates ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("91","41","Doloribus fugit doloribus est molestias consequatur est magni. ?","Tempore voluptates hic similique. Possimus laboriosam esse quis quas. Alias sit commodi explicabo porro numquam eligendi quia.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("92","42","Culpa ut accusamus nesciunt unde veniam ab molestiae. ?","Sint accusantium cupiditate architecto eum excepturi incidunt quia. Et quidem est minima. Error autem ullam tempore maxime cum illum earum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("93","43","Corrupti qui molestias ut doloribus. ?","Sed distinctio suscipit odio dolor odio. Dolore nihil et laudantium. Ut velit et ullam. Cupiditate molestias harum saepe saepe dolores fugit provident.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("94","44","Nemo non in enim. ?","Sunt omnis laudantium perferendis aut est est. Soluta doloremque aliquam ducimus quisquam sint ea commodi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("95","45","Provident dolorum rerum et consequatur distinctio adipisci quisquam. ?","Dolores ipsam et est ratione facilis labore non. Hic qui et eos ut. Quas dolores praesentium est sit autem aut non qui. Quis atque qui voluptate labore ut laboriosam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("96","46","Quibusdam aperiam quia dolores. ?","Debitis ipsa illo rerum eius libero ratione. Est voluptate omnis corrupti laboriosam pariatur corrupti quidem sit. Fuga aspernatur et sint.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("97","47","In voluptatem sunt provident quos tempora ut commodi. ?","Vitae et occaecati ut itaque dignissimos. Ut debitis reprehenderit fugiat esse aliquid nisi. Voluptatem et esse facere quae voluptas.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("98","48","Harum maxime ut doloribus sunt. ?","Ut dolorem dicta quaerat assumenda perferendis autem. Odit distinctio unde minima numquam molestiae. Ut consectetur est consectetur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("99","49","Eum laudantium commodi explicabo quod. ?","Assumenda veniam non officiis aut. Nobis veritatis ea repellat. Rerum consequatur recusandae nulla consequatur exercitationem aut est tempore.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("100","50","A voluptatem nisi aut perferendis. ?","Atque quidem nulla est a nesciunt repellendus. Aut inventore ut molestiae debitis omnis dolor.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("101","1","Voluptatem magnam molestiae rerum voluptatem. ?","Animi mollitia est quidem blanditiis. Totam enim ipsam qui in voluptatem sint laudantium placeat. At eveniet voluptatum non dolorem aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("102","2","Voluptates laudantium repellendus beatae est. ?","Et minus quo nostrum consequatur possimus. Recusandae hic dolore alias accusantium. Numquam nobis minima explicabo est voluptatem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("103","3","Sit doloribus laborum sint qui sit libero aut. ?","Perferendis vel enim quia inventore porro facere earum. Voluptatem pariatur asperiores odit odit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("104","4","Nobis rem dolore esse et voluptas non dolore. ?","Laboriosam ut praesentium molestiae sunt. Quo occaecati et maiores cum voluptate nisi. Voluptatem voluptatum et illum sed. Modi eos ex doloremque dolore commodi. Aut et aut ab dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("105","5","Deleniti non et et ratione reiciendis. ?","Et quis quaerat debitis labore ex. Id non modi non id consequuntur aut. Culpa iusto voluptatem qui perspiciatis cumque consectetur. Dolore fugiat voluptatem esse quia aut officiis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("106","6","Sit porro in eligendi hic ab. ?","Minus quis rerum voluptas ipsam enim ab est quis. Quisquam in nihil quod vel voluptas nobis. Rerum et corrupti maiores ea. Veritatis repellat facere aut harum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("107","7","Excepturi autem eum hic sit. ?","Veniam ipsum at repudiandae et ea nam. Voluptates omnis quisquam voluptatem consequuntur ullam rem. Enim soluta nisi facere quia atque. Cupiditate voluptatem voluptas blanditiis et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("108","8","Accusamus et eligendi rerum voluptas voluptatem. ?","Corporis sed facilis rem aut aut qui et. Aut neque esse officia unde voluptas in vel. Quibusdam dolor ut delectus magnam laudantium qui veniam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("109","9","Aliquid pariatur occaecati ex. ?","Ea placeat vitae aut. Facilis amet asperiores repellendus dolorem dicta optio dolore. Id est ullam nemo vel.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("110","10","Quaerat maxime modi voluptates quae molestiae nesciunt eveniet. ?","Rerum enim labore eos nihil. Eaque voluptatibus alias exercitationem veritatis. Quo ut molestiae saepe eos recusandae. Sed qui sunt eum similique excepturi ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("111","11","Reiciendis suscipit doloremque officia consequuntur qui fugiat eaque. ?","Sapiente illum quam consectetur incidunt adipisci itaque sapiente sit. Ad ad quia sit quisquam vero. Dolore quo adipisci qui id.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("112","12","Similique dolorem deleniti cum culpa deleniti porro quia quis. ?","Nemo qui vero expedita nam totam recusandae. Ut officiis quisquam est sunt omnis iusto ut. Fuga velit est illum corrupti.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("113","13","Quisquam facere aut in reprehenderit. ?","Ut eligendi consectetur est iusto odit ad. Quas eveniet animi exercitationem voluptatum voluptates. Et amet mollitia reiciendis aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("114","14","Ipsum eum dolores impedit illo dolorem. ?","Veniam facere eveniet saepe omnis dolorem facere libero ipsam. Qui veniam et consequatur quod.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("115","15","Dolor suscipit doloremque optio iure atque maiores et. ?","Pariatur sit earum et et earum inventore illum dolor. In voluptas delectus mollitia et aut et accusamus. Eum eaque debitis sint dolorem libero facere corrupti.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("116","16","Rerum voluptas eum reiciendis doloremque magni ut. ?","Eligendi distinctio saepe est repudiandae. Labore harum voluptate mollitia praesentium sed sunt eveniet. Ad error velit ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("117","17","Eos autem reprehenderit unde mollitia natus minus nam. ?","Dolore architecto provident est nobis similique. Temporibus dolor sit reiciendis eum. Distinctio est repudiandae quam. Ab doloremque aut quia nobis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("118","18","Asperiores necessitatibus reiciendis at perferendis accusantium similique aut. ?","Ullam quia molestiae autem velit ratione. Incidunt illo sed sunt consequatur accusantium. Asperiores iure dolores necessitatibus. Consectetur harum architecto nulla nam commodi ducimus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("119","19","Doloribus reiciendis laborum natus et non voluptatem. ?","Perferendis ad pariatur officia ut at maxime. Et saepe impedit et possimus. Sequi illum voluptates dolorem labore nobis soluta ipsa nulla. Ex repellat rerum rerum autem velit ab veritatis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("120","20","Sit a id ratione ad dolores id et. ?","Eum tenetur voluptatum pariatur ratione. Excepturi cum aut sint soluta error. Assumenda voluptatem quae nemo cupiditate nulla.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("121","21","Nobis corporis aut maiores repellendus. ?","Unde tempore unde aut deleniti cum sed ut. Soluta ducimus et id. Quae architecto voluptatum possimus harum consequatur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("122","22","Cum debitis at rerum nihil temporibus. ?","Velit omnis quo sit saepe velit adipisci. Omnis maxime dicta provident necessitatibus asperiores sit dolorem. Saepe voluptatem molestias provident ab impedit et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("123","23","Incidunt enim quia id ea doloribus. ?","Quia fuga quia ullam porro ullam soluta. Sed saepe iusto tempore modi consequatur unde laborum. Aspernatur et quis sint doloremque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("124","24","Sunt recusandae nostrum quo et. ?","Deleniti quam facere officiis beatae. Sed vero perspiciatis expedita magni facilis. Eos voluptate nihil voluptate nobis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("125","25","Ut omnis praesentium molestiae itaque non dolore. ?","Quisquam tenetur harum perferendis saepe ex. Doloremque soluta rerum rerum nihil. Accusantium vel amet quos blanditiis eos aspernatur. Quia nemo reiciendis cumque ea dolorum in rerum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("126","26","Cupiditate exercitationem adipisci voluptas aliquam et libero dolor iure. ?","Excepturi at quo quibusdam est est blanditiis. A qui minima deleniti omnis. Optio quos quia eum earum amet. Hic quod repudiandae eius voluptate hic voluptatem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("127","27","Consequatur ad et quis reprehenderit similique autem. ?","Aut aliquam quis molestiae. Saepe facere et quia ut pariatur nam id in. Voluptatem omnis aut deleniti et quisquam qui voluptatem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("128","28","Aut qui quia sit sint quidem hic. ?","Id delectus et quasi eum odio et qui. Est sit natus soluta voluptate dignissimos. Ut occaecati dolore est odit quis qui quo.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("129","29","Et sint repudiandae nemo porro provident ut repudiandae aut. ?","Eum eveniet sed mollitia repellat. Placeat atque aut et maxime. Enim voluptas sunt error non. Beatae dolores aliquid qui necessitatibus aut ipsam consequuntur. Dolores doloremque qui quia.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("130","30","Sunt laborum officiis eaque et. ?","Architecto ea ab ut illo sunt. Architecto dolores doloremque non voluptates. Nobis molestiae dicta cupiditate quibusdam corporis hic totam. Vel voluptatem harum quia hic tempora quis in.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("131","31","Est sed autem similique perspiciatis quod. ?","Nihil harum eveniet rerum doloremque natus. Ut velit eos accusamus. Est et perspiciatis est. Fugiat nemo consequatur dolorem explicabo nulla. Ipsum vero accusamus exercitationem sit animi blanditiis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("132","32","Est sequi et id excepturi. ?","Optio tempore nam veniam provident asperiores. Voluptate exercitationem dicta sint sint. Ullam laboriosam eum tenetur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("133","33","Dolorum odio corporis unde repellat ea. ?","Eum culpa aut deserunt quisquam. Sunt autem hic possimus quaerat. Porro dolor asperiores eum facere. Reiciendis distinctio delectus dolores est.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("134","34","Aut doloribus deleniti ea. ?","Aut id dignissimos doloremque quasi eos et a consequuntur. Vel quia et id dolorem suscipit alias fuga. Voluptate quos deserunt quis eveniet. Expedita recusandae et iusto.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("135","35","Optio minus ea ex sed. ?","Repellendus dignissimos et consectetur beatae sunt iure repudiandae. Illum rerum odit est doloribus et praesentium. Repellat voluptate provident nemo sed et. Fuga tempora hic autem ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("136","36","Quia accusamus ut ipsum voluptatum. ?","Consequatur molestiae sint omnis voluptas. Accusantium doloribus fugiat quia distinctio. Quia omnis quia aut aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("137","37","Earum et eius id voluptate odio sit. ?","Necessitatibus quas veniam velit quas. Magni excepturi molestiae perferendis et laborum nisi blanditiis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("138","38","Expedita molestias nesciunt natus nihil dolores unde cum. ?","Repudiandae et recusandae ipsa molestiae placeat. Veritatis atque est deserunt ipsa ea neque. Quod impedit dolorem minima qui mollitia.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("139","39","Consequuntur doloremque quis optio ducimus non alias. ?","Laboriosam explicabo dolor tempora at quia quo est. Dolorem et numquam in dignissimos illo. Perferendis ipsum quia dolorem repellat modi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("140","40","Incidunt id et voluptas occaecati reiciendis impedit. ?","Earum pariatur provident ut quod libero debitis dolorum. Unde modi aperiam vero qui eos aperiam qui voluptas. Voluptatem perferendis distinctio aut. Commodi dolores odio dolorem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("141","41","Est eos rerum dolor. ?","Dolor et recusandae consequatur est non velit. Vero animi doloribus eius labore quasi et. In esse aspernatur sed nulla saepe doloribus. Ipsam nesciunt libero nemo rerum excepturi dolore odit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("142","42","Reprehenderit eligendi voluptas facere fugit quasi sequi consequatur. ?","Veniam eum alias aut sint repellat aut. Sequi illum et veritatis. Voluptates aut similique molestiae. Porro est et molestiae doloribus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("143","43","Esse consequatur aut quas sapiente. ?","Et a et enim reprehenderit. Soluta incidunt ex aut quisquam sint deleniti et. In rerum quos dolorem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("144","44","Facere eligendi illum velit eos voluptate aspernatur. ?","Ea suscipit et ipsum est. Et debitis non est necessitatibus. Quis totam mollitia quidem sit dolores eius.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("145","45","Magnam vel autem molestias quisquam sed assumenda vero numquam. ?","Ex iste libero atque quia et dolor. Corporis cumque in quia iste vel laudantium rerum. Sunt minima facere in quaerat sint.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("146","46","Facilis nostrum qui quia ullam. ?","Necessitatibus nihil quae nostrum ad consectetur velit consequuntur et. Illo optio et non voluptatibus ab. Sit et asperiores tenetur doloribus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("147","47","Odit et inventore inventore blanditiis fugit. ?","Labore tempora ipsum eum ratione. Rerum sed qui sequi nisi. Commodi natus et voluptatibus rerum id. Doloremque expedita aliquid aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("148","48","Qui mollitia occaecati veritatis. ?","Aperiam sit quidem suscipit maxime in quia ipsa. Laborum eveniet cupiditate eligendi ut quia dignissimos voluptatem amet. Non modi dolor cum voluptatem rerum non.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("149","49","Deserunt est ut ex. ?","Ducimus porro voluptatem illum maiores atque. Molestias maxime voluptatem minima placeat omnis. Nostrum numquam id et temporibus aut similique veritatis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("150","50","Eum quis suscipit tempore incidunt fugiat veniam magnam. ?","Vel doloribus blanditiis optio. Dolor ex voluptatibus consequatur eligendi vel. Iusto itaque molestiae vitae commodi deserunt nemo. Nihil magni est a nesciunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("151","1","Saepe aperiam tempore possimus tempora alias facilis reiciendis omnis. ?","Veritatis corporis quia incidunt. Dolorem nam ducimus voluptatum ut. Ducimus in dolorum accusamus natus reprehenderit quis. Nulla sequi voluptatem animi rerum corrupti.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("152","2","Voluptatem mollitia debitis qui dicta aut. ?","Distinctio reprehenderit unde quae voluptatem qui. Ratione voluptas expedita quaerat ea et rerum hic. Dolores molestiae tenetur tempore reiciendis et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("153","3","Deserunt ducimus est dolorum nobis tempore. ?","Reiciendis aliquam delectus expedita quaerat ex magnam et et. Exercitationem dolorem ut libero. Omnis nesciunt numquam officia ab voluptates aliquam repellat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("154","4","Dolorem repudiandae aperiam enim esse. ?","Optio placeat tempora tempora provident porro iste cumque. Corporis qui ea hic. Consequuntur qui fuga fuga consequatur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("155","5","Vel et aperiam eos quisquam nostrum. ?","Voluptas deserunt deleniti minima ducimus perferendis enim. Mollitia totam ex vel delectus maxime ea et. Id inventore velit rerum enim. Amet et vitae est sequi nihil cumque at facilis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("156","6","Earum sit ut cupiditate necessitatibus alias. ?","Hic illo ut voluptatem aliquam nostrum hic. Non placeat et eligendi et sint cupiditate. Non sapiente nostrum natus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("157","7","Delectus fugiat cumque earum ut beatae. ?","Molestiae molestiae necessitatibus sunt in delectus et aut. Ipsum voluptatem saepe consectetur sit. Aut exercitationem corrupti aut quo voluptatum. Nobis ea placeat corrupti unde.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("158","8","Pariatur aut magnam sit praesentium. ?","Est velit commodi expedita voluptatem non dolor. Et voluptatem incidunt corrupti iste. In cum dolorum dolorem earum ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("159","9","Nulla quibusdam illum sit eius ipsam molestiae. ?","Aspernatur cupiditate aut enim tenetur rerum voluptas. Vero doloremque nam autem maiores veniam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("160","10","Consequatur iure nihil sed deserunt. ?","Necessitatibus praesentium est ut sit et est. Qui quo quos eos minima qui iusto optio.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("161","11","Tempora est in accusamus aut debitis. ?","Commodi alias voluptates veritatis. In vel consequatur impedit ipsam est numquam nam deleniti. Laboriosam laborum architecto quisquam vel non. Inventore distinctio cum labore nesciunt sunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("162","12","Quis praesentium blanditiis exercitationem aut. ?","Sunt ut quia voluptatem doloribus. Ab voluptatibus alias quas expedita. Voluptatem id repudiandae est quae.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("163","13","Animi doloribus commodi ea voluptate. ?","Maxime qui similique ratione quisquam autem nam quidem. Enim eum at sunt ut ipsa minus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("164","14","Odio sed dolores magni quae culpa maxime. ?","Modi non maxime est aut voluptas necessitatibus similique. Dolor cumque tempora corrupti tempore. Tenetur non praesentium sed non ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("165","15","Consequatur enim mollitia eum quos non minus dolores officiis. ?","Quibusdam sit ut aut id voluptatem quia. Et enim animi aut. Fugiat ducimus repudiandae voluptatem quod non.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("166","16","Dolor aut quasi in commodi commodi. ?","Dolorum nihil voluptas aut omnis et et quas. Blanditiis aut eligendi nisi natus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("167","17","In fugiat mollitia perferendis eos dolor culpa vel. ?","In libero voluptas voluptatem tempore sit cum ut expedita. Nulla quaerat facere enim cumque autem. Commodi provident cumque sed ad. Maiores est nobis voluptatibus velit maxime repellat suscipit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("168","18","Et provident quis veritatis ut rerum ut. ?","Ullam quam ut minus nihil quo. Ut quos sit dolores provident. Et consequatur perspiciatis consequuntur voluptas amet blanditiis. Enim dolore illum nobis ratione quo.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("169","19","Aut sapiente totam et perspiciatis sit at. ?","Rerum perspiciatis possimus quia dolorum minima. Numquam sit sit ipsa autem officia.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("170","20","Sint commodi eum quisquam impedit impedit inventore. ?","Vel rerum consectetur quam quidem qui unde exercitationem voluptas. Totam est dolorem facilis qui maiores. Rem ea est quod cum recusandae nam aut. Fugiat harum non quod cumque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("171","21","Eligendi magnam veniam distinctio est repellendus aspernatur. ?","Quia laboriosam voluptatem ea quam nobis enim magnam nulla. Rerum aut consequatur voluptate dolorum ratione magnam repellat. Modi nobis quis enim recusandae quis. Hic et dolorem harum ea dignissimos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("172","22","A nihil enim quia aut. ?","Reprehenderit nisi in qui. Ex voluptas nostrum incidunt velit aspernatur saepe quia. Et et deserunt provident repellat veniam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("173","23","Dolor ab debitis quia rerum aspernatur officiis aspernatur. ?","Incidunt itaque eum quis eius. Et necessitatibus et beatae rerum magnam odit. Voluptas delectus et voluptatum est repellat. Minus alias et architecto officiis aperiam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("174","24","Dolor dolor tenetur possimus sit id. ?","Ipsam architecto quod earum excepturi. Dolor rerum praesentium atque. Optio in maxime quia adipisci libero. Quo et exercitationem sapiente deserunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("175","25","Ratione inventore nisi alias omnis magnam. ?","Molestiae nihil et aut et. Esse est et veniam. Est quam nihil nihil non autem in. Eius placeat possimus iure autem sunt officiis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("176","26","Doloremque cumque eaque quibusdam quam. ?","Possimus ipsam sunt magnam rerum. Accusamus sequi voluptate reprehenderit ut illo. Sit explicabo autem sunt quam modi. Aut magni similique ea.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("177","27","Voluptate ab et illum error ducimus omnis. ?","Iste est et sed perspiciatis distinctio praesentium impedit. Id voluptatem qui quia veritatis eum facere labore. Harum placeat inventore laudantium sequi. Ducimus quos labore laborum eligendi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("178","28","Facere modi sequi commodi animi quisquam enim non. ?","Dolorem rerum culpa commodi est perspiciatis. Voluptate dolore eum autem quia unde pariatur. Reprehenderit velit debitis veniam saepe.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("179","29","Velit provident sed minus accusamus dicta eum velit. ?","Quibusdam voluptas et illo corrupti in. Et accusantium modi velit beatae voluptates in. Aliquid accusamus harum sed dolor. Odio accusamus commodi repellat quo ullam omnis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("180","30","Ratione aut reprehenderit aut debitis assumenda ratione nemo. ?","Rerum molestias cumque perspiciatis facilis temporibus quod vel. Nam iusto suscipit temporibus temporibus. Veniam quasi alias consequatur accusamus modi soluta doloribus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("181","31","Non eveniet nihil autem vel debitis. ?","Aspernatur eos ea aut doloribus eius. Mollitia dolores vel est aspernatur aut. Et facilis vel dicta sed quasi totam. Voluptatibus temporibus laboriosam qui. Repellendus laborum et enim voluptatem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("182","32","Laboriosam officia aspernatur perspiciatis vitae enim perferendis. ?","Deserunt officia odit assumenda inventore omnis. Ea fugiat et harum debitis. Explicabo est recusandae ut voluptatem labore. Laboriosam ut qui quasi excepturi sed voluptatum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("183","33","Voluptate quibusdam dignissimos non ut iste doloribus. ?","Sapiente atque quibusdam rerum assumenda vel possimus. Quis iste aliquam perspiciatis totam repellendus dolore minus. Numquam sint vero non ut eum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("184","34","Commodi itaque sunt nesciunt numquam. ?","Accusantium laborum error eius. Sed iusto asperiores asperiores earum sint. Dolore non ea omnis itaque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("185","35","Consequatur veritatis assumenda recusandae soluta. ?","Dolorem rerum odit eos reiciendis. Excepturi et consectetur dolorem eius sapiente. Consequatur est eaque optio est quisquam atque nostrum. Rerum dolores vel possimus consequatur et nobis rerum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("186","36","Dolores omnis quo aut est vero. ?","In eos earum reprehenderit sed eos similique ipsum eaque. Quaerat voluptatem recusandae magnam provident quas numquam aut. Magnam molestiae dolorum dolores sint aliquam. Ab pariatur sunt aut nostrum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("187","37","Est aut consequatur consequuntur error nam voluptatibus. ?","Accusantium placeat consequatur est autem. Aperiam minima minima non. In quo nesciunt ut architecto aliquam rerum natus mollitia.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("188","38","Voluptates accusamus modi sunt vitae. ?","Aspernatur veritatis eveniet quo dignissimos. Quia labore voluptatem aperiam rerum eligendi quia. Porro possimus explicabo atque ut quo quod. Eum aut vel enim aperiam dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("189","39","Asperiores laborum fuga voluptatibus libero id vitae ad. ?","Quae est sint error omnis aut. Voluptates vel qui incidunt tempora reiciendis. Voluptatem voluptas architecto nihil sunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("190","40","Laborum ut quia animi nisi dolorum facilis nemo. ?","Vel non in voluptatibus iure. Assumenda aut ea necessitatibus commodi sapiente. Odio alias aut enim magni. Iste quae alias sit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("191","41","Tempore placeat maiores amet. ?","Quasi aut ut beatae tempora. Et tenetur architecto voluptates maiores rem. Consequatur doloribus amet esse molestias est recusandae aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("192","42","Ut omnis magnam sit quo. ?","Aperiam a quo qui. Ipsa ducimus in debitis eos ut sequi. Labore quisquam quo unde quam inventore tempora dolores. Sed eius voluptate et temporibus saepe.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("193","43","Ut nulla et dolorem quasi et voluptatem aut. ?","Sint assumenda accusantium veniam dignissimos dolor. Cumque aliquid molestiae sed eum dolores. Ut ut delectus illo animi consequuntur autem magnam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("194","44","Ipsam rerum ipsa nam ut. ?","Officiis animi ad ut vel culpa placeat et veritatis. Ratione sed nemo enim consectetur explicabo voluptas. Eum et suscipit ut tenetur. Minus accusamus omnis voluptatum harum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("195","45","Qui nisi soluta laboriosam voluptatem sed quibusdam. ?","Ipsa molestiae quis eos hic sed. Voluptate et enim rerum id autem est. Dolorum voluptatem excepturi voluptates culpa hic facilis ea. Delectus eaque ducimus eligendi unde aut laborum tenetur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("196","46","Sequi eius velit odio hic. ?","Quis est iste voluptatem dolores. Nemo nostrum facilis eos quia. Excepturi modi veniam minima laudantium. Beatae similique dolore repellat non.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("197","47","Molestias ex eius qui sed. ?","Totam quisquam et dolore. Quia perferendis et soluta et molestias. Ut est omnis minima sequi molestiae ea facilis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("198","48","Reiciendis atque praesentium ipsam aperiam. ?","Minima libero et impedit voluptas. Eos nemo totam minima modi at excepturi quis. Nemo sequi illo sunt neque quam est quod facilis. Sint quis quia quisquam sed dolore laborum quisquam sed.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("199","49","Fugit dolores sed sunt velit quas. ?","Est quasi voluptatibus est eum enim. Veniam molestiae et quia odit reprehenderit qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("200","50","Suscipit blanditiis vel itaque sapiente repudiandae. ?","Tempore cupiditate sed ut ullam nam quae fugit. Necessitatibus excepturi sed magnam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("201","1","Quia quaerat veritatis ipsum sequi rerum sed reiciendis. ?","Ducimus qui vero sunt porro qui itaque. Est id aliquid nihil et. Architecto exercitationem dolore deserunt et suscipit veritatis quisquam. Expedita architecto est deleniti maxime iste ut sint.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("202","2","Rerum suscipit non illo cum voluptatem modi. ?","Officia dolore eaque vel accusamus aliquid consequuntur. Et est laborum hic in provident repellendus. Ut adipisci et rem eos. Nihil blanditiis aut at asperiores id vel eligendi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("203","3","Sapiente enim quisquam et magni nihil voluptatem similique. ?","Provident ut ducimus et doloribus amet in. Ut in sit provident ratione commodi. Quibusdam quisquam dolores expedita adipisci voluptatibus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("204","4","Aperiam qui ut accusantium tempora et pariatur. ?","Quia quia at iusto exercitationem ad eveniet. Quod rem aut velit veniam quo ut quod qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("205","5","Ut aperiam et mollitia maiores. ?","Quia dolorem voluptatem rerum alias iste expedita. Omnis delectus beatae minus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("206","6","Ipsa impedit odit minus porro sunt consequatur at. ?","Consectetur dolor quia illum debitis accusantium suscipit recusandae et. Maiores optio nisi sed non. Ducimus accusamus quod eligendi ad voluptas.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("207","7","Libero et quidem enim ut. ?","Qui fugit asperiores aut velit incidunt ea earum. Earum laudantium ad dignissimos sit omnis molestias id. Consequatur consequatur amet explicabo natus id.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("208","8","Doloremque quibusdam voluptate sit quidem. ?","Quo fuga ipsam corporis nobis autem. Quis quia quasi id iste ipsa rem. Sed in et enim.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("209","9","Dignissimos nostrum voluptatum quia molestias aliquam doloremque consectetur. ?","Autem consequatur nihil assumenda. Et quam earum omnis id est repellendus. In rem occaecati dicta consequuntur facere.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("210","10","Iusto rerum voluptatibus illo suscipit. ?","Facere nihil numquam et officia. Sint accusantium ipsa sed eos numquam. Nostrum distinctio et est qui nostrum id libero. Illum sed asperiores beatae et eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("211","11","Animi magni facere aut. ?","Necessitatibus atque aliquam modi corporis distinctio et. Ab voluptas aut aperiam doloribus aut. Voluptate quo molestiae necessitatibus sed nemo.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("212","12","Provident reiciendis omnis ea deserunt aliquam inventore. ?","Autem sint molestiae ut corporis perferendis ut. Debitis qui sed magnam dolor error. Suscipit et aut maxime non illum tempore magni.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("213","13","Laborum pariatur et sint enim. ?","Aut doloremque quod vero atque et similique occaecati. Totam totam deserunt sit at eius officiis iure. Rerum est facere alias ea blanditiis quos earum vitae.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("214","14","Cum qui excepturi ut. ?","Ut eum expedita et. Sed ea sapiente qui commodi dolor soluta odit. Tempore quo quia enim quaerat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("215","15","Veniam maxime aut est autem similique maxime a. ?","Enim dolorem laborum possimus sapiente. Autem iusto et ullam et fugiat ut rerum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("216","16","Laboriosam sed et cumque error natus harum. ?","Aliquid accusantium et odit iusto. Suscipit tenetur ipsam rerum quas sed quae. Voluptatem et ut temporibus nemo culpa. Sed rerum et est doloribus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("217","17","Ut rem voluptatum ratione praesentium laborum eligendi. ?","Nihil vitae saepe velit. Dolore voluptas sit cum est rerum. Totam sed voluptas est animi aut facilis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("218","18","Impedit numquam error facilis dicta dolor iste vel. ?","Ad nam ipsam consectetur aspernatur et. Nihil quas aut libero omnis optio. Aut vel fugiat cupiditate earum consequatur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("219","19","Officiis reiciendis non et voluptate earum sunt reiciendis. ?","Dolorem asperiores corrupti assumenda dolor. Laudantium saepe veniam quae voluptatem aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("220","20","Quia ea et sit suscipit reiciendis similique. ?","Maiores ab quia aut earum expedita magnam facere. Velit atque veritatis et sint autem beatae similique. Aut voluptatem omnis blanditiis ab ipsam. A odio vero quidem atque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("221","21","Consequuntur quo et accusamus repellendus voluptatem quia dolores. ?","Reiciendis molestiae tenetur enim eum totam est natus. Atque voluptatem dolore ipsa est eaque rerum aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("222","22","Laborum eos sit praesentium reiciendis consequuntur asperiores. ?","Inventore est totam ut soluta. Pariatur eligendi error est. Sequi voluptates voluptatibus debitis voluptates nihil. Id id rerum dolores nisi. Doloremque ut nulla aliquid incidunt eos corporis dolor.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("223","23","Minima voluptates quia voluptatem et quis. ?","Aut dolor corrupti non eveniet veniam et ipsa. Vel quis esse ut. Ratione ut vel est quisquam. Ea autem ullam voluptatem sapiente ratione. Sit aliquam sint enim. Nobis voluptate qui enim.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("224","24","Exercitationem dicta iusto ea. ?","Id ex enim repellat incidunt dolore ut. Est quo expedita officia dolores suscipit deserunt suscipit quia. Pariatur consectetur eveniet praesentium praesentium quos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("225","25","Et hic omnis dolorem ad unde deleniti praesentium voluptatem. ?","Qui est nam eos dignissimos sed qui et. Nostrum itaque adipisci et distinctio. Sed qui et eveniet vitae. Perferendis non quia reprehenderit explicabo qui ut dolore aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("226","26","Autem est et iusto veniam qui non. ?","Nihil et dolor tempora iusto. Quisquam mollitia ut sequi sint. Rerum ipsam ut dolorum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("227","27","Minima saepe molestiae illo. ?","Nesciunt ut a accusantium at blanditiis. Accusamus aspernatur vel consequatur aut officia sed.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("228","28","Ab voluptatem nisi deleniti dicta sint. ?","Deserunt dolore voluptatem suscipit quod porro eos. Eum dolorem saepe facilis maiores ut fuga facere. Eos eum quia ducimus architecto hic velit. Labore id ut sit est animi quasi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("229","29","Ratione deserunt modi consequatur et amet. ?","At doloribus quaerat hic animi accusantium iusto. Ex vero voluptate suscipit voluptatem aperiam. Pariatur eos dolor tempora reiciendis. Facilis et a eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("230","30","Est sint et voluptatem sunt delectus maiores. ?","Provident non ipsum asperiores possimus molestias similique quis. Eos sint et corporis molestiae. Accusamus nisi sequi ut unde modi. Et nisi dolorem praesentium possimus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("231","31","Commodi et nesciunt cumque perferendis culpa. ?","Debitis ea ea ut quibusdam voluptatem dolores facilis. Nihil assumenda est omnis maiores. Adipisci aspernatur illum aut corrupti eum commodi rem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("232","32","Officiis quia et illum molestiae voluptas. ?","Nesciunt deserunt ab deserunt dolor provident et. Tempore veritatis dolores voluptatem qui mollitia consequatur iusto.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("233","33","Cupiditate reprehenderit et recusandae iste et ipsam aliquam officia. ?","Corporis numquam vero pariatur dolorem quia et. Architecto cum quos at laborum et quisquam. Dolorum ullam voluptas illo necessitatibus dicta vero eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("234","34","Qui molestiae quis dolor necessitatibus dolores nam molestiae. ?","Quidem nobis quia ut qui rem. Quo quia perferendis ea ullam quos aperiam. Ut quia sunt aut et maiores dicta.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("235","35","Rerum placeat aliquid autem facilis quaerat. ?","Minus alias dicta iusto neque. Aperiam vel enim nobis consequatur quasi maiores. Ut cupiditate laborum quas. Itaque nam nam nulla amet repellat. Facere reprehenderit modi velit in corporis quidem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("236","36","Consequatur et voluptatem saepe nostrum nesciunt nobis hic. ?","Aut vel praesentium quis dolores quasi quia architecto necessitatibus. Eius ullam nostrum similique eos iusto. Alias sint dolorum fuga ut cupiditate provident. Fuga quae magni vel enim animi quia.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("237","37","Ut aliquid aspernatur ipsum eaque ipsa nesciunt totam. ?","Error qui est velit sint quam. Quia deserunt quis eum. Ipsa omnis omnis ex quo et minima qui sit. Delectus eum sit modi quis non itaque ea.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("238","38","Fugiat sapiente facere enim corporis. ?","Ea occaecati nesciunt omnis et qui. Velit quas voluptas natus maxime. Harum maxime et temporibus quis dolor.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("239","39","Enim suscipit omnis aut quaerat voluptas quidem non. ?","Veniam laudantium laudantium rerum voluptas hic in. Cupiditate iusto ipsa vel cumque omnis. Et et omnis dolores quibusdam similique et repellendus ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("240","40","Vel sed eaque sint est enim. ?","Rerum a qui quam illum. Ea fuga nihil dolores sit corrupti provident.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("241","41","Non et ad accusantium blanditiis quas nostrum ratione. ?","Quasi nihil magni voluptas aut tenetur accusamus. Rerum consequatur vero dicta fugit harum. Est blanditiis reprehenderit dolorem quo ea. Dolorem ea nemo in.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("242","42","Eius aut doloremque aut eos velit. ?","Ducimus sint repellat reprehenderit quo necessitatibus sint. Est qui voluptatibus aut eos. Magnam laudantium qui rem illo libero quidem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("243","43","Qui esse maiores autem dolorem nam. ?","Assumenda numquam consequatur hic adipisci vel. Perferendis molestias a sunt odio officiis. Explicabo qui voluptates quis aut praesentium ducimus odit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("244","44","Optio rerum dolore ea nostrum nisi ea. ?","In ut et laboriosam cumque iusto. Ut maxime esse in. Est impedit ea facere blanditiis ex quo ut maiores. Modi repellendus numquam ut fugit consequatur odio error. Maxime illo qui quia non.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("245","45","Et ea quo eaque esse cumque. ?","Omnis impedit rerum praesentium neque enim deleniti qui. Odit ut dolor sed ab et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("246","46","Eius consequuntur corrupti perspiciatis ducimus. ?","Nostrum inventore dolores aliquam autem voluptatem. Qui cumque dolor ad qui similique iusto ullam. Optio aliquam culpa iste quia nostrum dignissimos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("247","47","Dolor voluptate illo autem magnam repellat dolor repellat. ?","Accusamus ipsam modi repellendus harum nostrum repellat. Amet amet voluptatibus perferendis magnam dolorem doloremque quod.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("248","48","Et sunt repudiandae qui sint aut quidem maxime. ?","Corrupti libero neque magnam vero voluptas. Sapiente qui ab placeat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("249","49","Doloremque minus aliquid animi rem laudantium quae. ?","Laudantium eligendi in aliquid ipsa voluptas. Aperiam unde quo porro est voluptatem voluptate. Vel est sunt enim aut quod.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("250","50","Ex dolores omnis autem. ?","Dolorem neque quo voluptatem. Tempora necessitatibus dolor sit accusamus qui. Exercitationem aut debitis aliquam reiciendis consequatur aut. Debitis quidem eaque minus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("251","1","Et dolor reprehenderit fugiat et corporis deleniti culpa. ?","Dolores nihil tempora maiores voluptatem non consequatur blanditiis. Officia repellendus officia qui. Sunt expedita eos quam aut impedit eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("252","2","Asperiores qui ipsum est. ?","Debitis quaerat omnis incidunt nihil. Fugiat dolor nihil cupiditate omnis. Porro consequuntur laudantium et et. Et non debitis voluptates rerum velit cumque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("253","3","Eveniet deleniti ratione est consequatur id aut. ?","Architecto nam quia velit nam. Sed est et quis autem. Nihil consequatur maiores sit ratione maiores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("254","4","Consequuntur ipsum aut doloremque vitae facere corporis quae. ?","Qui et voluptatem molestiae et. Corrupti sequi autem qui modi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("255","5","Provident nihil aut expedita sit recusandae neque voluptatem. ?","Deleniti laudantium perferendis ut. Unde iure consequatur aut. Accusamus eum voluptas similique beatae doloremque commodi. Repellendus id illo est at inventore.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("256","6","Reiciendis error voluptatem ut perspiciatis tempora. ?","Eius iste quisquam fugiat odit aut dolorem ut. Totam veniam consequatur animi optio sequi nulla. Reiciendis eaque natus id eos occaecati dignissimos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("257","7","Deleniti officia illo eaque in illo. ?","Dolor pariatur soluta velit vero quod explicabo. Perspiciatis unde nihil quo. Voluptates ut dolore modi sapiente eum cupiditate nulla. Dolore ab atque reprehenderit ea.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("258","8","Repellendus enim iste laudantium cupiditate sint voluptatem. ?","Id laborum mollitia perspiciatis repellat amet. Ipsa voluptates rerum omnis nisi eveniet ea ad. Sed laudantium accusantium ratione qui hic laudantium. Atque vitae ullam magnam dolorem quibusdam sunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("259","9","Culpa qui perferendis ipsam assumenda modi. ?","Error veniam dolor reiciendis quam quis. Et consequatur nostrum earum sapiente sed nisi voluptas in. Magnam explicabo debitis aut ex.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("260","10","Quo eius omnis voluptas. ?","Cumque possimus molestiae sequi iure consequuntur quo aut. Voluptatibus veniam eveniet voluptatem maiores voluptatum et. Debitis repellat ad eum est laboriosam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("261","11","Debitis cum occaecati et et ratione quasi possimus. ?","Ipsam fugiat est nobis quae rerum. Quod et voluptas quaerat cumque velit veniam amet. Est ducimus quia temporibus architecto. Expedita voluptatem quasi beatae velit qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("262","12","Consequatur in maxime ducimus commodi nemo. ?","Dolor et ea eius. Aut suscipit cupiditate quisquam quo repellat aut ab. Soluta quas aut dicta numquam aut. Incidunt asperiores sunt dolorem dicta.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("263","13","Velit beatae et ipsum eveniet corrupti. ?","Nostrum atque iste provident aut sint fugiat. Reprehenderit itaque omnis voluptatem excepturi quia. Earum sed voluptas voluptatibus in blanditiis voluptatem nulla unde.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("264","14","Est provident deserunt sunt rerum aut quos. ?","Fuga eveniet sed blanditiis minus veniam. Ea perferendis laborum et vel reiciendis eveniet illum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("265","15","Quia placeat ea dolorum dolor corrupti. ?","Quos possimus cupiditate numquam odit ipsum sed. Illum fugit omnis voluptatem incidunt sit. Ut nulla alias temporibus qui est. Error quae aut maiores libero non perspiciatis esse.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("266","16","Impedit enim temporibus deserunt ratione animi. ?","Doloremque officia et veniam maiores eveniet. Autem necessitatibus eos aliquid placeat omnis. Omnis explicabo officiis quibusdam reiciendis. Consequatur magni quis soluta vel.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("267","17","Vel adipisci dolor ipsum fugiat. ?","Eligendi iure dolores temporibus blanditiis. Numquam sit dolor autem reprehenderit et. Reprehenderit error ullam repudiandae qui dignissimos. In et sit autem magni aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("268","18","Dolorem hic totam eaque sed earum. ?","Inventore sunt aut consequatur rerum dolorum expedita eaque. Sit perferendis minus amet laudantium amet sit fugiat iste. Debitis omnis temporibus autem rerum laudantium.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("269","19","Mollitia magnam est similique. ?","Sed aut et tenetur debitis quia ipsum sint. Amet beatae assumenda voluptas eveniet. Dolor consequatur vero id nostrum voluptatem quas quaerat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("270","20","Consequatur et omnis at reiciendis iure dolorum. ?","Veniam ut ut vitae voluptas ducimus dignissimos. Dicta quis maiores dolor et velit cumque labore earum. Quasi debitis fugiat quod veritatis delectus. Reiciendis vel quisquam in rerum laudantium eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("271","21","Atque quisquam est minima odit. ?","Possimus dolor vel accusantium dolor. Aut itaque eveniet et. Voluptas quia ut ipsum sunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("272","22","Ducimus laborum aliquid quod ex molestiae dolores architecto. ?","Et ipsum recusandae rerum illo adipisci quis. Eveniet rerum incidunt hic qui nam sit rerum nihil. Mollitia sequi non tempora cum. Eos illo ut labore ut et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("273","23","Ut iste aliquam dignissimos libero iusto. ?","Voluptatem dolor fugiat delectus expedita aspernatur est quos. Dolor accusamus deserunt repellat illum. Et ut consectetur est ut voluptas quia et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("274","24","Voluptas et rerum deserunt id. ?","Aut atque aspernatur consequatur deserunt. Tempora corporis ipsa aperiam tempora possimus fugit. Non doloribus sit corrupti sed delectus omnis repellendus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("275","25","Officiis velit nihil dolores velit omnis. ?","Quia quia nihil blanditiis et quia at delectus. Rerum est repudiandae cupiditate ut occaecati. Ipsa porro aut voluptatibus est. Qui aut et temporibus eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("276","26","Ut eos eveniet corrupti hic. ?","Sunt ut qui ut quasi ad dolor et. Quo tenetur aut aut nam modi nihil laudantium.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("277","27","Veniam itaque quis odio inventore et. ?","Velit a voluptate est molestiae voluptatum. Aperiam eum aut eaque voluptatem quasi delectus unde. Quo rem molestiae qui. Inventore saepe voluptatibus fugiat laborum eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("278","28","Qui rerum qui ut natus sed iusto magnam quos. ?","Qui deserunt debitis nemo rerum. Id laborum quia corrupti. Illum et amet fuga a culpa et ratione. Omnis sapiente possimus rerum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("279","29","Incidunt dicta perspiciatis et omnis minima modi perspiciatis. ?","Harum accusantium magnam optio non. Quis praesentium hic aperiam non qui doloribus dolor quidem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("280","30","Voluptates omnis et commodi voluptatem rerum. ?","Dolores mollitia possimus repellendus quas molestiae cumque consequuntur. Magnam ut eligendi eum iusto quae qui. Ut id beatae adipisci deleniti ullam blanditiis provident perspiciatis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("281","31","Nesciunt asperiores reprehenderit consequatur vel aut aliquid. ?","Sequi labore cumque earum unde. Molestias dolor dicta quasi ut expedita saepe. Blanditiis laudantium impedit rerum dolores quia. Ut et vitae vero porro omnis odit voluptatem corporis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("282","32","Quibusdam qui pariatur quas inventore. ?","Enim laborum reiciendis velit. Esse doloribus aut quibusdam et nesciunt rerum ut. Asperiores repellat rerum eum quaerat quam vel.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("283","33","Libero atque sunt deleniti enim quisquam aut eligendi. ?","Deserunt molestiae magni et aut. Omnis deleniti vel id sit. Aut enim quia quia. Illo est cumque velit distinctio sunt esse. Quo occaecati est vel repudiandae aspernatur necessitatibus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("284","34","Et quia ut in voluptas adipisci. ?","Autem vel optio quia deleniti doloribus et eos. Rerum similique cum autem et facilis consequatur. Repudiandae ut quis ad veniam et. Eius est quam sapiente eligendi incidunt debitis voluptatem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("285","35","Ducimus perferendis deleniti omnis sit veritatis. ?","Voluptatibus et cumque velit rerum id laudantium veritatis magni. Et tempora distinctio hic ipsa et nulla. Quos laboriosam aut atque quas minima modi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("286","36","Expedita id quidem esse itaque nobis earum. ?","Provident dicta ipsa voluptatum et. Amet impedit sequi facilis quidem quaerat accusamus doloremque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("287","37","Iusto deleniti cupiditate aperiam ullam esse. ?","Voluptate reiciendis nemo similique temporibus sint ullam. Maiores voluptatem non suscipit ad qui perspiciatis dignissimos laboriosam. Culpa consequatur ea iusto quas.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("288","38","Minus ipsam asperiores perspiciatis. ?","Optio quod voluptas recusandae nobis cupiditate ut. Qui tempora at ex asperiores omnis occaecati. Temporibus a vel accusantium ipsa quo.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("289","39","Quam ullam in nihil et autem rem. ?","Architecto in eaque numquam sequi eum. Natus quam quia quia atque et aut quo tempora. Enim sapiente distinctio eligendi est ratione accusantium autem voluptas. Iste harum est voluptas incidunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("290","40","Molestias est eius dolores sapiente commodi totam accusamus. ?","Doloremque ipsam consequatur in ut nihil. Omnis commodi ut non. Beatae sapiente sit in fugit omnis quia quae ipsam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("291","41","Non atque explicabo omnis iure. ?","Iste facere corrupti sapiente debitis cum. Sint possimus est qui est rem inventore atque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("292","42","Laudantium ut ut provident repellat voluptas qui beatae. ?","Inventore dicta ratione voluptatum animi. Eaque debitis culpa nostrum voluptate nemo non cum doloremque. Ipsam quo ipsum natus ut et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("293","43","Fuga sapiente est nisi nostrum. ?","In illo nobis sapiente. Fuga officiis consequuntur animi perferendis esse exercitationem. Dolores et illo nulla et. A sit itaque consequatur voluptatem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("294","44","Impedit autem veniam culpa reiciendis eligendi. ?","Vero numquam et maiores aperiam nisi tempora et. Esse illum recusandae perferendis expedita et. Nam quis rerum reprehenderit atque. Ex neque iusto incidunt quisquam ipsam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("295","45","Id consectetur et quis occaecati repellat velit hic. ?","Recusandae consequatur non laudantium impedit consectetur. Neque explicabo laboriosam iste officiis. Nostrum nulla numquam maiores aspernatur sunt dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("296","46","Eum magni repellendus voluptate nisi. ?","Quisquam voluptas inventore ullam qui voluptas cupiditate dolor. Ut blanditiis enim et. Adipisci sint sunt dolore porro facere quo. Veniam nostrum corrupti amet vel dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("297","47","Molestiae recusandae explicabo voluptatum aspernatur. ?","Doloribus quisquam iusto delectus esse. Facere ipsam omnis fuga.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("298","48","Est molestiae quo consequuntur non possimus vitae. ?","Eveniet sed qui asperiores cupiditate voluptate. Nihil animi qui cumque similique eum. Et aut dolores expedita et. Quia id labore dicta mollitia. Amet aut laboriosam aut vel quas expedita excepturi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("299","49","At est dolores quis dolor quae ut nam sunt. ?","Tempore sed natus officiis. Voluptas officia ea magni quam nemo ab harum. Porro soluta earum et praesentium voluptatibus velit quisquam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("300","50","Porro quam velit mollitia eligendi quas. ?","In eos voluptas ut culpa. Ut et totam labore culpa animi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("301","1","Ea alias a sed velit nobis. ?","Occaecati veniam distinctio qui voluptatem aut eius. Aut rerum in repudiandae non quisquam id. Beatae ducimus est blanditiis omnis sed reiciendis qui. Adipisci quos excepturi culpa quo.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("302","2","Veritatis soluta voluptas molestiae incidunt eos occaecati. ?","Nulla vel debitis aut. Placeat deserunt laborum quasi et voluptatem sit. Nemo aut tempore ducimus quo repellendus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("303","3","Recusandae cupiditate unde totam aut voluptatem sunt praesentium. ?","Sequi omnis labore omnis velit rem dolorem. Et a nobis ad beatae. Dolorem esse iure est.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("304","4","Asperiores et tempore enim consectetur est sed. ?","Ullam voluptates unde eaque officiis soluta. Doloribus nesciunt minima quis ut rem deleniti aut. Architecto esse quae consequuntur ab eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("305","5","Tempore non tempora neque fuga corrupti voluptatum magni magni. ?","Inventore dolores esse consequatur amet. Fugiat sint quas architecto reprehenderit fuga. Facere explicabo quibusdam perferendis aut deleniti eum. Et commodi ipsa autem nam ducimus natus et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("306","6","Dolorem voluptas ipsa beatae sint nihil. ?","Voluptates fugit commodi id consequatur in architecto voluptatem. Soluta repellat consequatur saepe. Enim possimus amet deleniti et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("307","7","Incidunt asperiores labore assumenda libero qui. ?","Minus harum optio error a quam. Excepturi nisi est voluptas adipisci. Corporis voluptas quia et perspiciatis reiciendis dolorem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("308","8","Expedita fugiat veniam totam quis sit ut. ?","Iusto non consequatur quidem molestiae quisquam. Fugiat nesciunt officiis ut voluptas fuga. Et magni accusamus et fugiat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("309","9","Debitis sed pariatur quo labore ut aut dolores. ?","Autem sit non laboriosam hic enim quisquam reprehenderit. Unde asperiores cupiditate sunt necessitatibus voluptatibus error earum. Architecto dolorem totam eaque a blanditiis nesciunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("310","10","Distinctio praesentium facere blanditiis sint sint. ?","Exercitationem consequatur neque ab officia. Animi voluptatum qui odit eum. Et aut dignissimos nisi aspernatur sed voluptatem. Sequi recusandae itaque molestias saepe et odit officiis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("311","11","Repellendus doloribus velit qui. ?","Sint possimus ratione perspiciatis. Ratione non omnis magni quasi enim a nostrum. Ad aperiam optio et molestiae vel dolor. Placeat qui inventore est similique quos vero esse similique.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("312","12","Modi sed corrupti modi voluptatem cupiditate non ipsum. ?","Vel qui libero nesciunt sit ad vitae ipsa. Amet aut dolores alias ut fugit. Deserunt quas illo unde sit dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("313","13","Libero dolorum consequatur in. ?","Veniam omnis sed a. Modi architecto quas quisquam aut deserunt. Dolorum est saepe eligendi quia veniam culpa vel tempora. Omnis quaerat impedit quae deserunt earum recusandae.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("314","14","Consequatur ut impedit natus quod rerum et. ?","Veritatis ratione quas est dolores labore ipsa. Itaque labore architecto ad neque eligendi laboriosam esse. Consectetur neque vitae in.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("315","15","Quo sit hic et a vero et error. ?","Ratione labore deserunt unde tempore ipsa amet. Mollitia quaerat accusamus porro. Dolore est totam recusandae eum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("316","16","Repellendus laborum suscipit officia dolorem quam voluptas. ?","Assumenda possimus ullam maiores est enim. Sit maxime consequatur temporibus beatae illum deleniti. Eos porro voluptate aut alias. Fuga est officia quia facere praesentium voluptatem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("317","17","Minima excepturi est aut sequi omnis nulla laborum autem. ?","Natus sed recusandae exercitationem quia ullam nesciunt corporis. Eos veritatis laudantium eum commodi non consequatur. Ut impedit rem delectus atque recusandae cum ratione.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("318","18","Molestias quia non atque veritatis ad. ?","Rerum at molestias et praesentium rerum voluptas. Officia distinctio rerum tenetur accusamus quae placeat eos porro. Itaque eveniet tenetur ea repudiandae expedita consequatur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("319","19","Eos dolorum aliquid nihil aut facere. ?","Consectetur omnis dolore aperiam quis corporis corrupti. Et omnis saepe culpa sunt tenetur enim et. Ut ut neque et qui aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("320","20","Dolore rerum quod eveniet distinctio. ?","Vel laboriosam et libero alias quia doloremque. Tenetur dolorum id esse et rerum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("321","21","Impedit eius et magni aliquid non ad. ?","Repellendus sunt distinctio sint quia commodi. Est tempora sunt enim sit repudiandae expedita quo qui. Odio doloremque ut maiores ut dolores et. Consequatur tempore sed incidunt ab voluptatum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("322","22","Culpa doloremque non facilis quo. ?","Est accusantium accusamus consequatur sit dolorum recusandae. Porro dicta laborum aperiam consequatur. Voluptas suscipit ut voluptatem tempore dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("323","23","Vitae ex reprehenderit porro iure quibusdam perspiciatis illum. ?","Sit ab dolorem hic temporibus eum. Quaerat pariatur rem in id est. In sequi eligendi eum ducimus exercitationem eaque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("324","24","Magni aperiam quis nobis aut voluptatum magni. ?","Mollitia labore aut at ad earum ex. Vel et voluptatum quia delectus molestiae sint. Sint voluptates sit in modi aut. Enim at ut doloremque eum dolorem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("325","25","Quas nobis facilis autem et magnam. ?","Odit veritatis praesentium enim sapiente voluptatem porro. Ut animi et officiis sunt. Et ut rerum omnis odio dolorum velit architecto.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("326","26","Occaecati delectus distinctio dolor sit vel eos autem sit. ?","Quia officiis inventore nostrum dignissimos quis. Officia et amet laboriosam possimus est unde. Id hic vel maxime.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("327","27","Enim voluptatem autem quia autem qui non ratione est. ?","Nobis at enim labore et. Reiciendis porro eaque quos deserunt recusandae praesentium. Odio quaerat odit laudantium doloremque. Aut laboriosam omnis explicabo sequi delectus atque sed.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("328","28","Ut similique eligendi aut cupiditate sit illo. ?","Ut et eius est id. Dolores unde ipsum libero et vel. Optio nihil nobis dolor voluptas error eos molestiae ut. Rerum qui voluptatem cumque quod.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("329","29","Est alias dolorem quam sed id et. ?","Reiciendis eum commodi qui nobis neque minima. Possimus quas consequuntur sed quisquam perspiciatis. Sint recusandae aut molestias iusto consectetur et error.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("330","30","Cupiditate nihil est voluptas suscipit expedita qui. ?","Quis nostrum consectetur non. Accusantium velit suscipit explicabo quibusdam provident culpa qui. Fugiat dolores enim optio ut corrupti non. Deserunt et deleniti ut harum et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("331","31","Provident officia omnis voluptate ut sed laborum. ?","Id totam ipsum sint tempore ullam. Cupiditate quis facere ut qui facilis quia. Est ipsa porro quos in.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("332","32","Eos magni aut voluptatem blanditiis perferendis. ?","Commodi quibusdam earum nam ut reprehenderit. Et enim doloremque labore sit dolor ut. Voluptas maiores dolor non similique est doloribus delectus. Quo assumenda est cum expedita aut qui rerum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("333","33","Quia reiciendis enim pariatur minima similique. ?","Aut ut sed minima voluptatum. Sunt velit molestias unde autem architecto pariatur. Dolor ea quam quod beatae et nihil qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("334","34","Ea voluptate molestias rerum placeat qui. ?","Similique perspiciatis autem vel dolorum eos architecto. Ab quod nihil et nobis architecto qui aut. Iste illo maxime ut quam et. Sint doloribus id nisi culpa aut dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("335","35","Quos accusantium hic quia quam ratione odio. ?","Similique cupiditate minus eos. Ducimus numquam nobis similique exercitationem distinctio dolorem possimus. Tempore aliquid iure ad voluptatem. Ea sit nulla quam ut possimus deserunt atque aperiam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("336","36","Eos culpa ipsa quas quia et et. ?","Ex fugiat mollitia asperiores cupiditate vitae quis. Nihil ipsum atque eos labore.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("337","37","Aut ut beatae porro nihil voluptatibus molestiae. ?","Rerum eveniet nam tempora aut quae cupiditate impedit. Sit excepturi saepe aut. Eveniet veritatis dolore dolorem suscipit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("338","38","Dolor qui vitae officia ratione nemo ipsum. ?","Ut iste assumenda autem nam. Voluptas doloremque id quis et itaque iure. Et sit et fuga sint sint. Est quia qui sed temporibus inventore.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("339","39","Culpa dolorem et excepturi id. ?","Animi recusandae sunt corporis quam. Rerum in omnis perspiciatis recusandae. Qui omnis quia est ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("340","40","Iure nam recusandae voluptatem consequatur. ?","Ut mollitia similique unde repudiandae quasi beatae voluptatum. Dolor aut quidem quaerat. Temporibus inventore quis non enim ex autem aut commodi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("341","41","In necessitatibus atque ea quas explicabo possimus et. ?","Inventore quisquam iste sint non ipsa. Rem dolor voluptatem sit animi expedita qui ipsam. Voluptatibus alias quibusdam eum aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("342","42","Qui adipisci explicabo voluptas. ?","Sit sit dignissimos ullam dolorem sapiente sit aut. Et et nam corrupti nemo amet consequatur. Nihil veritatis officia possimus veritatis impedit. Laborum officiis consequatur quod aspernatur vitae.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("343","43","Esse minima eos et ad qui esse. ?","Et omnis fugit vitae rerum ut. Inventore consequatur hic atque ex. Consectetur voluptate nemo vitae placeat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("344","44","Quia eos tenetur magni iste odit facere quis. ?","Explicabo dolore ut est est. Consequatur rerum blanditiis tempore est consequatur quia. Id beatae dignissimos magni magni quia. Harum quis enim aut aut impedit provident.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("345","45","Repellat repudiandae velit reprehenderit corporis. ?","Qui aut mollitia qui exercitationem reiciendis quia. Cumque eum debitis voluptates iure sit necessitatibus. Ut saepe et sint saepe.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("346","46","Nam facere nam repudiandae rerum. ?","Repellat aut vero rerum illo in neque. Sint maiores nihil facilis non et est est. Id omnis possimus quasi voluptatem. Est omnis doloremque sit et similique.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("347","47","Ut et doloremque sunt beatae. ?","Dolorem tempore quibusdam nesciunt tempore officia dolor. Aliquam dolorum alias quae autem laborum. Aut facere temporibus recusandae voluptatem est modi quas.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("348","48","Similique consequatur quasi ullam itaque dolorum. ?","Reprehenderit et adipisci tenetur et iste officiis. Sint aliquid dicta culpa molestiae. Aspernatur rerum totam illo sapiente dolorem numquam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("349","49","Assumenda mollitia aspernatur tenetur eveniet nam quos modi provident. ?","Vel reiciendis tempora rerum amet cum provident. Molestiae eum magnam cum ut aut officiis labore expedita. Assumenda fugiat voluptatibus earum. Qui eum fugiat omnis iusto ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("350","50","Nam corporis illum excepturi aut distinctio voluptatum distinctio. ?","Ad veritatis tempora sint corporis. Cumque sit sed sapiente nobis assumenda aliquid. Adipisci odit veritatis itaque voluptatem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("351","1","Qui ducimus ratione suscipit aut. ?","Qui recusandae qui impedit. Magnam unde et a vel. Voluptatum tempore eum dolorem et et libero fugiat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("352","2","Minus sequi enim eveniet rem. ?","Dolores sint illo reprehenderit consequatur aut. Labore quo possimus labore libero dolorem minima. Quasi aspernatur deserunt omnis. Omnis nostrum in natus consequuntur aliquid quis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("353","3","Ipsa quisquam quia quo animi quo. ?","Aut voluptas ut minus adipisci. Nam fuga aspernatur qui accusantium enim ut officiis voluptatum. Error eos velit incidunt et et totam. Blanditiis ipsa voluptas officia. Ea repellendus quia qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("354","4","Dolores maiores dolor fugit sit illo commodi quibusdam. ?","Qui autem qui ab sint corrupti a dolorem excepturi. Esse enim quasi ea mollitia consequatur. Qui placeat quis odit rerum libero. Non dolor ea in blanditiis eum non error.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("355","5","Dignissimos voluptatem sunt voluptas ut quae maiores. ?","Nostrum quo quia rerum sunt doloribus ex. Numquam iure delectus facilis optio ut explicabo. Ea rerum et aspernatur consectetur voluptas non vitae alias.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("356","6","Deserunt ut repellat vitae perspiciatis architecto delectus facere. ?","Facere illum culpa ea et dolorem dolorum sequi. Voluptatem repellendus beatae sunt debitis tempora et. Sed dolor dolor esse necessitatibus nemo voluptatem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("357","7","Veritatis quae quidem ea sit qui ut. ?","Eveniet veritatis maiores sit quia. Atque qui ea id assumenda accusantium quisquam sequi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("358","8","Ut cumque quis ea ratione. ?","Fuga et eos sed voluptas veniam. Voluptatem possimus rerum est ullam esse culpa cum. Fugiat fuga fugiat sit natus eum ullam dolores perferendis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("359","9","Dolorem modi dolorum ad non similique natus. ?","Fuga tempora saepe dolor quod. Ut sapiente sunt voluptatem. Reiciendis illum modi excepturi. Ratione consequatur molestiae temporibus qui illum doloribus illum odit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("360","10","Cumque tenetur magnam nostrum soluta sed minus. ?","Omnis quis et magni. Dolores atque omnis ab earum deleniti sequi libero. Unde quia repellendus culpa sunt debitis. Culpa sed harum quis consequatur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("361","11","Eum quis ea nisi sit vel. ?","Aut saepe excepturi provident neque porro. Fugit rem accusamus consequatur amet. Consequatur dolores voluptas quia aliquam autem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("362","12","Ut non quia ut est ea modi et. ?","Ea et ut sint harum. Dolor ea aliquam libero vel. Et aut ad ut ut natus libero ut. Rerum consequatur ut quibusdam qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("363","13","Vero accusamus deleniti et non. ?","Totam eaque delectus omnis aut non et ratione. Odio quod eos quam consectetur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("364","14","Culpa et perferendis laboriosam saepe aspernatur quia. ?","Exercitationem id incidunt perspiciatis adipisci. Id culpa animi et numquam. Eum mollitia quia excepturi voluptatum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("365","15","Reiciendis occaecati consequatur expedita tempore ratione vero saepe. ?","Architecto est quos veritatis sed. Facere pariatur quam labore eum illo deserunt dolorem. Et repudiandae nemo consequatur necessitatibus et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("366","16","Aspernatur et esse eius provident. ?","Ipsa eos ab possimus tempore officia. Quam non maxime id cupiditate recusandae necessitatibus. Iure officia nisi itaque a.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("367","17","Voluptatem non modi quasi non sint. ?","Deserunt tenetur rem et qui incidunt. Similique aut necessitatibus qui sed. Quidem optio cupiditate eaque aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("368","18","Aliquid nam accusamus illum reprehenderit qui deserunt. ?","At voluptatum quos laboriosam voluptate. Deleniti id asperiores et commodi voluptatem. Voluptas et et omnis. A magni praesentium error consequatur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("369","19","Eveniet quo doloremque facere quia aut tempora velit. ?","Perspiciatis delectus qui dolores ratione. Nobis et sit perferendis. Non sit quae harum voluptas ad sed in.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("370","20","Repellendus velit doloremque ipsa occaecati error. ?","Iste neque aperiam ad perspiciatis. Et sint eligendi architecto non. Rerum aspernatur qui voluptates est consequatur iste. Beatae accusamus in autem cupiditate et error id.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("371","21","Quis quia sit occaecati veniam reprehenderit aliquid qui. ?","Libero enim quas corrupti magni. Sint sed quis aspernatur est dolor quidem. Ad voluptas consequatur impedit incidunt sit cupiditate tenetur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("372","22","Neque velit ut delectus quia ea officia et quo. ?","Eos numquam aut vero cum iure consequatur quibusdam. Est ut qui cum ipsam qui in. Et qui omnis occaecati vitae quo dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("373","23","Mollitia quibusdam possimus voluptatem quia. ?","Alias accusamus vero nisi totam aut dolorem. Et ut et nihil quia fugiat iusto in.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("374","24","Sit sapiente consequatur qui nesciunt. ?","Labore optio sed quidem. Enim nam voluptatem architecto doloremque qui. Quisquam dicta ut rerum sunt. Facere voluptates eum odio eaque a et eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("375","25","Autem laudantium cumque odio odit. ?","Ut cum optio tempora fugiat est animi a. Sed quia dolores laborum et asperiores laborum. Illo iste at temporibus et. Sequi quae sed hic veritatis dolores temporibus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("376","26","Sunt tempore consequatur nemo numquam qui. ?","Asperiores nihil quo rerum. Libero sed et dolor. Illum iure ratione repellat ut fugit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("377","27","Error reprehenderit esse consequatur ut nesciunt odio sapiente. ?","Cum voluptatum voluptas eveniet ex modi. Optio laboriosam qui reiciendis nemo earum possimus et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("378","28","Sint aut et dolor. ?","Error qui id facere nulla officia. Doloremque et deleniti sed. Nulla eligendi est sint qui neque assumenda. Et et omnis possimus fugiat. Dicta odit qui perspiciatis voluptatem perspiciatis veritatis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("379","29","Aut delectus voluptas enim non consequatur et soluta ea. ?","Nulla voluptatibus cupiditate nisi consequatur nihil. Consequatur quisquam eos veritatis repellat omnis fuga. Tempora nemo omnis quis et. Ea explicabo nihil sed quia molestias ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("380","30","Quibusdam itaque dolor vitae quo autem provident in. ?","Odit sequi ipsum ducimus quidem impedit. Voluptatibus veniam ut molestias et at a.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("381","31","Aut quasi rerum totam error nam ea magnam et. ?","Nesciunt ut omnis pariatur veritatis eaque id qui. Facilis eius eum ipsa rem quo. Fugit velit quibusdam hic voluptatem libero saepe. Eum provident quisquam reiciendis vitae amet.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("382","32","Et est doloremque omnis laudantium. ?","Delectus molestiae quam est expedita quos provident quidem. Non dolor architecto minima excepturi est voluptatem ut. Qui consequuntur saepe dolor ut et quia reprehenderit modi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("383","33","Voluptatem earum est temporibus eius dolores explicabo soluta. ?","Laudantium maxime omnis rerum quos quia occaecati. Vitae et itaque provident ipsum. Voluptatem consectetur ex laboriosam molestiae molestiae repudiandae quis molestiae.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("384","34","Et aut dolorum suscipit. ?","Voluptatem praesentium ut eum rem est qui. Ut totam et dicta. Quisquam minus id consequatur est quos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("385","35","Delectus blanditiis id qui quibusdam aut cumque aut. ?","Et eum corrupti esse ut voluptas. Perferendis mollitia et omnis iusto perferendis. Officia earum sit labore est dolorem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("386","36","Iste facere dolor pariatur et id non provident. ?","Explicabo atque nisi voluptatem quod nihil et. Enim aspernatur eos quaerat aut nostrum sed omnis. Alias sit temporibus sunt eum explicabo quia eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("387","37","Aut velit facere eum aut iusto est natus. ?","Minima sequi vitae qui et. Animi atque reprehenderit voluptas expedita velit voluptatibus et. Sed facere soluta vero adipisci dolor ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("388","38","Quibusdam deserunt excepturi fugiat laboriosam sit quis molestias dolorem. ?","Eum voluptatem et dolorem hic nisi. Pariatur necessitatibus totam consectetur quibusdam nemo. Praesentium sed voluptatibus dignissimos eum molestias. Accusamus aperiam aperiam voluptatem est quae.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("389","39","Deserunt nam aut praesentium fuga non. ?","Nihil eaque ullam nulla accusamus eum. Rerum modi pariatur enim sit quis qui. Aliquid non culpa autem harum reprehenderit. Voluptates nihil aliquam non explicabo aut eos.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("390","40","Deleniti velit eos qui voluptas pariatur officia. ?","Ut voluptates quam velit id consectetur quo amet. Perspiciatis architecto minus maxime nisi neque est. In qui reprehenderit maxime repellendus dolor maxime non.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("391","41","Suscipit enim aut excepturi cumque nam. ?","Repudiandae ea officiis quos. Ab voluptas nobis ad aut in ut. Quam architecto quod eos ut autem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("392","42","Architecto recusandae facere eius qui nisi. ?","Quia soluta laboriosam est perspiciatis laboriosam quis hic. Iusto consectetur voluptatibus dignissimos quod laudantium autem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("393","43","Est nisi est officia. ?","Praesentium velit explicabo ipsum dolor perspiciatis accusamus nulla. Quae ad quisquam voluptas iste eos. Ipsa eius quaerat est quibusdam. Veritatis corporis quo voluptas.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("394","44","Molestiae facilis maiores aut porro iure ipsum omnis. ?","Accusantium facilis ex veniam eius sed illum ut. Consequatur quaerat ducimus at consequuntur hic necessitatibus consequuntur. Et ut voluptatum earum et. Et similique est quia sed sint.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("395","45","Sint commodi explicabo harum consequatur. ?","Dolor ut et eum et. Eligendi et cumque hic sit modi nihil et. Expedita provident rerum eum sed facilis quibusdam omnis veniam. Et aut labore est earum eos sunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("396","46","Et consequuntur cumque magnam rerum. ?","Rerum quia ipsum praesentium id. Quod dolores dolorem fuga repellat sequi dolorem. Dolore alias vero ea. Voluptatem aut nemo in aperiam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("397","47","Iste sequi maxime dolor beatae perferendis architecto. ?","Voluptatem sapiente adipisci nostrum harum autem cum voluptatem. Delectus neque aut eligendi praesentium. Architecto et deserunt sint dicta voluptas libero omnis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("398","48","Error sit ut error harum incidunt. ?","Id ratione et totam dolores. Id vel magni dolorum est consequatur et aspernatur dolor. Est et molestias saepe dolorem nulla et aut qui. Voluptatem ea voluptatum in necessitatibus et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("399","49","Praesentium dolor saepe saepe nam eos consequuntur. ?","Dicta qui eum dolor suscipit. Dolorum soluta qui reiciendis aut illum. Error temporibus qui in aut odit harum. Aliquid voluptatibus et delectus alias pariatur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("400","50","Sunt ducimus quibusdam ut quo magni. ?","Aliquid necessitatibus dolor et et adipisci facere. Sint adipisci voluptas aut cumque. Delectus id ut officia iusto labore accusantium. Similique laboriosam facere illo et quis et omnis eligendi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("401","1","Soluta neque et officiis officia non voluptatem aut. ?","Culpa repellendus vitae totam sed. Quo consequatur in blanditiis et. Eaque aut eum voluptatem consectetur voluptas quidem quia. Modi est est qui maxime. Blanditiis consequatur voluptas rem qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("402","2","Provident fugit nisi laudantium veniam. ?","Eaque aut amet voluptas vel. Velit corporis velit quaerat aperiam tenetur non. Vel ad aut est facilis et rerum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("403","3","Fugiat et dicta cupiditate assumenda aliquid omnis totam ad. ?","Officia non nemo velit numquam nemo. Et laboriosam odit perferendis quia repudiandae voluptates. Expedita distinctio quis minima rerum necessitatibus non sunt illo.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("404","4","Vel eum enim ducimus tenetur. ?","Modi voluptatem molestias et atque. Et eum quia in voluptatum blanditiis tempora sit atque. Commodi sit sed nobis aperiam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("405","5","Voluptatum saepe sequi illum reprehenderit. ?","Reiciendis deleniti nam eum ullam eligendi voluptatem voluptates. Vitae aut ullam dolore sunt. Dignissimos sed similique velit nisi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("406","6","Ut enim sequi quam repudiandae non nemo omnis. ?","Odio libero eum quasi omnis iste. Ut ut et cumque consequatur. Blanditiis nemo sed ratione libero inventore ducimus earum corporis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("407","7","Sapiente molestiae qui expedita odio. ?","Perferendis voluptates nam tempore repellat. Quia praesentium nesciunt voluptas aut veniam amet. Fuga et id quo sunt recusandae vel. Placeat ex et occaecati dolore cumque dolores voluptas dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("408","8","Omnis earum ab est magni rerum inventore. ?","Temporibus officiis autem error aliquam. Itaque sit rerum illum explicabo. Nulla esse sit ut magnam fugit id.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("409","9","Sed earum molestias quis sed rem et. ?","Repudiandae minima recusandae rem temporibus ipsum. Voluptate porro mollitia dolor molestiae iure eos ea. Sint in odio qui enim est. Quo quo corporis ut modi maxime nihil.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("410","10","Omnis qui odio exercitationem culpa deleniti. ?","Asperiores recusandae consequatur reiciendis est ipsa. Totam quo harum ea totam blanditiis. Asperiores iusto eveniet totam consectetur adipisci et vel.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("411","11","Itaque necessitatibus enim saepe ea. ?","Eveniet fugit veritatis et qui amet similique. Possimus libero repellendus doloribus pariatur esse voluptas. Est delectus unde et voluptatem commodi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("412","12","Eum facere nemo molestiae voluptatem libero unde. ?","Aliquam excepturi quia quia et et modi esse. Veritatis pariatur odio maiores sed ut. Similique eos voluptatem temporibus modi magni aut quia sunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("413","13","Fugiat debitis aspernatur at incidunt. ?","Eaque aut praesentium omnis. Quia sunt optio dolor. Rerum reprehenderit iste quis dolore autem non.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("414","14","Natus soluta doloribus deserunt omnis inventore consequatur. ?","Et quis dicta et voluptatem non nesciunt. Ad officiis laborum qui ullam ipsam ducimus. Voluptatem quia adipisci amet illum ducimus sint cupiditate sit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("415","15","Deleniti deserunt aspernatur dolores. ?","Iste sunt voluptatem repellendus ipsa consequatur doloribus rerum. Et possimus nobis dolores aut in mollitia. Ut qui illum enim autem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("416","16","Commodi id aliquam voluptatum eveniet voluptas ipsum. ?","Velit et est alias quam voluptatum quisquam minima. Sint vel culpa asperiores non. Ipsa voluptas ipsa est incidunt aut veniam officiis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("417","17","Voluptatum placeat exercitationem quis necessitatibus quia labore. ?","Molestiae et impedit et itaque pariatur in. Provident necessitatibus ducimus et sit cum laboriosam. Quisquam et eum corrupti aliquam. Reiciendis nihil nostrum sit et esse sunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("418","18","Necessitatibus ratione mollitia iure quo veritatis rerum eligendi. ?","Quia earum fuga molestiae nihil maxime quia. Assumenda neque labore nisi et blanditiis corporis et. Autem officia asperiores expedita similique fugit. Aut qui natus fuga repellendus non ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("419","19","Animi corrupti dolorem ea accusantium. ?","Qui ea officiis officia quod facere cupiditate. Qui accusantium et voluptate quasi aliquam. Omnis consequatur delectus eveniet. Aperiam eius sit totam porro.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("420","20","Et enim hic rerum quas quis sit. ?","Illum illo veniam quia dicta. Provident est vero consectetur at necessitatibus doloremque. Maiores aliquid pariatur vel sit doloribus delectus. Recusandae sunt nisi eius ea.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("421","21","Reiciendis magni ullam quas quia aliquid velit. ?","Dicta laboriosam qui omnis enim ut. Fugit ducimus aut provident dolorum quam. Aut laborum quod eaque nobis at. Similique et necessitatibus laudantium a sed.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("422","22","Molestiae consectetur quia ut autem omnis. ?","Atque error nobis ab qui illo vero veritatis eaque. Qui et voluptatibus eius veritatis dolor nihil nemo. Eos quis dolorem odit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("423","23","Nemo libero vel recusandae itaque. ?","Odit molestias sed eum est. Et corrupti magni consequatur cupiditate. Nostrum non ratione cumque ullam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("424","24","Libero dolores nulla harum quo tenetur. ?","Odit ut deserunt dolor id ad. Porro officiis dolorem omnis. Velit omnis enim temporibus quia molestias quasi modi. Et ut libero velit quo quasi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("425","25","Eaque exercitationem optio numquam quaerat et quo magnam. ?","Enim est molestiae minus a facilis. Corporis nemo occaecati sed iusto debitis culpa consequuntur. Beatae autem qui corrupti repellendus voluptatem corrupti officiis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("426","26","A nihil reiciendis repellat qui amet commodi illum. ?","Aut est sit aliquam et. Et rerum consequatur ut quisquam. Eum repellat ut ipsam sed. Quo id ipsam hic in. Ut atque ullam non et veniam impedit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("427","27","Est quam neque ut et. ?","Qui officiis numquam quisquam soluta sunt qui. Non consequatur omnis qui blanditiis eos nesciunt. Soluta eum similique tenetur porro voluptatem ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("428","28","Aut et odio fugiat harum porro. ?","Dolorum porro autem et voluptas qui eum aut. Rem enim velit esse aut. Nostrum doloribus est et ut qui. Fugiat assumenda autem eos nam sed sunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("429","29","Hic deleniti minus sunt ipsam velit facere nam molestiae. ?","Eaque tempore aut animi enim. In eaque doloribus dolore vel. Deserunt maiores doloribus in officia.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("430","30","Nobis provident nihil amet provident. ?","Est a sunt laboriosam ipsa consectetur. Et ad minus qui eos nisi. Corrupti quia tempora numquam id qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("431","31","Eveniet illo quia iste incidunt rem sequi. ?","Ea tenetur ad nostrum dolores est ipsa. Iusto iusto voluptatem provident praesentium quasi. Vero delectus qui inventore sunt suscipit est.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("432","32","Fugit eos repellat deleniti voluptatum est quaerat maiores. ?","Saepe est voluptas maiores laboriosam ut. Omnis ut velit qui qui aut corporis. Praesentium veritatis impedit ut accusamus possimus vero veniam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("433","33","Illo quae quaerat ducimus distinctio consequatur. ?","Ullam animi unde ducimus aut inventore voluptate. Culpa rem repudiandae quo ullam. Expedita veniam doloremque ea quos labore. Velit eos delectus quae facere ut debitis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("434","34","Soluta at et alias. ?","Est ad quos in accusantium quaerat id et. Reiciendis eius corporis ut officiis rem nam. Et recusandae error sapiente quo voluptates et eum. Rerum quasi error eligendi sunt distinctio officiis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("435","35","Ut ducimus autem neque et numquam. ?","Dignissimos dolorum minus facilis quaerat reprehenderit praesentium qui. In nobis facilis fuga quod distinctio molestiae. Voluptatem est sint aut id in excepturi dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("436","36","Rerum atque quaerat pariatur laudantium odit. ?","Sint qui sunt nam culpa facere maxime. Adipisci repellat fugiat ut voluptatum quo enim dolores. Voluptatem harum sit expedita. Veritatis et amet voluptatem et ducimus omnis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("437","37","Sapiente dolorum sint autem eum consequatur et ad. ?","Pariatur laudantium sed ullam sit. Possimus vel est asperiores aliquid consequatur. Non quae laboriosam laboriosam tempore. Debitis distinctio velit quibusdam provident aperiam sed ducimus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("438","38","Inventore porro est corporis aut placeat reprehenderit. ?","Ab aut repellat consequatur. Quod velit facere inventore. Aut id et quae eaque quisquam assumenda et.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("439","39","Ipsum et quisquam quos dolor aut incidunt similique. ?","Iure pariatur corrupti voluptatibus itaque. Harum suscipit nemo culpa. A nostrum eos voluptatem voluptas.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("440","40","Rem excepturi totam aut voluptate assumenda facere id in. ?","Id tenetur odit nostrum id et. Eveniet omnis voluptatem quo deserunt aut soluta et. Quasi neque aut voluptatem. Neque et nisi est sed.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("441","41","Est enim deserunt consequatur et unde. ?","At est dolorum reprehenderit est repellat ut sit. Voluptas qui nulla eveniet aliquam aut quo nihil. Modi et voluptatum quo sit aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("442","42","Deserunt ducimus quia incidunt dolor nobis quaerat iste. ?","Quia ut aut tempora ut. Ipsa temporibus provident maiores maxime suscipit nihil. Dolorem deleniti earum qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("443","43","Quo sapiente aspernatur assumenda corrupti corporis iste dolorem. ?","Quibusdam qui est laudantium quasi. Alias cumque quam pariatur explicabo qui dolore ducimus. Iure odit debitis fugit. Sed ut corrupti nihil qui. Repellat id ducimus omnis dolore maiores nulla.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("444","44","Eum ut qui nisi ut recusandae. ?","Ullam sed libero culpa asperiores consectetur. Occaecati sequi illo aperiam aut et libero. Quod dolorum et itaque et nostrum earum. Nulla et et numquam quam placeat non distinctio ad.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("445","45","Modi sunt sed repellat distinctio in atque. ?","Quos iusto id et labore quasi. Voluptatum nisi iusto quo modi a quae sed. Reiciendis fugiat ex accusamus et assumenda ea voluptas. Voluptatum dignissimos ex dolore vitae aut in non ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("446","46","Pariatur eligendi amet ut quia officiis ipsum. ?","Repellendus et et vero et porro ut et quis. Tempora nesciunt nulla omnis. Mollitia sed incidunt quisquam eveniet. Aut a tempora blanditiis. Assumenda voluptates incidunt aperiam ex illo ipsam.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("447","47","Mollitia repellat consequuntur natus tenetur. ?","Dolores harum laborum libero numquam quibusdam adipisci perspiciatis. Quia dolore adipisci saepe illum consequatur tempora modi quia. Quibusdam incidunt tempora voluptas nisi perspiciatis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("448","48","Vero molestiae exercitationem quibusdam tempore cum mollitia asperiores. ?","Nihil facere velit libero voluptatum voluptas reiciendis et. Iusto consectetur blanditiis aut sequi. Qui expedita id eius qui quidem minima quaerat aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("449","49","Ut neque in quos accusantium. ?","Nostrum et iusto facere autem. Natus ut doloribus repellat fugiat optio ut iure. Illum atque accusamus iusto recusandae blanditiis. Quo eaque enim doloremque. Sapiente nisi quaerat non ut odit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("450","50","Qui est ex impedit tempore nemo. ?","Aliquid ea modi ut in earum magnam. Ea eius ipsum blanditiis. Iusto et veritatis eum quod architecto quod delectus. Amet autem saepe quidem est.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("451","1","Iure maxime dolor aut excepturi maxime. ?","Aperiam occaecati fugiat autem est dolor unde eum praesentium. Reprehenderit ea corporis eveniet ratione totam magni minus. At ipsam rerum sit cupiditate sit et iusto.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("452","2","Veritatis fugit ipsam ad tempore unde aliquid. ?","Unde commodi suscipit quis hic. Assumenda corporis inventore omnis. Saepe nihil mollitia officiis facilis libero aut. Ut corrupti voluptatibus odio sit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("453","3","Nesciunt dolorum dicta et omnis aut. ?","Culpa qui soluta sequi. Consequatur omnis aut laboriosam illum. Excepturi sequi ea omnis. Sit ad numquam similique quis ducimus a.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("454","4","Ut rerum fugiat hic explicabo tempora eveniet recusandae. ?","Quisquam rerum eum rerum eum. Dolorem explicabo a voluptas at qui molestias. Velit molestiae et qui est odio quia. Omnis omnis est fugiat qui voluptatem.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("455","5","Eum et dolorem ea perspiciatis. ?","Saepe est consequatur cupiditate rem exercitationem. Ut sed et qui asperiores hic sed saepe. Non alias consequuntur ut omnis et eaque.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("456","6","Eius dolor suscipit et. ?","Asperiores tempore eos nesciunt voluptate omnis placeat laboriosam. In cum totam aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("457","7","Qui modi libero sint cum sunt. ?","Officia nihil incidunt enim voluptas quo id suscipit. Unde minima architecto ullam eaque eaque eaque id. Labore sed facilis labore voluptatem dignissimos excepturi tempore non.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("458","8","Qui voluptatum voluptas non earum velit. ?","Dolorum qui eligendi repellat vel officiis. Aut aliquam aut quia sequi adipisci maxime neque odit. Illum optio beatae est qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("459","9","Et enim odio qui. ?","Culpa dolores voluptatibus est. Incidunt harum quisquam necessitatibus culpa quia. Ea numquam doloribus sunt excepturi ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("460","10","Sed ut unde voluptas animi dolores ea. ?","Odio autem ratione asperiores nisi sit magnam ad corrupti. Dolorum quia nam voluptatum in. Sunt mollitia et fugiat ut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("461","11","Enim architecto dolor maiores totam praesentium velit sed. ?","Impedit laboriosam temporibus saepe sunt nisi. Blanditiis nobis repellat aut deserunt. Fugit itaque vel non id et porro.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("462","12","Ex dolorem odit laborum illo tempora qui. ?","Qui accusantium autem reprehenderit nihil architecto placeat nam est. Qui excepturi enim placeat. Autem qui est architecto neque. Et aut quam sit enim id ut excepturi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("463","13","Qui repudiandae facere adipisci nobis. ?","Possimus error aut pariatur est. Id impedit consequatur et excepturi fugiat. Nihil aut enim nihil assumenda.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("464","14","Occaecati eius explicabo aliquam velit sunt. ?","Aspernatur tempora magni consequatur et quis. Voluptatem pariatur nisi quis repudiandae voluptatem reprehenderit. Quas et qui placeat voluptatibus voluptate quaerat.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("465","15","Facilis distinctio ab voluptas ducimus. ?","Velit autem quibusdam unde vitae praesentium. Ut dolorem aperiam omnis dignissimos at. Rerum recusandae sed id. Reprehenderit non veniam voluptates ratione soluta aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("466","16","In amet amet saepe voluptatem. ?","Nobis nemo labore accusamus laborum. Quam et modi adipisci voluptatem saepe. Laborum a explicabo beatae ut inventore.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("467","17","Dolorem ullam nisi molestiae velit nostrum mollitia. ?","Sint facilis illum facere ratione est. Rem earum debitis provident dolor. Non ipsam officia possimus a aperiam omnis nostrum nesciunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("468","18","Consequatur voluptas repellendus fugiat deserunt. ?","Mollitia voluptatem minus eum unde odit. Reprehenderit placeat ea iusto beatae. Aut voluptates minima voluptas autem iure modi. Quidem omnis eligendi error aut iusto fuga. Quos cum non sequi iste.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("469","19","Rem qui minima est qui laborum nihil quo. ?","Et modi rerum dolorem. At est beatae eligendi aut dolores. Amet magni quis debitis. Sed ratione corporis quia temporibus rerum recusandae. Qui quis delectus ipsum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("470","20","Et aspernatur autem ullam aut ut doloremque quis. ?","Eius officia fuga voluptatibus vitae incidunt asperiores totam. Eligendi tempora vitae recusandae aliquid. Totam iste iure corporis molestias omnis qui assumenda. Quasi ipsam ea quidem aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("471","21","Molestias qui ullam consequatur repellat. ?","Molestiae placeat illum magni distinctio et nobis. Nesciunt nostrum iure facere quia expedita. Hic sed enim consequatur sunt reiciendis voluptatem. Qui aut qui amet adipisci.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("472","22","Nihil eaque occaecati assumenda quibusdam. ?","Labore doloribus impedit aspernatur porro qui ipsum. Unde in dolorum voluptas earum possimus omnis. Facere fugit quasi aspernatur maxime ut illo velit.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("473","23","Quod voluptatem adipisci qui impedit. ?","Fugit velit sed molestiae hic pariatur. Consectetur nostrum et eum sit aut aut.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("474","24","Cupiditate et enim aut officiis quis. ?","Accusantium eum voluptatem vel dicta. Aliquam laudantium assumenda aut rerum repudiandae sed.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("475","25","Dolor et perspiciatis voluptatibus sed. ?","Ratione architecto ea natus vel deleniti impedit. Cum iure maiores molestiae. Enim amet atque tempora magni non ea. Nemo aut tempora omnis molestiae eum quae amet.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("476","26","Assumenda quia aperiam ipsa delectus labore dolores. ?","Ut praesentium eum iure porro saepe quibusdam neque. Eum eum tempore quas voluptatem est asperiores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("477","27","Libero quia velit accusamus deleniti. ?","Similique aliquam possimus fugiat mollitia. Quam voluptatem natus et sed ipsam et maxime quod. Laudantium esse ratione eius perspiciatis corporis rem ipsum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("478","28","Cupiditate nihil odio similique dolorem. ?","Itaque optio sequi assumenda voluptatem officia consequuntur amet et. Dolore porro occaecati tempore dolor officiis consequatur impedit. Exercitationem est nam debitis enim qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("479","29","Voluptatem blanditiis dicta officiis veniam. ?","Earum excepturi sint omnis qui facilis magni. Consequatur soluta magnam atque unde qui magni vel. Et quis occaecati velit qui.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("480","30","Deserunt est sit modi delectus nisi officiis. ?","Libero accusamus neque tempora placeat. Adipisci culpa beatae natus quo dolor aut voluptate. Est alias quia ipsa aut minima asperiores officia. A est quam occaecati dolores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("481","31","Qui tempore sint pariatur nostrum. ?","Earum quasi dolorem dolorum possimus sit omnis. Mollitia nesciunt omnis ut recusandae error quod et quia. Sit voluptates consequatur illo nostrum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("482","32","Deleniti eveniet iste qui numquam reiciendis. ?","Nostrum est molestias itaque quibusdam est sed. Iusto cupiditate fuga accusantium saepe neque maiores. Dolor dolorem vel laboriosam autem repellendus maiores.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("483","33","Quaerat expedita consequatur sit aut qui ut laborum. ?","Nesciunt necessitatibus ullam debitis aliquid est dolor aut. Quas minima ipsum blanditiis sed consequatur est laborum ut. Quo dolor accusamus laboriosam omnis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("484","34","Dolores earum ut saepe delectus. ?","Voluptatem voluptatibus aliquid vitae est. Asperiores fugit optio autem aut cupiditate quaerat incidunt.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("485","35","Quia necessitatibus ullam ullam alias ut corporis qui. ?","Ducimus sed dolorem omnis ea. Cumque dolores vitae maiores aut quo non officiis vel. Modi sit esse sunt. Et officia et ut nesciunt magnam sed ea.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("486","36","Officia nesciunt ea atque. ?","Sint tempore sint cum quaerat quo quibusdam excepturi. Consectetur aspernatur sit voluptatem et exercitationem aut. Ut deleniti nihil qui reiciendis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("487","37","Non deleniti laboriosam aut qui possimus rem. ?","Ab praesentium eaque aut voluptas qui veritatis qui. Ullam vel non quos ut molestias esse sint. Dolores omnis et aliquam veritatis.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("488","38","Laudantium placeat sed sint veniam. ?","Quam repellat necessitatibus est ut et. Et fugiat animi hic placeat. Temporibus earum facilis delectus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("489","39","Et sequi consectetur officia distinctio. ?","Dolorum est natus animi quasi in quia rerum. Dignissimos voluptatem sint laboriosam sint quo velit. Nisi quia odio exercitationem sed. Voluptate voluptatem velit veritatis aut ratione fuga.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("490","40","Sit eos rerum eum enim et aut. ?","Alias consectetur quia sunt eum iusto saepe recusandae. Occaecati vel in id sit quia laborum. Enim eos esse esse accusantium consequatur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("491","41","Consectetur expedita est exercitationem. ?","Iste recusandae perferendis sint sit. Dolorum dolorem minima numquam labore cum consequatur.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("492","42","Eaque vel magnam qui voluptas. ?","Exercitationem quia maxime omnis magni. Velit vitae corrupti et consequatur est. Accusamus fugit impedit nihil ipsum qui non. Est facere maiores commodi dolores natus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("493","43","Fugit deleniti vitae alias ad deserunt cum. ?","Repellat ratione quaerat quo nesciunt magni veritatis natus. Dolor placeat rem eaque libero.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("494","44","Blanditiis nulla voluptas ea distinctio aliquid nobis repudiandae. ?","Esse repellendus exercitationem ut quae consequatur. Ipsam porro labore iusto dolor libero voluptas magnam. Voluptate veritatis iure vero atque quas ut. Illo quasi in rerum vel.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("495","45","Sunt molestiae dignissimos officia earum. ?","Natus ea sed quis accusantium. Architecto explicabo dolorem molestiae praesentium.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("496","46","Illum totam ducimus est eum. ?","Totam eum eum veniam. Commodi et et quis beatae ducimus iure nostrum quibusdam. Quo tempore deserunt voluptate possimus explicabo in. Exercitationem delectus minus totam ullam sint.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("497","47","Sed cum delectus nihil exercitationem. ?","Quo natus ut fuga eum est consequatur. Omnis laudantium reprehenderit commodi praesentium. Aut error aliquid voluptates est necessitatibus. Voluptatum quo architecto in a.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("498","48","Natus maiores libero corporis facilis. ?","Esse laudantium numquam vero quia non qui. Suscipit ut eveniet cumque officia reprehenderit. Consequatur itaque nihil et harum.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("499","49","Ipsam et et maiores in quia cum officiis. ?","Et reprehenderit ut eius error quis. Distinctio et id sit ut. Quo non perspiciatis cupiditate distinctio nostrum nemo. Maiores optio ducimus nisi.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");
INSERT INTO infix_knowledge_base VALUES("500","50","Et veritatis iusto tempore quis molestiae. ?","Corporis non in perferendis distinctio omnis earum velit. Non numquam provident beatae dicta atque dolores delectus eaque. Eius perspiciatis quidem eaque dolor. Et voluptate hic cumque ducimus.","1","1","2021-04-28 12:42:00","2021-04-28 12:42:00");



DROP TABLE infix_knowledge_base_category;

CREATE TABLE `infix_knowledge_base_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_knowledge_base_category VALUES("1","Pagac PLC","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_knowledge_base_category VALUES("2","Hilpert LLC","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_knowledge_base_category VALUES("3","Casper Ltd","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_knowledge_base_category VALUES("4","Abernathy PLC","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_knowledge_base_category VALUES("5","Ratke Group","1","2021-04-28 12:41:59","2021-04-28 12:41:59");



DROP TABLE infix_languages;

CREATE TABLE `infix_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `native` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_universal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_id` int(10) unsigned DEFAULT '1',
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_languages VALUES("1","English","English","en","19","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");



DROP TABLE infix_module_managers;

CREATE TABLE `infix_module_managers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installed_domain` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated_date` date DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_module_managers VALUES("1","MailSystem","support@spondonit.com","This is MailSystem Module for MailSystem. Thanks for using.","0.1","https://spondonit.com/contact","1619613724","http://localhost/minted","2021-04-28","1","2021-04-28 12:42:04","2021-04-28 12:42:04");
INSERT INTO infix_module_managers VALUES("2","Newsletter","support@spondonit.com","This is Newsletter Module for Newsletter. Thanks for using.","0.1","https://spondonit.com/contact","1619613724","http://localhost/minted","2021-04-28","1","2021-04-28 12:42:04","2021-04-28 12:42:04");
INSERT INTO infix_module_managers VALUES("3","Pages","support@spondonit.com","This is Pages Module for Pages. Thanks for using.","0.1","https://spondonit.com/contact","1619613724","http://localhost/minted","2021-04-28","1","2021-04-28 12:42:04","2021-04-28 12:42:04");
INSERT INTO infix_module_managers VALUES("4","Refund","support@spondonit.com","This is Refund Module for Refund. Thanks for using.","0.1","https://spondonit.com/contact","1619613724","http://localhost/minted","2021-04-28","1","2021-04-28 12:42:04","2021-04-28 12:42:04");
INSERT INTO infix_module_managers VALUES("5","Systemsetting","support@spondonit.com","This is Systemsetting Module for Systemsetting. Thanks for using.","0.1","https://spondonit.com/contact","1619613724","http://localhost/minted","2021-04-28","1","2021-04-28 12:42:04","2021-04-28 12:42:04");
INSERT INTO infix_module_managers VALUES("6","Tax","support@spondonit.com","This is Tax Module for Tax. Thanks for using.","0.1","https://spondonit.com/contact","1619613724","http://localhost/minted","2021-04-28","1","2021-04-28 12:42:04","2021-04-28 12:42:04");
INSERT INTO infix_module_managers VALUES("7","Ticket","support@spondonit.com","This is Ticket Module for Ticket. Thanks for using.","0.1","https://spondonit.com/contact","1619613724","http://localhost/minted","2021-04-28","1","2021-04-28 12:42:04","2021-04-28 12:42:04");
INSERT INTO infix_module_managers VALUES("8","HumanResource","support@spondonit.com","This is HumanResource Module for HumanResource. Thanks for using.","0.1","https://spondonit.com/contact","1619613724","http://localhost/minted","2021-04-28","1","2021-04-28 12:42:04","2021-04-28 12:42:04");
INSERT INTO infix_module_managers VALUES("9","KnowledgeBase","support@spondonit.com","This is KnowledgeBase Module for KnowledgeBase. Thanks for using.","0.1","https://spondonit.com/contact","1619613724","http://localhost/minted","2021-04-28","1","2021-04-28 12:42:04","2021-04-28 12:42:04");



DROP TABLE infix_newsletter;

CREATE TABLE `infix_newsletter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE infix_payment_gateway_settings;

CREATE TABLE `infix_payment_gateway_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `env_terms` longtext COLLATE utf8mb4_unicode_ci,
  `is_config_required` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` tinyint(1) NOT NULL DEFAULT '1',
  `gateway_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_configur` longtext COLLATE utf8mb4_unicode_ci,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_payment_gateway_settings VALUES("1","public/no_logo.png","PAYPAL_CLIENT_ID:Afth8tuZq5oNpy5VCaQlmuelnB5egFAKHrNwg5aka_tlRC9YpUec9I6IoRc3CNNNd5GsYgyR0JGpF-X6,PAYPAL_CLIENT_SECRET:EKXHVM_WbMqw5sMj1hI4kEe94_w5Ff_-WGHqE3zm-a5I4Dga-2ga7vLZbaA-iI12lWLhBgtMr9XLRXwc,PAYPAL_CURRENCY:USD,PAYPAL_MIN_PAYOUT:50,PAYPAL_MODE:sandbox,","https://developer.paypal.com/developer/applications/","1","PayPal","","1","1","1","","");
INSERT INTO infix_payment_gateway_settings VALUES("2","public/no_logo.png","STRIPE_KEY:77fgd4g5erer8,STRIPE_SECRET:fsdfwerwef541f7sdfs6d,STRIPE_MIN_PAYOUT:50,","https://dashboard.stripe.com/dashboard","1","Stripe","","0","1","1","","");
INSERT INTO infix_payment_gateway_settings VALUES("3","public/no_logo.png","RAZOR_KEY:s45df67sdwf,RAZOR_SECRET:dsf7s7ef9w6e4f5689,RAZORPAY_MIN_PAYOUT:50,","https://dashboard.razorpay.com/app/config","1","Razorpay","","1","1","1","","");
INSERT INTO infix_payment_gateway_settings VALUES("4","public/no_logo.png","BANK_NAME:Dhaka_Bank,BRANCH_NAME:Dhaka,ACCOUNT_NUMBER:64687964,ACCOUNT_HOLDER:Digital_marketplace,BANK_MIN_PAYOUT:50,","1","1","Bank","","1","1","1","","");



DROP TABLE infix_privacy_policies;

CREATE TABLE `infix_privacy_policies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heading_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_privacy_policies VALUES("1","Privacy Policy","Lorem Ipsum is simply dummy text of the printing and typesetting industry.","Lorem Ipsum is simply dummy text of the printing and typesetting industry.","Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.","Modules/Pages/Assets/image/1.png","0","1","1","","");



DROP TABLE infix_profile_settings;

CREATE TABLE `infix_profile_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heading1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text2` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading3` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_profile_settings VALUES("1","Personal Information","We do not sell or share your details without your permission. Find out more in our Privacy Policy.","Change Password","Change your password..","Billing Information","We do not sell or share your details without your permission. Find out more in our Privacy Policy.","1","1","1","","");



DROP TABLE infix_seo_settings;

CREATE TABLE `infix_seo_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_seo_settings VALUES("1","Infix Digital Market Place","Infix Digital Market Place","Infix","Thousands of Products are waiting in Infix Digital Market Place","Thousands of Products, Infix, Digital Market Place","1","1","1","","");



DROP TABLE infix_styles;

CREATE TABLE `infix_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_main_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_infix_style` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `white` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `black` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar_bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barchart1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barchart2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcharttextcolor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcharttextfamily` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `areachartlinecolor1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `areachartlinecolor2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboardbackground` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_styles VALUES("1","Default","style.css","infix.css","#415094","#7c32ff","#222222","#828bb2","#ffffff","#000000","#e7ecff","#8a33f8","#f25278","#415094","\"poppins\", sans-serif","rgba(124, 50, 255, 0.5)","rgba(242, 82, 120, 0.5)","","1","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_styles VALUES("2","Sky Blue","blue_version/style.css","blue_version/infix.css","#415094","#2c7be5","#222222","#828bb2","#ffffff","#000000","#e7ecff","#8a33f8","#f25278","#415094","HKGroteskRegular","rgba(124, 50, 255, 0.5)","rgba(242, 82, 120, 0.5)","#e7ecff","1","0","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_styles VALUES("3","Orange","orange_version/style.css","orange_version/infix.css","#415094","#f2662f","#222222","#828bb2","#ffffff","#000000","#e7ecff","#415094","#f2662f","#f2662f","\"Cerebri Sans\", Helvetica, Arial, sans-serif","#415094","#f25278","#e7ecff","1","0","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_styles VALUES("4","Paste","paste_version/style.css","paste_version/infix.css","#415094","#05dce9","#222222","#828bb2","#ffffff","#000000","#e7ecff","#415094","#05dce9","#05dce9","\"Cerebri Sans\", Helvetica, Arial, sans-serif","#415094","#05dce9","#e7ecff","1","0","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_styles VALUES("5","Dark Blue","darkblue_version/style.css","darkblue_version/infix.css","#415094","#4046f4","#222222","#828bb2","#ffffff","#000000","#e7ecff","#415094","#4046f4","#4046f4","\"Cerebri Sans\", Helvetica, Arial, sans-serif","#415094","#4046f4","#e7ecff","1","0","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_styles VALUES("6","Pink","pink_version/style.css","pink_version/infix.css","#415094","#ff1e6d","#222222","#828bb2","#ffffff","#000000","#e7ecff","#415094","#ff1e6d","#ff1e6d","\"Cerebri Sans\", Helvetica, Arial, sans-serif","#415094","#ff1e6d","#e7ecff","1","0","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_styles VALUES("7","Lawn Green","lawngreen_version/style.css","lawngreen_version/infix.css","#415094","#03e396","#222222","#828bb2","#ffffff","#000000","#e7ecff","#415094","#03e396","#03e396","\"Cerebri Sans\", Helvetica, Arial, sans-serif","#415094","#03e396","#e7ecff","1","0","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_styles VALUES("8","Dark","dark_version/style.css","dark_version/infix.css","#000","#000","#222222","#000","#ffffff","#000000","#dcdcdf","#000","#000","#000","\"Cerebri Sans\", Helvetica, Arial, sans-serif","#000","#222","#e7ecff","1","0","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");



DROP TABLE infix_terms_conditions;

CREATE TABLE `infix_terms_conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heading_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_terms_conditions VALUES("1","Terms Conditions","Lorem Ipsum is simply dummy text of the printing and typesetting industry.","Lorem Ipsum is simply dummy text of the printing and typesetting industry.","Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.","Modules/Pages/Assets/image/1.png","0","1","1","","");



DROP TABLE infix_ticket_categories;

CREATE TABLE `infix_ticket_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_ticket_categories VALUES("1","Customer Service","1","","");
INSERT INTO infix_ticket_categories VALUES("2","Buy Item","1","","");
INSERT INTO infix_ticket_categories VALUES("3","Research and Development","1","","");



DROP TABLE infix_ticket_comments;

CREATE TABLE `infix_ticket_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `ticket_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_comments_0012` (`user_id`),
  KEY `ticket_comments_0093` (`ticket_id`),
  KEY `ticket_comments_0033` (`client_id`),
  CONSTRAINT `ticket_comments_0012` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_comments_0033` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ticket_comments_0093` FOREIGN KEY (`ticket_id`) REFERENCES `infix_tickets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE infix_ticket_priorities;

CREATE TABLE `infix_ticket_priorities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_ticket_priorities VALUES("1","Normal","","");
INSERT INTO infix_ticket_priorities VALUES("2","Low","","");
INSERT INTO infix_ticket_priorities VALUES("3","Critical","","");
INSERT INTO infix_ticket_priorities VALUES("4","Urgent","","");



DROP TABLE infix_tickets;

CREATE TABLE `infix_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_agent` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `priority_id` int(10) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `infix_tickets_0001` (`user_id`),
  KEY `infix_tickets_008` (`user_agent`),
  KEY `infix_tickets_002` (`category_id`),
  KEY `infix_tickets_003` (`priority_id`),
  KEY `infix_tickets_00444` (`department_id`),
  CONSTRAINT `infix_tickets_0001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `infix_tickets_002` FOREIGN KEY (`category_id`) REFERENCES `infix_ticket_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `infix_tickets_003` FOREIGN KEY (`priority_id`) REFERENCES `infix_ticket_priorities` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `infix_tickets_00444` FOREIGN KEY (`department_id`) REFERENCES `infix_departments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `infix_tickets_008` FOREIGN KEY (`user_agent`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE infix_time_zones;

CREATE TABLE `infix_time_zones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO infix_time_zones VALUES("1","AD","Europe/Andorra","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("2","AE","Asia/Dubai","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("3","AF","Asia/Kabul","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("4","AG","America/Antigua","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("5","AI","America/Anguilla","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("6","AL","Europe/Tirane","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("7","AM","Asia/Yerevan","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("8","AO","Africa/Luanda","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("9","AQ","Antarctica/McMurdo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("10","AQ","Antarctica/Casey","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("11","AQ","Antarctica/Davis","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("12","AQ","Antarctica/DumontDUrville","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("13","AQ","Antarctica/Mawson","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("14","AQ","Antarctica/Palmer","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("15","AQ","Antarctica/Rothera","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("16","AQ","Antarctica/Syowa","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("17","AQ","Antarctica/Troll","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("18","AQ","Antarctica/Vostok","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("19","AR","America/Argentina/Buenos_Aires","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("20","AR","America/Argentina/Cordoba","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("21","AR","America/Argentina/Salta","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("22","AR","America/Argentina/Jujuy","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("23","AR","America/Argentina/Tucuman","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("24","AR","America/Argentina/Catamarca","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("25","AR","America/Argentina/La_Rioja","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("26","AR","America/Argentina/San_Juan","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("27","AR","America/Argentina/Mendoza","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("28","AR","America/Argentina/San_Luis","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("29","AR","America/Argentina/Rio_Gallegos","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("30","AR","America/Argentina/Ushuaia","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("31","AS","Pacific/Pago_Pago","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("32","AT","Europe/Vienna","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("33","AU","Australia/Lord_Howe","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("34","AU","Antarctica/Macquarie","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("35","AU","Australia/Hobart","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("36","AU","Australia/Currie","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("37","AU","Australia/Melbourne","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("38","AU","Australia/Sydney","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("39","AU","Australia/Broken_Hill","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("40","AU","Australia/Brisbane","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("41","AU","Australia/Lindeman","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("42","AU","Australia/Adelaide","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("43","AU","Australia/Darwin","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("44","AU","Australia/Perth","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("45","AU","Australia/Eucla","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("46","AW","America/Aruba","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("47","AX","Europe/Mariehamn","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("48","AZ","Asia/Baku","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("49","BA","Europe/Sarajevo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("50","BB","America/Barbados","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("51","BD","Asia/Dhaka","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("52","BE","Europe/Brussels","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("53","BF","Africa/Ouagadougou","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("54","BG","Europe/Sofia","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("55","BH","Asia/Bahrain","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("56","BI","Africa/Bujumbura","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("57","BJ","Africa/Porto-Novo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("58","BL","America/St_Barthelemy","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("59","BM","Atlantic/Bermuda","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("60","BN","Asia/Brunei","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("61","BO","America/La_Paz","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("62","BQ","America/Kralendijk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("63","BR","America/Noronha","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("64","BR","America/Belem","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("65","BR","America/Fortaleza","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("66","BR","America/Recife","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("67","BR","America/Araguaina","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("68","BR","America/Maceio","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("69","BR","America/Bahia","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("70","BR","America/Sao_Paulo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("71","BR","America/Campo_Grande","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("72","BR","America/Cuiaba","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("73","BR","America/Santarem","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("74","BR","America/Porto_Velho","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("75","BR","America/Boa_Vista","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("76","BR","America/Manaus","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("77","BR","America/Eirunepe","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("78","BR","America/Rio_Branco","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("79","BS","America/Nassau","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("80","BT","Asia/Thimphu","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("81","BW","Africa/Gaborone","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("82","BY","Europe/Minsk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("83","BZ","America/Belize","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("84","CA","America/St_Johns","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("85","CA","America/Halifax","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("86","CA","America/Glace_Bay","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("87","CA","America/Moncton","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("88","CA","America/Goose_Bay","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("89","CA","America/Blanc-Sablon","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("90","CA","America/Toronto","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("91","CA","America/Nipigon","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("92","CA","America/Thunder_Bay","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("93","CA","America/Iqaluit","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("94","CA","America/Pangnirtung","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("95","CA","America/Atikokan","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("96","CA","America/Winnipeg","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("97","CA","America/Rainy_River","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("98","CA","America/Resolute","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("99","CA","America/Rankin_Inlet","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("100","CA","America/Regina","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("101","CA","America/Swift_Current","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("102","CA","America/Edmonton","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("103","CA","America/Cambridge_Bay","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("104","CA","America/Yellowknife","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("105","CA","America/Inuvik","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("106","CA","America/Creston","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("107","CA","America/Dawson_Creek","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("108","CA","America/Fort_Nelson","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("109","CA","America/Vancouver","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("110","CA","America/Whitehorse","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("111","CA","America/Dawson","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("112","CC","Indian/Cocos","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("113","CD","Africa/Kinshasa","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("114","CD","Africa/Lubumbashi","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("115","CF","Africa/Bangui","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("116","CG","Africa/Brazzaville","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("117","CH","Europe/Zurich","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("118","CI","Africa/Abidjan","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("119","CK","Pacific/Rarotonga","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("120","CL","America/Santiago","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("121","CL","America/Punta_Arenas","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("122","CL","Pacific/Easter","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("123","CM","Africa/Douala","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("124","CN","Asia/Shanghai","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("125","CN","Asia/Urumqi","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("126","CO","America/Bogota","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("127","CR","America/Costa_Rica","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("128","CU","America/Havana","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("129","CV","Atlantic/Cape_Verde","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("130","CW","America/Curacao","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("131","CX","Indian/Christmas","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("132","CY","Asia/Nicosia","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("133","CY","Asia/Famagusta","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("134","CZ","Europe/Prague","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("135","DE","Europe/Berlin","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("136","DE","Europe/Busingen","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("137","DJ","Africa/Djibouti","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("138","DK","Europe/Copenhagen","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("139","DM","America/Dominica","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("140","DO","America/Santo_Domingo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("141","DZ","Africa/Algiers","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("142","EC","America/Guayaquil","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("143","EC","Pacific/Galapagos","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("144","EE","Europe/Tallinn","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("145","EG","Africa/Cairo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("146","EH","Africa/El_Aaiun","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("147","ER","Africa/Asmara","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("148","ES","Europe/Madrid","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("149","ES","Africa/Ceuta","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("150","ES","Atlantic/Canary","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("151","ET","Africa/Addis_Ababa","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("152","FI","Europe/Helsinki","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("153","FJ","Pacific/Fiji","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("154","FK","Atlantic/Stanley","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("155","FM","Pacific/Chuuk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("156","FM","Pacific/Pohnpei","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("157","FM","Pacific/Kosrae","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("158","FO","Atlantic/Faroe","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("159","FR","Europe/Paris","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("160","GA","Africa/Libreville","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("161","GB","Europe/London","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("162","GD","America/Grenada","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("163","GE","Asia/Tbilisi","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("164","GF","America/Cayenne","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("165","GG","Europe/Guernsey","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("166","GH","Africa/Accra","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("167","GI","Europe/Gibraltar","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("168","GL","America/Godthab","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("169","GL","America/Danmarkshavn","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("170","GL","America/Scoresbysund","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("171","GL","America/Thule","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("172","GM","Africa/Banjul","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("173","GN","Africa/Conakry","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("174","GP","America/Guadeloupe","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("175","GQ","Africa/Malabo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("176","GR","Europe/Athens","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("177","GS","Atlantic/South_Georgia","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("178","GT","America/Guatemala","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("179","GU","Pacific/Guam","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("180","GW","Africa/Bissau","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("181","GY","America/Guyana","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("182","HK","Asia/Hong_Kong","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("183","HN","America/Tegucigalpa","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("184","HR","Europe/Zagreb","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("185","HT","America/Port-au-Prince","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("186","HU","Europe/Budapest","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("187","ID","Asia/Jakarta","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("188","ID","Asia/Pontianak","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("189","ID","Asia/Makassar","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("190","ID","Asia/Jayapura","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("191","IE","Europe/Dublin","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("192","IL","Asia/Jerusalem","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("193","IM","Europe/Isle_of_Man","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("194","IN","Asia/Kolkata","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("195","IO","Indian/Chagos","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("196","IQ","Asia/Baghdad","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("197","IR","Asia/Tehran","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("198","IS","Atlantic/Reykjavik","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("199","IT","Europe/Rome","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("200","JE","Europe/Jersey","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("201","JM","America/Jamaica","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("202","JO","Asia/Amman","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("203","JP","Asia/Tokyo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("204","KE","Africa/Nairobi","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("205","KG","Asia/Bishkek","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("206","KH","Asia/Phnom_Penh","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("207","KI","Pacific/Tarawa","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("208","KI","Pacific/Enderbury","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("209","KI","Pacific/Kiritimati","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("210","KM","Indian/Comoro","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("211","KN","America/St_Kitts","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("212","KP","Asia/Pyongyang","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("213","KR","Asia/Seoul","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("214","KW","Asia/Kuwait","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("215","KY","America/Cayman","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("216","KZ","Asia/Almaty","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("217","KZ","Asia/Qyzylorda","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("218","KZ","Asia/Aqtobe","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("219","KZ","Asia/Aqtau","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("220","KZ","Asia/Atyrau","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("221","KZ","Asia/Oral","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("222","LA","Asia/Vientiane","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("223","LB","Asia/Beirut","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("224","LC","America/St_Lucia","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("225","LI","Europe/Vaduz","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("226","LK","Asia/Colombo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("227","LR","Africa/Monrovia","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("228","LS","Africa/Maseru","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("229","LT","Europe/Vilnius","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("230","LU","Europe/Luxembourg","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("231","LV","Europe/Riga","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("232","LY","Africa/Tripoli","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("233","MA","Africa/Casablanca","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("234","MC","Europe/Monaco","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("235","MD","Europe/Chisinau","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("236","ME","Europe/Podgorica","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("237","MF","America/Marigot","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("238","MG","Indian/Antananarivo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("239","MH","Pacific/Majuro","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("240","MH","Pacific/Kwajalein","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("241","MK","Europe/Skopje","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("242","ML","Africa/Bamako","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("243","MM","Asia/Yangon","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("244","MN","Asia/Ulaanbaatar","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("245","MN","Asia/Hovd","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("246","MN","Asia/Choibalsan","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("247","MO","Asia/Macau","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("248","MP","Pacific/Saipan","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("249","MQ","America/Martinique","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("250","MR","Africa/Nouakchott","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("251","MS","America/Montserrat","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("252","MT","Europe/Malta","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("253","MU","Indian/Mauritius","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("254","MV","Indian/Maldives","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("255","MW","Africa/Blantyre","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("256","MX","America/Mexico_City","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("257","MX","America/Cancun","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("258","MX","America/Merida","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("259","MX","America/Monterrey","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("260","MX","America/Matamoros","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("261","MX","America/Mazatlan","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("262","MX","America/Chihuahua","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("263","MX","America/Ojinaga","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("264","MX","America/Hermosillo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("265","MX","America/Tijuana","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("266","MX","America/Bahia_Banderas","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("267","MY","Asia/Kuala_Lumpur","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("268","MY","Asia/Kuching","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("269","MZ","Africa/Maputo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("270","NA","Africa/Windhoek","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("271","NC","Pacific/Noumea","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("272","NE","Africa/Niamey","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("273","NF","Pacific/Norfolk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("274","NG","Africa/Lagos","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("275","NI","America/Managua","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("276","NL","Europe/Amsterdam","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("277","NO","Europe/Oslo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("278","NP","Asia/Kathmandu","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("279","NR","Pacific/Nauru","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("280","NU","Pacific/Niue","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("281","NZ","Pacific/Auckland","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("282","NZ","Pacific/Chatham","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("283","OM","Asia/Muscat","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("284","PA","America/Panama","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("285","PE","America/Lima","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("286","PF","Pacific/Tahiti","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("287","PF","Pacific/Marquesas","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("288","PF","Pacific/Gambier","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("289","PG","Pacific/Port_Moresby","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("290","PG","Pacific/Bougainville","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("291","PH","Asia/Manila","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("292","PK","Asia/Karachi","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("293","PL","Europe/Warsaw","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("294","PM","America/Miquelon","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("295","PN","Pacific/Pitcairn","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("296","PR","America/Puerto_Rico","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("297","PS","Asia/Gaza","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("298","PS","Asia/Hebron","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("299","PT","Europe/Lisbon","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("300","PT","Atlantic/Madeira","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("301","PT","Atlantic/Azores","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("302","PW","Pacific/Palau","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("303","PY","America/Asuncion","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("304","QA","Asia/Qatar","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("305","RE","Indian/Reunion","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("306","RO","Europe/Bucharest","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("307","RS","Europe/Belgrade","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("308","RU","Europe/Kaliningrad","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("309","RU","Europe/Moscow","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("310","RU","Europe/Simferopol","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("311","RU","Europe/Volgograd","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("312","RU","Europe/Kirov","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("313","RU","Europe/Astrakhan","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("314","RU","Europe/Saratov","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("315","RU","Europe/Ulyanovsk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("316","RU","Europe/Samara","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("317","RU","Asia/Yekaterinburg","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("318","RU","Asia/Omsk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("319","RU","Asia/Novosibirsk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("320","RU","Asia/Barnaul","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("321","RU","Asia/Tomsk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("322","RU","Asia/Novokuznetsk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("323","RU","Asia/Krasnoyarsk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("324","RU","Asia/Irkutsk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("325","RU","Asia/Chita","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("326","RU","Asia/Yakutsk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("327","RU","Asia/Khandyga","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("328","RU","Asia/Vladivostok","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("329","RU","Asia/Ust-Nera","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("330","RU","Asia/Magadan","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("331","RU","Asia/Sakhalin","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("332","RU","Asia/Srednekolymsk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("333","RU","Asia/Kamchatka","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("334","RU","Asia/Anadyr","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("335","RW","Africa/Kigali","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("336","SA","Asia/Riyadh","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("337","SB","Pacific/Guadalcanal","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("338","SC","Indian/Mahe","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("339","SD","Africa/Khartoum","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("340","SE","Europe/Stockholm","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("341","SG","Asia/Singapore","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("342","SH","Atlantic/St_Helena","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("343","SI","Europe/Ljubljana","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("344","SJ","Arctic/Longyearbyen","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("345","SK","Europe/Bratislava","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("346","SL","Africa/Freetown","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("347","SM","Europe/San_Marino","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("348","SN","Africa/Dakar","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("349","SO","Africa/Mogadishu","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("350","SR","America/Paramaribo","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("351","SS","Africa/Juba","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("352","ST","Africa/Sao_Tome","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("353","SV","America/El_Salvador","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("354","SX","America/Lower_Princes","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("355","SY","Asia/Damascus","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("356","SZ","Africa/Mbabane","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("357","TC","America/Grand_Turk","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("358","TD","Africa/Ndjamena","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("359","TF","Indian/Kerguelen","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("360","TG","Africa/Lome","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("361","TH","Asia/Bangkok","1","1","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO infix_time_zones VALUES("362","TJ","Asia/Dushanbe","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("363","TK","Pacific/Fakaofo","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("364","TL","Asia/Dili","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("365","TM","Asia/Ashgabat","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("366","TN","Africa/Tunis","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("367","TO","Pacific/Tongatapu","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("368","TR","Europe/Istanbul","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("369","TT","America/Port_of_Spain","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("370","TV","Pacific/Funafuti","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("371","TW","Asia/Taipei","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("372","TZ","Africa/Dar_es_Salaam","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("373","UA","Europe/Kiev","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("374","UA","Europe/Uzhgorod","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("375","UA","Europe/Zaporozhye","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("376","UG","Africa/Kampala","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("377","UM","Pacific/Midway","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("378","UM","Pacific/Wake","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("379","US","America/New_York","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("380","US","America/Detroit","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("381","US","America/Kentucky/Louisville","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("382","US","America/Kentucky/Monticello","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("383","US","America/Indiana/Indianapolis","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("384","US","America/Indiana/Vincennes","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("385","US","America/Indiana/Winamac","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("386","US","America/Indiana/Marengo","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("387","US","America/Indiana/Petersburg","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("388","US","America/Indiana/Vevay","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("389","US","America/Chicago","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("390","US","America/Indiana/Tell_City","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("391","US","America/Indiana/Knox","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("392","US","America/Menominee","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("393","US","America/North_Dakota/Center","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("394","US","America/North_Dakota/New_Salem","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("395","US","America/North_Dakota/Beulah","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("396","US","America/Denver","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("397","US","America/Boise","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("398","US","America/Phoenix","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("399","US","America/Los_Angeles","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("400","US","America/Anchorage","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("401","US","America/Juneau","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("402","US","America/Sitka","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("403","US","America/Metlakatla","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("404","US","America/Yakutat","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("405","US","America/Nome","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("406","US","America/Adak","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("407","US","Pacific/Honolulu","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("408","UY","America/Montevideo","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("409","UZ","Asia/Samarkand","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("410","UZ","Asia/Tashkent","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("411","VA","Europe/Vatican","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("412","VC","America/St_Vincent","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("413","VE","America/Caracas","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("414","VG","America/Tortola","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("415","VI","America/St_Thomas","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("416","VN","Asia/Ho_Chi_Minh","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("417","VU","Pacific/Efate","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("418","WF","Pacific/Wallis","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("419","WS","Pacific/Apia","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("420","YE","Asia/Aden","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("421","YT","Indian/Mayotte","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("422","ZA","Africa/Johannesburg","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("423","ZM","Africa/Lusaka","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");
INSERT INTO infix_time_zones VALUES("424","ZW","Africa/Harare","1","1","1","2021-04-28 12:41:59","2021-04-28 12:41:59");



DROP TABLE item_attributes;

CREATE TABLE `item_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `values` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE item_categories;

CREATE TABLE `item_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `up_permission` tinyint(1) DEFAULT NULL,
  `file_permission` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `recommended_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended_price_extended` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended_price_commercial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_menu` int(11) DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO item_categories VALUES("1","Wordpress","wordpress","this is Wordpress","1","1","1","45-67","150-170","75-90","1","1","","");
INSERT INTO item_categories VALUES("2","Hosting","hosting","this is HTML","2","1","9","45-67","150-170","75-90","1","1","","");
INSERT INTO item_categories VALUES("3","HTML","html","this is HTML","1","1","3","45-67","150-170","75-90","1","1","","");
INSERT INTO item_categories VALUES("4","Marketing","marketing","this is Marketing","1","1","4","45-67","150-170","75-90","1","1","","");
INSERT INTO item_categories VALUES("5","CMS","cms","this is CMS","1","1","5","45-67","150-170","75-90","1","1","","");
INSERT INTO item_categories VALUES("6","eCommerce","ecommerce","this is eCommerce","1","1","6","45-67","150-170","75-90","1","1","","");
INSERT INTO item_categories VALUES("7","Muse","muse","this is Muse","1","2","7","45-67","150-170","75-90","1","1","","");
INSERT INTO item_categories VALUES("8","UI Design","ui_design","this is UI Design","2","2","8","45-67","150-170","75-90","1","1","","");
INSERT INTO item_categories VALUES("9","Plugins","plugins","this is Plugins","2","1","2","45-67","150-170","75-90","1","1","","");
INSERT INTO item_categories VALUES("10","Logo Maker","logo_maker","this is Logo Maker","2","1","10","45-67","150-170","75-90","1","1","","");



DROP TABLE item_fees;

CREATE TABLE `item_fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned DEFAULT NULL,
  `re_fee` double(10,2) NOT NULL,
  `ex_fee` double(10,2) NOT NULL,
  `co_fee` double(10,2) NOT NULL,
  `support_fee` double(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_fees_007` (`category_id`),
  CONSTRAINT `item_fees_007` FOREIGN KEY (`category_id`) REFERENCES `item_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO item_fees VALUES("1","1","15.00","68.00","23.00","1.00","1","2021-04-28 12:42:02","2021-04-28 12:42:02");
INSERT INTO item_fees VALUES("2","2","15.00","50.00","20.00","10.00","1","2021-04-28 12:42:02","2021-04-28 12:42:02");
INSERT INTO item_fees VALUES("3","3","6.00","39.00","21.00","2.00","1","2021-04-28 12:42:02","2021-04-28 12:42:02");
INSERT INTO item_fees VALUES("4","4","8.00","30.00","26.00","6.00","1","2021-04-28 12:42:02","2021-04-28 12:42:02");
INSERT INTO item_fees VALUES("5","5","8.00","70.00","21.00","10.00","1","2021-04-28 12:42:02","2021-04-28 12:42:02");
INSERT INTO item_fees VALUES("6","6","6.00","61.00","24.00","10.00","1","2021-04-28 12:42:02","2021-04-28 12:42:02");
INSERT INTO item_fees VALUES("7","7","9.00","77.00","22.00","10.00","1","2021-04-28 12:42:02","2021-04-28 12:42:02");
INSERT INTO item_fees VALUES("8","8","4.00","59.00","20.00","6.00","1","2021-04-28 12:42:02","2021-04-28 12:42:02");
INSERT INTO item_fees VALUES("9","9","1.00","43.00","30.00","3.00","1","2021-04-28 12:42:02","2021-04-28 12:42:02");
INSERT INTO item_fees VALUES("10","10","7.00","36.00","22.00","1.00","1","2021-04-28 12:42:02","2021-04-28 12:42:02");



DROP TABLE item_images;

CREATE TABLE `item_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci,
  `image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_images_fk0` (`item_id`),
  CONSTRAINT `item_images_fk0` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE item_orders;

CREATE TABLE `item_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `discount` double(10,2) NOT NULL,
  `item` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `download_status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_0001` (`order_id`),
  KEY `order_item` (`item_id`),
  KEY `author_id_or` (`author_id`),
  KEY `order_user_item` (`user_id`),
  CONSTRAINT `author_id_or` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_0001` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_user_item` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE item_payments;

CREATE TABLE `item_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_payments_001` (`user_id`),
  KEY `item_payments_0002` (`item_id`),
  CONSTRAINT `item_payments_0002` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_payments_001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE item_previews;

CREATE TABLE `item_previews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `sub_category_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature1` text COLLATE utf8mb4_unicode_ci,
  `feature2` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `resolution` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_preview` text COLLATE utf8mb4_unicode_ci,
  `screen_shot` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compatible_browsers` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compatible_with` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `framework` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `columns` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demo_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `Re_item` double(10,2) DEFAULT NULL,
  `Re_buyer` double(10,2) DEFAULT NULL,
  `Reg_total` double(10,2) DEFAULT NULL,
  `E_item` double(10,2) DEFAULT NULL,
  `E_buyer` double(10,2) DEFAULT NULL,
  `Ex_total` double(10,2) DEFAULT NULL,
  `C_item` double(10,2) DEFAULT NULL,
  `C_buyer` double(10,2) DEFAULT NULL,
  `C_total` double(10,2) DEFAULT NULL,
  `user_msg` longtext COLLATE utf8mb4_unicode_ci,
  `sell` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `rate` double(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_upload` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_preview_000199` (`item_id`),
  KEY `items_preview_0001` (`user_id`),
  KEY `items_preview_0002` (`category_id`),
  KEY `items_preview_0003` (`sub_category_id`),
  CONSTRAINT `items_preview_0001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `items_preview_000199` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `items_preview_0002` FOREIGN KEY (`category_id`) REFERENCES `item_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `items_preview_0003` FOREIGN KEY (`sub_category_id`) REFERENCES `item_sub_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE item_sub_categories;

CREATE TABLE `item_sub_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_category_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_menu` int(11) DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_sub_categories_fk0` (`item_category_id`),
  CONSTRAINT `item_sub_categories_fk0` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO item_sub_categories VALUES("1","1","WordPress","wordpress","this is WordPress","1","1","","");
INSERT INTO item_sub_categories VALUES("2","1","Advertising","advertising","this is Advertising","1","1","","");
INSERT INTO item_sub_categories VALUES("3","1","SEO","seo","this is SEO","1","1","","");
INSERT INTO item_sub_categories VALUES("4","1","Media","media","this is Media","1","1","","");
INSERT INTO item_sub_categories VALUES("5","1","Utilities","utilities","this is Utilities","1","1","","");
INSERT INTO item_sub_categories VALUES("6","3","Creative","creative","this is Creative","1","1","","");
INSERT INTO item_sub_categories VALUES("7","3","Canvas","canvas","this is Canvas","1","1","","");
INSERT INTO item_sub_categories VALUES("8","3","Form","form","this is Form","1","1","","");
INSERT INTO item_sub_categories VALUES("9","3","Web Template","web_template","this is Web Template","1","1","","");
INSERT INTO item_sub_categories VALUES("10","3","Email Template","email_template","this is Email Template","1","1","","");
INSERT INTO item_sub_categories VALUES("11","4","Email Template","email_template","this is Email Template","1","1","","");
INSERT INTO item_sub_categories VALUES("12","5","Drupal","drupal","this is Drupal","1","1","","");
INSERT INTO item_sub_categories VALUES("13","6","Magneto","magneto","this is Magneto","1","1","","");
INSERT INTO item_sub_categories VALUES("14","7","Corporate","corporate","this is Corporate","1","1","","");
INSERT INTO item_sub_categories VALUES("15","8","PSD Template","psd_template","this is UI Design","1","1","","");
INSERT INTO item_sub_categories VALUES("16","10","Business Logo Maker","business_logo_maker","this is Business Logo Maker","1","1","","");



DROP TABLE item_supports;

CREATE TABLE `item_supports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sort_description` text COLLATE utf8mb4_unicode_ci,
  `long_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO item_supports VALUES("1","<p>Item support includes</p>

                <ul>
                    <li>
                    <p>Not All Blank Cassettes Are Created Equal</p>
                    </li>
                    <li>
                    <p>How To Protect Your Computer Wery Useful Tips</p>
                    </li>
                    <li>
                    <p>Help Finding Information Online</p>
                    </li>
                    <li>
                    <p>Video Games Playing With Imagination</p>
                    </li>
                    <li>
                    <p>5 Reasons To Choose A Notebook Over A Computer</p>
                    </li>
                    <li>
                    <p>Fta Keys</p>
                    </li>
                    <li>
                    <p>3 Simple Ways To Save A Bunch Of Money When Buying</p>
                    </li>
                    <li>
                    <p>Pos Hardware More Options In Less Space</p>
                    </li>
                </ul>","<p>However, item support does not include</p>

                <ul>
                    <li>
                    <p>Not All Blank Cassettes Are Created Equal</p>
                    </li>
                    <li>
                    <p>How To Protect Your Computer Wery Useful Tips</p>
                    </li>
                    <li>
                    <p>Help Finding Information Online</p>
                    </li>
                    <li>
                    <p>Video Games Playing With Imagination</p>
                    </li>
                </ul>","<ul>
                <li>
                <p>Quality checked by Infix</p>
                </li>
                <li>
                <p>Future Updates</p>
                </li>
                <li>
                <p>Theme hosting offer</p>
                </li>
                <li>
                <p>Q6 months support from Codethemes<br />
                <a href=\"#\">What does support include</a></p>
                </li>
            </ul>","","");



DROP TABLE item_update_notifies;

CREATE TABLE `item_update_notifies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_update_notifies_00` (`user_id`),
  KEY `item_update_notifies_99` (`item_id`),
  CONSTRAINT `item_update_notifies_00` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_update_notifies_99` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE item_views;

CREATE TABLE `item_views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemView_02` (`item_id`),
  CONSTRAINT `itemView_02` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE items;

CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `sub_category_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature1` text COLLATE utf8mb4_unicode_ci,
  `feature2` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `resolution` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_preview` text COLLATE utf8mb4_unicode_ci,
  `screen_shot` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compatible_browsers` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compatible_with` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `framework` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `software_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `columns` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `demo_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `Re_item` double(10,2) DEFAULT NULL,
  `Re_buyer` double(10,2) DEFAULT NULL,
  `Reg_total` double(10,2) DEFAULT NULL,
  `C_item` double(10,2) DEFAULT NULL,
  `C_buyer` double(10,2) DEFAULT NULL,
  `C_total` double(10,2) DEFAULT NULL,
  `E_item` double(10,2) DEFAULT NULL,
  `E_buyer` double(10,2) DEFAULT NULL,
  `Ex_total` double(10,2) DEFAULT NULL,
  `user_msg` longtext COLLATE utf8mb4_unicode_ci,
  `sell` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `rate` double(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `free` tinyint(1) NOT NULL DEFAULT '0',
  `is_upload` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `005` (`user_id`),
  KEY `007` (`category_id`),
  KEY `006` (`sub_category_id`),
  CONSTRAINT `005` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `006` FOREIGN KEY (`sub_category_id`) REFERENCES `item_sub_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `007` FOREIGN KEY (`category_id`) REFERENCES `item_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `items_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE jobs;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE labels;

CREATE TABLE `labels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `rate` double(10,2) NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `labels_fk0` (`user_id`),
  CONSTRAINT `labels_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO labels VALUES("1","","37.50","public/uploads/label/icon/icon-0.png","0.00","1","","");
INSERT INTO labels VALUES("2","","36.25","public/uploads/label/icon/icon-0.png","3750.00","1","","");
INSERT INTO labels VALUES("3","","35.00","public/uploads/label/icon/icon-0.png","7500.00","1","","");
INSERT INTO labels VALUES("4","","33.75","public/uploads/label/icon/icon-0.png","11250.00","1","","");
INSERT INTO labels VALUES("5","","32.50","public/uploads/label/icon/icon-0.png","15000.00","1","","");
INSERT INTO labels VALUES("6","","31.25","public/uploads/label/icon/icon-0.png","18750.00","1","","");
INSERT INTO labels VALUES("7","","30.00","public/uploads/label/icon/icon-0.png","22500.00","1","","");
INSERT INTO labels VALUES("8","","28.75","public/uploads/label/icon/icon-0.png","26250.00","1","","");
INSERT INTO labels VALUES("9","","27.50","public/uploads/label/icon/icon-0.png","30000.00","1","","");
INSERT INTO labels VALUES("10","","26.25","public/uploads/label/icon/icon-0.png","33750.00","1","","");
INSERT INTO labels VALUES("11","","25.00","public/uploads/label/icon/icon-0.png","37500.00","1","","");
INSERT INTO labels VALUES("12","","23.75","public/uploads/label/icon/icon-0.png","41250.00","1","","");
INSERT INTO labels VALUES("13","","22.50","public/uploads/label/icon/icon-0.png","45000.00","1","","");
INSERT INTO labels VALUES("14","","21.25","public/uploads/label/icon/icon-0.png","48750.00","1","","");
INSERT INTO labels VALUES("15","","20.00","public/uploads/label/icon/icon-0.png","52500.00","1","","");
INSERT INTO labels VALUES("16","","18.75","public/uploads/label/icon/icon-0.png","56250.00","1","","");
INSERT INTO labels VALUES("17","","17.50","public/uploads/label/icon/icon-0.png","60000.00","1","","");
INSERT INTO labels VALUES("18","","16.25","public/uploads/label/icon/icon-0.png","63750.00","1","","");
INSERT INTO labels VALUES("19","","15.00","public/uploads/label/icon/icon-0.png","67500.00","1","","");
INSERT INTO labels VALUES("20","","13.75","public/uploads/label/icon/icon-0.png","71250.00","1","","");
INSERT INTO labels VALUES("21","","12.50","public/uploads/label/icon/icon-0.png","75000.00","1","","");



DROP TABLE license_features;

CREATE TABLE `license_features` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feature_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular` tinyint(4) NOT NULL DEFAULT '1',
  `extended` tinyint(4) NOT NULL DEFAULT '1',
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO license_features VALUES("1","Number of end products","1","1","1","1","1","2021-04-28 12:42:03","2021-04-28 12:42:03");
INSERT INTO license_features VALUES("2","Use in a single end product","1","0","1","1","1","2021-04-28 12:42:03","2021-04-28 12:42:03");
INSERT INTO license_features VALUES("3","Use in a free end product","1","1","1","1","1","2021-04-28 12:42:03","2021-04-28 12:42:03");
INSERT INTO license_features VALUES("4","Use in an end product that\'s sold","1","1","1","1","1","2021-04-28 12:42:03","2021-04-28 12:42:03");
INSERT INTO license_features VALUES("5","On-demand products/services","1","1","1","1","1","2021-04-28 12:42:03","2021-04-28 12:42:03");
INSERT INTO license_features VALUES("6","Use in stock items/templates","1","1","1","1","1","2021-04-28 12:42:03","2021-04-28 12:42:03");



DROP TABLE license_pages;

CREATE TABLE `license_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heading` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading2_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO license_pages VALUES("1","Standard Licenses","Lorem ipsum dolor sit amet consectetur adipisicing elit. Hic iure architecto quaerat temporibus rem delectus ipsum eius rerum, iusto quibusdam eaque doloremque, consequatur repudiandae.","Note To Freelancers And Creative Agencies","Lorem ipsum dolor sit amet consectetur adipisicing elit. Culpa iure cumque error officia, quae ullam soluta repudiandae eligendi. Est similique ea, accusamus quidem vitae dolorem ratione explicabo quas, quae alias ab eos voluptas omnis dicta sed vel reprehenderit quaerat sint.","1","1","1","","");



DROP TABLE market_apis;

CREATE TABLE `market_apis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO market_apis VALUES("1","Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.","","");



DROP TABLE migrations;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("2","2018_09_18_070338_create_roles_table","1");
INSERT INTO migrations VALUES("3","2018_09_25_050324_create_attributes_table","1");
INSERT INTO migrations VALUES("4","2018_09_25_050342_create_sub_attributes_table","1");
INSERT INTO migrations VALUES("5","2019_06_20_054635_create_spn_countries_table","1");
INSERT INTO migrations VALUES("6","2019_06_20_054654_create_spn_states_table","1");
INSERT INTO migrations VALUES("7","2019_09_17_070338_create_badges_table","1");
INSERT INTO migrations VALUES("8","2019_09_17_100008_create_users_table","1");
INSERT INTO migrations VALUES("9","2019_09_17_170338_create_vendors_table","1");
INSERT INTO migrations VALUES("10","2019_09_18_070338_create_balances_table","1");
INSERT INTO migrations VALUES("11","2019_09_18_070338_create_blog_categories_table","1");
INSERT INTO migrations VALUES("12","2019_09_18_070338_create_blogs_table","1");
INSERT INTO migrations VALUES("13","2019_09_18_070338_create_buyer_item_fees_table","1");
INSERT INTO migrations VALUES("14","2019_09_18_070338_create_comments_table","1");
INSERT INTO migrations VALUES("15","2019_09_18_070338_create_contacts_table","1");
INSERT INTO migrations VALUES("16","2019_09_18_070338_create_coupons_table","1");
INSERT INTO migrations VALUES("17","2019_09_18_070338_create_customers_table","1");
INSERT INTO migrations VALUES("18","2019_09_18_070338_create_followers_table","1");
INSERT INTO migrations VALUES("19","2019_09_18_070338_create_item_categories_table","1");
INSERT INTO migrations VALUES("20","2019_09_18_070338_create_item_images_table","1");
INSERT INTO migrations VALUES("21","2019_09_18_070338_create_item_sub_categories_table","1");
INSERT INTO migrations VALUES("22","2019_09_18_070338_create_items_table","1");
INSERT INTO migrations VALUES("23","2019_09_18_070338_create_labels_table","1");
INSERT INTO migrations VALUES("24","2019_09_18_070338_create_profiles_table","1");
INSERT INTO migrations VALUES("25","2019_09_18_070338_create_ratings_table","1");
INSERT INTO migrations VALUES("26","2019_09_18_070338_create_refund_subscriptions_table","1");
INSERT INTO migrations VALUES("27","2019_09_18_070338_create_reviews_table","1");
INSERT INTO migrations VALUES("28","2019_09_18_070338_create_settings_table","1");
INSERT INTO migrations VALUES("29","2019_09_18_070338_create_social_icons_table","1");
INSERT INTO migrations VALUES("30","2019_09_18_070338_create_subscription_plan_table","1");
INSERT INTO migrations VALUES("31","2019_09_18_070339_add_foreign_keys_to_balances_table","1");
INSERT INTO migrations VALUES("32","2019_09_18_070339_add_foreign_keys_to_blogs_table","1");
INSERT INTO migrations VALUES("33","2019_09_18_070339_add_foreign_keys_to_comments_table","1");
INSERT INTO migrations VALUES("34","2019_09_18_070339_add_foreign_keys_to_customers_table","1");
INSERT INTO migrations VALUES("35","2019_09_18_070339_add_foreign_keys_to_followers_table","1");
INSERT INTO migrations VALUES("36","2019_09_18_070339_add_foreign_keys_to_item_images_table","1");
INSERT INTO migrations VALUES("37","2019_09_18_070339_add_foreign_keys_to_item_sub_categories_table","1");
INSERT INTO migrations VALUES("38","2019_09_18_070339_add_foreign_keys_to_items_table","1");
INSERT INTO migrations VALUES("39","2019_09_18_070339_add_foreign_keys_to_labels_table","1");
INSERT INTO migrations VALUES("40","2019_09_18_070339_add_foreign_keys_to_ratings_table","1");
INSERT INTO migrations VALUES("41","2019_09_18_070339_add_foreign_keys_to_refund_subscriptions_table","1");
INSERT INTO migrations VALUES("42","2019_09_18_070339_add_foreign_keys_to_reviews_table","1");
INSERT INTO migrations VALUES("43","2019_09_18_070339_add_foreign_keys_to_settings_table","1");
INSERT INTO migrations VALUES("44","2019_09_18_070339_add_foreign_keys_to_social_icons_table","1");
INSERT INTO migrations VALUES("45","2019_09_18_070339_add_foreign_keys_to_subscription_plan_table","1");
INSERT INTO migrations VALUES("46","2019_09_18_070339_add_foreign_keys_to_users_table","1");
INSERT INTO migrations VALUES("47","2019_09_18_070339_add_foreign_keys_to_vendors_table","1");
INSERT INTO migrations VALUES("48","2019_09_18_080143_create_sm_background_settings_table","1");
INSERT INTO migrations VALUES("49","2019_09_19_050226_create_social_logins_table","1");
INSERT INTO migrations VALUES("50","2019_09_21_070652_create_sm_language_phrases_table","1");
INSERT INTO migrations VALUES("51","2019_09_26_082657_create_session_files_table","1");
INSERT INTO migrations VALUES("52","2019_10_09_052459_create_userlogs_table","1");
INSERT INTO migrations VALUES("53","2019_10_16_124537_create_buyer_fee_types_table","1");
INSERT INTO migrations VALUES("54","2019_10_21_045359_create_orders_table","1");
INSERT INTO migrations VALUES("55","2019_10_21_104350_create_item_orders_table","1");
INSERT INTO migrations VALUES("56","2019_10_29_053224_create_infix_general_settings_table","1");
INSERT INTO migrations VALUES("57","2019_10_29_062747_create_infix_background_settings_table","1");
INSERT INTO migrations VALUES("58","2019_10_29_062747_create_infix_styles_table","1");
INSERT INTO migrations VALUES("59","2019_10_29_062747_create_infix_time_zones_table","1");
INSERT INTO migrations VALUES("60","2019_10_29_062748_create_infix_backups_table","1");
INSERT INTO migrations VALUES("61","2019_10_29_062748_create_infix_currencies_table","1");
INSERT INTO migrations VALUES("62","2019_10_29_062749_create_infix_languages_table","1");
INSERT INTO migrations VALUES("63","2019_10_29_062749_create_infix_seo_settings_table","1");
INSERT INTO migrations VALUES("64","2019_10_29_062752_create_infix_payment_gateway_settings_table","1");
INSERT INTO migrations VALUES("65","2019_10_29_121509_create_infix_email_settings_table","1");
INSERT INTO migrations VALUES("66","2019_10_29_124302_create_infix_all_languages_table","1");
INSERT INTO migrations VALUES("67","2019_10_29_133035_create_infix_image_settings_table","1");
INSERT INTO migrations VALUES("68","2019_10_30_051912_create_infix_privacy_policies_table","1");
INSERT INTO migrations VALUES("69","2019_10_30_051912_create_infix_terms_conditions_table","1");
INSERT INTO migrations VALUES("70","2019_10_30_051914_create_infix_about_companies_table","1");
INSERT INTO migrations VALUES("71","2019_10_30_070237_create_infix_footer_settings_table","1");
INSERT INTO migrations VALUES("72","2019_10_30_111659_create_infix_date_format_table","1");
INSERT INTO migrations VALUES("73","2019_10_30_120850_create_infix_faqs_table","1");
INSERT INTO migrations VALUES("74","2019_11_02_094411_create_supports_table","1");
INSERT INTO migrations VALUES("75","2019_11_03_124914_create_review_types_table","1");
INSERT INTO migrations VALUES("76","2019_11_04_060140_create_package_types_table","1");
INSERT INTO migrations VALUES("77","2019_11_04_060141_create_packages_table","1");
INSERT INTO migrations VALUES("78","2019_11_05_091041_create_infix_newsletter_table","1");
INSERT INTO migrations VALUES("79","2019_11_05_092601_create_buy_packages_table","1");
INSERT INTO migrations VALUES("80","2019_11_06_104353_create_item_views_table","1");
INSERT INTO migrations VALUES("81","2019_11_11_090722_create_infix_knowledge_base_category","1");
INSERT INTO migrations VALUES("82","2019_11_11_110101_create_infix_knowledge_base","1");
INSERT INTO migrations VALUES("83","2019_11_12_075709_create_infix_category_question","1");
INSERT INTO migrations VALUES("84","2019_11_16_064017_create_statements_table","1");
INSERT INTO migrations VALUES("85","2019_11_16_115342_create_taxes_table","1");
INSERT INTO migrations VALUES("86","2019_11_19_082406_create_refund_reasons_table","1");
INSERT INTO migrations VALUES("87","2019_11_19_090940_create_email_notification_settings_table","1");
INSERT INTO migrations VALUES("88","2019_11_19_123552_create_refunds_table","1");
INSERT INTO migrations VALUES("89","2019_11_20_043152_create_infix_ticket_categories","1");
INSERT INTO migrations VALUES("90","2019_11_20_060816_create_infix_ticket_priority","1");
INSERT INTO migrations VALUES("91","2019_11_20_074705_create_refund_comments_table","1");
INSERT INTO migrations VALUES("92","2019_11_20_115328_create_balance_sheets_table","1");
INSERT INTO migrations VALUES("93","2019_11_27_052724_create_buyer_fees_table","1");
INSERT INTO migrations VALUES("94","2019_12_08_090952_create_item_previews_table","1");
INSERT INTO migrations VALUES("95","2019_12_09_092523_create_item_fees_table","1");
INSERT INTO migrations VALUES("96","2019_12_10_044336_create_stripe_payments_table","1");
INSERT INTO migrations VALUES("97","2019_12_10_054447_create_payment_methods_table","1");
INSERT INTO migrations VALUES("98","2019_12_11_054641_create_deposits_table","1");
INSERT INTO migrations VALUES("99","2019_12_11_111422_create_payment_packages_table","1");
INSERT INTO migrations VALUES("100","2019_12_12_111627_create_paid_payments_table","1");
INSERT INTO migrations VALUES("101","2019_12_15_104701_create_registration_bonuses_table","1");
INSERT INTO migrations VALUES("102","2019_12_15_122538_create_re_captcha_settings_table","1");
INSERT INTO migrations VALUES("103","2019_12_18_063047_create_item_payments_table","1");
INSERT INTO migrations VALUES("104","2019_12_18_123000_create_paid_package_payments_table","1");
INSERT INTO migrations VALUES("105","2019_12_22_044849_create_paid_vendors_table","1");
INSERT INTO migrations VALUES("106","2019_12_23_095757_create_purchase_codes_table","1");
INSERT INTO migrations VALUES("107","2019_12_23_120428_create_withdraws_table","1");
INSERT INTO migrations VALUES("108","2020_01_09_120750_create_feedback_table","1");
INSERT INTO migrations VALUES("109","2020_01_11_055402_create_infix_departments_table","1");
INSERT INTO migrations VALUES("110","2020_01_11_124245_create_sm_notifications_table","1");
INSERT INTO migrations VALUES("111","2020_02_22_054408_create_infix_home_pages_table","1");
INSERT INTO migrations VALUES("112","2020_02_22_095947_create_front_settings_table","1");
INSERT INTO migrations VALUES("113","2020_02_22_130109_create_footer_menus_table","1");
INSERT INTO migrations VALUES("114","2020_02_23_063301_create_infix_footer_menus_table","1");
INSERT INTO migrations VALUES("115","2020_02_23_081653_create_market_apis_table","1");
INSERT INTO migrations VALUES("116","2020_02_23_100649_create_front_coupons_table","1");
INSERT INTO migrations VALUES("117","2020_02_23_115809_create_item_supports_table","1");
INSERT INTO migrations VALUES("118","2020_02_24_053548_create_license_pages_table","1");
INSERT INTO migrations VALUES("119","2020_02_24_062213_create_license_features_table","1");
INSERT INTO migrations VALUES("120","2020_02_25_061733_create_ticket_pages_table","1");
INSERT INTO migrations VALUES("121","2020_03_08_124114_create_jobs_table","1");
INSERT INTO migrations VALUES("122","2020_03_09_044920_create_email_templates_table","1");
INSERT INTO migrations VALUES("123","2020_03_09_072124_create_item_update_notifies_table","1");
INSERT INTO migrations VALUES("124","2020_03_12_103221_create_product_settings_table","1");
INSERT INTO migrations VALUES("125","2020_03_23_113623_create_sm_email_sms_logs_table","1");
INSERT INTO migrations VALUES("126","2020_03_25_072612_create_free_items_table","1");
INSERT INTO migrations VALUES("127","2020_04_07_123733_create_infix_funds_table","1");
INSERT INTO migrations VALUES("128","2020_04_13_074648_create_bank_deposits_table","1");
INSERT INTO migrations VALUES("129","2020_04_21_071524_create_infix_profile_settings_table","1");
INSERT INTO migrations VALUES("130","2020_05_16_063317_create_author_payout_setups_table","1");
INSERT INTO migrations VALUES("131","2020_05_20_090013_create_modules_table","1");
INSERT INTO migrations VALUES("132","2020_05_27_112127_create_assign_module_permissions_table","1");
INSERT INTO migrations VALUES("133","2020_06_20_054708_create_spn_cities_table","1");
INSERT INTO migrations VALUES("134","2020_06_30_035335_create_error_logs_table","1");
INSERT INTO migrations VALUES("135","2020_07_04_111710_create_module_permission_links_table","1");
INSERT INTO migrations VALUES("136","2020_08_19_134140_create_become_authors_table","1");
INSERT INTO migrations VALUES("137","2020_09_15_151550_create_item_attributes_table","1");
INSERT INTO migrations VALUES("138","2020_11_16_121739_create_temp_files_table","1");
INSERT INTO migrations VALUES("139","2020_11_20_063644_create_infix_ticket","1");
INSERT INTO migrations VALUES("140","2020_12_02_085206_create_infix_ticket_comments_table","1");
INSERT INTO migrations VALUES("141","2020_12_27_121929_create_payments_table","1");
INSERT INTO migrations VALUES("142","2021_01_21_051248_create_infix_module_managers_table","1");
INSERT INTO migrations VALUES("143","2021_02_23_194810_create_version_histories_table","1");
INSERT INTO migrations VALUES("144","2021_03_21_042915_create_coupon_histories_table","1");
INSERT INTO migrations VALUES("145","2021_03_31_130028_create_third_party_apis_table","1");



DROP TABLE module_permission_links;

CREATE TABLE `module_permission_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO module_permission_links VALUES("1","1","Dashboard","admin/dashboard","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("2","2","department","department","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("3","2","User List","humanresource/user-list","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("4","2","Author List","admin/vendor","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("5","2","customer List","admin/customer","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("6","2","agent List","admin/agent","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("7","2","user log List","admin/user-log","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("8","2","registration bonus","admin/registration-bonus","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("9","3","Add Fund","admin/add-fund","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("10","3","Fund List","admin/fund-list","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("11","4","Bank Deposit Request","admin/deposit-request","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("12","4","Deposit Approve","admin/deposit-approved","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("13","5","Category(Product)","admin/add-category","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("14","5","Sub Category","admin/sub-category","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("15","5","attributes","admin/attributes","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("16","5","sub-attributes","admin/sub-attributes","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("17","6","Product Update List","admin/item-preview","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("18","7","Product Pending List","admin/item-pending","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("19","5","Product List","admin/product","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("20","5","Deactive Product List","admin/deactive-products","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("21","5","Free Product List","admin/free-product","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("22","8","Order","admin/order","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("23","9","Refund Type","admin/refund-list","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("24","9","Request Refund Order","admin/request-refund-order","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("25","9","Refund Order","admin/refund-order","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("26","10","Buyer Fee","admin/item-fee","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("27","11","Label List","admin/label","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("28","11","badge List","admin/badge","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("29","11","review type List","admin/review-type","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("30","12","Coupon Plan","admin/coupon","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("31","13","Category (Kn. Base)","knowledgebase/category","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("32","13","Question","knowledgebase/category-question","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("33","13","Sub Question & Answer","knowledgebase/question","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("34","14","Tax","admin/tax-list","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("35","15","Save Credit Card","admin/save-credit-card","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("36","15","Author Balance","admin/paymnet-method","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("37","15","Payment Author","admin/payable-author","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("38","16","Send Mail","admin/send-email-sms-view","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("39","17","Recaptcha Setting","admin/recaptcha-setting","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("40","18","Ticket Status","ticket/ticket-status","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("41","18","Category (Ticket)","ticket/ticket-category","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("42","18","Priority","ticket/ticket-priority","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("43","18","Ticket","ticket/ticket-list","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("44","19","Admin Revenue","admin/revenue","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("45","19","Author Revenue","admin/author-revenue","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("46","20","General Settings","systemsetting/general-setting","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("47","20","Email Settings","systemsetting/email-setting","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("48","20","Role Permission","systemsetting/role-permission","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("49","20","Payment Method Settings","systemsetting/payment-method-setting","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("50","20","Language Settings","systemsetting/language-setting","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("51","20","SEO Settings","systemsetting/seo-setting","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("52","20","Dashboard Themes","systemsetting/theme-setting","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("53","20","Backup","systemsetting/backup-setting","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("54","20","Third Party API","systemsetting/third-party-api","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("55","20","About","systemsetting/about-system","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("56","21","Home Page","pages/home-page","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("57","21","Profile Setting","pages/profile-setting","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("58","21","Coupon","pages/coupon-text","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("59","21","License","pages/license","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("60","21","Ticket (Frontend)","pages/ticket","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("61","21","Privacy Policy","pages/privacy-policy","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("62","21","Terms Conditions","pages/terms-conditions","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("63","21","Market API","pages/market-apis","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("64","21","Item Support","pages/item-support","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("65","21","About Company","pages/about-company","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("66","21","FAQ","pages/faqs","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("67","22","Site Image Settings","systemsetting/site-image-setting","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("68","22","Footer Menu","footer-menug","1","2020-05-20 03:25:09","2020-05-20 03:25:09");
INSERT INTO module_permission_links VALUES("69","22","Footer Custom Link","systemsetting/footer-custom-link","1","2020-05-20 03:25:09","2020-05-20 03:25:09");



DROP TABLE modules;

CREATE TABLE `modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO modules VALUES("1","Dashboard","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("2","User Management","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("3","Offline Payment","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("4","Bank Payment","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("5","Product","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("6","Product Update List","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("7","Product Pending List","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("8","Product Order","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("9","Refund Order","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("10","Buyer Fee","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("11","Author Level","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("12","Coupon","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("13","Knowledge Bage","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("14","Tax","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("15","Payment","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("16","Promotional","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("17","Recaptcha","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("18","Ticket","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("19","Reports","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("20","System Settings","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("21","Frontend CMS","1","1","1","2021-04-28 12:42:03","");
INSERT INTO modules VALUES("22","Front Settings","1","1","1","2021-04-28 12:42:03","");



DROP TABLE orders;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `total` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_user_01` (`user_id`),
  CONSTRAINT `order_user_01` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE package_types;

CREATE TABLE `package_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` double(10,2) NOT NULL,
  `half_year` double(10,2) NOT NULL,
  `year` double(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO package_types VALUES("1","Basic","basic","50.00","260.00","500.00","1","","");
INSERT INTO package_types VALUES("2","Medium","medium","100.00","500.00","900.00","1","","");
INSERT INTO package_types VALUES("3","Premium","premium","150.00","700.00","1300.00","1","","");
INSERT INTO package_types VALUES("4","Business","business","250.00","1200.00","2000.00","1","","");



DROP TABLE packages;

CREATE TABLE `packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_type` int(10) unsigned DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_item` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `packlage_01` (`package_type`),
  CONSTRAINT `packlage_01` FOREIGN KEY (`package_type`) REFERENCES `package_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE paid_package_payments;

CREATE TABLE `paid_package_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_paid_550` (`user_id`),
  CONSTRAINT `payment_paid_550` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE paid_payments;

CREATE TABLE `paid_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_paid_990` (`user_id`),
  CONSTRAINT `payment_paid_990` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE paid_vendors;

CREATE TABLE `paid_vendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `amount` double(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paid_vendors_001` (`user_id`),
  CONSTRAINT `paid_vendors_001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE password_resets;

CREATE TABLE `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE payment_methods;

CREATE TABLE `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `card_id` varchar(240) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_mm` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exp_yy` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methods_001` (`user_id`),
  CONSTRAINT `payment_methods_001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE payment_packages;

CREATE TABLE `payment_packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_plan` int(10) unsigned NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_packages_001` (`user_id`),
  KEY `payment_packages_003` (`package_plan`),
  CONSTRAINT `payment_packages_001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `payment_packages_003` FOREIGN KEY (`package_plan`) REFERENCES `package_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE payments;

CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE product_settings;

CREATE TABLE `product_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_category_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_sub_categories_fk0` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE profiles;

CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci,
  `country_id` int(11) DEFAULT NULL,
  `state_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `marital_status` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_index` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO profiles VALUES("1","1","","","","","","","","","","","19","290","1374","","","","","","","1","2021-04-28 12:41:55","2021-04-28 12:41:55");



DROP TABLE purchase_codes;

CREATE TABLE `purchase_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `active_status` int(11) NOT NULL DEFAULT '1',
  `purchase_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE ratings;

CREATE TABLE `ratings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `rating` int(11) NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ratings_fk0` (`user_id`),
  KEY `ratings_fk1` (`item_id`),
  CONSTRAINT `ratings_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ratings_fk1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE re_captcha_settings;

CREATE TABLE `re_captcha_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sitekey` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secretkey` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO re_captcha_settings VALUES("1","Google Re-captcha","","","1","0","","");



DROP TABLE refund_comments;

CREATE TABLE `refund_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `refund_comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_comment_10` (`user_id`),
  KEY `refund_comment_20` (`author_id`),
  KEY `refund_comment_30` (`item_id`),
  CONSTRAINT `refund_comment_10` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `refund_comment_20` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `refund_comment_30` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE refund_reasons;

CREATE TABLE `refund_reasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO refund_reasons VALUES("1","It was a mistake purchase","1","","");
INSERT INTO refund_reasons VALUES("2","There was a problem with my payment","1","","");
INSERT INTO refund_reasons VALUES("3","I`m having a problem with item support","1","","");
INSERT INTO refund_reasons VALUES("4","The item has been removed from my downloads","1","","");
INSERT INTO refund_reasons VALUES("5","The item is broken , malfunctioning or not as described","1","","");



DROP TABLE refund_subscriptions;

CREATE TABLE `refund_subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `subscription_plan_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_subscriptions_fk0` (`user_id`),
  KEY `refund_subscriptions_fk1` (`subscription_plan_id`),
  CONSTRAINT `refund_subscriptions_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `refund_subscriptions_fk1` FOREIGN KEY (`subscription_plan_id`) REFERENCES `subscription_plan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE refunds;

CREATE TABLE `refunds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `ref_id` int(10) unsigned DEFAULT NULL,
  `refund_details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_status` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_103` (`order_item_id`),
  KEY `refund_items_10` (`user_id`),
  KEY `refund_45` (`author_id`),
  KEY `refund_items_20` (`item_id`),
  KEY `refund_items_30` (`ref_id`),
  CONSTRAINT `1` FOREIGN KEY (`ref_id`) REFERENCES `refund_reasons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `refund_45` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `refund_items_10` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `refund_items_103` FOREIGN KEY (`order_item_id`) REFERENCES `item_orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `refund_items_20` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE registration_bonuses;

CREATE TABLE `registration_bonuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bonus` double(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO registration_bonuses VALUES("1","20.00","1","2","","");



DROP TABLE review_types;

CREATE TABLE `review_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO review_types VALUES("1","Feature Availability","1","","");
INSERT INTO review_types VALUES("2","Documentation Quality","1","","");
INSERT INTO review_types VALUES("3","Felxibility","1","","");
INSERT INTO review_types VALUES("4","Customer Support Bugs","1","","");
INSERT INTO review_types VALUES("5","Code Quality","1","","");
INSERT INTO review_types VALUES("6","Design Quality","1","","");
INSERT INTO review_types VALUES("7","Customizability","1","","");
INSERT INTO review_types VALUES("8","Others","1","","");



DROP TABLE reviews;

CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `vendor_id` int(10) unsigned DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `item_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `rating` text COLLATE utf8mb4_unicode_ci,
  `review_type` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_fk0` (`user_id`),
  KEY `review_01` (`vendor_id`),
  KEY `reviews_fk1` (`item_id`),
  CONSTRAINT `review_01` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reviews_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reviews_fk1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE roles;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Super admin","1","","");
INSERT INTO roles VALUES("2","Agent","1","","");
INSERT INTO roles VALUES("3","Operator","1","","");
INSERT INTO roles VALUES("4","Author","1","","");
INSERT INTO roles VALUES("5","Customer","1","","");



DROP TABLE session_files;

CREATE TABLE `session_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE settings;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_fk0` (`user_id`),
  CONSTRAINT `settings_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE sm_background_settings;

CREATE TABLE `sm_background_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sm_background_settings VALUES("1","Dashboard Background","image","public/backEnd/img/body-bg.jpg","","1","","");
INSERT INTO sm_background_settings VALUES("2","Login Background","image","public/backEnd/img/login-bg.jpg","","1","","");



DROP TABLE sm_email_sms_logs;

CREATE TABLE `sm_email_sms_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_date` date DEFAULT NULL,
  `send_through` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sm_email_sms_logs_created_by_foreign` (`created_by`),
  KEY `sm_email_sms_logs_updated_by_foreign` (`updated_by`),
  CONSTRAINT `sm_email_sms_logs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `sm_email_sms_logs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE sm_language_phrases;

CREATE TABLE `sm_language_phrases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modules` text,
  `default_phrases` text,
  `en` text,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=984 DEFAULT CHARSET=utf8;

INSERT INTO sm_language_phrases VALUES("1","0","send_email","Send email","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("2","0","send_through","Send through","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("3","0","select_all","Select all","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("4","0","promotional","Promotional","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("5","0","deactive","Deactive","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("6","0","dashboard","Dashboard","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("7","0","feedback","Feedback","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("8","0","reject","Reject","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("9","0","support","Support","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("10","0","welcome","Welcome","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("11","0","user","User","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("12","0","uplaod","Uplaod","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("13","0","vendor","Vendor","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("14","0","customer","Customer","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("15","0","management","Management","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("16","0","list","List","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("17","0","name","Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("18","0","email","Email","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("19","0","verify","Verify","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("20","0","expiring","Expiring","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("21","0","status","Status","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("22","0","search","Search","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("23","0","close","Close","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("24","0","humanresource","Human Resource","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("25","0","action","Action","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("26","0","select","Select","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("27","0","view","View","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("28","0","edit","Edit","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("29","0","delete","Delete","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("30","0","total","Total","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("31","0","balance","Balance","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("32","0","earning","Earning","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("33","0","active","Active","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("34","0","pending","Pending","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("35","0","Attachment","Attachment","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("36","0","reply","Reply","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("37","0","department","Department","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("38","0","priority","Priority","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("39","0","suspended","Suspended","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("40","0","permission","Permission","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("41","0","login","Login","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("42","0","enter_login","Enter Login details to get access","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("43","0","success_alert","Success","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("44","0","failed_alert","Error","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("45","0","success_message","Operation success !","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("46","0","failed_message","Operation failed !","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("47","0","Date_of_birth","Date of birth","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("48","0","first","First","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("49","0","last","Last","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("50","0","number_of_sale","number of sale","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("51","0","days","days","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("52","0","extend_buyer_Fee","Extend Buyer Fee","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("53","0","regular_buyer_Fee","Regular Buyer Fee","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("54","0","today","today","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("55","0","fund_deposit","Fund Deposit","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("56","0","paid","Paid","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("57","0","one","One","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("58","0","six","Six","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("59","0","full","Full","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("60","0","online","Online","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("61","0","print","Print","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("62","0","father","Father","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("63","0","mother","Mother","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("64","0","mobile","Mobile","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("65","0","information","Information","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("66","0","reset","Reset","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("67","0","Current_address","Current address","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("68","0","Permanent_addres","Permanent addres","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("69","0","location","Location","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("70","0","update","Update","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("71","0","date_of_joining","Date of joining","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("72","0","browse","Browse","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("73","0","image_upload_requirement_100","Only PNG 100x100PX","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("74","0","Crop_Image_And_Upload","Crop Image And Upload","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("75","0","No_file_selected","No file selected","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("76","0","basic_info","Basic information","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("77","0","image_upload_400","JPG OR PNG 860x400PX","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("78","0","acknowledgement_for_Terms_of_Service","You have read and agree to HostGator Terms of Service and Cancellation Policy and acknowledge receipt of the Privacy Policy.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("79","0","instruction_for_terms_and_conditions","By clicking \"Checkout Now\" you agree to have your personal information transferred and stored in the United States, which is necessary to provide you with the services under our agreement with you.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("80","0","payment","Payment","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("81","0","click","Click","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("82","0","new","New","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("83","0","extent_support_time","Extend support to 12 months.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("84","0","info","Info","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("85","0","method","Method","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("86","0","Product","Product","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("87","0","profile","Profile","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("88","0","category","Category","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("89","0","save","Save","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("90","0","description","Description","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("91","0","upload_photo","Upload Photo","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("92","0","upload_icon","Upload Icon","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("93","0","icon","Icon","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("94","0","image","Image","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("95","0","add","Add","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("96","0","inactive","Inactive","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("97","0","cancel","Cancel","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("98","0","level","Level","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("99","0","sub","Sub","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("100","0","are_you_sure_to_delete","Are you sure to delete?","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("101","0","are_you_sure_to_active","Are you sure to active?","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("102","0","knowledge_base","Knowledge Base","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("103","0","attributes","Attributes","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("104","0","field_name","Field Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("105","0","fee","Fee","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("106","0","buyer","Buyer","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("107","0","buy","Buy","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("108","0","emails","emails","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("109","0","daily","Daily","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("110","0","summary","summary","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("111","0","daily_summary_emails","Send me a daily summary of all items approved or rejected","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("112","0","buyer_review_notifications","Send an email reminding me to rate an item a week after purchase","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("113","0","type","Type","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("114","0","regular","Regular","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("115","0","up","Up","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("116","0","file","File","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("117","0","yes","Yes","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("118","0","no","No","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("119","0","title","Title","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("120","0","price","Price","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("121","0","demo","Demo","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("122","0","url","Url","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("123","0","label","Lavel","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("124","0","badge","Badge","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("125","0","amount","Amount","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("126","0","time","Time","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("127","0","password","Password","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("128","0","admin","Admin","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("129","0","website","Website","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("130","0","reports","Reports","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("131","0","member","Member","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("132","0","plan","Plan","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("133","0","package","Package","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("134","0","log","Log","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("135","0","log","Log","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("136","0","device","Device","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("137","0","coupon","Coupon","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("138","0","code","Code","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("139","0","discount","Discount","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("140","0","valid","Valid","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("141","0","enter","Enter","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("142","0","date","Date","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("143","0","id","id","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("144","0","min_price","Min Price","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("145","0","details","Details","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("146","1","system_settings","System Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("147","1","email_settings","Email Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("148","1","payment_method","Payment Method","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("149","1","setting","Setting","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("150","1","Order","Order","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("151","1","configuration","Configuration","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("152","1","setup","Setup","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("153","1","language","Language","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("154","1","select_language","Select Language","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("155","1","status","Status","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("156","1","universal","Universal","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("157","1","native","Native","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("158","1","remove","Remove","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("159","1","seo","SEO","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("160","1","site","Site","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("161","1","google","Google","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("162","1","system_setting","System Setting","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("163","1","pages","Pages","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("164","1","about","About","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("165","1","company","Company","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("166","1","KnowledgeBase","Knowledge Base","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("167","1","deleteWarningQuestion","If you delete this question, the system will delete all related data","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("168","1","deleteWarning","If you delete this category, the system will delete all related data","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("169","1","sub","Sub","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("170","1","privacy","Privacy","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("171","1","history","History","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("172","1","policy","Policy","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("173","1","terms","Terms","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("174","1","conditions","Conditions","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("175","1","short","Short","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("176","1","heading","Heading","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("177","1","&","&","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("178","0","role","Role","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("179","1","faq","FAQ","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("180","1","faqs","FAQs","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("181","1","question","Question","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("182","1","answers","Answers","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("183","1","answer","Answer","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("184","1","is_configure_require","Is Configure Require","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("185","20","primary_color","Primary Color","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("186","20","primary_color2","Primary Color 2","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("187","20","primary_color3","Primary Color 3","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("188","20","title_color","Title Color","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("189","20","text_color","Text Color","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("190","20","sidebar_bg","Sidebar","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("191","20","theme","Theme","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("192","20","background","Background","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("193","20","style","Style","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("194","20","color","Color","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("195","20","change","Change","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("196","20","saved","Saved","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("197","20","changes","Changes","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("198","20","system_name","System Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("199","20","system_title","System Title","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("200","20","address","Address","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("201","20","keep_me_logged_in","Keep me logged in","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("202","20","phone","Phone","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("203","20","currency","Currency","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("204","20","currency_symbol","Currency Symbol","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("205","20","currency_code","Currency Code","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("206","20","time_zone","Time Zone","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("207","20","copyright_text","Copyright Text","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("208","20","amazons3_host","Amazons3 Host","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("209","20","module_manage","Module Manage","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("210","20","Amazon_S3","Amazon S3","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("211","20","Next_Payout","Next Payout","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("212","20","You_currently_have","You currently have","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("213","20","setup_aws3","Setup AWS3","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("214","20","language_name","Language Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("215","20","default","Default","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("216","20","commercial","Commercial","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("217","20","commercial_buyer_Fee","Com Buyer Fee","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("218","20","next_month_payout","in earnings for next month payout","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("219","20","make_default","Make Default","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("220","20","sl","Sl","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("221","20","from_name","From Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("222","20","from","From","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("223","20","mail","Mail","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("224","20","driver","Driver","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("225","20","host","Host","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("226","20","port","Port","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("227","20","your_bank_account","Your Bank Account","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("228","20","google_analytics","GOOGLE ANALYTICS","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("229","20","public_vendor_registration","Public Vendor Registration","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("230","20","product_upload","Product Upload","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("231","20","purchase_link","Purchase Link","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("232","20","product_upload_or_link","Product Upload Or Link","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("233","20","google_analytics_warning","Complete Google Analytics Setup to view this graphical statistics data or you can hide those from","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("234","20","username","Username","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("235","20","encryption","Encryption","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("236","20","method_name","Method Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("237","20","env_terms","Key","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("238","20","env_value","Value","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("239","20","faq","Frequently Asked Questions","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("240","20","language_settings","Language Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("241","20","background_settings","Background Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("242","20","footer_setting","Footer Setting","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("243","20","general_settings","General Setting","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("244","20","language_setup","Language Setup","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("245","20","update_language","Update Language","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("246","20","logo","Logo","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("247","20","status","Status","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("248","20","facebook_link","Facebook Link","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("249","20","twitter_link","Twitter Link","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("250","20","author","Author","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("251","20","keyword","Keyword","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("252","0","purchases","purchases","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("253","0","purchase","purchase","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("254","0","make","Make","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("255","0","followers","Followers","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("256","0","Following","Following","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("257","0","followings","Followings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("258","0","see","see","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("259","0","awating","Awating","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("260","0","review","Review","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("261","0","item_revirew_notification","Send an email reminding me to rate an item a week after purchase","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("262","0","personal","Personal","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("263","0","credit","Credit","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("264","0","number","number","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("265","0","holder","Holder","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("266","0","current","Current","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("267","0","card","Card","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("268","0","cvc","Cvc","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("269","0","assignee","Assignee","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("270","0","expiration","Expiration","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("271","0","mm","MM","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("272","0","yy","YY","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("273","0","preview","Preview","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("274","0","social","social","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("275","0","network","network","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("276","0","networks","networks","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("277","0","banner","Banner","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("278","0","install","Install","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("279","20","total","Total","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("280","20","product","Product","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("281","20","products","Products","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("282","20","approval","Approval","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("283","20","pending","Pending","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("284","20","sale","Sale","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("285","20","withdraws","Withdraws","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("286","20","customers","Customers","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("287","20","subscribers","Subscribers","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("288","20","vendors","Vendors","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("289","20","users","Users","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("290","20","blocked","Blocked","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("291","20","free","Free","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("292","20","subscribers","Subscribers","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("293","20","mark_all_as_read","Mark All As Read","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("294","20","are_you_sure_to_remove","Are you sure to remove?","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("295","20","blog","Blog","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("296","20","subscription","Subscription","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("297","20","newsletter","Newsletter","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("298","20","registered","Registered","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("299","20","register","Register","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("300","20","rate","Rate","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("301","20","registration","Registration","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("302","20","re_captcha","Recaptcha","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("303","20","bonus","Bonus","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("304","20","confirm","Confirm","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("305","20","notification","Notification","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("306","20","you_have","You Have","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("307","20","upload","Upload","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("308","20","AddOns","Add Ons","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("309","20","review","Review","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("310","20","item","Item","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("311","20","monthly","Monthly","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("312","20","half_yearly","Half Yearly","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("313","20","yearly","Yearly","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("314","20","filter","Filter","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("315","20","sales","Sales","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("316","20","no","No","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("317","20","high","High","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("318","20","mudium","Mudium","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("319","20","low","Low","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("320","20","star_and_higher","Star and Higher","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("321","20","top_seller","Top Seller","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("322","20","sell","Sell","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("323","20","date","Date","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("324","20","added","Added","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("325","20","any","Any","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("326","20","year","year","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("327","20","month","month","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("328","20","Trending","Trending","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("329","20","Rated","Rated","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("330","20","Newest","Newest","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("331","20","Sellers","Sellers","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("332","20","all_items","All items","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("333","20","Sub","Sub","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("334","20","Category","Category","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("335","20","Tags","Tags","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("336","20","Price","Price","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("337","20","rating","Rating","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("338","20","following","Following","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("339","20","no_rating_yet","No rating yet","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("340","20","mryr","main reason for your rating","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("341","20","week","week","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("342","20","not_yet","Not yet","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("343","20","Best","Best","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("344","20","Pricing","Pricing","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("345","20","Plans","Plans","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("346","20","software","Software","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("347","20","Infix","Infix","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("348","20","Files","Files","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("349","20","Included","Included","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("350","20","Columns","Columns","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("351","20","Documentation","Documentation","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("352","20","Well","Well","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("353","20","Documented","Documented","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("354","20","Layout","Layout","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("355","20","License","License","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("356","20","license","License","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("357","20","Customize_your_selection","Customize Your Selection","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("358","20","Select_a_License","Select a License","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("359","20","version","Version","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("360","20","forgot","Forgot","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("361","20","Regular","Regular","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("362","20","Extended","Extended","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("363","20","Available","Available","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("364","20","Packages","Packages","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("365","20","Billing","Billing","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("366","20","Information","Information","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("367","20","Father","Father","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("368","20","Mother","Mother","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("369","20","Checkout","Checkout","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("370","20","Now","Now","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("371","20","Amount","Amount","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("372","20","Due","Due","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("373","20","cancle","cancle","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("374","20","comments","Comments","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("375","20","product_review_by_buyer","Product review by buyer","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("376","20","review_publish_to_other","your review will be publicaly visible and the author may replay to your comments","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("377","20","Total","Total","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("378","20","Downloads","Downloads","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("379","20","Ratings","Ratings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("380","20","pinterest_link","Pinterest Link","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("381","20","youtube_link","Youtube Link","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("382","20","instagram_link","Instagram Link","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("383","20","social","Social","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("384","20","profiles","Profiles","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("385","20","average_based_on","average based on","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("386","20","comment","Comment","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("387","20","overview","Overview","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("388","20","reviews","Reviews","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("389","20","Support","Support","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("390","20","duration","duration","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("391","20","months","Months","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("392","20","Replay","Replay","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("393","20","Post","Post","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("394","20","Features","Features","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("395","20","Last","Last","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("396","20","author_response_time_message","This author response time can be up to 1 business day.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("397","20","pqfthi","Popular questions for this item","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("398","20","Supports_this_item","Supports this item","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("399","20","Leave_a_comment","Leave a comment, be nice","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("400","20","Subtotal","Subtotal","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("401","20","package_plan_page_subtitle","Lights tree our winged fifth his creepeth had herb kind life very very make so  harth face male","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("402","20","Get_your_right_choice","Get your right choice","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("403","20","product_header_sub_title","Crafty is an element gallery for web designers and web developers, anybody using
                            Bootstrap","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("404","20","compatiability","Compatiability","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("405","20","in_the_last","In the Last","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("406","20","DiscoverOLDG","Discover Our Latest Digital Goods","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("407","20","Low_to_High","Low to High","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("408","20","High_to_Low","High to Low","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("409","0","Created","Created","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("410","0","resolution","Resolution","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("411","0","reminders","reminders","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("412","0","send_email_reminding","Send an email reminding me to rate an item a week after purchase","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("413","0","Widget","Widget","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("414","0","Ready","Ready","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("415","0","sent","Sent","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("416","0","main","Main","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("417","0","Refund","Refund","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("418","0","Reason","Reason","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("419","0","Compatible","Compatible","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("420","0","Browsers","Browsers","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("421","0","What_are_my_Options","What are my Options?","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("422","0","With","With","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("423","0","request","Request","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("424","0","decline","Decline","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("425","0","give","Give","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("426","0","next","Next","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("427","0","payout","Payout","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("428","0","pay","Pay","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("429","0","via","Via","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("430","0","or","Or","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("431","0","Reply_to_Comment","Reply to Comment","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("432","0","Framework","Framework","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("433","0","Future","Future","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("434","0","expire","Expire","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("435","0","Quality_checked_by","Quality checked by","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("436","0","Theme","Theme","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("437","0","hosting","hosting","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("438","0","hosting","hosting","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("439","0","offer","offer","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("440","0","Extend_support_to","Extend support to","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("441","0","get_it_now","Get it now and save up to","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("442","0","Add_To_Cart","Add To Cart","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("443","0","Buy","Buy","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("444","0","star","Star","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("445","0","send","Send","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("446","0","message","Message","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("447","0","Now","Now","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("448","0","graph","Graph","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("449","0","notification","notification","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("450","0","notifications","notifications","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("451","0","Send_an_email_when_an_item_purchased_updated","Send an email when an item purchased is updated","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("452","0","backup_settings","Backup Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("453","0","download","Download","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("454","0","backup_files","Backup files","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("455","0","created_date_time","CREATED DATE TIME","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("456","0","address_recipeint","Your email address will be shown to the recipeint","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("457","0","extended","Extended","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("458","0","my","My","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("459","0","team","Teamy","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("460","0","send_notification_for_purchase","Send an email reminding me to rate an item a week after purchase","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("461","0","comment_notification","Send me an email when someone comments on one of my items","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("462","0","requirements","Requirements","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("463","0","profile_update_message","We do not sell or share your details without your permission. Find out more in our Privacy Policy. Your username, email and password can be updated via your Codepixar Account settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("464","0","tax","tax","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("465","0","Already_Added_This_Item","Already Added This Item","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("466","0","portfolio","Portfolio","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("467","0","unfollow","Unfollow","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("468","0","follow","Follow","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("469","0","your","Your","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("470","0","top","Top","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("471","0","tons_of_premium","Tons of premium","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("472","0","templates_are","Templates are","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("473","0","template","Template","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("474","0","waiting_for_you","Waiting for you!","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("475","0","there_are_advances_being_made_in_science","There are advances being made in science","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("476","0","technology_and_good","and technology everyday, and a good","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("477","0","example_of","example of this is the","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("478","0","countries","Countries","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("479","0","set","Set","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("480","0","set","Set","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("481","0","backup","Backup","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("482","0","earnings","Earnings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("483","0","this","this","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("484","0","this_overview","this overview","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("485","0","account","Account","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("486","0","message_for_rating","to help the author Improve this iteam , please leave a resone and a comment for young rating","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("487","0","ysreotl30d","Your sales and referral earnings over the last 30 days","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("488","0","we_do_not_sell","We do not sell or share your details without your permission. Find out more in our Privacy Policy. Your username, email and password","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("489","0","Upload_Your_First_Item","Upload Your First Item","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("490","0","database_backup_list","Database Backup List","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("491","0","welcome_for_author","Welcome and congratulations on becoming an author","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("492","0","with_Infix_Digital_Marketplace","with Infix Digital Marketplace","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("493","0","welcome_message_for_vendor","We do not sell or share your details without your permission. Find out more in our Privacy Policy. Your username, email
                                                                    and password can be updated via your Codepixar Account settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("494","0","upload_from_local_directory","Upload From Local Directory","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("495","0","All_prices_are","All prices are in USD","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("496","0","regular_license_description","Chances are unless you are very lucky you will go thru many different relationships before you find your special someone","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("497","0","extended_license_description","Chances are unless you are very lucky you will go thru many different relationships before you find your special someone","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("498","0","itemsale","Item Sales Count","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("499","0","tax","Tax","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("500","0","ticket","Ticket","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("501","0","choose","Choose","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("502","0","your","Your","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("503","0","purchase","Purchase","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("504","0","submit_separate","If you need to refunds for multiple purchase then you will have to submit separate requests","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("505","0","main_reason","Main reason for requesting a refund","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("506","0","describe_details","Describe your request","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("507","0","send_request","Send request","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("508","0","reason_request","Your refund request will be sent to the author for review.They may get in touch with you to discuss details of the request","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("509","0","dont_item","You dont have any refundable","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("510","0","refund","Refund","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("511","0","your_email address_recipeint","Your email address recipeint","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("512","0","request_refund","Request A Refund","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("513","0","reason_request","You dont have any refundable","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("514","0","counter","Countery","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("515","0","ticket_category","Ticket Category","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("516","0","category_list","Category List","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("517","0","ticket_system","Ticket System","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("518","0","order","Order","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("519","0","approve","Approve","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("520","0","are_you_want_to_Approve","Are you want to approve this item","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("521","0","are_you_want_to_deactive","Are you want to de-active this item","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("522","0","are_you_want_to_suspent","Are you want to suspend this item","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("523","0","affiliate","Affiliate","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("524","0","added_time","Added time","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("525","0","all","All","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("526","0","link","Link","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("527","0","ticket_list","ticket list","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("528","0","country","Country","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("529","0","state","State","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("530","0","submit","Submit","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("531","0","subject","subject","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("532","0","department","Department","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("533","0","search","search","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("534","0","departments","Departments","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("535","0","select_status","select status","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("536","0","ticket_priority","Ticket Priority","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("537","0","ticket_category","Ticket Category","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("538","0","department_name","Department name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("539","0","marital_status","Marital Status","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("540","0","married","Married","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("541","0","unmarried","Unmarried","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("542","0","select_criteria","Select Criteria","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("543","0","search_by_name","Search By Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("544","0","search_by_email","Search By Email","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("545","0","position","Position","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("546","0","custom","Custom","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("547","0","links","Links","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("548","0","page","Page","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("549","0","welcome_message_for_vendor_billing_info","We do not sell or share your details without your permission. Find out more in our Privacy Policy.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("550","0","shopping_cart","Shopping Cart","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("551","0","price_displayed_excludes_sales_tax","Price Displayed includes sales tax","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("552","0","continue_shopping","Continue Shopping","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("553","0","empty_cart","Empty Cart","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("554","0","apply","Apply","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("555","0","empty","Empty","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("556","0","secure_checkout","Secure Checkout","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("557","0","first_name","First Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("558","0","site_key","Site key","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("559","0","secret_key","Secret key","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("560","0","company_name","Company name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("561","0","country_name","Country Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("562","0","your_cart_total_is","Your Cart Total is","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("563","0","billing_details","Billing Details","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("564","0","city","City","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("565","0","your_order","Your Order","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("566","0","procced_to_payment","Procced to Payment","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("567","0","zip_postal_code","Zip/Postal code","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("568","0","you_can_buy_now","You can  buy now","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("569","0","card_holder_name","Card Holder Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("570","0","expiry_date","Expiry Date","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("571","0","card_CVV","Card CVV","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("572","0","save_for_next_time","Save for next time","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("573","0","make_ayment","Make Payment","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("574","0","sort_description","Sort Description","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("575","0","long_description","Long Description","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("576","0","go_to_item_Support","go to item Support","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("577","0","extended","Extended","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("578","0","limit","Limit","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("579","0","main_file_message","ZIP - All files for buyers, not including preview images.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("580","0","maximum_file_size_allowed_500MB","The maximum file size allowed is 500 MB - please ensure compression has been optimized before uploading.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("581","0","tags_message","Maximum of 15 keywords covering features, usage, and styling. Keywords should all be in lowercase and separated by commas. e.g. photography, gallery, modern, jquery, wordpress theme.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("582","0","price_message","The \"Recommended purchase price\" is just a guide to help you decide - all pricing decisions are yours and yours only.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("583","0","submit_message","Any images, sounds, video, code, flash, or other assets that are not my own work, have been appropriately licensed for use in the file preview or main download. Other than these items, this work is entirely my own and I have full rights to sell it on","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("584","0","upload_heading","It\'s important that you set the price for your items independently and not discuss your pricing decisions with other authors. The item price will include your author fee and your initial term of item support (if you offer it). See our Author Terms and Item Support breakdown if you want to know more","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("585","0","thumdnail_message","JPEG or PNG 80x80px Thumbnail","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("586","0","theme_preview_message","ZIP file of images (png/jpg)
            The first image appears on the Item Page and Search Results and must be 590x300 pixels and named 01_<filename>.jpg. You can include additional images which show off your item. Additional images must be named in the order that you want them to appear, for example, 02_<filename>.jpg, 03_<filename>.jpg, 04_<filename>.jpg. These images can be a maximum of 900x900 pixels, and may be cropped when displayed on the search results page to the same aspect ratio as the main preview image. Images must be JPGs or PNGs.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("587","0","key_feature_messsage","Highlight what makes your item unique or a key selling point. They appear on search result pages next to an image of your item. Max 45 characters per line. No HTML or emoji allowed. Do not repeat features or keyword spam.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("588","0","key_feature_messsage_description","HTML or plain text allowed, no emoji This field is used for search, so please be descriptive! If you\'re linking to external images, please mind the page load speed: use few, compress them and host them on a fast server or CDN.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("589","0","Contact_the_author","Contact the author","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("590","0","this_author_will_respond","This author will respond to buyers questions and provides limited support through their own support system.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("591","0","authors","Authors","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("592","0","front_settings","Front Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("593","0","footer_menu","Footer Menus","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("594","0","feature_title","Feature Title","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("595","0","menu_title","Menu Title","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("596","0","menu_url","Menu URL","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("597","0","menu","Menu","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("598","0","progress","Progress","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("599","0","your_shopping_cart_is_empty","Your Shopping Cart is Empty.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("600","0","search_box_color","Search Box Color","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("601","0","background_color","Background Color","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("602","0","front_settings","Front Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("603","0","footer_menu_ist","Footer Menu List","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("604","0","footer_menu_ist","Footer Menu List","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("605","0","footer_menu","Footer Menu","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("606","0","category_limit","Category limit","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("607","0","home_page","Home Page","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("608","0","Home_page","Home Page","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("609","0","feature","Feature","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("610","0","expired_coupon","Expired Coupon","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("611","0","delete_coupon","Delete Coupon","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("612","0","add_coupon","Add Coupon","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("613","0","heading_text","Heading Text","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("614","0","fund","Fund","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("615","0","depositor","depositor","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("616","0","receiver","receiver","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("617","0","note","note","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("618","0","funding_history","Fund History","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("619","0","ticket_text","Ticket Text","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("620","0","ip","IP","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("621","0","admin_profile","Admin Profile","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("622","0","priority_list","Priority List","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("623","0","staff","Staff","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("624","0","change_your_password","Change your password.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("625","0","move_to","Move To","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("626","0","recommended","Recommended","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("627","0","profile_setting","Profile Setting","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("628","0","text","Text","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("629","0","last_name","Last Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("630","0","region","Region","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("631","0","money","Money","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("632","0","agent","Agent","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("633","0","group","Group","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("634","0","individual","Individual","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("635","0","revenue","Revenue","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("636","0","extend_support_Fee","Extend Support Fee","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("637","0","role_permission","Pole Permission","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("638","0","assign_permission","Assain Permission","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("639","0","system","System","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("640","0","font_awesome_icon","Font Awesome Icon","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("641","0","social_url","Social URL","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("642","0","refuse","Refuse","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("643","0","owner","Owner","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("644","0","created_at","Created At","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("645","0","dipositor","Dipositor","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("646","0","enter_email","Enter Email","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("647","0","test_mail_configuration","Test Mail Configuration","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("648","0","test_mail","Test Mail","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("649","0","to","To","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("650","0","soft_rejected","Soft Rejected","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("651","0","hard_rejected","Hard Rejected","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("652","0","view_full_license","View full License","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("653","0","market_apis","Market Apis","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("654","0","package_plan","Package Plan","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("655","0","per_month","Per Month","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("656","0","talk_to_the_buyer","1. Talk to the buyer to see if you can help them","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("657","0","if_not_make","2. If not, make a decision with the refund.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("658","0","downloaded","Downloaded","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("659","0","not","Not","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("660","0","your_comment","Your Comment","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("661","0","live_review","Live Review","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("662","0","screenshoot","Screenshoot","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("663","0","item_support_policy","item support policy","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("664","0","send_an_email_to_the_author","Send an email to The author","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("665","0","all_messege_are_recorded","All messege are recorded ans spam is not tolerated. maximum word","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("666","0","sign_in_to_download_it_for_free","Sign in to download it for free","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("667","0","view_license_details","View license details","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("668","0","by_downloading_this_item","By downloading this item, you agree to the terms of the Regular License. Support and updates are not provided for free files.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("669","0","support_ticket","Support Ticket","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("670","0","tickets","Tickets","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("671","0","open_new_ticket","Open New Ticket","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("672","0","view_ticket","View Ticket","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("673","0","submitted","Submitted","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("674","0","back","Back","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("675","0","messege","Messege","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("676","0","upload_an_image","Upload an image","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("677","0","supported_extensions","supported extensions: .jpg, .gif, .jpeg, .png,.pdf, .doc, .docx, .xls, .xlsx, .csv, .sql, .txt, .html, .bmp,.zip,.tar.gz, .crt, .key, .ca-bundle","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("678","0","attach_a_file","Attach a file","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("679","0","open_ticket","Open Ticket","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("680","0","related_service","Related Service","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("681","0","open_a_new_tickets","Open a new Tickets","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("682","0","last_updated","Last Updated","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("683","0","ticket_id","Ticket ID","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("684","0","no_sales","No Sales","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("685","0","1_star_and_higher","1 Star and Higher","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("686","0","2_star_and_higher","2 Star and Higher","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("687","0","3_star_and_higher","3 Star and Higher","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("688","0","4_star_and_higher","4 Star and Higher","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("689","0","5_star_and_higher","5 Star and Higher","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("690","0","date_added","Date Added","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("691","0","software_version","Software Version","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("692","0","add_invoice","Add Invoice","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("693","0","total_community_earnings","Total Community Earnings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("694","0","total_items_sold","Total items sold","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("695","0","start_selling","Start Selling","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("696","0","view_portfolio","View Portfolio","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("697","0","member_since","Member since","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("698","0","total_sales","Total Sales","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("699","0","deposit_amount","Deposit Amount","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("700","0","postcode_ZIP","Postcode/ZIP","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("701","0","select_package","Select Package","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("702","0","get_package","get package","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("703","0","you_have_appproved_this_refund","You Have appproved this refund","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("704","0","product_features","Product features","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("705","0","best_sellers","Best Sellers","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("706","0","best_rated","Best Rated","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("707","0","price_high_to_low","Price High to Low","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("708","0","price_low_to_high","Price Low to High","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("709","0","clear_filter","Clear Filter","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("710","0","click_here","Click here","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("711","0","mobile_no","Mobile No","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("712","0","personal_info","Personal info","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("713","0","please_input_time_yearly","Please input time yearly","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("714","0","please_input","Please input 80*80 png or jpg","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("715","0","offline_payment","Offline Payment","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("716","0","bank_payment","Bank Payment","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("717","0","approved_deposit_request","Approved Deposit Request","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("718","0","bank_info","Bank Info","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("719","0","account_no","Account No","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("720","0","owner_name","Owner Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("721","0","approved","Approved","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("722","0","deposit","Deposit","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("723","0","are_you_sure_to_approve_this_deposit_request","Are you sure to approve this deposit request","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("724","0","bank_deposit_request","Bank Deposit Request","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("725","0","license_feature","License Feature","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("726","0","disable","Disable","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("727","0","enable","Enable","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("728","0","modules_list","Modules List","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("729","0","visitor_and_page_view","Visitor and Page View","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("730","0","new_client_information","New Client Information","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("731","0","select_styles","Select Styles","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("732","0","select_alignment","Select Alignment","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("733","0","approved_request","Approved Request","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("734","0","fund_list","Fund List","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("735","0","add_fund","Add Fund","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("736","0","author_balance","Author Balance","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("737","0","RECM_extended","RECM Extended","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("738","0","RECM_regular","RECM Regular","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("739","0","RECM_commercial","RECM COMMERCIAL","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("740","0","show_in_menu","Show In Menu","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("741","0","product_free","Product free","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("742","0","are_you_want_to_refund","Are you want to refund?","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("743","0","assign_permission","Assign Permission","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("744","0","new_saller","New Saller","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("745","0","top_best_saller","Top Best Saller","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("746","0","monthly_sales_report","Monthly Sales Report","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("747","0","daily_sales_report","Daily Sales Report","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("748","0","visitor_type","Visitor Type","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("749","0","visitor_country","Visitor Country","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("750","0","item_by","Item By","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("751","0","this_item_is_now_available_on_your","This item is now available on your","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("752","0","an_confirmation_email_is_coming_your_way","An confirmation Email is coming your way.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("753","0","payment_complete","Payment Complete","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("754","0","to_see_this_item","To see this item","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("755","0","click_here_to_request_another","Click here to request another","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("756","0","before_proceeding","Before proceeding, please check your email for a varification link. If you din not get the email.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("757","0","verify_your_email_address","Verify Your Email Address","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("758","0","mail_verify","Mail Verify","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("759","0","view_all_free_products","View All Free Products","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("760","0","free_product_of_the_month","Free product of the month","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("761","0","view_all_featured_products","View All Featured Products","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("762","0","continue","Continue","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("763","0","by_continuing_you_agree_to_the","By continuing you agree to the","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("764","0","become_an","Become an","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("765","0","in_the_last","In the Last","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("766","0","day","day","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("767","0","select_city","Select City","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("768","0","view_the","View the","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("769","0","this_is_free_item_file_of_the_month","This is Free Item File of the Month","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("770","0","compatible_with","Compatible with","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("771","0","compatible_browsers","Compatible browsers","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("772","0","high_resolution","High Resolution","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("773","0","in","In","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("774","0","sign_out","Sign Out","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("775","0","payouts","Payouts","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("776","0","statement","Statement","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("777","0","settings","Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("778","0","user_settings","User Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("779","0","author_settings","Author Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("780","0","become_a_author","Become an Author","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("781","0","balances","Balances","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("782","0","sign_in","Sign In","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("783","0","order_details","Order Details","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("784","0","payouts2_tab","payouts2-tab","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("785","0","payouts3_tab","Payouts3-tab","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("786","0","your_stripe_account","Your Stripe Account","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("787","0","minimum_amount_$50.00","Minimum amount $50.00","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("788","0","name_of_account_owner","Name of account owner","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("789","0","bank_name","Bank Name","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("790","0","by_continuing_you_agree_to_the","By continuing you agree to the","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("791","0","404_error_message_text","404 Error Message Text","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("792","0","sign_in_page_message","Sign In Page Message","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("793","0","view_text","View Text","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("794","0","font_awesome_icon_list","Font Awesome Icon List","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("795","0","complete","Complete","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("796","0","this_application_will_be_able_to","This application will be able to","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("797","0","is_requesting_permission_to_access_your_account.","is requesting permission to access your account.","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("798","0","authorization_request.","Authorization Request","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("799","0","module_humanResource.","Module HumanResource","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("800","0","crop","Crop","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("801","0","module_knowledgeBase","Module KnowledgeBase","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("802","0","sub_question","Sub question","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("803","0","module_mailSystem","Module MailSystem","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("804","0","this_view_is_loaded_from_module","This view is loaded from module","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("805","0","hello_world","Hello World","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("806","0","module_newsletter","Module Newsletter","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("807","0","module_pages","Module Pages","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("808","0","become_author_text","Become Author Text","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("809","0","update_item_support","Update Item Support","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("810","0","license_feature_list","License Feature List","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("811","0","module_refund","Module Refund","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("812","0","module_tax","Module Tax","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("813","0","download_file","Download file","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("814","0","module_icket","Module Ticket","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("815","0","module_systemsetting","Module Systemsetting","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("816","0","system_activated_date","System Activated Date","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("817","0","install_domain","Install Domain","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("818","0","purchase_code","Purchase code","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("819","0","curl_enable","Curl enable","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("820","0","PHP_version","PHP Version","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("821","0","Check_update","Check update","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("822","0","size","Size","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("823","0","database","Database","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("824","0","full_project","Full Project","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("825","0","images","Images","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("826","0","auto_approval","Auto Approval","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("827","0","auto_update","Auto Update","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("828","0","setup_fixer","Setup Fixer","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("829","0","fixer_access_key","Fixer Access Key","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("830","0","setup_google_analytics","Setup Google Analytics","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("831","0","GOOGLE_ANALYTICS_VIEW_ID","GOOGLE ANALYTICS VIEW ID","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("832","0","setup_third_party_APIs","Setup Third Party APIs","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("833","0","third_party_API","Third Party API","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("834","0","phrases","Phrases","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("835","0","default_phrases","Default Phrases","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("836","0","activated","Activated","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("837","0","live","Live","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("838","0","sandbox","Sandbox","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("839","0","LTL","LTL","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("840","0","RTL","RTL","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("841","0","footer_custom_link","Footer Custom Link","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("842","0","site_image_settings","Site Image Settings","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("843","0","about_company","About Company","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("844","0","become_author","Become Author","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("845","0","item_support","Item Support","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("846","0","terms_conditions","Terms & Conditions","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("847","0","privacy_policy","Privacy Policy","1","2021-04-28 12:41:57","2021-04-28 12:41:57");
INSERT INTO sm_language_phrases VALUES("848","0","frontend_CMS","Frontend CMS","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("849","0","dashboard_themes","Dashboard Themes","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("850","0","SEO_settings","SEO Settings","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("851","0","payment_method_settings","Payment Method Settings","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("852","0","role_permission","Role Permission","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("853","0","general_settings","General Settings","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("854","0","inventory","Inventory","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("855","0","logout","Logout","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("856","0","set_date","Set Date","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("857","0","start_date","Start Date","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("858","0","end_date","End Date","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("859","0","enter_coupon_code","Enter Coupon Code","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("860","0","payPal_accepts","PayPal accepts","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("861","0","use","Use","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("862","0","from_my_infix_balance_for_this_purchase","from my infix balance for this purchase","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("863","0","statements","Statements","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("864","0","refunds","Refunds","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("865","0","hidden_items","Hidden Items","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("866","0","social_profiles","Social Profiles","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("867","0","regular_license_with","Regular License with help wordpress file installation","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("868","0","get_notified","Get Notified by email if this item is updated","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("869","0","support_will_expair","support will expair","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("870","0","all_files_documentation","All files & documentation","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("871","0","installable_file_only","Installable file only","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("872","0","license_certificate_purchase_code","License certificate & purchase code (pdf)","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("873","0","reviewed_by","Reviewed by","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("874","0","no_refund_request","No Refund Request","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("875","0","minimum_amount","Minimum amount","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("876","0","xtemos","Xtemos","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("877","0","woodMark_responsive_woocommerce_theme","woodMark - responsive Woocommerce theme","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("878","0","fees","Fees","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("879","0","my_funds","My Funds","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("880","0","total_value_of_your_sales","Total value of your sales, before author fees (based on list price)","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("881","0","your_total_balance_after_associated_author_fees","Your total balance after associated author fees","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("882","0","setup_account","Setup Payout Account","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("883","0","add_a_new_razorPay_account","Add a New RazorPay Account","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("884","0","more_about_razorPay","More about RazorPay","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("885","0","razorPay_international_transfer","RazorPay (International Transfer)get paid directly into your bank account. Connected with over 9000 banking organisations, security institutions and customers in more than 200 countries","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("886","0","your_razorPay_account","Your RazorPay Account","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("887","0","create_an_account","Create an account","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("888","0","more_about_payPal","More about PayPal","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("889","0","get_paid_by_credit","Get paid by credit or debit card, PayPal transfer or even via bank account in just a few clicks.All you need is your email address or mobile number.","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("890","0","your_paypal_account","Your Paypal Account","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("891","0","more_about_stripe","More about Stripe","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("892","0","get_paid_by_credit_or","Get paid by credit or debit card, Stripe transfer or even via bank account in just a few clicks.All you need is your email address or mobile number.","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("893","0","your_stripe_account","Your Stripe Account","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("894","0","item_price","Item price","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("895","0","no_item","No Item","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("896","0","resubmit","Resubmit","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("897","0","product_validation","Product Validation","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("898","0","API_path","API Path","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("899","0","copy_text","Copy Text","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("900","0","genarate_API_key","Genarate API Key","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("901","0","CVC_number","CVC Number","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("902","0","expire_date","Expire Date","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("903","0","card_umber","Card Number","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("904","0","send_me_a_daily_summary","Send me a daily summary of all items approved or rejected","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("905","0","item_purchase_date","Item Purchase Date","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("906","0","item_purchase_code","Item Purchase Code","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("907","0","item_ID","Item ID","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("908","0","item_URL","Item URL","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("909","0","item_title","Item Title","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("910","0","licensors_author_username","Licensors Author Username","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("911","0","license_certificate","License Certificate","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("912","0","valid_date","Valid Date","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("913","0","coupon_code","Coupon Code","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("914","0","coupon_name","Coupon Name","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("915","0","coupon_list","Coupon list","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("916","0","coupon_item","Coupon Item","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("917","0","min_valid_rice","Min. Valid Price","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("918","0","discounted_amount","Discounted Amount","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("919","0","coupon_type","Coupon Type","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("920","0","inactive_coupons","Inactive Coupons","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("921","0","expired_coupons","Expired Coupons","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("922","0","restore","Restore","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("923","0","deleted_coupons","Deleted Coupons","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("924","0","enter_discount_rate","Enter discount rate","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("925","0","percent","Percent","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("926","0","fixed","Fixed","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("927","0","coupon_discount","Coupon Discount","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("928","0","multiple","Multiple","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("929","0","once","Once","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("930","0","all_coupons","All Coupons","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("931","0","all_active_coupons","All Active Coupons","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("932","0","help","Help","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("933","0","select_category","Select Category","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("934","0","select_switch_ategories","Select/switch Categories","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("935","0","upload_item","Upload Item","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("936","0","name_and_desription","Name and Desription","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("937","0","message_to_the_reviewer","Message to the Reviewer","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("938","0","purchase_price","Purchase price","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("939","0","BUYER_FEE","BUYER FEE","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("940","0","ITEM_PRISE","ITEM PRISE","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("941","0","extended_license","Extended License","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("942","0","regular_license","regular license","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("943","0","N/A","N/A","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("944","0","responsive","Responsive","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("945","0","liquid","Liquid","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("946","0","widget_ready","Widget Ready","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("947","0","categories_and_attributes","Categories and Attributes","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("948","0","ZIP_containing_an_installable","ZIP containing an installable","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("949","0","browse_file","Browse File","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("950","0","mark_all_images","Mark all images and make it zip. Please dont zip a folder.","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("951","0","theme_preview","Theme Preview","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("952","0","thumbnails","Thumbnails","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("953","0","maximum_100_characters_no_HTML_r_emoji_allowed","Maximum 100 characters. No HTML or emoji allowed","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("954","0","demo_url","Demo url","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("955","0","main_files","Main Files","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("956","0","your_previous_update_is_pending","Your previous update is pending, Please wait till get approval","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("957","0","images_found","images found","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("958","0","key_features","Key Features","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("959","0","search_your_product","Search your product","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("960","0","phone_number","Phone number","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("961","0","user_name","User name","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("962","0","confirm_password","Confirm Password","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("963","0","new_password","New Password","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("964","0","current_password","Current Password","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("965","0","enter_email_address","Enter email address","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("966","0","enter_fix_discount","Enter fix discount","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("967","0","to_date","To date","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("968","0","from_date","From date","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("969","0","full_name","Full Name","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("970","0","confirm_passowrd","Confirm Passowrd","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("971","0","enter_passowrd","Enter passowrd","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("972","0","username_email_address","Username / Email address","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("973","0","enter_username","Enter username","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("974","0","enter_full_name","Enter full name","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("975","0","enter_valid_email","Enter valid Email","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("976","0","froget_password","Froget Password","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("977","0","f_id","F-ID","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("978","0","there_are_no_comments_for_this_item_yet","There are no comments for this item yet","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("979","0","no_review_available","No Review Available","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("980","0","purchased","Purchased","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("981","0","supported","Supported","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("982","0","Upload_From_Local_Directory","Upload From Local Directory","1","2021-04-28 12:41:58","2021-04-28 12:41:58");
INSERT INTO sm_language_phrases VALUES("983","0","ga_site_tag_id","Google Analytics Tracking ID","1","2021-04-28 12:41:58","2021-04-28 12:41:58");



DROP TABLE sm_notifications;

CREATE TABLE `sm_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_id` int(11) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `active_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sm_notifications_001` (`user_id`),
  KEY `sm_notifications_002` (`role_id`),
  CONSTRAINT `sm_notifications_001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sm_notifications_002` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE social_icons;

CREATE TABLE `social_icons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `behance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deviantart` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dribbble` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flickr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_plus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastfm` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reddit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soundcloud` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumblr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vimeo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_icons_fk0` (`user_id`),
  CONSTRAINT `social_icons_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE social_logins;

CREATE TABLE `social_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_id_unique` (`provider_id`),
  KEY `social_logins_user_id_index` (`user_id`),
  CONSTRAINT `social_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE spn_cities;

CREATE TABLE `spn_cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE spn_countries;

CREATE TABLE `spn_countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso3` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonecode` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO spn_countries VALUES("1","Afghanistan","AFG","AF","93","AFN","Kabul","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("2","Aland Islands","ALA","AX","+358-18","EUR","Mariehamn","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("3","Albania","ALB","AL","355","ALL","Tirana","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("4","Algeria","DZA","DZ","213","DZD","Algiers","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("5","American Samoa","ASM","AS","+1-684","USD","Pago Pago","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("6","Andorra","AND","AD","376","EUR","Andorra la Vella","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("7","Angola","AGO","AO","244","AOA","Luanda","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("8","Anguilla","AIA","AI","+1-264","XCD","The Valley","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("9","Antarctica","ATA","AQ","","","","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("10","Antigua And Barbuda","ATG","AG","+1-268","XCD","St. John\'s","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("11","Argentina","ARG","AR","54","ARS","Buenos Aires","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("12","Armenia","ARM","AM","374","AMD","Yerevan","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("13","Aruba","ABW","AW","297","AWG","Oranjestad","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("14","Australia","AUS","AU","61","AUD","Canberra","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("15","Austria","AUT","AT","43","EUR","Vienna","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("16","Azerbaijan","AZE","AZ","994","AZN","Baku","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("17","Bahamas The","BHS","BS","+1-242","BSD","Nassau","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("18","Bahrain","BHR","BH","973","BHD","Manama","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("19","Bangladesh","BGD","BD","880","BDT","Dhaka","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("20","Barbados","BRB","BB","+1-246","BBD","Bridgetown","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("21","Belarus","BLR","BY","375","BYR","Minsk","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("22","Belgium","BEL","BE","32","EUR","Brussels","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("23","Belize","BLZ","BZ","501","BZD","Belmopan","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("24","Benin","BEN","BJ","229","XOF","Porto-Novo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("25","Bermuda","BMU","BM","+1-441","BMD","Hamilton","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("26","Bhutan","BTN","BT","975","BTN","Thimphu","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("27","Bolivia","BOL","BO","591","BOB","Sucre","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("28","Bosnia and Herzegovina","BIH","BA","387","BAM","Sarajevo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("29","Botswana","BWA","BW","267","BWP","Gaborone","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("30","Bouvet Island","BVT","BV","","NOK","","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("31","Brazil","BRA","BR","55","BRL","Brasilia","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("32","British Indian Ocean Territory","IOT","IO","246","USD","Diego Garcia","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("33","Brunei","BRN","BN","673","BND","Bandar Seri Begawan","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("34","Bulgaria","BGR","BG","359","BGN","Sofia","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("35","Burkina Faso","BFA","BF","226","XOF","Ouagadougou","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("36","Burundi","BDI","BI","257","BIF","Bujumbura","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("37","Cambodia","KHM","KH","855","KHR","Phnom Penh","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("38","Cameroon","CMR","CM","237","XAF","Yaounde","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("39","Canada","CAN","CA","1","CAD","Ottawa","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("40","Cape Verde","CPV","CV","238","CVE","Praia","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("41","Cayman Islands","CYM","KY","+1-345","KYD","George Town","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("42","Central African Republic","CAF","CF","236","XAF","Bangui","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("43","Chad","TCD","TD","235","XAF","N\'Djamena","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("44","Chile","CHL","CL","56","CLP","Santiago","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("45","China","CHN","CN","86","CNY","Beijing","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("46","Christmas Island","CXR","CX","61","AUD","Flying Fish Cove","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("47","Cocos (Keeling) Islands","CCK","CC","61","AUD","West Island","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("48","Colombia","COL","CO","57","COP","Bogota","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("49","Comoros","COM","KM","269","KMF","Moroni","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("50","Congo","COG","CG","242","XAF","Brazzaville","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("51","Congo The Democratic Republic Of The","COD","CD","243","CDF","Kinshasa","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("52","Cook Islands","COK","CK","682","NZD","Avarua","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("53","Costa Rica","CRI","CR","506","CRC","San Jose","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("54","Cote D\'Ivoire (Ivory Coast)","CIV","CI","225","XOF","Yamoussoukro","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("55","Croatia (Hrvatska)","HRV","HR","385","HRK","Zagreb","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("56","Cuba","CUB","CU","53","CUP","Havana","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("57","Cyprus","CYP","CY","357","EUR","Nicosia","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("58","Czech Republic","CZE","CZ","420","CZK","Prague","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("59","Denmark","DNK","DK","45","DKK","Copenhagen","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("60","Djibouti","DJI","DJ","253","DJF","Djibouti","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("61","Dominica","DMA","DM","+1-767","XCD","Roseau","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("62","Dominican Republic","DOM","DO","+1-809 and 1-829","DOP","Santo Domingo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("63","East Timor","TLS","TL","670","USD","Dili","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("64","Ecuador","ECU","EC","593","USD","Quito","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("65","Egypt","EGY","EG","20","EGP","Cairo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("66","El Salvador","SLV","SV","503","USD","San Salvador","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("67","Equatorial Guinea","GNQ","GQ","240","XAF","Malabo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("68","Eritrea","ERI","ER","291","ERN","Asmara","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("69","Estonia","EST","EE","372","EUR","Tallinn","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("70","Ethiopia","ETH","ET","251","ETB","Addis Ababa","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("71","Falkland Islands","FLK","FK","500","FKP","Stanley","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("72","Faroe Islands","FRO","FO","298","DKK","Torshavn","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("73","Fiji Islands","FJI","FJ","679","FJD","Suva","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("74","Finland","FIN","FI","358","EUR","Helsinki","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("75","France","FRA","FR","33","EUR","Paris","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("76","French Guiana","GUF","GF","594","EUR","Cayenne","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("77","French Polynesia","PYF","PF","689","XPF","Papeete","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("78","French Southern Territories","ATF","TF","","EUR","Port-aux-Francais","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("79","Gabon","GAB","GA","241","XAF","Libreville","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("80","Gambia The","GMB","GM","220","GMD","Banjul","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("81","Georgia","GEO","GE","995","GEL","Tbilisi","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("82","Germany","DEU","DE","49","EUR","Berlin","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("83","Ghana","GHA","GH","233","GHS","Accra","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("84","Gibraltar","GIB","GI","350","GIP","Gibraltar","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("85","Greece","GRC","GR","30","EUR","Athens","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("86","Greenland","GRL","GL","299","DKK","Nuuk","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("87","Grenada","GRD","GD","+1-473","XCD","St. George\'s","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("88","Guadeloupe","GLP","GP","590","EUR","Basse-Terre","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("89","Guam","GUM","GU","+1-671","USD","Hagatna","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("90","Guatemala","GTM","GT","502","GTQ","Guatemala City","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("91","Guernsey and Alderney","GGY","GG","+44-1481","GBP","St Peter Port","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("92","Guinea","GIN","GN","224","GNF","Conakry","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("93","Guinea-Bissau","GNB","GW","245","XOF","Bissau","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("94","Guyana","GUY","GY","592","GYD","Georgetown","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("95","Haiti","HTI","HT","509","HTG","Port-au-Prince","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("96","Heard and McDonald Islands","HMD","HM"," ","AUD","","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("97","Honduras","HND","HN","504","HNL","Tegucigalpa","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("98","Hong Kong S.A.R.","HKG","HK","852","HKD","Hong Kong","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("99","Hungary","HUN","HU","36","HUF","Budapest","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("100","Iceland","ISL","IS","354","ISK","Reykjavik","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("101","India","IND","IN","91","INR","New Delhi","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("102","Indonesia","IDN","ID","62","IDR","Jakarta","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("103","Iran","IRN","IR","98","IRR","Tehran","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("104","Iraq","IRQ","IQ","964","IQD","Baghdad","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("105","Ireland","IRL","IE","353","EUR","Dublin","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("106","Israel","ISR","IL","972","ILS","Jerusalem","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("107","Italy","ITA","IT","39","EUR","Rome","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("108","Jamaica","JAM","JM","+1-876","JMD","Kingston","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("109","Japan","JPN","JP","81","JPY","Tokyo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("110","Jersey","JEY","JE","+44-1534","GBP","Saint Helier","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("111","Jordan","JOR","JO","962","JOD","Amman","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("112","Kazakhstan","KAZ","KZ","7","KZT","Astana","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("113","Kenya","KEN","KE","254","KES","Nairobi","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("114","Kiribati","KIR","KI","686","AUD","Tarawa","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("115","Korea North
","PRK","KP","850","KPW","Pyongyang","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("116","Korea South","KOR","KR","82","KRW","Seoul","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("117","Kuwait","KWT","KW","965","KWD","Kuwait City","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("118","Kyrgyzstan","KGZ","KG","996","KGS","Bishkek","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("119","Laos","LAO","LA","856","LAK","Vientiane","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("120","Latvia","LVA","LV","371","EUR","Riga","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("121","Lebanon","LBN","LB","961","LBP","Beirut","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("122","Lesotho","LSO","LS","266","LSL","Maseru","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("123","Liberia","LBR","LR","231","LRD","Monrovia","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("124","Libya","LBY","LY","218","LYD","Tripolis","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("125","Liechtenstein","LIE","LI","423","CHF","Vaduz","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("126","Lithuania","LTU","LT","370","LTL","Vilnius","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("127","Luxembourg","LUX","LU","352","EUR","Luxembourg","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("128","Macau S.A.R.","MAC","MO","853","MOP","Macao","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("129","Macedonia","MKD","MK","389","MKD","Skopje","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("130","Madagascar","MDG","MG","261","MGA","Antananarivo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("131","Malawi","MWI","MW","265","MWK","Lilongwe","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("132","Malaysia","MYS","MY","60","MYR","Kuala Lumpur","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("133","Maldives","MDV","MV","960","MVR","Male","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("134","Mali","MLI","ML","223","XOF","Bamako","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("135","Malta","MLT","MT","356","EUR","Valletta","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("136","Man (Isle of)","IMN","IM","+44-1624","GBP","Douglas, Isle of Man","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("137","Marshall Islands","MHL","MH","692","USD","Majuro","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("138","Martinique","MTQ","MQ","596","EUR","Fort-de-France","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("139","Mauritania","MRT","MR","222","MRO","Nouakchott","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("140","Mauritius","MUS","MU","230","MUR","Port Louis","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("141","Mayotte","MYT","YT","262","EUR","Mamoudzou","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("142","Mexico","MEX","MX","52","MXN","Mexico City","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("143","Micronesia","FSM","FM","691","USD","Palikir","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("144","Moldova","MDA","MD","373","MDL","Chisinau","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("145","Monaco","MCO","MC","377","EUR","Monaco","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("146","Mongolia","MNG","MN","976","MNT","Ulan Bator","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("147","Montenegro","MNE","ME","382","EUR","Podgorica","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("148","Montserrat","MSR","MS","+1-664","XCD","Plymouth","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("149","Morocco","MAR","MA","212","MAD","Rabat","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("150","Mozambique","MOZ","MZ","258","MZN","Maputo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("151","Myanmar","MMR","MM","95","MMK","Nay Pyi Taw","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("152","Namibia","NAM","NA","264","NAD","Windhoek","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("153","Nauru","NRU","NR","674","AUD","Yaren","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("154","Nepal","NPL","NP","977","NPR","Kathmandu","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("155","Netherlands Antilles","ANT","AN","","","","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("156","Netherlands The","NLD","NL","31","EUR","Amsterdam","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("157","New Caledonia","NCL","NC","687","XPF","Noumea","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("158","New Zealand","NZL","NZ","64","NZD","Wellington","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("159","Nicaragua","NIC","NI","505","NIO","Managua","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("160","Niger","NER","NE","227","XOF","Niamey","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("161","Nigeria","NGA","NG","234","NGN","Abuja","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("162","Niue","NIU","NU","683","NZD","Alofi","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("163","Norfolk Island","NFK","NF","672","AUD","Kingston","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("164","Northern Mariana Islands","MNP","MP","+1-670","USD","Saipan","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("165","Norway","NOR","NO","47","NOK","Oslo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("166","Oman","OMN","OM","968","OMR","Muscat","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("167","Pakistan","PAK","PK","92","PKR","Islamabad","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("168","Palau","PLW","PW","680","USD","Melekeok","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("169","Palestinian Territory Occupied","PSE","PS","970","ILS","East Jerusalem","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("170","Panama","PAN","PA","507","PAB","Panama City","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("171","Papua new Guinea","PNG","PG","675","PGK","Port Moresby","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("172","Paraguay","PRY","PY","595","PYG","Asuncion","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("173","Peru","PER","PE","51","PEN","Lima","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("174","Philippines","PHL","PH","63","PHP","Manila","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("175","Pitcairn Island","PCN","PN","870","NZD","Adamstown","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("176","Poland","POL","PL","48","PLN","Warsaw","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("177","Portugal","PRT","PT","351","EUR","Lisbon","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("178","Puerto Rico","PRI","PR","+1-787 and 1-939","USD","San Juan","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("179","Qatar","QAT","QA","974","QAR","Doha","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("180","Reunion","REU","RE","262","EUR","Saint-Denis","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("181","Romania","ROU","RO","40","RON","Bucharest","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("182","Russia","RUS","RU","7","RUB","Moscow","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("183","Rwanda","RWA","RW","250","RWF","Kigali","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("184","Saint Helena","SHN","SH","290","SHP","Jamestown","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("185","Saint Kitts And Nevis","KNA","KN","+1-869","XCD","Basseterre","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("186","Saint Lucia","LCA","LC","+1-758","XCD","Castries","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("187","Saint Pierre and Miquelon","SPM","PM","508","EUR","Saint-Pierre","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("188","Saint Vincent And The Grenadines","VCT","VC","+1-784","XCD","Kingstown","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("189","Saint-Barthelemy","BLM","BL","590","EUR","Gustavia","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("190","Saint-Martin (French part)","MAF","MF","590","EUR","Marigot","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("191","Samoa","WSM","WS","685","WST","Apia","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("192","San Marino","SMR","SM","378","EUR","San Marino","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("193","Sao Tome and Principe","STP","ST","239","STD","Sao Tome","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("194","Saudi Arabia","SAU","SA","966","SAR","Riyadh","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("195","Senegal","SEN","SN","221","XOF","Dakar","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("196","Serbia","SRB","RS","381","RSD","Belgrade","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("197","Seychelles","SYC","SC","248","SCR","Victoria","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("198","Sierra Leone","SLE","SL","232","SLL","Freetown","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("199","Singapore","SGP","SG","65","SGD","Singapur","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("200","Slovakia","SVK","SK","421","EUR","Bratislava","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("201","Slovenia","SVN","SI","386","EUR","Ljubljana","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("202","Solomon Islands","SLB","SB","677","SBD","Honiara","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("203","Somalia","SOM","SO","252","SOS","Mogadishu","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("204","South Africa","ZAF","ZA","27","ZAR","Pretoria","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("205","South Georgia","SGS","GS","","GBP","Grytviken","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("206","South Sudan","SSD","SS","211","SSP","Juba","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("207","Spain","ESP","ES","34","EUR","Madrid","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("208","Sri Lanka","LKA","LK","94","LKR","Colombo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("209","Sudan","SDN","SD","249","SDG","Khartoum","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("210","Suriname","SUR","SR","597","SRD","Paramaribo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("211","Svalbard And Jan Mayen Islands","SJM","SJ","47","NOK","Longyearbyen","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("212","Swaziland","SWZ","SZ","268","SZL","Mbabane","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("213","Sweden","SWE","SE","46","SEK","Stockholm","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("214","Switzerland","CHE","CH","41","CHF","Berne","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("215","Syria","SYR","SY","963","SYP","Damascus","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("216","Taiwan","TWN","TW","886","TWD","Taipei","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("217","Tajikistan","TJK","TJ","992","TJS","Dushanbe","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("218","Tanzania","TZA","TZ","255","TZS","Dodoma","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("219","Thailand","THA","TH","66","THB","Bangkok","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("220","Togo","TGO","TG","228","XOF","Lome","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("221","Tokelau","TKL","TK","690","NZD","","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("222","Tonga","TON","TO","676","TOP","Nuku\'alofa","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("223","Trinidad And Tobago","TTO","TT","+1-868","TTD","Port of Spain","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("224","Tunisia","TUN","TN","216","TND","Tunis","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("225","Turkey","TUR","TR","90","TRY","Ankara","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("226","Turkmenistan","TKM","TM","993","TMT","Ashgabat","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("227","Turks And Caicos Islands","TCA","TC","+1-649","USD","Cockburn Town","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("228","Tuvalu","TUV","TV","688","AUD","Funafuti","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("229","Uganda","UGA","UG","256","UGX","Kampala","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("230","Ukraine","UKR","UA","380","UAH","Kiev","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("231","United Arab Emirates","ARE","AE","971","AED","Abu Dhabi","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("232","United Kingdom","GBR","GB","44","GBP","London","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("233","United States","USA","US","1","USD","Washington","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("234","United States Minor Outlying Islands","UMI","UM","1","USD","","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("235","Uruguay","URY","UY","598","UYU","Montevideo","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("236","Uzbekistan","UZB","UZ","998","UZS","Tashkent","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("237","Vanuatu","VUT","VU","678","VUV","Port Vila","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("238","Vatican City State (Holy See)","VAT","VA","379","EUR","Vatican City","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("239","Venezuela","VEN","VE","58","VEF","Caracas","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("240","Vietnam","VNM","VN","84","VND","Hanoi","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("241","Virgin Islands (British)","VGB","VG","+1-284","USD","Road Town","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("242","Virgin Islands (US)","VIR","VI","+1-340","USD","Charlotte Amalie","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("243","Wallis And Futuna Islands","WLF","WF","681","XPF","Mata Utu","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("244","Western Sahara","ESH","EH","212","MAD","El-Aaiun","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("245","Yemen","YEM","YE","967","YER","Sanaa","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("246","Zambia","ZMB","ZM","260","ZMK","Lusaka","1","2018-07-20 14:41:03","2018-07-20 14:41:03");
INSERT INTO spn_countries VALUES("247","Zimbabwe","ZWE","ZW","263","ZWL","Harare","1","2018-07-20 14:41:03","2018-07-20 14:41:03");



DROP TABLE spn_states;

CREATE TABLE `spn_states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4029 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO spn_states VALUES("1","Badakhshan","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("2","Badgis","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("3","Baglan","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("4","Balkh","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("5","Bamiyan","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("6","Farah","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("7","Faryab","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("8","Gawr","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("9","Gazni","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("10","Herat","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("11","Hilmand","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("12","Jawzjan","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("13","Kabul","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("14","Kapisa","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("15","Khawst","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("16","Kunar","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("17","Lagman","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("18","Lawghar","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("19","Nangarhar","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("20","Nimruz","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("21","Nuristan","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("22","Paktika","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("23","Paktiya","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("24","Parwan","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("25","Qandahar","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("26","Qunduz","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("27","Samangan","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("28","Sar-e Pul","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("29","Takhar","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("30","Uruzgan","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("31","Wardag","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("32","Zabul","1","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("33","Berat","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("34","Bulqize","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("35","Delvine","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("36","Devoll","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("37","Dibre","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("38","Durres","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("39","Elbasan","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("40","Fier","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("41","Gjirokaster","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("42","Gramsh","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("43","Has","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("44","Kavaje","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("45","Kolonje","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("46","Korce","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("47","Kruje","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("48","Kucove","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("49","Kukes","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("50","Kurbin","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("51","Lezhe","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("52","Librazhd","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("53","Lushnje","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("54","Mallakaster","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("55","Malsi e Madhe","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("56","Mat","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("57","Mirdite","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("58","Peqin","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("59","Permet","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("60","Pogradec","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("61","Puke","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("62","Sarande","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("63","Shkoder","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("64","Skrapar","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("65","Tepelene","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("66","Tirane","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("67","Tropoje","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("68","Vlore","3","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("69","Ayn Daflah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("70","Ayn Tamushanat","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("71","Adrar","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("72","Algiers","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("73","Annabah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("74","Bashshar","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("75","Batnah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("76","Bijayah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("77","Biskrah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("78","Blidah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("79","Buirah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("80","Bumardas","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("81","Burj Bu Arririj","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("82","Ghalizan","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("83","Ghardayah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("84","Ilizi","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("85","Jijili","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("86","Jilfah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("87","Khanshalah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("88","Masilah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("89","Midyah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("90","Milah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("91","Muaskar","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("92","Mustaghanam","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("93","Naama","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("94","Oran","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("95","Ouargla","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("96","Qalmah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("97","Qustantinah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("98","Sakikdah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("99","Satif","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("100","Sayda\'","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("101","Sidi ban-al-\'Abbas","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("102","Suq Ahras","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("103","Tamanghasat","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("104","Tibazah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("105","Tibissah","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("106","Tilimsan","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("107","Tinduf","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("108","Tisamsilt","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("109","Tiyarat","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("110","Tizi Wazu","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("111","Umm-al-Bawaghi","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("112","Wahran","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("113","Warqla","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("114","Wilaya d Alger","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("115","Wilaya de Bejaia","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("116","Wilaya de Constantine","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("117","al-Aghwat","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("118","al-Bayadh","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("119","al-Jaza\'ir","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("120","al-Wad","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("121","ash-Shalif","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("122","at-Tarif","4","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("123","Eastern","5","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("124","Manu\'a","5","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("125","Swains Island","5","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("126","Western","5","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("127","Andorra la Vella","6","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("128","Canillo","6","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("129","Encamp","6","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("130","La Massana","6","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("131","Les Escaldes","6","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("132","Ordino","6","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("133","Sant Julia de Loria","6","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("134","Bengo","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("135","Benguela","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("136","Bie","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("137","Cabinda","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("138","Cunene","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("139","Huambo","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("140","Huila","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("141","Kuando-Kubango","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("142","Kwanza Norte","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("143","Kwanza Sul","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("144","Luanda","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("145","Lunda Norte","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("146","Lunda Sul","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("147","Malanje","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("148","Moxico","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("149","Namibe","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("150","Uige","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("151","Zaire","7","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("152","Other Provinces","8","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("153","Sector claimed by Argentina/Ch","9","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("154","Sector claimed by Argentina/UK","9","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("155","Sector claimed by Australia","9","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("156","Sector claimed by France","9","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("157","Sector claimed by New Zealand","9","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("158","Sector claimed by Norway","9","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("159","Unclaimed Sector","9","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("160","Barbuda","10","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("161","Saint George","10","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("162","Saint John","10","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("163","Saint Mary","10","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("164","Saint Paul","10","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("165","Saint Peter","10","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("166","Saint Philip","10","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("167","Buenos Aires","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("168","Catamarca","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("169","Chaco","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("170","Chubut","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("171","Cordoba","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("172","Corrientes","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("173","Distrito Federal","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("174","Entre Rios","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("175","Formosa","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("176","Jujuy","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("177","La Pampa","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("178","La Rioja","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("179","Mendoza","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("180","Misiones","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("181","Neuquen","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("182","Rio Negro","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("183","Salta","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("184","San Juan","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("185","San Luis","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("186","Santa Cruz","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("187","Santa Fe","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("188","Santiago del Estero","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("189","Tierra del Fuego","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("190","Tucuman","11","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("191","Aragatsotn","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("192","Ararat","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("193","Armavir","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("194","Gegharkunik","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("195","Kotaik","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("196","Lori","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("197","Shirak","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("198","Stepanakert","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("199","Syunik","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("200","Tavush","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("201","Vayots Dzor","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("202","Yerevan","12","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("203","Aruba","13","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("204","Auckland","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("205","Australian Capital Territory","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("206","Balgowlah","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("207","Balmain","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("208","Bankstown","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("209","Baulkham Hills","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("210","Bonnet Bay","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("211","Camberwell","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("212","Carole Park","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("213","Castle Hill","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("214","Caulfield","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("215","Chatswood","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("216","Cheltenham","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("217","Cherrybrook","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("218","Clayton","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("219","Collingwood","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("220","Frenchs Forest","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("221","Hawthorn","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("222","Jannnali","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("223","Knoxfield","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("224","Melbourne","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("225","New South Wales","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("226","Northern Territory","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("227","Perth","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("228","Queensland","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("229","South Australia","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("230","Tasmania","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("231","Templestowe","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("232","Victoria","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("233","Werribee south","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("234","Western Australia","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("235","Wheeler","14","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("236","Bundesland Salzburg","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("237","Bundesland Steiermark","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("238","Bundesland Tirol","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("239","Burgenland","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("240","Carinthia","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("241","Karnten","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("242","Liezen","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("243","Lower Austria","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("244","Niederosterreich","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("245","Oberosterreich","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("246","Salzburg","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("247","Schleswig-Holstein","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("248","Steiermark","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("249","Styria","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("250","Tirol","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("251","Upper Austria","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("252","Vorarlberg","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("253","Wien","15","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("254","Abseron","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("255","Baki Sahari","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("256","Ganca","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("257","Ganja","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("258","Kalbacar","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("259","Lankaran","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("260","Mil-Qarabax","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("261","Mugan-Salyan","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("262","Nagorni-Qarabax","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("263","Naxcivan","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("264","Priaraks","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("265","Qazax","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("266","Saki","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("267","Sirvan","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("268","Xacmaz","16","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("269","\'Isa","18","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("270","Badiyah","18","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("271","Hidd","18","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("272","Jidd Hafs","18","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("273","Mahama","18","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("274","Manama","18","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("275","Sitrah","18","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("276","al-Manamah","18","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("277","al-Muharraq","18","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("278","ar-Rifa\'a","18","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("279","Bagar Hat","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("280","Bandarban","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("281","Barguna","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("282","Barisal","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("283","Bhola","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("284","Bogora","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("285","Brahman Bariya","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("286","Chandpur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("287","Chattagam","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("288","Chittagong Division","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("289","Chuadanga","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("290","Dhaka","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("291","Dinajpur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("292","Faridpur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("293","Feni","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("294","Gaybanda","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("295","Gazipur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("296","Gopalganj","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("297","Habiganj","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("298","Jaipur Hat","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("299","Jamalpur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("300","Jessor","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("301","Jhalakati","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("302","Jhanaydah","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("303","Khagrachhari","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("304","Khulna","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("305","Kishorganj","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("306","Koks Bazar","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("307","Komilla","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("308","Kurigram","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("309","Kushtiya","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("310","Lakshmipur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("311","Lalmanir Hat","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("312","Madaripur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("313","Magura","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("314","Maimansingh","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("315","Manikganj","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("316","Maulvi Bazar","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("317","Meherpur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("318","Munshiganj","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("319","Naral","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("320","Narayanganj","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("321","Narsingdi","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("322","Nator","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("323","Naugaon","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("324","Nawabganj","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("325","Netrakona","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("326","Nilphamari","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("327","Noakhali","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("328","Pabna","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("329","Panchagarh","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("330","Patuakhali","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("331","Pirojpur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("332","Rajbari","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("333","Rajshahi","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("334","Rangamati","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("335","Rangpur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("336","Satkhira","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("337","Shariatpur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("338","Sherpur","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("339","Silhat","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("340","Sirajganj","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("341","Sunamganj","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("342","Tangayal","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("343","Thakurgaon","19","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("344","Christ Church","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("345","Saint Andrew","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("346","Saint George","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("347","Saint James","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("348","Saint John","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("349","Saint Joseph","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("350","Saint Lucy","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("351","Saint Michael","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("352","Saint Peter","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("353","Saint Philip","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("354","Saint Thomas","20","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("355","Brest","21","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("356","Homjel\'","21","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("357","Hrodna","21","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("358","Mahiljow","21","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("359","Mahilyowskaya Voblasts","21","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("360","Minsk","21","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("361","Minskaja Voblasts\'","21","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("362","Petrik","21","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("363","Vicebsk","21","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("364","Antwerpen","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("365","Berchem","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("366","Brabant","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("367","Brabant Wallon","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("368","Brussel","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("369","East Flanders","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("370","Hainaut","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("371","Liege","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("372","Limburg","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("373","Luxembourg","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("374","Namur","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("375","Ontario","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("376","Oost-Vlaanderen","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("377","Provincie Brabant","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("378","Vlaams-Brabant","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("379","Wallonne","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("380","West-Vlaanderen","22","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("381","Belize","23","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("382","Cayo","23","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("383","Corozal","23","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("384","Orange Walk","23","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("385","Stann Creek","23","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("386","Toledo","23","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("387","Alibori","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("388","Atacora","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("389","Atlantique","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("390","Borgou","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("391","Collines","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("392","Couffo","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("393","Donga","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("394","Littoral","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("395","Mono","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("396","Oueme","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("397","Plateau","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("398","Zou","24","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("399","Hamilton","25","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("400","Saint George","25","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("401","Bumthang","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("402","Chhukha","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("403","Chirang","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("404","Daga","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("405","Geylegphug","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("406","Ha","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("407","Lhuntshi","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("408","Mongar","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("409","Pemagatsel","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("410","Punakha","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("411","Rinpung","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("412","Samchi","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("413","Samdrup Jongkhar","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("414","Shemgang","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("415","Tashigang","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("416","Timphu","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("417","Tongsa","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("418","Wangdiphodrang","26","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("419","Beni","27","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("420","Chuquisaca","27","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("421","Cochabamba","27","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("422","La Paz","27","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("423","Oruro","27","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("424","Pando","27","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("425","Potosi","27","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("426","Santa Cruz","27","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("427","Tarija","27","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("428","Federacija Bosna i Hercegovina","28","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("429","Republika Srpska","28","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("430","Central Bobonong","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("431","Central Boteti","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("432","Central Mahalapye","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("433","Central Serowe-Palapye","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("434","Central Tutume","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("435","Chobe","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("436","Francistown","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("437","Gaborone","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("438","Ghanzi","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("439","Jwaneng","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("440","Kgalagadi North","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("441","Kgalagadi South","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("442","Kgatleng","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("443","Kweneng","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("444","Lobatse","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("445","Ngamiland","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("446","Ngwaketse","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("447","North East","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("448","Okavango","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("449","Orapa","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("450","Selibe Phikwe","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("451","South East","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("452","Sowa","29","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("453","Bouvet Island","30","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("454","Acre","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("455","Alagoas","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("456","Amapa","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("457","Amazonas","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("458","Bahia","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("459","Ceara","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("460","Distrito Federal","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("461","Espirito Santo","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("462","Estado de Sao Paulo","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("463","Goias","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("464","Maranhao","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("465","Mato Grosso","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("466","Mato Grosso do Sul","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("467","Minas Gerais","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("468","Para","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("469","Paraiba","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("470","Parana","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("471","Pernambuco","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("472","Piaui","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("473","Rio Grande do Norte","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("474","Rio Grande do Sul","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("475","Rio de Janeiro","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("476","Rondonia","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("477","Roraima","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("478","Santa Catarina","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("479","Sao Paulo","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("480","Sergipe","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("481","Tocantins","31","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("482","British Indian Ocean Territory","32","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("483","Blagoevgrad","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("484","Burgas","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("485","Dobrich","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("486","Gabrovo","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("487","Haskovo","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("488","Jambol","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("489","Kardzhali","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("490","Kjustendil","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("491","Lovech","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("492","Montana","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("493","Oblast Sofiya-Grad","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("494","Pazardzhik","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("495","Pernik","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("496","Pleven","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("497","Plovdiv","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("498","Razgrad","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("499","Ruse","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("500","Shumen","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("501","Silistra","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("502","Sliven","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("503","Smoljan","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("504","Sofija grad","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("505","Sofijska oblast","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("506","Stara Zagora","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("507","Targovishte","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("508","Varna","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("509","Veliko Tarnovo","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("510","Vidin","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("511","Vraca","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("512","Yablaniza","34","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("513","Bale","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("514","Bam","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("515","Bazega","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("516","Bougouriba","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("517","Boulgou","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("518","Boulkiemde","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("519","Comoe","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("520","Ganzourgou","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("521","Gnagna","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("522","Gourma","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("523","Houet","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("524","Ioba","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("525","Kadiogo","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("526","Kenedougou","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("527","Komandjari","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("528","Kompienga","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("529","Kossi","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("530","Kouritenga","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("531","Kourweogo","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("532","Leraba","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("533","Mouhoun","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("534","Nahouri","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("535","Namentenga","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("536","Noumbiel","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("537","Oubritenga","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("538","Oudalan","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("539","Passore","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("540","Poni","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("541","Sanguie","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("542","Sanmatenga","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("543","Seno","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("544","Sissili","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("545","Soum","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("546","Sourou","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("547","Tapoa","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("548","Tuy","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("549","Yatenga","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("550","Zondoma","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("551","Zoundweogo","35","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("552","Bubanza","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("553","Bujumbura","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("554","Bururi","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("555","Cankuzo","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("556","Cibitoke","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("557","Gitega","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("558","Karuzi","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("559","Kayanza","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("560","Kirundo","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("561","Makamba","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("562","Muramvya","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("563","Muyinga","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("564","Ngozi","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("565","Rutana","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("566","Ruyigi","36","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("567","Banteay Mean Chey","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("568","Bat Dambang","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("569","Kampong Cham","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("570","Kampong Chhnang","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("571","Kampong Spoeu","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("572","Kampong Thum","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("573","Kampot","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("574","Kandal","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("575","Kaoh Kong","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("576","Kracheh","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("577","Krong Kaeb","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("578","Krong Pailin","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("579","Krong Preah Sihanouk","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("580","Mondol Kiri","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("581","Otdar Mean Chey","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("582","Phnum Penh","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("583","Pousat","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("584","Preah Vihear","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("585","Prey Veaeng","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("586","Rotanak Kiri","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("587","Siem Reab","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("588","Stueng Traeng","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("589","Svay Rieng","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("590","Takaev","37","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("591","Adamaoua","38","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("592","Centre","38","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("593","Est","38","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("594","Littoral","38","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("595","Nord","38","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("596","Nord Extreme","38","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("597","Nordouest","38","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("598","Ouest","38","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("599","Sud","38","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("600","Sudouest","38","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("601","Alberta","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("602","British Columbia","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("603","Manitoba","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("604","New Brunswick","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("605","Newfoundland and Labrador","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("606","Northwest Territories","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("607","Nova Scotia","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("608","Nunavut","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("609","Ontario","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("610","Prince Edward Island","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("611","Quebec","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("612","Saskatchewan","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("613","Yukon","39","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("614","Boavista","40","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("615","Brava","40","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("616","Fogo","40","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("617","Maio","40","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("618","Sal","40","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("619","Santo Antao","40","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("620","Sao Nicolau","40","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("621","Sao Tiago","40","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("622","Sao Vicente","40","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("623","Grand Cayman","41","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("624","Bamingui-Bangoran","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("625","Bangui","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("626","Basse-Kotto","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("627","Haut-Mbomou","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("628","Haute-Kotto","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("629","Kemo","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("630","Lobaye","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("631","Mambere-Kadei","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("632","Mbomou","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("633","Nana-Gribizi","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("634","Nana-Mambere","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("635","Ombella Mpoko","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("636","Ouaka","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("637","Ouham","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("638","Ouham-Pende","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("639","Sangha-Mbaere","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("640","Vakaga","42","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("641","Batha","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("642","Biltine","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("643","Bourkou-Ennedi-Tibesti","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("644","Chari-Baguirmi","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("645","Guera","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("646","Kanem","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("647","Lac","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("648","Logone Occidental","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("649","Logone Oriental","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("650","Mayo-Kebbi","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("651","Moyen-Chari","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("652","Ouaddai","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("653","Salamat","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("654","Tandjile","43","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("655","Aisen","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("656","Antofagasta","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("657","Araucania","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("658","Atacama","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("659","Bio Bio","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("660","Coquimbo","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("661","Libertador General Bernardo O\'","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("662","Los Lagos","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("663","Magellanes","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("664","Maule","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("665","Metropolitana","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("666","Metropolitana de Santiago","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("667","Tarapaca","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("668","Valparaiso","44","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("669","Anhui","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("670","Anhui Province","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("671","Anhui Sheng","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("672","Aomen","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("673","Beijing","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("674","Beijing Shi","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("675","Chongqing","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("676","Fujian","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("677","Fujian Sheng","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("678","Gansu","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("679","Guangdong","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("680","Guangdong Sheng","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("681","Guangxi","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("682","Guizhou","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("683","Hainan","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("684","Hebei","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("685","Heilongjiang","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("686","Henan","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("687","Hubei","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("688","Hunan","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("689","Jiangsu","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("690","Jiangsu Sheng","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("691","Jiangxi","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("692","Jilin","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("693","Liaoning","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("694","Liaoning Sheng","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("695","Nei Monggol","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("696","Ningxia Hui","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("697","Qinghai","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("698","Shaanxi","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("699","Shandong","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("700","Shandong Sheng","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("701","Shanghai","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("702","Shanxi","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("703","Sichuan","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("704","Tianjin","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("705","Xianggang","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("706","Xinjiang","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("707","Xizang","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("708","Yunnan","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("709","Zhejiang","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("710","Zhejiang Sheng","45","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("711","Christmas Island","46","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("712","Cocos (Keeling) Islands","47","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("713","Amazonas","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("714","Antioquia","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("715","Arauca","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("716","Atlantico","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("717","Bogota","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("718","Bolivar","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("719","Boyaca","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("720","Caldas","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("721","Caqueta","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("722","Casanare","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("723","Cauca","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("724","Cesar","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("725","Choco","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("726","Cordoba","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("727","Cundinamarca","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("728","Guainia","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("729","Guaviare","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("730","Huila","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("731","La Guajira","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("732","Magdalena","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("733","Meta","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("734","Narino","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("735","Norte de Santander","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("736","Putumayo","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("737","Quindio","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("738","Risaralda","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("739","San Andres y Providencia","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("740","Santander","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("741","Sucre","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("742","Tolima","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("743","Valle del Cauca","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("744","Vaupes","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("745","Vichada","48","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("746","Mwali","49","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("747","Njazidja","49","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("748","Nzwani","49","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("749","Bouenza","50","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("750","Brazzaville","50","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("751","Cuvette","50","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("752","Kouilou","50","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("753","Lekoumou","50","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("754","Likouala","50","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("755","Niari","50","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("756","Plateaux","50","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("757","Pool","50","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("758","Sangha","50","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("759","Aitutaki","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("760","Atiu","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("761","Mangaia","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("762","Manihiki","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("763","Mauke","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("764","Mitiaro","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("765","Nassau","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("766","Pukapuka","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("767","Rakahanga","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("768","Rarotonga","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("769","Tongareva","52","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("770","Alajuela","53","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("771","Cartago","53","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("772","Guanacaste","53","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("773","Heredia","53","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("774","Limon","53","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("775","Puntarenas","53","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("776","San Jose","53","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("777","Camaguey","56","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("778","Ciego de Avila","56","1","2018-07-20 14:53:15","2018-07-20 14:53:15");
INSERT INTO spn_states VALUES("779","Cienfuegos","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("780","Ciudad de la Habana","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("781","Granma","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("782","Guantanamo","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("783","Habana","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("784","Holguin","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("785","Isla de la Juventud","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("786","La Habana","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("787","Las Tunas","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("788","Matanzas","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("789","Pinar del Rio","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("790","Sancti Spiritus","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("791","Santiago de Cuba","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("792","Villa Clara","56","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("793","Government controlled area","57","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("794","Limassol","57","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("795","Nicosia District","57","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("796","Paphos","57","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("797","Turkish controlled area","57","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("798","Central Bohemian","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("799","Frycovice","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("800","Jihocesky Kraj","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("801","Jihochesky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("802","Jihomoravsky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("803","Karlovarsky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("804","Klecany","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("805","Kralovehradecky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("806","Liberecky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("807","Lipov","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("808","Moravskoslezsky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("809","Olomoucky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("810","Olomoucky Kraj","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("811","Pardubicky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("812","Plzensky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("813","Praha","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("814","Rajhrad","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("815","Smirice","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("816","South Moravian","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("817","Straz nad Nisou","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("818","Stredochesky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("819","Unicov","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("820","Ustecky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("821","Valletta","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("822","Velesin","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("823","Vysochina","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("824","Zlinsky","58","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("825","Arhus","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("826","Bornholm","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("827","Frederiksborg","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("828","Fyn","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("829","Hovedstaden","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("830","Kobenhavn","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("831","Kobenhavns Amt","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("832","Kobenhavns Kommune","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("833","Nordjylland","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("834","Ribe","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("835","Ringkobing","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("836","Roervig","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("837","Roskilde","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("838","Roslev","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("839","Sjaelland","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("840","Soeborg","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("841","Sonderjylland","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("842","Storstrom","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("843","Syddanmark","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("844","Toelloese","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("845","Vejle","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("846","Vestsjalland","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("847","Viborg","59","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("848","\'Ali Sabih","60","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("849","Dikhil","60","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("850","Jibuti","60","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("851","Tajurah","60","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("852","Ubuk","60","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("853","Saint Andrew","61","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("854","Saint David","61","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("855","Saint George","61","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("856","Saint John","61","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("857","Saint Joseph","61","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("858","Saint Luke","61","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("859","Saint Mark","61","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("860","Saint Patrick","61","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("861","Saint Paul","61","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("862","Saint Peter","61","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("863","Azua","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("864","Bahoruco","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("865","Barahona","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("866","Dajabon","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("867","Distrito Nacional","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("868","Duarte","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("869","El Seybo","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("870","Elias Pina","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("871","Espaillat","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("872","Hato Mayor","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("873","Independencia","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("874","La Altagracia","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("875","La Romana","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("876","La Vega","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("877","Maria Trinidad Sanchez","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("878","Monsenor Nouel","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("879","Monte Cristi","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("880","Monte Plata","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("881","Pedernales","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("882","Peravia","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("883","Puerto Plata","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("884","Salcedo","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("885","Samana","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("886","San Cristobal","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("887","San Juan","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("888","San Pedro de Macoris","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("889","Sanchez Ramirez","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("890","Santiago","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("891","Santiago Rodriguez","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("892","Valverde","62","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("893","Aileu","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("894","Ainaro","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("895","Ambeno","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("896","Baucau","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("897","Bobonaro","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("898","Cova Lima","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("899","Dili","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("900","Ermera","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("901","Lautem","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("902","Liquica","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("903","Manatuto","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("904","Manufahi","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("905","Viqueque","63","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("906","Azuay","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("907","Bolivar","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("908","Canar","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("909","Carchi","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("910","Chimborazo","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("911","Cotopaxi","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("912","El Oro","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("913","Esmeraldas","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("914","Galapagos","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("915","Guayas","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("916","Imbabura","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("917","Loja","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("918","Los Rios","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("919","Manabi","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("920","Morona Santiago","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("921","Napo","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("922","Orellana","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("923","Pastaza","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("924","Pichincha","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("925","Sucumbios","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("926","Tungurahua","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("927","Zamora Chinchipe","64","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("928","Aswan","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("929","Asyut","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("930","Bani Suwayf","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("931","Bur Sa\'id","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("932","Cairo","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("933","Dumyat","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("934","Kafr-ash-Shaykh","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("935","Matruh","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("936","Muhafazat ad Daqahliyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("937","Muhafazat al Fayyum","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("938","Muhafazat al Gharbiyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("939","Muhafazat al Iskandariyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("940","Muhafazat al Qahirah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("941","Qina","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("942","Sawhaj","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("943","Sina al-Janubiyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("944","Sina ash-Shamaliyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("945","ad-Daqahliyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("946","al-Bahr-al-Ahmar","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("947","al-Buhayrah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("948","al-Fayyum","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("949","al-Gharbiyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("950","al-Iskandariyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("951","al-Ismailiyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("952","al-Jizah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("953","al-Minufiyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("954","al-Minya","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("955","al-Qahira","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("956","al-Qalyubiyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("957","al-Uqsur","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("958","al-Wadi al-Jadid","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("959","as-Suways","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("960","ash-Sharqiyah","65","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("961","Ahuachapan","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("962","Cabanas","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("963","Chalatenango","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("964","Cuscatlan","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("965","La Libertad","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("966","La Paz","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("967","La Union","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("968","Morazan","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("969","San Miguel","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("970","San Salvador","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("971","San Vicente","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("972","Santa Ana","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("973","Sonsonate","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("974","Usulutan","66","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("975","Annobon","67","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("976","Bioko Norte","67","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("977","Bioko Sur","67","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("978","Centro Sur","67","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("979","Kie-Ntem","67","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("980","Litoral","67","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("981","Wele-Nzas","67","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("982","Anseba","68","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("983","Debub","68","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("984","Debub-Keih-Bahri","68","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("985","Gash-Barka","68","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("986","Maekel","68","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("987","Semien-Keih-Bahri","68","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("988","Harju","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("989","Hiiu","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("990","Ida-Viru","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("991","Jarva","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("992","Jogeva","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("993","Laane","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("994","Laane-Viru","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("995","Parnu","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("996","Polva","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("997","Rapla","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("998","Saare","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("999","Tartu","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1000","Valga","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1001","Viljandi","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1002","Voru","69","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1003","Addis Abeba","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1004","Afar","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1005","Amhara","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1006","Benishangul","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1007","Diredawa","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1008","Gambella","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1009","Harar","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1010","Jigjiga","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1011","Mekele","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1012","Oromia","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1013","Somali","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1014","Southern","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1015","Tigray","70","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1016","Falkland Islands","71","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1017","South Georgia","71","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1018","Klaksvik","72","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1019","Nor ara Eysturoy","72","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1020","Nor oy","72","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1021","Sandoy","72","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1022","Streymoy","72","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1023","Su uroy","72","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1024","Sy ra Eysturoy","72","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1025","Torshavn","72","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1026","Vaga","72","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1027","Central","73","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1028","Eastern","73","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1029","Northern","73","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1030","South Pacific","73","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1031","Western","73","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1032","Ahvenanmaa","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1033","Etela-Karjala","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1034","Etela-Pohjanmaa","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1035","Etela-Savo","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1036","Etela-Suomen Laani","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1037","Ita-Suomen Laani","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1038","Ita-Uusimaa","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1039","Kainuu","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1040","Kanta-Hame","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1041","Keski-Pohjanmaa","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1042","Keski-Suomi","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1043","Kymenlaakso","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1044","Lansi-Suomen Laani","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1045","Lappi","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1046","Northern Savonia","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1047","Ostrobothnia","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1048","Oulun Laani","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1049","Paijat-Hame","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1050","Pirkanmaa","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1051","Pohjanmaa","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1052","Pohjois-Karjala","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1053","Pohjois-Pohjanmaa","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1054","Pohjois-Savo","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1055","Saarijarvi","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1056","Satakunta","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1057","Southern Savonia","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1058","Tavastia Proper","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1059","Uleaborgs Lan","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1060","Uusimaa","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1061","Varsinais-Suomi","74","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1062","Ain","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1063","Aisne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1064","Albi Le Sequestre","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1065","Allier","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1066","Alpes-Cote dAzur","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1067","Alpes-Maritimes","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1068","Alpes-de-Haute-Provence","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1069","Alsace","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1070","Aquitaine","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1071","Ardeche","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1072","Ardennes","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1073","Ariege","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1074","Aube","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1075","Aude","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1076","Auvergne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1077","Aveyron","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1078","Bas-Rhin","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1079","Basse-Normandie","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1080","Bouches-du-Rhone","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1081","Bourgogne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1082","Bretagne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1083","Brittany","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1084","Burgundy","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1085","Calvados","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1086","Cantal","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1087","Cedex","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1088","Centre","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1089","Charente","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1090","Charente-Maritime","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1091","Cher","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1092","Correze","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1093","Corse-du-Sud","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1094","Cote-d\'Or","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1095","Cotes-d\'Armor","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1096","Creuse","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1097","Crolles","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1098","Deux-Sevres","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1099","Dordogne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1100","Doubs","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1101","Drome","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1102","Essonne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1103","Eure","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1104","Eure-et-Loir","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1105","Feucherolles","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1106","Finistere","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1107","Franche-Comte","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1108","Gard","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1109","Gers","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1110","Gironde","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1111","Haut-Rhin","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1112","Haute-Corse","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1113","Haute-Garonne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1114","Haute-Loire","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1115","Haute-Marne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1116","Haute-Saone","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1117","Haute-Savoie","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1118","Haute-Vienne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1119","Hautes-Alpes","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1120","Hautes-Pyrenees","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1121","Hauts-de-Seine","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1122","Herault","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1123","Ile-de-France","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1124","Ille-et-Vilaine","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1125","Indre","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1126","Indre-et-Loire","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1127","Isere","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1128","Jura","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1129","Klagenfurt","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1130","Landes","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1131","Languedoc-Roussillon","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1132","Larcay","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1133","Le Castellet","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1134","Le Creusot","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1135","Limousin","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1136","Loir-et-Cher","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1137","Loire","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1138","Loire-Atlantique","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1139","Loiret","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1140","Lorraine","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1141","Lot","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1142","Lot-et-Garonne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1143","Lower Normandy","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1144","Lozere","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1145","Maine-et-Loire","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1146","Manche","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1147","Marne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1148","Mayenne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1149","Meurthe-et-Moselle","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1150","Meuse","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1151","Midi-Pyrenees","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1152","Morbihan","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1153","Moselle","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1154","Nievre","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1155","Nord","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1156","Nord-Pas-de-Calais","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1157","Oise","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1158","Orne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1159","Paris","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1160","Pas-de-Calais","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1161","Pays de la Loire","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1162","Pays-de-la-Loire","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1163","Picardy","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1164","Puy-de-Dome","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1165","Pyrenees-Atlantiques","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1166","Pyrenees-Orientales","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1167","Quelmes","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1168","Rhone","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1169","Rhone-Alpes","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1170","Saint Ouen","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1171","Saint Viatre","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1172","Saone-et-Loire","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1173","Sarthe","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1174","Savoie","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1175","Seine-Maritime","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1176","Seine-Saint-Denis","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1177","Seine-et-Marne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1178","Somme","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1179","Sophia Antipolis","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1180","Souvans","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1181","Tarn","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1182","Tarn-et-Garonne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1183","Territoire de Belfort","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1184","Treignac","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1185","Upper Normandy","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1186","Val-d\'Oise","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1187","Val-de-Marne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1188","Var","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1189","Vaucluse","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1190","Vellise","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1191","Vendee","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1192","Vienne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1193","Vosges","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1194","Yonne","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1195","Yvelines","75","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1196","Cayenne","76","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1197","Saint-Laurent-du-Maroni","76","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1198","Iles du Vent","77","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1199","Iles sous le Vent","77","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1200","Marquesas","77","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1201","Tuamotu","77","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1202","Tubuai","77","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1203","Amsterdam","78","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1204","Crozet Islands","78","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1205","Kerguelen","78","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1206","Estuaire","79","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1207","Haut-Ogooue","79","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1208","Moyen-Ogooue","79","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1209","Ngounie","79","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1210","Nyanga","79","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1211","Ogooue-Ivindo","79","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1212","Ogooue-Lolo","79","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1213","Ogooue-Maritime","79","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1214","Woleu-Ntem","79","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1215","Banjul","80","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1216","Basse","80","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1217","Brikama","80","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1218","Janjanbureh","80","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1219","Kanifing","80","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1220","Kerewan","80","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1221","Kuntaur","80","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1222","Mansakonko","80","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1223","Abhasia","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1224","Ajaria","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1225","Guria","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1226","Imereti","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1227","Kaheti","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1228","Kvemo Kartli","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1229","Mcheta-Mtianeti","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1230","Racha","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1231","Samagrelo-Zemo Svaneti","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1232","Samche-Zhavaheti","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1233","Shida Kartli","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1234","Tbilisi","81","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1235","Auvergne","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1236","Baden-Wurttemberg","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1237","Bavaria","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1238","Bayern","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1239","Beilstein Wurtt","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1240","Berlin","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1241","Brandenburg","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1242","Bremen","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1243","Dreisbach","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1244","Freistaat Bayern","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1245","Hamburg","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1246","Hannover","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1247","Heroldstatt","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1248","Hessen","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1249","Kortenberg","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1250","Laasdorf","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1251","Land Baden-Wurttemberg","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1252","Land Bayern","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1253","Land Brandenburg","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1254","Land Hessen","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1255","Land Mecklenburg-Vorpommern","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1256","Land Nordrhein-Westfalen","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1257","Land Rheinland-Pfalz","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1258","Land Sachsen","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1259","Land Sachsen-Anhalt","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1260","Land Thuringen","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1261","Lower Saxony","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1262","Mecklenburg-Vorpommern","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1263","Mulfingen","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1264","Munich","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1265","Neubeuern","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1266","Niedersachsen","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1267","Noord-Holland","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1268","Nordrhein-Westfalen","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1269","North Rhine-Westphalia","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1270","Osterode","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1271","Rheinland-Pfalz","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1272","Rhineland-Palatinate","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1273","Saarland","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1274","Sachsen","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1275","Sachsen-Anhalt","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1276","Saxony","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1277","Schleswig-Holstein","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1278","Thuringia","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1279","Webling","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1280","Weinstrabe","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1281","schlobborn","82","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1282","Ashanti","83","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1283","Brong-Ahafo","83","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1284","Central","83","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1285","Eastern","83","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1286","Greater Accra","83","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1287","Northern","83","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1288","Upper East","83","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1289","Upper West","83","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1290","Volta","83","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1291","Western","83","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1292","Gibraltar","84","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1293","Acharnes","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1294","Ahaia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1295","Aitolia kai Akarnania","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1296","Argolis","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1297","Arkadia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1298","Arta","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1299","Attica","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1300","Attiki","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1301","Ayion Oros","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1302","Crete","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1303","Dodekanisos","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1304","Drama","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1305","Evia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1306","Evritania","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1307","Evros","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1308","Evvoia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1309","Florina","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1310","Fokis","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1311","Fthiotis","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1312","Grevena","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1313","Halandri","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1314","Halkidiki","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1315","Hania","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1316","Heraklion","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1317","Hios","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1318","Ilia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1319","Imathia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1320","Ioannina","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1321","Iraklion","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1322","Karditsa","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1323","Kastoria","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1324","Kavala","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1325","Kefallinia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1326","Kerkira","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1327","Kiklades","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1328","Kilkis","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1329","Korinthia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1330","Kozani","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1331","Lakonia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1332","Larisa","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1333","Lasithi","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1334","Lesvos","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1335","Levkas","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1336","Magnisia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1337","Messinia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1338","Nomos Attikis","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1339","Nomos Zakynthou","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1340","Pella","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1341","Pieria","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1342","Piraios","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1343","Preveza","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1344","Rethimni","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1345","Rodopi","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1346","Samos","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1347","Serrai","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1348","Thesprotia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1349","Thessaloniki","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1350","Trikala","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1351","Voiotia","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1352","West Greece","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1353","Xanthi","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1354","Zakinthos","85","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1355","Aasiaat","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1356","Ammassalik","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1357","Illoqqortoormiut","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1358","Ilulissat","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1359","Ivittuut","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1360","Kangaatsiaq","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1361","Maniitsoq","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1362","Nanortalik","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1363","Narsaq","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1364","Nuuk","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1365","Paamiut","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1366","Qaanaaq","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1367","Qaqortoq","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1368","Qasigiannguit","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1369","Qeqertarsuaq","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1370","Sisimiut","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1371","Udenfor kommunal inddeling","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1372","Upernavik","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1373","Uummannaq","86","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1374","Carriacou-Petite Martinique","87","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1375","Saint Andrew","87","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1376","Saint Davids","87","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1377","Saint George\'s","87","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1378","Saint John","87","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1379","Saint Mark","87","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1380","Saint Patrick","87","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1381","Basse-Terre","88","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1382","Grande-Terre","88","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1383","Iles des Saintes","88","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1384","La Desirade","88","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1385","Marie-Galante","88","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1386","Saint Barthelemy","88","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1387","Saint Martin","88","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1388","Agana Heights","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1389","Agat","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1390","Barrigada","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1391","Chalan-Pago-Ordot","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1392","Dededo","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1393","Hagatna","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1394","Inarajan","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1395","Mangilao","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1396","Merizo","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1397","Mongmong-Toto-Maite","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1398","Santa Rita","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1399","Sinajana","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1400","Talofofo","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1401","Tamuning","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1402","Yigo","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1403","Yona","89","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1404","Alta Verapaz","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1405","Baja Verapaz","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1406","Chimaltenango","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1407","Chiquimula","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1408","El Progreso","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1409","Escuintla","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1410","Guatemala","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1411","Huehuetenango","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1412","Izabal","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1413","Jalapa","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1414","Jutiapa","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1415","Peten","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1416","Quezaltenango","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1417","Quiche","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1418","Retalhuleu","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1419","Sacatepequez","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1420","San Marcos","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1421","Santa Rosa","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1422","Solola","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1423","Suchitepequez","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1424","Totonicapan","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1425","Zacapa","90","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1426","Alderney","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1427","Castel","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1428","Forest","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1429","Saint Andrew","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1430","Saint Martin","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1431","Saint Peter Port","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1432","Saint Pierre du Bois","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1433","Saint Sampson","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1434","Saint Saviour","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1435","Sark","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1436","Torteval","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1437","Vale","91","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1438","Beyla","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1439","Boffa","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1440","Boke","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1441","Conakry","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1442","Coyah","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1443","Dabola","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1444","Dalaba","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1445","Dinguiraye","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1446","Faranah","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1447","Forecariah","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1448","Fria","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1449","Gaoual","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1450","Gueckedou","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1451","Kankan","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1452","Kerouane","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1453","Kindia","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1454","Kissidougou","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1455","Koubia","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1456","Koundara","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1457","Kouroussa","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1458","Labe","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1459","Lola","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1460","Macenta","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1461","Mali","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1462","Mamou","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1463","Mandiana","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1464","Nzerekore","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1465","Pita","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1466","Siguiri","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1467","Telimele","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1468","Tougue","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1469","Yomou","92","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1470","Bafata","93","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1471","Bissau","93","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1472","Bolama","93","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1473","Cacheu","93","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1474","Gabu","93","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1475","Oio","93","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1476","Quinara","93","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1477","Tombali","93","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1478","Barima-Waini","94","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1479","Cuyuni-Mazaruni","94","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1480","Demerara-Mahaica","94","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1481","East Berbice-Corentyne","94","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1482","Essequibo Islands-West Demerar","94","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1483","Mahaica-Berbice","94","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1484","Pomeroon-Supenaam","94","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1485","Potaro-Siparuni","94","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1486","Upper Demerara-Berbice","94","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1487","Upper Takutu-Upper Essequibo","94","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1488","Artibonite","95","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1489","Centre","95","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1490","Grand\'Anse","95","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1491","Nord","95","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1492","Nord-Est","95","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1493","Nord-Ouest","95","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1494","Ouest","95","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1495","Sud","95","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1496","Sud-Est","95","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1497","Heard and McDonald Islands","96","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1498","Atlantida","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1499","Choluteca","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1500","Colon","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1501","Comayagua","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1502","Copan","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1503","Cortes","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1504","Distrito Central","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1505","El Paraiso","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1506","Francisco Morazan","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1507","Gracias a Dios","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1508","Intibuca","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1509","Islas de la Bahia","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1510","La Paz","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1511","Lempira","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1512","Ocotepeque","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1513","Olancho","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1514","Santa Barbara","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1515","Valle","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1516","Yoro","97","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1517","Hong Kong","98","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1518","Bacs-Kiskun","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1519","Baranya","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1520","Bekes","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1521","Borsod-Abauj-Zemplen","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1522","Budapest","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1523","Csongrad","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1524","Fejer","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1525","Gyor-Moson-Sopron","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1526","Hajdu-Bihar","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1527","Heves","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1528","Jasz-Nagykun-Szolnok","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1529","Komarom-Esztergom","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1530","Nograd","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1531","Pest","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1532","Somogy","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1533","Szabolcs-Szatmar-Bereg","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1534","Tolna","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1535","Vas","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1536","Veszprem","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1537","Zala","99","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1538","Austurland","100","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1539","Gullbringusysla","100","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1540","Hofu borgarsva i","100","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1541","Nor urland eystra","100","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1542","Nor urland vestra","100","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1543","Su urland","100","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1544","Su urnes","100","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1545","Vestfir ir","100","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1546","Vesturland","100","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1547","Andaman and Nicobar Islands","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1548","Andhra Pradesh","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1549","Arunachal Pradesh","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1550","Assam","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1551","Bihar","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1552","Chandigarh","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1553","Chhattisgarh","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1554","Dadra and Nagar Haveli","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1555","Daman and Diu","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1556","Delhi","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1557","Goa","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1558","Gujarat","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1559","Haryana","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1560","Himachal Pradesh","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1561","Jammu and Kashmir","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1562","Jharkhand","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1563","Karnataka","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1564","Kenmore","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1565","Kerala","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1566","Lakshadweep","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1567","Madhya Pradesh","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1568","Maharashtra","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1569","Manipur","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1570","Meghalaya","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1571","Mizoram","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1572","Nagaland","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1573","Narora","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1574","Natwar","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1575","Odisha","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1576","Paschim Medinipur","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1577","Pondicherry","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1578","Punjab","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1579","Rajasthan","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1580","Sikkim","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1581","Tamil Nadu","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1582","Telangana","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1583","Tripura","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1584","Uttar Pradesh","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1585","Uttarakhand","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1586","Vaishali","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1587","West Bengal","101","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1588","Aceh","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1589","Bali","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1590","Bangka-Belitung","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1591","Banten","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1592","Bengkulu","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1593","Gandaria","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1594","Gorontalo","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1595","Jakarta","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1596","Jambi","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1597","Jawa Barat","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1598","Jawa Tengah","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1599","Jawa Timur","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1600","Kalimantan Barat","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1601","Kalimantan Selatan","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1602","Kalimantan Tengah","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1603","Kalimantan Timur","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1604","Kendal","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1605","Lampung","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1606","Maluku","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1607","Maluku Utara","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1608","Nusa Tenggara Barat","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1609","Nusa Tenggara Timur","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1610","Papua","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1611","Riau","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1612","Riau Kepulauan","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1613","Solo","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1614","Sulawesi Selatan","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1615","Sulawesi Tengah","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1616","Sulawesi Tenggara","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1617","Sulawesi Utara","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1618","Sumatera Barat","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1619","Sumatera Selatan","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1620","Sumatera Utara","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1621","Yogyakarta","102","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1622","Ardabil","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1623","Azarbayjan-e Bakhtari","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1624","Azarbayjan-e Khavari","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1625","Bushehr","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1626","Chahar Mahal-e Bakhtiari","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1627","Esfahan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1628","Fars","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1629","Gilan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1630","Golestan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1631","Hamadan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1632","Hormozgan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1633","Ilam","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1634","Kerman","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1635","Kermanshah","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1636","Khorasan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1637","Khuzestan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1638","Kohgiluyeh-e Boyerahmad","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1639","Kordestan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1640","Lorestan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1641","Markazi","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1642","Mazandaran","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1643","Ostan-e Esfahan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1644","Qazvin","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1645","Qom","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1646","Semnan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1647","Sistan-e Baluchestan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1648","Tehran","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1649","Yazd","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1650","Zanjan","103","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1651","Babil","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1652","Baghdad","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1653","Dahuk","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1654","Dhi Qar","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1655","Diyala","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1656","Erbil","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1657","Irbil","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1658","Karbala","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1659","Kurdistan","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1660","Maysan","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1661","Ninawa","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1662","Salah-ad-Din","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1663","Wasit","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1664","al-Anbar","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1665","al-Basrah","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1666","al-Muthanna","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1667","al-Qadisiyah","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1668","an-Najaf","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1669","as-Sulaymaniyah","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1670","at-Ta\'mim","104","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1671","Armagh","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1672","Carlow","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1673","Cavan","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1674","Clare","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1675","Cork","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1676","Donegal","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1677","Dublin","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1678","Galway","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1679","Kerry","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1680","Kildare","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1681","Kilkenny","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1682","Laois","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1683","Leinster","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1684","Leitrim","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1685","Limerick","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1686","Loch Garman","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1687","Longford","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1688","Louth","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1689","Mayo","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1690","Meath","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1691","Monaghan","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1692","Offaly","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1693","Roscommon","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1694","Sligo","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1695","Tipperary North Riding","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1696","Tipperary South Riding","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1697","Ulster","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1698","Waterford","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1699","Westmeath","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1700","Wexford","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1701","Wicklow","105","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1702","Beit Hanania","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1703","Ben Gurion Airport","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1704","Bethlehem","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1705","Caesarea","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1706","Centre","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1707","Gaza","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1708","Hadaron","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1709","Haifa District","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1710","Hamerkaz","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1711","Hazafon","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1712","Hebron","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1713","Jaffa","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1714","Jerusalem","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1715","Khefa","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1716","Kiryat Yam","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1717","Lower Galilee","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1718","Qalqilya","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1719","Talme Elazar","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1720","Tel Aviv","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1721","Tsafon","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1722","Umm El Fahem","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1723","Yerushalayim","106","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1724","Abruzzi","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1725","Abruzzo","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1726","Agrigento","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1727","Alessandria","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1728","Ancona","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1729","Arezzo","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1730","Ascoli Piceno","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1731","Asti","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1732","Avellino","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1733","Bari","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1734","Basilicata","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1735","Belluno","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1736","Benevento","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1737","Bergamo","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1738","Biella","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1739","Bologna","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1740","Bolzano","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1741","Brescia","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1742","Brindisi","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1743","Calabria","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1744","Campania","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1745","Cartoceto","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1746","Caserta","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1747","Catania","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1748","Chieti","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1749","Como","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1750","Cosenza","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1751","Cremona","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1752","Cuneo","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1753","Emilia-Romagna","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1754","Ferrara","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1755","Firenze","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1756","Florence","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1757","Forli-Cesena ","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1758","Friuli-Venezia Giulia","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1759","Frosinone","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1760","Genoa","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1761","Gorizia","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1762","L\'Aquila","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1763","Lazio","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1764","Lecce","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1765","Lecco","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1766","Lecco Province","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1767","Liguria","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1768","Lodi","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1769","Lombardia","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1770","Lombardy","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1771","Macerata","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1772","Mantova","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1773","Marche","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1774","Messina","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1775","Milan","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1776","Modena","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1777","Molise","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1778","Molteno","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1779","Montenegro","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1780","Monza and Brianza","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1781","Naples","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1782","Novara","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1783","Padova","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1784","Parma","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1785","Pavia","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1786","Perugia","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1787","Pesaro-Urbino","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1788","Piacenza","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1789","Piedmont","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1790","Piemonte","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1791","Pisa","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1792","Pordenone","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1793","Potenza","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1794","Puglia","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1795","Reggio Emilia","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1796","Rimini","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1797","Roma","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1798","Salerno","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1799","Sardegna","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1800","Sassari","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1801","Savona","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1802","Sicilia","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1803","Siena","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1804","Sondrio","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1805","South Tyrol","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1806","Taranto","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1807","Teramo","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1808","Torino","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1809","Toscana","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1810","Trapani","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1811","Trentino-Alto Adige","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1812","Trento","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1813","Treviso","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1814","Udine","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1815","Umbria","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1816","Valle d\'Aosta","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1817","Varese","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1818","Veneto","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1819","Venezia","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1820","Verbano-Cusio-Ossola","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1821","Vercelli","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1822","Verona","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1823","Vicenza","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1824","Viterbo","107","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1825","Buxoro Viloyati","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1826","Clarendon","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1827","Hanover","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1828","Kingston","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1829","Manchester","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1830","Portland","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1831","Saint Andrews","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1832","Saint Ann","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1833","Saint Catherine","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1834","Saint Elizabeth","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1835","Saint James","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1836","Saint Mary","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1837","Saint Thomas","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1838","Trelawney","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1839","Westmoreland","108","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1840","Aichi","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1841","Akita","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1842","Aomori","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1843","Chiba","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1844","Ehime","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1845","Fukui","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1846","Fukuoka","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1847","Fukushima","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1848","Gifu","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1849","Gumma","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1850","Hiroshima","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1851","Hokkaido","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1852","Hyogo","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1853","Ibaraki","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1854","Ishikawa","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1855","Iwate","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1856","Kagawa","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1857","Kagoshima","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1858","Kanagawa","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1859","Kanto","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1860","Kochi","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1861","Kumamoto","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1862","Kyoto","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1863","Mie","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1864","Miyagi","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1865","Miyazaki","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1866","Nagano","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1867","Nagasaki","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1868","Nara","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1869","Niigata","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1870","Oita","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1871","Okayama","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1872","Okinawa","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1873","Osaka","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1874","Saga","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1875","Saitama","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1876","Shiga","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1877","Shimane","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1878","Shizuoka","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1879","Tochigi","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1880","Tokushima","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1881","Tokyo","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1882","Tottori","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1883","Toyama","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1884","Wakayama","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1885","Yamagata","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1886","Yamaguchi","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1887","Yamanashi","109","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1888","Grouville","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1889","Saint Brelade","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1890","Saint Clement","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1891","Saint Helier","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1892","Saint John","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1893","Saint Lawrence","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1894","Saint Martin","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1895","Saint Mary","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1896","Saint Peter","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1897","Saint Saviour","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1898","Trinity","110","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1899","\'Ajlun","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1900","Amman","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1901","Irbid","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1902","Jarash","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1903","Ma\'an","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1904","Madaba","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1905","al-\'Aqabah","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1906","al-Balqa\'","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1907","al-Karak","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1908","al-Mafraq","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1909","at-Tafilah","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1910","az-Zarqa\'","111","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1911","Akmecet","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1912","Akmola","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1913","Aktobe","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1914","Almati","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1915","Atirau","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1916","Batis Kazakstan","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1917","Burlinsky Region","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1918","Karagandi","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1919","Kostanay","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1920","Mankistau","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1921","Ontustik Kazakstan","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1922","Pavlodar","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1923","Sigis Kazakstan","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1924","Soltustik Kazakstan","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1925","Taraz","112","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1926","Central","113","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1927","Coast","113","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1928","Eastern","113","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1929","Nairobi","113","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1930","North Eastern","113","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1931","Nyanza","113","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1932","Rift Valley","113","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1933","Western","113","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1934","Abaiang","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1935","Abemana","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1936","Aranuka","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1937","Arorae","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1938","Banaba","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1939","Beru","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1940","Butaritari","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1941","Kiritimati","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1942","Kuria","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1943","Maiana","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1944","Makin","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1945","Marakei","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1946","Nikunau","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1947","Nonouti","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1948","Onotoa","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1949","Phoenix Islands","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1950","Tabiteuea North","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1951","Tabiteuea South","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1952","Tabuaeran","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1953","Tamana","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1954","Tarawa North","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1955","Tarawa South","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1956","Teraina","114","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1957","Busan","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1958","Cheju","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1959","Chollabuk","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1960","Chollanam","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1961","Chungbuk","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1962","Chungcheongbuk","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1963","Chungcheongnam","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1964","Chungnam","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1965","Daegu","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1966","Gangwon-do","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1967","Goyang-si","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1968","Gyeonggi-do","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1969","Gyeongsang ","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1970","Gyeongsangnam-do","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1971","Incheon","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1972","Jeju-Si","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1973","Jeonbuk","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1974","Kangweon","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1975","Kwangju","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1976","Kyeonggi","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1977","Kyeongsangbuk","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1978","Kyeongsangnam","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1979","Kyonggi-do","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1980","Kyungbuk-Do","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1981","Kyunggi-Do","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1982","Pusan","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1983","Seoul","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1984","Sudogwon","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1985","Taegu","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1986","Taejeon","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1987","Taejon-gwangyoksi","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1988","Ulsan","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1989","Wonju","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1990","gwangyoksi","116","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1991","Al Asimah","117","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1992","Hawalli","117","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1993","Mishref","117","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1994","Qadesiya","117","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1995","Safat","117","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1996","Salmiya","117","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1997","al-Ahmadi","117","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1998","al-Farwaniyah","117","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("1999","al-Jahra","117","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2000","al-Kuwayt","117","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2001","Batken","118","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2002","Bishkek","118","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2003","Chui","118","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2004","Issyk-Kul","118","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2005","Jalal-Abad","118","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2006","Naryn","118","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2007","Osh","118","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2008","Talas","118","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2009","Attopu","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2010","Bokeo","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2011","Bolikhamsay","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2012","Champasak","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2013","Houaphanh","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2014","Khammouane","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2015","Luang Nam Tha","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2016","Luang Prabang","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2017","Oudomxay","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2018","Phongsaly","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2019","Saravan","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2020","Savannakhet","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2021","Sekong","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2022","Viangchan Prefecture","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2023","Viangchan Province","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2024","Xaignabury","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2025","Xiang Khuang","119","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2026","Aizkraukles","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2027","Aluksnes","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2028","Balvu","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2029","Bauskas","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2030","Cesu","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2031","Daugavpils","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2032","Daugavpils City","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2033","Dobeles","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2034","Gulbenes","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2035","Jekabspils","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2036","Jelgava","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2037","Jelgavas","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2038","Jurmala City","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2039","Kraslavas","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2040","Kuldigas","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2041","Liepaja","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2042","Liepajas","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2043","Limbazhu","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2044","Ludzas","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2045","Madonas","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2046","Ogres","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2047","Preilu","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2048","Rezekne","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2049","Rezeknes","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2050","Riga","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2051","Rigas","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2052","Saldus","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2053","Talsu","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2054","Tukuma","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2055","Valkas","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2056","Valmieras","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2057","Ventspils","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2058","Ventspils City","120","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2059","Beirut","121","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2060","Jabal Lubnan","121","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2061","Mohafazat Liban-Nord","121","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2062","Mohafazat Mont-Liban","121","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2063","Sidon","121","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2064","al-Biqa","121","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2065","al-Janub","121","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2066","an-Nabatiyah","121","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2067","ash-Shamal","121","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2068","Berea","122","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2069","Butha-Buthe","122","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2070","Leribe","122","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2071","Mafeteng","122","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2072","Maseru","122","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2073","Mohale\'s Hoek","122","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2074","Mokhotlong","122","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2075","Qacha\'s Nek","122","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2076","Quthing","122","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2077","Thaba-Tseka","122","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2078","Bomi","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2079","Bong","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2080","Grand Bassa","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2081","Grand Cape Mount","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2082","Grand Gedeh","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2083","Loffa","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2084","Margibi","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2085","Maryland and Grand Kru","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2086","Montserrado","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2087","Nimba","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2088","Rivercess","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2089","Sinoe","123","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2090","Ajdabiya","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2091","Banghazi","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2092","Darnah","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2093","Ghadamis","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2094","Gharyan","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2095","Misratah","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2096","Murzuq","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2097","Sabha","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2098","Sawfajjin","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2099","Surt","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2100","Tarabulus","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2101","Tarhunah","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2102","Tripolitania","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2103","Tubruq","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2104","Yafran","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2105","Zlitan","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2106","al-\'Aziziyah","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2107","al-Fatih","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2108","al-Jabal al Akhdar","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2109","al-Jufrah","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2110","al-Khums","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2111","al-Kufrah","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2112","an-Nuqat al-Khams","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2113","ash-Shati\'","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2114","az-Zawiyah","124","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2115","Balzers","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2116","Eschen","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2117","Gamprin","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2118","Mauren","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2119","Planken","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2120","Ruggell","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2121","Schaan","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2122","Schellenberg","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2123","Triesen","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2124","Triesenberg","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2125","Vaduz","125","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2126","Alytaus","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2127","Anyksciai","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2128","Kauno","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2129","Klaipedos","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2130","Marijampoles","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2131","Panevezhio","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2132","Panevezys","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2133","Shiauliu","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2134","Taurages","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2135","Telshiu","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2136","Telsiai","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2137","Utenos","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2138","Vilniaus","126","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2139","Capellen","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2140","Clervaux","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2141","Diekirch","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2142","Echternach","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2143","Esch-sur-Alzette","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2144","Grevenmacher","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2145","Luxembourg","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2146","Mersch","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2147","Redange","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2148","Remich","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2149","Vianden","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2150","Wiltz","127","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2151","Macau","128","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2152","Berovo","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2153","Bitola","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2154","Brod","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2155","Debar","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2156","Delchevo","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2157","Demir Hisar","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2158","Gevgelija","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2159","Gostivar","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2160","Kavadarci","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2161","Kichevo","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2162","Kochani","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2163","Kratovo","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2164","Kriva Palanka","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2165","Krushevo","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2166","Kumanovo","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2167","Negotino","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2168","Ohrid","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2169","Prilep","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2170","Probishtip","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2171","Radovish","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2172","Resen","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2173","Shtip","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2174","Skopje","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2175","Struga","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2176","Strumica","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2177","Sveti Nikole","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2178","Tetovo","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2179","Valandovo","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2180","Veles","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2181","Vinica","129","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2182","Antananarivo","130","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2183","Antsiranana","130","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2184","Fianarantsoa","130","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2185","Mahajanga","130","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2186","Toamasina","130","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2187","Toliary","130","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2188","Balaka","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2189","Blantyre City","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2190","Chikwawa","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2191","Chiradzulu","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2192","Chitipa","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2193","Dedza","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2194","Dowa","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2195","Karonga","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2196","Kasungu","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2197","Lilongwe City","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2198","Machinga","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2199","Mangochi","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2200","Mchinji","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2201","Mulanje","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2202","Mwanza","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2203","Mzimba","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2204","Mzuzu City","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2205","Nkhata Bay","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2206","Nkhotakota","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2207","Nsanje","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2208","Ntcheu","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2209","Ntchisi","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2210","Phalombe","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2211","Rumphi","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2212","Salima","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2213","Thyolo","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2214","Zomba Municipality","131","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2215","Johor","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2216","Kedah","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2217","Kelantan","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2218","Kuala Lumpur","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2219","Labuan","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2220","Melaka","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2221","Negeri Johor","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2222","Negeri Sembilan","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2223","Pahang","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2224","Penang","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2225","Perak","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2226","Perlis","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2227","Pulau Pinang","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2228","Sabah","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2229","Sarawak","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2230","Selangor","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2231","Sembilan","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2232","Terengganu","132","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2233","Alif Alif","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2234","Alif Dhaal","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2235","Baa","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2236","Dhaal","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2237","Faaf","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2238","Gaaf Alif","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2239","Gaaf Dhaal","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2240","Ghaviyani","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2241","Haa Alif","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2242","Haa Dhaal","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2243","Kaaf","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2244","Laam","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2245","Lhaviyani","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2246","Male","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2247","Miim","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2248","Nuun","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2249","Raa","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2250","Shaviyani","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2251","Siin","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2252","Thaa","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2253","Vaav","133","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2254","Bamako","134","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2255","Gao","134","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2256","Kayes","134","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2257","Kidal","134","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2258","Koulikoro","134","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2259","Mopti","134","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2260","Segou","134","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2261","Sikasso","134","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2262","Tombouctou","134","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2263","Gozo and Comino","135","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2264","Inner Harbour","135","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2265","Northern","135","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2266","Outer Harbour","135","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2267","South Eastern","135","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2268","Valletta","135","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2269","Western","135","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2270","Castletown","136","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2271","Douglas","136","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2272","Laxey","136","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2273","Onchan","136","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2274","Peel","136","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2275","Port Erin","136","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2276","Port Saint Mary","136","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2277","Ramsey","136","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2278","Ailinlaplap","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2279","Ailuk","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2280","Arno","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2281","Aur","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2282","Bikini","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2283","Ebon","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2284","Enewetak","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2285","Jabat","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2286","Jaluit","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2287","Kili","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2288","Kwajalein","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2289","Lae","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2290","Lib","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2291","Likiep","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2292","Majuro","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2293","Maloelap","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2294","Mejit","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2295","Mili","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2296","Namorik","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2297","Namu","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2298","Rongelap","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2299","Ujae","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2300","Utrik","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2301","Wotho","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2302","Wotje","137","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2303","Fort-de-France","138","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2304","La Trinite","138","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2305","Le Marin","138","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2306","Saint-Pierre","138","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2307","Adrar","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2308","Assaba","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2309","Brakna","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2310","Dhakhlat Nawadibu","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2311","Hudh-al-Gharbi","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2312","Hudh-ash-Sharqi","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2313","Inshiri","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2314","Nawakshut","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2315","Qidimagha","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2316","Qurqul","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2317","Taqant","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2318","Tiris Zammur","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2319","Trarza","139","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2320","Black River","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2321","Eau Coulee","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2322","Flacq","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2323","Floreal","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2324","Grand Port","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2325","Moka","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2326","Pamplempousses","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2327","Plaines Wilhelm","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2328","Port Louis","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2329","Riviere du Rempart","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2330","Rodrigues","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2331","Rose Hill","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2332","Savanne","140","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2333","Mayotte","141","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2334","Pamanzi","141","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2335","Aguascalientes","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2336","Baja California","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2337","Baja California Sur","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2338","Campeche","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2339","Chiapas","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2340","Chihuahua","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2341","Coahuila","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2342","Colima","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2343","Distrito Federal","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2344","Durango","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2345","Estado de Mexico","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2346","Guanajuato","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2347","Guerrero","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2348","Hidalgo","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2349","Jalisco","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2350","Mexico","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2351","Michoacan","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2352","Morelos","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2353","Nayarit","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2354","Nuevo Leon","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2355","Oaxaca","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2356","Puebla","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2357","Queretaro","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2358","Quintana Roo","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2359","San Luis Potosi","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2360","Sinaloa","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2361","Sonora","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2362","Tabasco","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2363","Tamaulipas","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2364","Tlaxcala","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2365","Veracruz","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2366","Yucatan","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2367","Zacatecas","142","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2368","Chuuk","143","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2369","Kusaie","143","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2370","Pohnpei","143","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2371","Yap","143","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2372","Balti","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2373","Cahul","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2374","Chisinau","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2375","Chisinau Oras","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2376","Edinet","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2377","Gagauzia","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2378","Lapusna","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2379","Orhei","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2380","Soroca","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2381","Taraclia","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2382","Tighina","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2383","Transnistria","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2384","Ungheni","144","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2385","Fontvieille","145","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2386","La Condamine","145","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2387","Monaco-Ville","145","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2388","Monte Carlo","145","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2389","Arhangaj","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2390","Bajan-Olgij","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2391","Bajanhongor","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2392","Bulgan","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2393","Darhan-Uul","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2394","Dornod","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2395","Dornogovi","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2396","Dundgovi","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2397","Govi-Altaj","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2398","Govisumber","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2399","Hentij","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2400","Hovd","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2401","Hovsgol","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2402","Omnogovi","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2403","Orhon","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2404","Ovorhangaj","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2405","Selenge","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2406","Suhbaatar","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2407","Tov","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2408","Ulaanbaatar","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2409","Uvs","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2410","Zavhan","146","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2411","Montserrat","148","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2412","Agadir","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2413","Casablanca","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2414","Chaouia-Ouardigha","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2415","Doukkala-Abda","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2416","Fes-Boulemane","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2417","Gharb-Chrarda-Beni Hssen","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2418","Guelmim","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2419","Kenitra","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2420","Marrakech-Tensift-Al Haouz","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2421","Meknes-Tafilalet","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2422","Oriental","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2423","Oujda","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2424","Province de Tanger","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2425","Rabat-Sale-Zammour-Zaer","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2426","Sala Al Jadida","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2427","Settat","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2428","Souss Massa-Draa","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2429","Tadla-Azilal","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2430","Tangier-Tetouan","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2431","Taza-Al Hoceima-Taounate","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2432","Wilaya de Casablanca","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2433","Wilaya de Rabat-Sale","149","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2434","Cabo Delgado","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2435","Gaza","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2436","Inhambane","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2437","Manica","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2438","Maputo","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2439","Maputo Provincia","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2440","Nampula","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2441","Niassa","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2442","Sofala","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2443","Tete","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2444","Zambezia","150","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2445","Ayeyarwady","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2446","Bago","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2447","Chin","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2448","Kachin","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2449","Kayah","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2450","Kayin","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2451","Magway","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2452","Mandalay","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2453","Mon","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2454","Nay Pyi Taw","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2455","Rakhine","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2456","Sagaing","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2457","Shan","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2458","Tanintharyi","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2459","Yangon","151","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2460","Caprivi","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2461","Erongo","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2462","Hardap","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2463","Karas","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2464","Kavango","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2465","Khomas","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2466","Kunene","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2467","Ohangwena","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2468","Omaheke","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2469","Omusati","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2470","Oshana","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2471","Oshikoto","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2472","Otjozondjupa","152","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2473","Yaren","153","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2474","Bagmati","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2475","Bheri","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2476","Dhawalagiri","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2477","Gandaki","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2478","Janakpur","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2479","Karnali","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2480","Koshi","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2481","Lumbini","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2482","Mahakali","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2483","Mechi","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2484","Narayani","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2485","Rapti","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2486","Sagarmatha","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2487","Seti","154","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2488","Bonaire","155","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2489","Curacao","155","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2490","Saba","155","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2491","Sint Eustatius","155","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2492","Sint Maarten","155","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2493","Amsterdam","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2494","Benelux","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2495","Drenthe","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2496","Flevoland","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2497","Friesland","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2498","Gelderland","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2499","Groningen","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2500","Limburg","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2501","Noord-Brabant","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2502","Noord-Holland","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2503","Overijssel","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2504","South Holland","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2505","Utrecht","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2506","Zeeland","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2507","Zuid-Holland","156","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2508","Iles","157","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2509","Nord","157","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2510","Sud","157","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2511","Area Outside Region","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2512","Auckland","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2513","Bay of Plenty","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2514","Canterbury","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2515","Christchurch","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2516","Gisborne","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2517","Hawke\'s Bay","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2518","Manawatu-Wanganui","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2519","Marlborough","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2520","Nelson","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2521","Northland","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2522","Otago","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2523","Rodney","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2524","Southland","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2525","Taranaki","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2526","Tasman","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2527","Waikato","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2528","Wellington","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2529","West Coast","158","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2530","Atlantico Norte","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2531","Atlantico Sur","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2532","Boaco","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2533","Carazo","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2534","Chinandega","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2535","Chontales","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2536","Esteli","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2537","Granada","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2538","Jinotega","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2539","Leon","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2540","Madriz","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2541","Managua","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2542","Masaya","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2543","Matagalpa","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2544","Nueva Segovia","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2545","Rio San Juan","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2546","Rivas","159","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2547","Agadez","160","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2548","Diffa","160","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2549","Dosso","160","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2550","Maradi","160","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2551","Niamey","160","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2552","Tahoua","160","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2553","Tillabery","160","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2554","Zinder","160","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2555","Abia","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2556","Abuja Federal Capital Territor","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2557","Adamawa","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2558","Akwa Ibom","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2559","Anambra","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2560","Bauchi","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2561","Bayelsa","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2562","Benue","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2563","Borno","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2564","Cross River","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2565","Delta","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2566","Ebonyi","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2567","Edo","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2568","Ekiti","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2569","Enugu","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2570","Gombe","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2571","Imo","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2572","Jigawa","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2573","Kaduna","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2574","Kano","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2575","Katsina","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2576","Kebbi","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2577","Kogi","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2578","Kwara","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2579","Lagos","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2580","Nassarawa","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2581","Niger","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2582","Ogun","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2583","Ondo","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2584","Osun","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2585","Oyo","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2586","Plateau","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2587","Rivers","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2588","Sokoto","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2589","Taraba","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2590","Yobe","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2591","Zamfara","161","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2592","Niue","162","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2593","Norfolk Island","163","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2594","Northern Islands","164","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2595","Rota","164","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2596","Saipan","164","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2597","Tinian","164","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2598","Akershus","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2599","Aust Agder","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2600","Bergen","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2601","Buskerud","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2602","Finnmark","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2603","Hedmark","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2604","Hordaland","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2605","Moere og Romsdal","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2606","Nord Trondelag","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2607","Nordland","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2608","Oestfold","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2609","Oppland","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2610","Oslo","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2611","Rogaland","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2612","Soer Troendelag","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2613","Sogn og Fjordane","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2614","Stavern","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2615","Sykkylven","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2616","Telemark","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2617","Troms","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2618","Vest Agder","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2619","Vestfold","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2620","ÃƒÂƒÃ†Â’ÃƒÂ‚Ã‹Âœstfold","165","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2621","Al Buraimi","166","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2622","Dhufar","166","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2623","Masqat","166","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2624","Musandam","166","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2625","Rusayl","166","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2626","Wadi Kabir","166","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2627","ad-Dakhiliyah","166","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2628","adh-Dhahirah","166","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2629","al-Batinah","166","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2630","ash-Sharqiyah","166","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2631","Baluchistan","167","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2632","Federal Capital Area","167","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2633","Federally administered Tribal ","167","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2634","North-West Frontier","167","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2635","Northern Areas","167","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2636","Punjab","167","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2637","Sind","167","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2638","Aimeliik","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2639","Airai","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2640","Angaur","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2641","Hatobohei","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2642","Kayangel","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2643","Koror","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2644","Melekeok","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2645","Ngaraard","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2646","Ngardmau","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2647","Ngaremlengui","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2648","Ngatpang","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2649","Ngchesar","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2650","Ngerchelong","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2651","Ngiwal","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2652","Peleliu","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2653","Sonsorol","168","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2654","Ariha","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2655","Bayt Lahm","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2656","Bethlehem","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2657","Dayr-al-Balah","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2658","Ghazzah","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2659","Ghazzah ash-Shamaliyah","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2660","Janin","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2661","Khan Yunis","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2662","Nabulus","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2663","Qalqilyah","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2664","Rafah","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2665","Ram Allah wal-Birah","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2666","Salfit","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2667","Tubas","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2668","Tulkarm","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2669","al-Khalil","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2670","al-Quds","169","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2671","Bocas del Toro","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2672","Chiriqui","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2673","Cocle","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2674","Colon","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2675","Darien","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2676","Embera","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2677","Herrera","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2678","Kuna Yala","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2679","Los Santos","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2680","Ngobe Bugle","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2681","Panama","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2682","Veraguas","170","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2683","East New Britain","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2684","East Sepik","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2685","Eastern Highlands","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2686","Enga","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2687","Fly River","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2688","Gulf","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2689","Madang","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2690","Manus","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2691","Milne Bay","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2692","Morobe","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2693","National Capital District","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2694","New Ireland","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2695","North Solomons","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2696","Oro","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2697","Sandaun","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2698","Simbu","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2699","Southern Highlands","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2700","West New Britain","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2701","Western Highlands","171","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2702","Alto Paraguay","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2703","Alto Parana","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2704","Amambay","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2705","Asuncion","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2706","Boqueron","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2707","Caaguazu","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2708","Caazapa","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2709","Canendiyu","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2710","Central","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2711","Concepcion","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2712","Cordillera","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2713","Guaira","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2714","Itapua","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2715","Misiones","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2716","Neembucu","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2717","Paraguari","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2718","Presidente Hayes","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2719","San Pedro","172","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2720","Amazonas","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2721","Ancash","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2722","Apurimac","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2723","Arequipa","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2724","Ayacucho","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2725","Cajamarca","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2726","Cusco","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2727","Huancavelica","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2728","Huanuco","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2729","Ica","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2730","Junin","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2731","La Libertad","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2732","Lambayeque","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2733","Lima y Callao","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2734","Loreto","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2735","Madre de Dios","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2736","Moquegua","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2737","Pasco","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2738","Piura","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2739","Puno","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2740","San Martin","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2741","Tacna","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2742","Tumbes","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2743","Ucayali","173","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2744","Batangas","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2745","Bicol","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2746","Bulacan","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2747","Cagayan","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2748","Caraga","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2749","Central Luzon","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2750","Central Mindanao","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2751","Central Visayas","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2752","Cordillera","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2753","Davao","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2754","Eastern Visayas","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2755","Greater Metropolitan Area","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2756","Ilocos","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2757","Laguna","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2758","Luzon","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2759","Mactan","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2760","Metropolitan Manila Area","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2761","Muslim Mindanao","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2762","Northern Mindanao","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2763","Southern Mindanao","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2764","Southern Tagalog","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2765","Western Mindanao","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2766","Western Visayas","174","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2767","Pitcairn Island","175","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2768","Biale Blota","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2769","Dobroszyce","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2770","Dolnoslaskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2771","Dziekanow Lesny","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2772","Hopowo","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2773","Kartuzy","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2774","Koscian","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2775","Krakow","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2776","Kujawsko-Pomorskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2777","Lodzkie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2778","Lubelskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2779","Lubuskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2780","Malomice","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2781","Malopolskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2782","Mazowieckie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2783","Mirkow","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2784","Opolskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2785","Ostrowiec","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2786","Podkarpackie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2787","Podlaskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2788","Polska","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2789","Pomorskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2790","Poznan","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2791","Pruszkow","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2792","Rymanowska","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2793","Rzeszow","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2794","Slaskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2795","Stare Pole","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2796","Swietokrzyskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2797","Warminsko-Mazurskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2798","Warsaw","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2799","Wejherowo","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2800","Wielkopolskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2801","Wroclaw","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2802","Zachodnio-Pomorskie","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2803","Zukowo","176","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2804","Abrantes","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2805","Acores","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2806","Alentejo","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2807","Algarve","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2808","Braga","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2809","Centro","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2810","Distrito de Leiria","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2811","Distrito de Viana do Castelo","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2812","Distrito de Vila Real","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2813","Distrito do Porto","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2814","Lisboa e Vale do Tejo","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2815","Madeira","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2816","Norte","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2817","Paivas","177","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2818","Arecibo","178","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2819","Bayamon","178","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2820","Carolina","178","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2821","Florida","178","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2822","Guayama","178","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2823","Humacao","178","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2824","Mayaguez-Aguadilla","178","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2825","Ponce","178","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2826","Salinas","178","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2827","San Juan","178","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2828","Doha","179","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2829","Jarian-al-Batnah","179","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2830","Umm Salal","179","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2831","ad-Dawhah","179","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2832","al-Ghuwayriyah","179","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2833","al-Jumayliyah","179","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2834","al-Khawr","179","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2835","al-Wakrah","179","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2836","ar-Rayyan","179","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2837","ash-Shamal","179","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2838","Saint-Benoit","180","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2839","Saint-Denis","180","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2840","Saint-Paul","180","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2841","Saint-Pierre","180","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2842","Alba","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2843","Arad","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2844","Arges","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2845","Bacau","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2846","Bihor","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2847","Bistrita-Nasaud","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2848","Botosani","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2849","Braila","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2850","Brasov","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2851","Bucuresti","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2852","Buzau","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2853","Calarasi","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2854","Caras-Severin","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2855","Cluj","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2856","Constanta","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2857","Covasna","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2858","Dambovita","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2859","Dolj","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2860","Galati","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2861","Giurgiu","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2862","Gorj","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2863","Harghita","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2864","Hunedoara","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2865","Ialomita","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2866","Iasi","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2867","Ilfov","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2868","Maramures","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2869","Mehedinti","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2870","Mures","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2871","Neamt","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2872","Olt","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2873","Prahova","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2874","Salaj","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2875","Satu Mare","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2876","Sibiu","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2877","Sondelor","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2878","Suceava","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2879","Teleorman","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2880","Timis","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2881","Tulcea","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2882","Valcea","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2883","Vaslui","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2884","Vrancea","181","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2885","Adygeja","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2886","Aga","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2887","Alanija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2888","Altaj","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2889","Amur","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2890","Arhangelsk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2891","Astrahan","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2892","Bashkortostan","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2893","Belgorod","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2894","Brjansk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2895","Burjatija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2896","Chechenija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2897","Cheljabinsk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2898","Chita","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2899","Chukotka","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2900","Chuvashija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2901","Dagestan","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2902","Evenkija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2903","Gorno-Altaj","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2904","Habarovsk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2905","Hakasija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2906","Hanty-Mansija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2907","Ingusetija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2908","Irkutsk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2909","Ivanovo","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2910","Jamalo-Nenets","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2911","Jaroslavl","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2912","Jevrej","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2913","Kabardino-Balkarija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2914","Kaliningrad","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2915","Kalmykija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2916","Kaluga","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2917","Kamchatka","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2918","Karachaj-Cherkessija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2919","Karelija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2920","Kemerovo","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2921","Khabarovskiy Kray","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2922","Kirov","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2923","Komi","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2924","Komi-Permjakija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2925","Korjakija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2926","Kostroma","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2927","Krasnodar","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2928","Krasnojarsk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2929","Krasnoyarskiy Kray","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2930","Kurgan","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2931","Kursk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2932","Leningrad","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2933","Lipeck","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2934","Magadan","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2935","Marij El","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2936","Mordovija","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2937","Moscow","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2938","Moskovskaja Oblast","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2939","Moskovskaya Oblast","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2940","Moskva","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2941","Murmansk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2942","Nenets","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2943","Nizhnij Novgorod","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2944","Novgorod","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2945","Novokusnezk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2946","Novosibirsk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2947","Omsk","182","1","2018-07-20 14:53:16","2018-07-20 14:53:16");
INSERT INTO spn_states VALUES("2948","Orenburg","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2949","Orjol","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2950","Penza","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2951","Perm","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2952","Primorje","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2953","Pskov","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2954","Pskovskaya Oblast","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2955","Rjazan","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2956","Rostov","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2957","Saha","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2958","Sahalin","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2959","Samara","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2960","Samarskaya","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2961","Sankt-Peterburg","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2962","Saratov","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2963","Smolensk","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2964","Stavropol","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2965","Sverdlovsk","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2966","Tajmyrija","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2967","Tambov","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2968","Tatarstan","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2969","Tjumen","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2970","Tomsk","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2971","Tula","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2972","Tver","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2973","Tyva","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2974","Udmurtija","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2975","Uljanovsk","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2976","Ulyanovskaya Oblast","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2977","Ust-Orda","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2978","Vladimir","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2979","Volgograd","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2980","Vologda","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2981","Voronezh","182","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2982","Butare","183","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2983","Byumba","183","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2984","Cyangugu","183","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2985","Gikongoro","183","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2986","Gisenyi","183","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2987","Gitarama","183","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2988","Kibungo","183","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2989","Kibuye","183","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2990","Kigali-ngali","183","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2991","Ruhengeri","183","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2992","Ascension","184","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2993","Gough Island","184","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2994","Saint Helena","184","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2995","Tristan da Cunha","184","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2996","Christ Church Nichola Town","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2997","Saint Anne Sandy Point","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2998","Saint George Basseterre","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("2999","Saint George Gingerland","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3000","Saint James Windward","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3001","Saint John Capesterre","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3002","Saint John Figtree","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3003","Saint Mary Cayon","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3004","Saint Paul Capesterre","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3005","Saint Paul Charlestown","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3006","Saint Peter Basseterre","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3007","Saint Thomas Lowland","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3008","Saint Thomas Middle Island","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3009","Trinity Palmetto Point","185","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3010","Anse-la-Raye","186","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3011","Canaries","186","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3012","Castries","186","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3013","Choiseul","186","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3014","Dennery","186","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3015","Gros Inlet","186","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3016","Laborie","186","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3017","Micoud","186","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3018","Soufriere","186","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3019","Vieux Fort","186","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3020","Miquelon-Langlade","187","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3021","Saint-Pierre","187","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3022","Charlotte","188","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3023","Grenadines","188","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3024","Saint Andrew","188","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3025","Saint David","188","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3026","Saint George","188","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3027","Saint Patrick","188","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3028","A\'ana","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3029","Aiga-i-le-Tai","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3030","Atua","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3031","Fa\'asaleleaga","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3032","Gaga\'emauga","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3033","Gagaifomauga","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3034","Palauli","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3035","Satupa\'itea","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3036","Tuamasaga","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3037","Va\'a-o-Fonoti","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3038","Vaisigano","191","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3039","Acquaviva","192","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3040","Borgo Maggiore","192","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3041","Chiesanuova","192","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3042","Domagnano","192","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3043","Faetano","192","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3044","Fiorentino","192","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3045","Montegiardino","192","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3046","San Marino","192","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3047","Serravalle","192","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3048","Agua Grande","193","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3049","Cantagalo","193","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3050","Lemba","193","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3051","Lobata","193","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3052","Me-Zochi","193","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3053","Pague","193","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3054","Al Khobar","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3055","Aseer","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3056","Ash Sharqiyah","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3057","Asir","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3058","Central Province","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3059","Eastern Province","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3060","Ha\'il","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3061","Jawf","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3062","Jizan","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3063","Makkah","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3064","Najran","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3065","Qasim","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3066","Tabuk","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3067","Western Province","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3068","al-Bahah","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3069","al-Hudud-ash-Shamaliyah","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3070","al-Madinah","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3071","ar-Riyad","194","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3072","Dakar","195","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3073","Diourbel","195","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3074","Fatick","195","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3075","Kaolack","195","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3076","Kolda","195","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3077","Louga","195","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3078","Saint-Louis","195","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3079","Tambacounda","195","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3080","Thies","195","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3081","Ziguinchor","195","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3082","Central Serbia","196","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3083","Kosovo and Metohija","196","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3084","Vojvodina","196","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3085","Anse Boileau","197","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3086","Anse Royale","197","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3087","Cascade","197","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3088","Takamaka","197","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3089","Victoria","197","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3090","Eastern","198","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3091","Northern","198","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3092","Southern","198","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3093","Western","198","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3094","Singapore","199","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3095","Banskobystricky","200","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3096","Bratislavsky","200","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3097","Kosicky","200","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3098","Nitriansky","200","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3099","Presovsky","200","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3100","Trenciansky","200","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3101","Trnavsky","200","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3102","Zilinsky","200","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3103","Benedikt","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3104","Gorenjska","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3105","Gorishka","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3106","Jugovzhodna Slovenija","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3107","Koroshka","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3108","Notranjsko-krashka","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3109","Obalno-krashka","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3110","Obcina Domzale","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3111","Obcina Vitanje","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3112","Osrednjeslovenska","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3113","Podravska","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3114","Pomurska","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3115","Savinjska","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3116","Slovenian Littoral","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3117","Spodnjeposavska","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3118","Zasavska","201","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3119","Central","202","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3120","Choiseul","202","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3121","Guadalcanal","202","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3122","Isabel","202","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3123","Makira and Ulawa","202","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3124","Malaita","202","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3125","Rennell and Bellona","202","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3126","Temotu","202","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3127","Western","202","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3128","Awdal","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3129","Bakol","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3130","Banadir","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3131","Bari","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3132","Bay","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3133","Galgudug","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3134","Gedo","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3135","Hiran","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3136","Jubbada Hose","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3137","Jubbadha Dexe","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3138","Mudug","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3139","Nugal","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3140","Sanag","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3141","Shabellaha Dhexe","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3142","Shabellaha Hose","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3143","Togdher","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3144","Woqoyi Galbed","203","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3145","Eastern Cape","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3146","Free State","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3147","Gauteng","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3148","Kempton Park","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3149","Kramerville","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3150","KwaZulu Natal","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3151","Limpopo","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3152","Mpumalanga","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3153","North West","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3154","Northern Cape","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3155","Parow","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3156","Table View","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3157","Umtentweni","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3158","Western Cape","204","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3159","South Georgia","205","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3160","Central Equatoria","206","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3161","A Coruna","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3162","Alacant","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3163","Alava","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3164","Albacete","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3165","Almeria","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3166","Andalucia","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3167","Asturias","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3168","Avila","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3169","Badajoz","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3170","Balears","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3171","Barcelona","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3172","Bertamirans","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3173","Biscay","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3174","Burgos","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3175","Caceres","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3176","Cadiz","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3177","Cantabria","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3178","Castello","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3179","Catalunya","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3180","Ceuta","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3181","Ciudad Real","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3182","Comunidad Autonoma de Canarias","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3183","Comunidad Autonoma de Cataluna","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3184","Comunidad Autonoma de Galicia","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3185","Comunidad Autonoma de las Isla","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3186","Comunidad Autonoma del Princip","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3187","Comunidad Valenciana","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3188","Cordoba","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3189","Cuenca","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3190","Gipuzkoa","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3191","Girona","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3192","Granada","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3193","Guadalajara","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3194","Guipuzcoa","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3195","Huelva","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3196","Huesca","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3197","Jaen","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3198","La Rioja","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3199","Las Palmas","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3200","Leon","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3201","Lerida","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3202","Lleida","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3203","Lugo","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3204","Madrid","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3205","Malaga","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3206","Melilla","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3207","Murcia","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3208","Navarra","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3209","Ourense","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3210","Pais Vasco","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3211","Palencia","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3212","Pontevedra","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3213","Salamanca","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3214","Santa Cruz de Tenerife","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3215","Segovia","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3216","Sevilla","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3217","Soria","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3218","Tarragona","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3219","Tenerife","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3220","Teruel","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3221","Toledo","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3222","Valencia","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3223","Valladolid","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3224","Vizcaya","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3225","Zamora","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3226","Zaragoza","207","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3227","Amparai","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3228","Anuradhapuraya","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3229","Badulla","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3230","Boralesgamuwa","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3231","Colombo","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3232","Galla","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3233","Gampaha","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3234","Hambantota","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3235","Kalatura","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3236","Kegalla","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3237","Kilinochchi","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3238","Kurunegala","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3239","Madakalpuwa","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3240","Maha Nuwara","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3241","Malwana","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3242","Mannarama","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3243","Matale","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3244","Matara","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3245","Monaragala","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3246","Mullaitivu","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3247","North Eastern Province","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3248","North Western Province","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3249","Nuwara Eliya","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3250","Polonnaruwa","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3251","Puttalama","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3252","Ratnapuraya","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3253","Southern Province","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3254","Tirikunamalaya","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3255","Tuscany","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3256","Vavuniyawa","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3257","Western Province","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3258","Yapanaya","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3259","kadawatha","208","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3260","A\'ali-an-Nil","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3261","Bahr-al-Jabal","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3262","Central Equatoria","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3263","Gharb Bahr-al-Ghazal","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3264","Gharb Darfur","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3265","Gharb Kurdufan","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3266","Gharb-al-Istiwa\'iyah","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3267","Janub Darfur","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3268","Janub Kurdufan","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3269","Junqali","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3270","Kassala","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3271","Nahr-an-Nil","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3272","Shamal Bahr-al-Ghazal","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3273","Shamal Darfur","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3274","Shamal Kurdufan","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3275","Sharq-al-Istiwa\'iyah","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3276","Sinnar","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3277","Warab","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3278","Wilayat al Khartum","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3279","al-Bahr-al-Ahmar","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3280","al-Buhayrat","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3281","al-Jazirah","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3282","al-Khartum","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3283","al-Qadarif","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3284","al-Wahdah","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3285","an-Nil-al-Abyad","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3286","an-Nil-al-Azraq","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3287","ash-Shamaliyah","209","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3288","Brokopondo","210","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3289","Commewijne","210","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3290","Coronie","210","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3291","Marowijne","210","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3292","Nickerie","210","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3293","Para","210","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3294","Paramaribo","210","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3295","Saramacca","210","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3296","Wanica","210","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3297","Svalbard","211","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3298","Hhohho","212","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3299","Lubombo","212","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3300","Manzini","212","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3301","Shiselweni","212","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3302","Alvsborgs Lan","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3303","Angermanland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3304","Blekinge","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3305","Bohuslan","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3306","Dalarna","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3307","Gavleborg","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3308","Gaza","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3309","Gotland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3310","Halland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3311","Jamtland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3312","Jonkoping","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3313","Kalmar","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3314","Kristianstads","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3315","Kronoberg","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3316","Norrbotten","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3317","Orebro","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3318","Ostergotland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3319","Saltsjo-Boo","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3320","Skane","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3321","Smaland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3322","Sodermanland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3323","Stockholm","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3324","Uppsala","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3325","Varmland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3326","Vasterbotten","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3327","Vastergotland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3328","Vasternorrland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3329","Vastmanland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3330","Vastra Gotaland","213","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3331","Aargau","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3332","Appenzell Inner-Rhoden","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3333","Appenzell-Ausser Rhoden","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3334","Basel-Landschaft","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3335","Basel-Stadt","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3336","Bern","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3337","Canton Ticino","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3338","Fribourg","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3339","Geneve","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3340","Glarus","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3341","Graubunden","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3342","Heerbrugg","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3343","Jura","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3344","Kanton Aargau","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3345","Luzern","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3346","Morbio Inferiore","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3347","Muhen","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3348","Neuchatel","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3349","Nidwalden","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3350","Obwalden","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3351","Sankt Gallen","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3352","Schaffhausen","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3353","Schwyz","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3354","Solothurn","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3355","Thurgau","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3356","Ticino","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3357","Uri","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3358","Valais","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3359","Vaud","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3360","Vauffelin","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3361","Zug","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3362","Zurich","214","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3363","Aleppo","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3364","Dar\'a","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3365","Dayr-az-Zawr","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3366","Dimashq","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3367","Halab","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3368","Hamah","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3369","Hims","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3370","Idlib","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3371","Madinat Dimashq","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3372","Tartus","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3373","al-Hasakah","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3374","al-Ladhiqiyah","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3375","al-Qunaytirah","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3376","ar-Raqqah","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3377","as-Suwayda","215","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3378","Changhwa","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3379","Chiayi Hsien","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3380","Chiayi Shih","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3381","Eastern Taipei","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3382","Hsinchu Hsien","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3383","Hsinchu Shih","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3384","Hualien","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3385","Ilan","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3386","Kaohsiung Hsien","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3387","Kaohsiung Shih","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3388","Keelung Shih","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3389","Kinmen","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3390","Miaoli","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3391","Nantou","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3392","Northern Taiwan","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3393","Penghu","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3394","Pingtung","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3395","Taichung","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3396","Taichung Hsien","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3397","Taichung Shih","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3398","Tainan Hsien","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3399","Tainan Shih","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3400","Taipei Hsien","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3401","Taipei Shih / Taipei Hsien","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3402","Taitung","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3403","Taoyuan","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3404","Yilan","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3405","Yun-Lin Hsien","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3406","Yunlin","216","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3407","Dushanbe","217","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3408","Gorno-Badakhshan","217","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3409","Karotegin","217","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3410","Khatlon","217","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3411","Sughd","217","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3412","Arusha","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3413","Dar es Salaam","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3414","Dodoma","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3415","Iringa","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3416","Kagera","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3417","Kigoma","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3418","Kilimanjaro","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3419","Lindi","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3420","Mara","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3421","Mbeya","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3422","Morogoro","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3423","Mtwara","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3424","Mwanza","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3425","Pwani","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3426","Rukwa","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3427","Ruvuma","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3428","Shinyanga","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3429","Singida","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3430","Tabora","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3431","Tanga","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3432","Zanzibar and Pemba","218","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3433","Amnat Charoen","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3434","Ang Thong","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3435","Bangkok","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3436","Buri Ram","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3437","Chachoengsao","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3438","Chai Nat","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3439","Chaiyaphum","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3440","Changwat Chaiyaphum","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3441","Chanthaburi","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3442","Chiang Mai","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3443","Chiang Rai","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3444","Chon Buri","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3445","Chumphon","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3446","Kalasin","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3447","Kamphaeng Phet","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3448","Kanchanaburi","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3449","Khon Kaen","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3450","Krabi","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3451","Krung Thep","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3452","Lampang","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3453","Lamphun","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3454","Loei","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3455","Lop Buri","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3456","Mae Hong Son","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3457","Maha Sarakham","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3458","Mukdahan","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3459","Nakhon Nayok","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3460","Nakhon Pathom","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3461","Nakhon Phanom","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3462","Nakhon Ratchasima","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3463","Nakhon Sawan","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3464","Nakhon Si Thammarat","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3465","Nan","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3466","Narathiwat","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3467","Nong Bua Lam Phu","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3468","Nong Khai","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3469","Nonthaburi","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3470","Pathum Thani","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3471","Pattani","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3472","Phangnga","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3473","Phatthalung","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3474","Phayao","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3475","Phetchabun","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3476","Phetchaburi","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3477","Phichit","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3478","Phitsanulok","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3479","Phra Nakhon Si Ayutthaya","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3480","Phrae","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3481","Phuket","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3482","Prachin Buri","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3483","Prachuap Khiri Khan","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3484","Ranong","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3485","Ratchaburi","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3486","Rayong","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3487","Roi Et","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3488","Sa Kaeo","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3489","Sakon Nakhon","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3490","Samut Prakan","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3491","Samut Sakhon","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3492","Samut Songkhran","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3493","Saraburi","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3494","Satun","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3495","Si Sa Ket","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3496","Sing Buri","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3497","Songkhla","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3498","Sukhothai","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3499","Suphan Buri","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3500","Surat Thani","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3501","Surin","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3502","Tak","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3503","Trang","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3504","Trat","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3505","Ubon Ratchathani","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3506","Udon Thani","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3507","Uthai Thani","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3508","Uttaradit","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3509","Yala","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3510","Yasothon","219","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3511","Centre","220","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3512","Kara","220","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3513","Maritime","220","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3514","Plateaux","220","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3515","Savanes","220","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3516","Atafu","221","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3517","Fakaofo","221","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3518","Nukunonu","221","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3519","Eua","222","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3520","Ha\'apai","222","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3521","Niuas","222","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3522","Tongatapu","222","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3523","Vava\'u","222","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3524","Arima-Tunapuna-Piarco","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3525","Caroni","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3526","Chaguanas","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3527","Couva-Tabaquite-Talparo","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3528","Diego Martin","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3529","Glencoe","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3530","Penal Debe","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3531","Point Fortin","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3532","Port of Spain","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3533","Princes Town","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3534","Saint George","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3535","San Fernando","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3536","San Juan","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3537","Sangre Grande","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3538","Siparia","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3539","Tobago","223","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3540","Aryanah","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3541","Bajah","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3542","Bin \'Arus","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3543","Binzart","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3544","Gouvernorat de Ariana","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3545","Gouvernorat de Nabeul","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3546","Gouvernorat de Sousse","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3547","Hammamet Yasmine","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3548","Jundubah","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3549","Madaniyin","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3550","Manubah","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3551","Monastir","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3552","Nabul","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3553","Qabis","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3554","Qafsah","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3555","Qibili","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3556","Safaqis","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3557","Sfax","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3558","Sidi Bu Zayd","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3559","Silyanah","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3560","Susah","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3561","Tatawin","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3562","Tawzar","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3563","Tunis","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3564","Zaghwan","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3565","al-Kaf","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3566","al-Mahdiyah","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3567","al-Munastir","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3568","al-Qasrayn","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3569","al-Qayrawan","224","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3570","Adana","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3571","Adiyaman","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3572","Afyon","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3573","Agri","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3574","Aksaray","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3575","Amasya","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3576","Ankara","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3577","Antalya","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3578","Ardahan","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3579","Artvin","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3580","Aydin","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3581","Balikesir","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3582","Bartin","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3583","Batman","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3584","Bayburt","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3585","Bilecik","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3586","Bingol","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3587","Bitlis","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3588","Bolu","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3589","Burdur","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3590","Bursa","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3591","Canakkale","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3592","Cankiri","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3593","Corum","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3594","Denizli","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3595","Diyarbakir","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3596","Duzce","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3597","Edirne","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3598","Elazig","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3599","Erzincan","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3600","Erzurum","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3601","Eskisehir","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3602","Gaziantep","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3603","Giresun","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3604","Gumushane","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3605","Hakkari","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3606","Hatay","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3607","Icel","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3608","Igdir","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3609","Isparta","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3610","Istanbul","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3611","Izmir","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3612","Kahramanmaras","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3613","Karabuk","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3614","Karaman","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3615","Kars","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3616","Karsiyaka","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3617","Kastamonu","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3618","Kayseri","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3619","Kilis","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3620","Kirikkale","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3621","Kirklareli","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3622","Kirsehir","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3623","Kocaeli","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3624","Konya","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3625","Kutahya","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3626","Lefkosa","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3627","Malatya","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3628","Manisa","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3629","Mardin","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3630","Mugla","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3631","Mus","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3632","Nevsehir","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3633","Nigde","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3634","Ordu","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3635","Osmaniye","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3636","Rize","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3637","Sakarya","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3638","Samsun","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3639","Sanliurfa","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3640","Siirt","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3641","Sinop","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3642","Sirnak","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3643","Sivas","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3644","Tekirdag","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3645","Tokat","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3646","Trabzon","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3647","Tunceli","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3648","Usak","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3649","Van","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3650","Yalova","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3651","Yozgat","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3652","Zonguldak","225","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3653","Ahal","226","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3654","Asgabat","226","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3655","Balkan","226","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3656","Dasoguz","226","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3657","Lebap","226","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3658","Mari","226","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3659","Grand Turk","227","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3660","South Caicos and East Caicos","227","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3661","Funafuti","228","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3662","Nanumanga","228","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3663","Nanumea","228","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3664","Niutao","228","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3665","Nui","228","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3666","Nukufetau","228","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3667","Nukulaelae","228","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3668","Vaitupu","228","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3669","Central","229","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3670","Eastern","229","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3671","Northern","229","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3672","Western","229","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3673","Cherkas\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3674","Chernihivs\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3675","Chernivets\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3676","Crimea","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3677","Dnipropetrovska","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3678","Donets\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3679","Ivano-Frankivs\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3680","Kharkiv","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3681","Kharkov","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3682","Khersonska","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3683","Khmel\'nyts\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3684","Kirovohrad","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3685","Krym","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3686","Kyyiv","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3687","Kyyivs\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3688","L\'vivs\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3689","Luhans\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3690","Mykolayivs\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3691","Odes\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3692","Odessa","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3693","Poltavs\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3694","Rivnens\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3695","Sevastopol\'","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3696","Sums\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3697","Ternopil\'s\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3698","Volyns\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3699","Vynnyts\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3700","Zakarpats\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3701","Zaporizhia","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3702","Zhytomyrs\'ka","230","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3703","Abu Zabi","231","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3704","Ajman","231","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3705","Dubai","231","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3706","Ras al-Khaymah","231","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3707","Sharjah","231","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3708","Sharjha","231","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3709","Umm al Qaywayn","231","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3710","al-Fujayrah","231","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3711","ash-Shariqah","231","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3712","Aberdeen","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3713","Aberdeenshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3714","Argyll","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3715","Armagh","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3716","Bedfordshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3717","Belfast","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3718","Berkshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3719","Birmingham","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3720","Brechin","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3721","Bridgnorth","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3722","Bristol","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3723","Buckinghamshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3724","Cambridge","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3725","Cambridgeshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3726","Channel Islands","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3727","Cheshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3728","Cleveland","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3729","Co Fermanagh","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3730","Conwy","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3731","Cornwall","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3732","Coventry","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3733","Craven Arms","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3734","Cumbria","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3735","Denbighshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3736","Derby","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3737","Derbyshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3738","Devon","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3739","Dial Code Dungannon","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3740","Didcot","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3741","Dorset","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3742","Dunbartonshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3743","Durham","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3744","East Dunbartonshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3745","East Lothian","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3746","East Midlands","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3747","East Sussex","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3748","East Yorkshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3749","England","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3750","Essex","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3751","Fermanagh","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3752","Fife","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3753","Flintshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3754","Fulham","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3755","Gainsborough","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3756","Glocestershire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3757","Gwent","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3758","Hampshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3759","Hants","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3760","Herefordshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3761","Hertfordshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3762","Ireland","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3763","Isle Of Man","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3764","Isle of Wight","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3765","Kenford","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3766","Kent","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3767","Kilmarnock","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3768","Lanarkshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3769","Lancashire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3770","Leicestershire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3771","Lincolnshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3772","Llanymynech","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3773","London","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3774","Ludlow","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3775","Manchester","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3776","Mayfair","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3777","Merseyside","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3778","Mid Glamorgan","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3779","Middlesex","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3780","Mildenhall","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3781","Monmouthshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3782","Newton Stewart","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3783","Norfolk","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3784","North Humberside","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3785","North Yorkshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3786","Northamptonshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3787","Northants","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3788","Northern Ireland","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3789","Northumberland","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3790","Nottinghamshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3791","Oxford","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3792","Powys","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3793","Roos-shire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3794","SUSSEX","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3795","Sark","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3796","Scotland","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3797","Scottish Borders","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3798","Shropshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3799","Somerset","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3800","South Glamorgan","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3801","South Wales","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3802","South Yorkshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3803","Southwell","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3804","Staffordshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3805","Strabane","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3806","Suffolk","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3807","Surrey","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3808","Twickenham","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3809","Tyne and Wear","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3810","Tyrone","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3811","Utah","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3812","Wales","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3813","Warwickshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3814","West Lothian","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3815","West Midlands","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3816","West Sussex","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3817","West Yorkshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3818","Whissendine","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3819","Wiltshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3820","Wokingham","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3821","Worcestershire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3822","Wrexham","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3823","Wurttemberg","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3824","Yorkshire","232","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3825","Alabama","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3826","Alaska","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3827","Arizona","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3828","Arkansas","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3829","Byram","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3830","California","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3831","Cokato","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3832","Colorado","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3833","Connecticut","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3834","Delaware","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3835","District of Columbia","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3836","Florida","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3837","Georgia","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3838","Hawaii","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3839","Idaho","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3840","Illinois","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3841","Indiana","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3842","Iowa","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3843","Kansas","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3844","Kentucky","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3845","Louisiana","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3846","Lowa","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3847","Maine","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3848","Maryland","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3849","Massachusetts","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3850","Medfield","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3851","Michigan","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3852","Minnesota","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3853","Mississippi","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3854","Missouri","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3855","Montana","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3856","Nebraska","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3857","Nevada","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3858","New Hampshire","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3859","New Jersey","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3860","New Jersy","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3861","New Mexico","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3862","New York","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3863","North Carolina","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3864","North Dakota","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3865","Ohio","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3866","Oklahoma","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3867","Ontario","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3868","Oregon","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3869","Pennsylvania","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3870","Ramey","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3871","Rhode Island","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3872","South Carolina","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3873","South Dakota","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3874","Sublimity","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3875","Tennessee","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3876","Texas","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3877","Trimble","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3878","Utah","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3879","Vermont","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3880","Virginia","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3881","Washington","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3882","West Virginia","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3883","Wisconsin","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3884","Wyoming","233","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3885","United States Minor Outlying I","234","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3886","Artigas","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3887","Canelones","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3888","Cerro Largo","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3889","Colonia","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3890","Durazno","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3891","FLorida","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3892","Flores","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3893","Lavalleja","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3894","Maldonado","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3895","Montevideo","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3896","Paysandu","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3897","Rio Negro","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3898","Rivera","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3899","Rocha","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3900","Salto","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3901","San Jose","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3902","Soriano","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3903","Tacuarembo","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3904","Treinta y Tres","235","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3905","Andijon","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3906","Buhoro","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3907","Buxoro Viloyati","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3908","Cizah","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3909","Fargona","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3910","Horazm","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3911","Kaskadar","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3912","Korakalpogiston","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3913","Namangan","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3914","Navoi","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3915","Samarkand","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3916","Sirdare","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3917","Surhondar","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3918","Toskent","236","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3919","Malampa","237","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3920","Penama","237","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3921","Sanma","237","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3922","Shefa","237","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3923","Tafea","237","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3924","Torba","237","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3925","Vatican City State (Holy See)","238","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3926","Amazonas","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3927","Anzoategui","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3928","Apure","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3929","Aragua","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3930","Barinas","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3931","Bolivar","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3932","Carabobo","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3933","Cojedes","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3934","Delta Amacuro","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3935","Distrito Federal","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3936","Falcon","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3937","Guarico","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3938","Lara","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3939","Merida","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3940","Miranda","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3941","Monagas","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3942","Nueva Esparta","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3943","Portuguesa","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3944","Sucre","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3945","Tachira","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3946","Trujillo","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3947","Vargas","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3948","Yaracuy","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3949","Zulia","239","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3950","Bac Giang","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3951","Binh Dinh","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3952","Binh Duong","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3953","Da Nang","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3954","Dong Bang Song Cuu Long","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3955","Dong Bang Song Hong","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3956","Dong Nai","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3957","Dong Nam Bo","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3958","Duyen Hai Mien Trung","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3959","Hanoi","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3960","Hung Yen","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3961","Khu Bon Cu","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3962","Long An","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3963","Mien Nui Va Trung Du","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3964","Thai Nguyen","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3965","Thanh Pho Ho Chi Minh","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3966","Thu Do Ha Noi","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3967","Tinh Can Tho","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3968","Tinh Da Nang","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3969","Tinh Gia Lai","240","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3970","Anegada","241","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3971","Jost van Dyke","241","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3972","Tortola","241","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3973","Saint Croix","242","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3974","Saint John","242","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3975","Saint Thomas","242","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3976","Alo","243","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3977","Singave","243","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3978","Wallis","243","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3979","Bu Jaydur","244","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3980","Wad-adh-Dhahab","244","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3981","al-\'Ayun","244","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3982","as-Samarah","244","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3983","\'Adan","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3984","Abyan","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3985","Dhamar","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3986","Hadramaut","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3987","Hajjah","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3988","Hudaydah","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3989","Ibb","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3990","Lahij","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3991","Ma\'rib","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3992","Madinat San\'a","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3993","Sa\'dah","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3994","Sana","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3995","Shabwah","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3996","Ta\'izz","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3997","al-Bayda","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3998","al-Hudaydah","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("3999","al-Jawf","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4000","al-Mahrah","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4001","al-Mahwit","245","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4002","Central","246","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4003","Copperbelt","246","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4004","Eastern","246","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4005","Luapala","246","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4006","Lusaka","246","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4007","North-Western","246","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4008","Northern","246","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4009","Southern","246","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4010","Western","246","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4011","Bulawayo","247","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4012","Harare","247","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4013","Manicaland","247","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4014","Mashonaland Central","247","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4015","Mashonaland East","247","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4016","Mashonaland West","247","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4017","Masvingo","247","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4018","Matabeleland North","247","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4019","Matabeleland South","247","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4020","Midlands","247","1","2018-07-20 14:53:17","2018-07-20 14:53:17");
INSERT INTO spn_states VALUES("4021","American Samoa","233","1","2019-01-25 02:44:37","2019-01-25 02:44:37");
INSERT INTO spn_states VALUES("4022","Federated States Of Micronesia","233","1","2019-01-25 02:44:37","2019-01-25 02:44:37");
INSERT INTO spn_states VALUES("4023","Guam","233","1","2019-01-25 02:44:37","2019-01-25 02:44:37");
INSERT INTO spn_states VALUES("4024","Marshall Islands","233","1","2019-01-25 02:44:37","2019-01-25 02:44:37");
INSERT INTO spn_states VALUES("4025","Northern Mariana Islands","233","1","2019-01-25 02:44:37","2019-01-25 02:44:37");
INSERT INTO spn_states VALUES("4026","Palau","233","1","2019-01-25 02:44:37","2019-01-25 02:44:37");
INSERT INTO spn_states VALUES("4027","Puerto Rico","233","1","2019-01-25 02:44:37","2019-01-25 02:44:37");
INSERT INTO spn_states VALUES("4028","Virgin Islands","233","1","2019-01-25 02:44:37","2019-01-25 02:44:37");



DROP TABLE statements;

CREATE TABLE `statements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned DEFAULT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Statement_011` (`author_id`),
  KEY `statement_01` (`item_id`),
  KEY `order_0011` (`order_id`),
  CONSTRAINT `Statement_011` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_0011` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `statement_01` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE stripe_payments;

CREATE TABLE `stripe_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double(8,2) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `charge_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'customer stripe id',
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stripe_payment_001` (`user_id`),
  CONSTRAINT `stripe_payment_001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE sub_attributes;

CREATE TABLE `sub_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attributes_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_attributes_attributes_id_index` (`attributes_id`),
  KEY `sub_attributes_category_id_index` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sub_attributes VALUES("1","1","1","IE6","1","","");
INSERT INTO sub_attributes VALUES("2","1","1","IE7","1","","");
INSERT INTO sub_attributes VALUES("3","2","1","bbPress 2.4 x","1","","");
INSERT INTO sub_attributes VALUES("4","2","1","bbPress 2.5 x","1","","");
INSERT INTO sub_attributes VALUES("5","3","1","Layers WP","1","","");
INSERT INTO sub_attributes VALUES("6","3","1","Genesis","1","","");
INSERT INTO sub_attributes VALUES("7","4","1","WordPress5.5.x","1","","");
INSERT INTO sub_attributes VALUES("8","4","1","WordPress5.4.x","1","","");
INSERT INTO sub_attributes VALUES("9","1","2","IE6","1","","");
INSERT INTO sub_attributes VALUES("10","1","2","IE7","1","","");
INSERT INTO sub_attributes VALUES("11","2","2","bbPress 2.4 x","1","","");
INSERT INTO sub_attributes VALUES("12","2","2","bbPress 2.5 x","1","","");
INSERT INTO sub_attributes VALUES("13","3","2","Layers WP","1","","");
INSERT INTO sub_attributes VALUES("14","3","2","Genesis","1","","");
INSERT INTO sub_attributes VALUES("15","4","2","WordPress5.5.x","1","","");
INSERT INTO sub_attributes VALUES("16","4","2","WordPress5.4.x","1","","");
INSERT INTO sub_attributes VALUES("17","1","3","IE6","1","","");
INSERT INTO sub_attributes VALUES("18","1","3","IE7","1","","");
INSERT INTO sub_attributes VALUES("19","2","3","bbPress 2.4 x","1","","");
INSERT INTO sub_attributes VALUES("20","2","3","bbPress 2.5 x","1","","");
INSERT INTO sub_attributes VALUES("21","3","3","Layers WP","1","","");
INSERT INTO sub_attributes VALUES("22","3","3","Genesis","1","","");
INSERT INTO sub_attributes VALUES("23","4","3","WordPress5.5.x","1","","");
INSERT INTO sub_attributes VALUES("24","4","3","WordPress5.4.x","1","","");
INSERT INTO sub_attributes VALUES("25","1","4","IE6","1","","");
INSERT INTO sub_attributes VALUES("26","1","4","IE7","1","","");
INSERT INTO sub_attributes VALUES("27","2","4","bbPress 2.4 x","1","","");
INSERT INTO sub_attributes VALUES("28","2","4","bbPress 2.5 x","1","","");
INSERT INTO sub_attributes VALUES("29","3","4","Layers WP","1","","");
INSERT INTO sub_attributes VALUES("30","3","4","Genesis","1","","");
INSERT INTO sub_attributes VALUES("31","4","4","WordPress5.5.x","1","","");
INSERT INTO sub_attributes VALUES("32","4","4","WordPress5.4.x","1","","");
INSERT INTO sub_attributes VALUES("33","1","5","IE6","1","","");
INSERT INTO sub_attributes VALUES("34","1","5","IE7","1","","");
INSERT INTO sub_attributes VALUES("35","2","5","bbPress 2.4 x","1","","");
INSERT INTO sub_attributes VALUES("36","2","5","bbPress 2.5 x","1","","");
INSERT INTO sub_attributes VALUES("37","3","5","Layers WP","1","","");
INSERT INTO sub_attributes VALUES("38","3","5","Genesis","1","","");
INSERT INTO sub_attributes VALUES("39","4","5","WordPress5.5.x","1","","");
INSERT INTO sub_attributes VALUES("40","4","5","WordPress5.4.x","1","","");
INSERT INTO sub_attributes VALUES("41","1","6","IE6","1","","");
INSERT INTO sub_attributes VALUES("42","1","6","IE7","1","","");
INSERT INTO sub_attributes VALUES("43","2","6","bbPress 2.4 x","1","","");
INSERT INTO sub_attributes VALUES("44","2","6","bbPress 2.5 x","1","","");
INSERT INTO sub_attributes VALUES("45","3","6","Layers WP","1","","");
INSERT INTO sub_attributes VALUES("46","3","6","Genesis","1","","");
INSERT INTO sub_attributes VALUES("47","4","6","WordPress5.5.x","1","","");
INSERT INTO sub_attributes VALUES("48","4","6","WordPress5.4.x","1","","");
INSERT INTO sub_attributes VALUES("49","1","7","IE6","1","","");
INSERT INTO sub_attributes VALUES("50","1","7","IE7","1","","");
INSERT INTO sub_attributes VALUES("51","2","7","bbPress 2.4 x","1","","");
INSERT INTO sub_attributes VALUES("52","2","7","bbPress 2.5 x","1","","");
INSERT INTO sub_attributes VALUES("53","3","7","Layers WP","1","","");
INSERT INTO sub_attributes VALUES("54","3","7","Genesis","1","","");
INSERT INTO sub_attributes VALUES("55","4","7","WordPress5.5.x","1","","");
INSERT INTO sub_attributes VALUES("56","4","7","WordPress5.4.x","1","","");
INSERT INTO sub_attributes VALUES("57","1","8","IE6","1","","");
INSERT INTO sub_attributes VALUES("58","1","8","IE7","1","","");
INSERT INTO sub_attributes VALUES("59","2","8","bbPress 2.4 x","1","","");
INSERT INTO sub_attributes VALUES("60","2","8","bbPress 2.5 x","1","","");
INSERT INTO sub_attributes VALUES("61","3","8","Layers WP","1","","");
INSERT INTO sub_attributes VALUES("62","3","8","Genesis","1","","");
INSERT INTO sub_attributes VALUES("63","4","8","WordPress5.5.x","1","","");
INSERT INTO sub_attributes VALUES("64","4","8","WordPress5.4.x","1","","");
INSERT INTO sub_attributes VALUES("65","1","9","IE6","1","","");
INSERT INTO sub_attributes VALUES("66","1","9","IE7","1","","");
INSERT INTO sub_attributes VALUES("67","2","9","bbPress 2.4 x","1","","");
INSERT INTO sub_attributes VALUES("68","2","9","bbPress 2.5 x","1","","");
INSERT INTO sub_attributes VALUES("69","3","9","Layers WP","1","","");
INSERT INTO sub_attributes VALUES("70","3","9","Genesis","1","","");
INSERT INTO sub_attributes VALUES("71","4","9","WordPress5.5.x","1","","");
INSERT INTO sub_attributes VALUES("72","4","9","WordPress5.4.x","1","","");
INSERT INTO sub_attributes VALUES("73","1","10","IE6","1","","");
INSERT INTO sub_attributes VALUES("74","1","10","IE7","1","","");
INSERT INTO sub_attributes VALUES("75","2","10","bbPress 2.4 x","1","","");
INSERT INTO sub_attributes VALUES("76","2","10","bbPress 2.5 x","1","","");
INSERT INTO sub_attributes VALUES("77","3","10","Layers WP","1","","");
INSERT INTO sub_attributes VALUES("78","3","10","Genesis","1","","");
INSERT INTO sub_attributes VALUES("79","4","10","WordPress5.5.x","1","","");
INSERT INTO sub_attributes VALUES("80","4","10","WordPress5.4.x","1","","");



DROP TABLE subscription_plan;

CREATE TABLE `subscription_plan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `item_amount` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscription_plan_fk0` (`vendor_id`),
  CONSTRAINT `subscription_plan_fk0` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE supports;

CREATE TABLE `supports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `vendor_id` int(10) unsigned DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support01` (`user_id`),
  KEY `support02` (`item_id`),
  KEY `support03` (`vendor_id`),
  CONSTRAINT `support01` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `support02` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `support03` FOREIGN KEY (`vendor_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE taxes;

CREATE TABLE `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE temp_files;

CREATE TABLE `temp_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE third_party_apis;

CREATE TABLE `third_party_apis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ga_view_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ga_site_tag_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ga_service_account` longtext COLLATE utf8mb4_unicode_ci,
  `fixer_access_key` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO third_party_apis VALUES("1","214610223","UA-162089702-1","app/analytics/service-account-credentials.json","","2021-04-28 12:42:04","2021-04-28 12:42:04");



DROP TABLE ticket_pages;

CREATE TABLE `ticket_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heading` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(10) unsigned DEFAULT '1',
  `updated_by` int(10) unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO ticket_pages VALUES("1","All Submitted Tickets","We do not sell or share your details without your permission. Find out more in our Privacy Policy. Your username, email and password can be updated via your Codepixar Account settings.","1","1","1","","");



DROP TABLE userlogs;

CREATE TABLE `userlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userlog_01` (`user_id`),
  CONSTRAINT `userlog_01` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO userlogs VALUES("1","1","2021-04-28 12:42:24","::1","Macintosh","Chrome/10_15_6(OS X)","","","","","1","2021-04-28 12:42:24","2021-04-28 12:42:24");



DROP TABLE users;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `access_status` tinyint(1) NOT NULL DEFAULT '1',
  `style_id` int(11) DEFAULT NULL,
  `lang_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rtl` int(11) DEFAULT '0',
  `referrer_id` int(10) unsigned DEFAULT NULL,
  `referral_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`),
  UNIQUE KEY `users_referral_token_unique` (`referral_token`),
  KEY `users_fk0` (`role_id`),
  KEY `refer_001` (`referrer_id`),
  CONSTRAINT `refer_001` FOREIGN KEY (`referrer_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_fk0` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","1","Super Admin","Super admin","mafy.vlad@yahoo.com","$2y$10$iEYNNsSwKhJeNB5jZdLcUuEr8/YKAHg2BvAHBHKoFzBstuGZyYRCi","0","2021-04-28 12:41:54","","","Uimp7LpKSRMq1OrIxeZ1ntIirEd7fpuv4Hb4j3tp5Eu3AQNW79W3Sf0lyHcF","1","","1","","","0","","","2021-04-28 12:41:54","2021-04-28 12:42:04");



DROP TABLE vendors;

CREATE TABLE `vendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendors_fk0` (`user_id`),
  CONSTRAINT `vendors_fk0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE version_histories;

CREATE TABLE `version_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `release_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE withdraws;

CREATE TABLE `withdraws` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `paid_vendors_id` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `withdraws_001` (`user_id`),
  KEY `withdraws_009` (`paid_vendors_id`),
  KEY `withdraws_00900` (`payment_method_id`),
  CONSTRAINT `withdraws_001` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `withdraws_009` FOREIGN KEY (`paid_vendors_id`) REFERENCES `paid_vendors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `withdraws_00900` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




