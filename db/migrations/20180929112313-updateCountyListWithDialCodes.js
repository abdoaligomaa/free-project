'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return Promise.all([
      queryInterface.sequelize.query('TRUNCATE TABLE Country'),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AF','Afghanistan','+93',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AL','Albania','+355',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('DZ','Algeria','+213',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AS','AmericanSamoa','+1 684',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AD','Andorra','+376',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AO','Angola','+244',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AI','Anguilla','+1 264',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AQ','Antarctica','+672',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AG','Antigua and Barbuda','+1268',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AR','Argentina','+54',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AM','Armenia','+374',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AW','Aruba','+297',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AU','Australia','+61',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AT','Austria','+43',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AZ','Azerbaijan','+994',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BS','Bahamas','+1 242',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BH','Bahrain','+973',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BD','Bangladesh','+880',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BB','Barbados','+1 246',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BY','Belarus','+375',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BE','Belgium','+32',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BZ','Belize','+501',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BJ','Benin','+229',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BM','Bermuda','+1 441',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BT','Bhutan','+975',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BO','Bolivia, Plurinational State of','+591',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BA','Bosnia and Herzegovina','+387',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BW','Botswana','+267',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BR','Brazil','+55',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('IO','British Indian Ocean Territory','+246',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BN','Brunei Darussalam','+673',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BG','Bulgaria','+359',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BF','Burkina Faso','+226',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BI','Burundi','+257',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KH','Cambodia','+855',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CM','Cameroon','+237',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CA','Canada','+1',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CV','Cape Verde','+238',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KY','Cayman Islands','+ 345',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CF','Central African Republic','+236',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TD','Chad','+235',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CL','Chile','+56',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CN','China','+86',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CX','Christmas Island','+61',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CC','Cocos (Keeling) Islands','+61',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CO','Colombia','+57',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KM','Comoros','+269',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CG','Congo','+242',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CD','Congo, The Democratic Republic of the','+243',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CK','Cook Islands','+682',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CR','Costa Rica','+506',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CI','Cote d''Ivoire','+225',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('HR','Croatia','+385',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CU','Cuba','+53',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CY','Cyprus','+537',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CZ','Czech Republic','+420',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('DK','Denmark','+45',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('DJ','Djibouti','+253',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('DM','Dominica','+1 767',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('DO','Dominican Republic','+1 849',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('EC','Ecuador','+593',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('EG','Egypt','+20',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SV','El Salvador','+503',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GQ','Equatorial Guinea','+240',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('ER','Eritrea','+291',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('EE','Estonia','+372',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('ET','Ethiopia','+251',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('FK','Falkland Islands (Malvinas)','+500',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('FO','Faroe Islands','+298',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('FJ','Fiji','+679',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('FI','Finland','+358',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('FR','France','+33',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GF','French Guiana','+594',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PF','French Polynesia','+689',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GA','Gabon','+241',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GM','Gambia','+220',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GE','Georgia','+995',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('DE','Germany','+49',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GH','Ghana','+233',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GI','Gibraltar','+350',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GR','Greece','+30',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GL','Greenland','+299',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GD','Grenada','+1 473',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GP','Guadeloupe','+590',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GU','Guam','+1 671',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GT','Guatemala','+502',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GG','Guernsey','+44',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GN','Guinea','+224',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GW','Guinea-Bissau','+245',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GY','Guyana','+595',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('HT','Haiti','+509',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('VA','Holy See (Vatican City State)','+379',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('HN','Honduras','+504',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('HK','Hong Kong','+852',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('HU','Hungary','+36',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('IS','Iceland','+354',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('IN','India','+91',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('ID','Indonesia','+62',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('IR','Iran, Islamic Republic of','+98',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('IQ','Iraq','+964',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('IE','Ireland','+353',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('IM','Isle of Man','+44',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('IL','Israel','+972',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('IT','Italy','+39',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('JM','Jamaica','+1 876',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('JP','Japan','+81',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('JE','Jersey','+44',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('JO','Jordan','+962',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KZ','Kazakhstan','+7 7',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KE','Kenya','+254',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KI','Kiribati','+686',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KP','Korea, Democratic People''s Republic of','+850',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KR','Korea, Republic of','+82',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KW','Kuwait','+965',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KG','Kyrgyzstan','+996',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LA','Lao People''s Democratic Republic','+856',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LV','Latvia','+371',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LB','Lebanon','+961',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LS','Lesotho','+266',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LR','Liberia','+231',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LY','Libyan Arab Jamahiriya','+218',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LI','Liechtenstein','+423',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LT','Lithuania','+370',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LU','Luxembourg','+352',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MO','Macao','+853',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MK','Macedonia, The Former Yugoslav Republic of','+389',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MG','Madagascar','+261',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MW','Malawi','+265',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MY','Malaysia','+60',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MV','Maldives','+960',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('ML','Mali','+223',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MT','Malta','+356',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MH','Marshall Islands','+692',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MQ','Martinique','+596',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MR','Mauritania','+222',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MU','Mauritius','+230',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('YT','Mayotte','+262',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MX','Mexico','+52',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('FM','Micronesia, Federated States of','+691',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MD','Moldova, Republic of','+373',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MC','Monaco','+377',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MN','Mongolia','+976',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('ME','Montenegro','+382',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MS','Montserrat','+1664',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MA','Morocco','+212',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MZ','Mozambique','+258',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MM','Myanmar','+95',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NA','Namibia','+264',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NR','Nauru','+674',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NP','Nepal','+977',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NL','Netherlands','+31',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AN','Netherlands Antilles','+599',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NC','New Caledonia','+687',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NZ','New Zealand','+64',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NI','Nicaragua','+505',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NE','Niger','+227',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NG','Nigeria','+234',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NU','Niue','+683',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NF','Norfolk Island','+672',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MP','Northern Mariana Islands','+1 670',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('NO','Norway','+47',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('OM','Oman','+968',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PK','Pakistan','+92',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PW','Palau','+680',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PS','Palestinian Territory, Occupied','+970',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PA','Panama','+507',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PG','Papua New Guinea','+675',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PY','Paraguay','+595',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PE','Peru','+51',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PH','Philippines','+63',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PN','Pitcairn','+872',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PL','Poland','+48',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PT','Portugal','+351',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PR','Puerto Rico','+1 939',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('QA','Qatar','+974',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('RO','Romania','+40',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('RU','Russia','+7',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('RW','Rwanda','+250',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('RE','Réunion','+262',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('BL','Saint Barthélemy','+590',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SH','Saint Helena, Ascension and Tristan Da Cunha','+290',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('KN','Saint Kitts and Nevis','+1 869',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LC','Saint Lucia','+1 758',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('MF','Saint Martin','+590',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('PM','Saint Pierre and Miquelon','+508',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('VC','Saint Vincent and the Grenadines','+1 784',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('WS','Samoa','+685',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SM','San Marino','+378',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('ST','Sao Tome and Principe','+239',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SA','Saudi Arabia','+966',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SN','Senegal','+221',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('RS','Serbia','+381',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SC','Seychelles','+248',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SL','Sierra Leone','+232',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SG','Singapore','+65',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SK','Slovakia','+421',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SI','Slovenia','+386',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SB','Solomon Islands','+677',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SO','Somalia','+252',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('ZA','South Africa','+27',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GS','South Georgia and the South Sandwich Islands','+500',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('ES','Spain','+34',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('LK','Sri Lanka','+94',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SD','Sudan','+249',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SR','Suriname','+597',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SJ','Svalbard and Jan Mayen','+47',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SZ','Swaziland','+268',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SE','Sweden','+46',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('CH','Switzerland','+41',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('SY','Syrian Arab Republic','+963',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TW','Taiwan, Province of China','+886',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TJ','Tajikistan','+992',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TZ','Tanzania, United Republic of','+255',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TH','Thailand','+66',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TL','Timor-Leste','+670',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TG','Togo','+228',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TK','Tokelau','+690',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TO','Tonga','+676',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TT','Trinidad and Tobago','+1 868',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TN','Tunisia','+216',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TR','Turkey','+90',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TM','Turkmenistan','+993',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TC','Turks and Caicos Islands','+1 649',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('TV','Tuvalu','+688',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('UG','Uganda','+256',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('UA','Ukraine','+380',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AE','United Arab Emirates','+971',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('GB','United Kingdom','+44',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('US','United States','+1',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('UY','Uruguay','+598',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('UZ','Uzbekistan','+998',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('VU','Vanuatu','+678',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('VE','Venezuela, Bolivarian Republic of','+58',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('VN','Viet Nam','+84',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('VG','Virgin Islands, British','+1 284',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('VI','Virgin Islands, U.S.','+1 340',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('WF','Wallis and Futuna','+681',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('YE','Yemen','+967',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('ZM','Zambia','+260',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('ZW','Zimbabwe','+263',1)",
      ),
      queryInterface.sequelize.query(
        "INSERT INTO Country (`countryCode`, `countryName`, `dialCode`, `isEnable`) VALUES ('AX','Åland Islands','+358',1)",
      ),
    ]);
  },
  down: (queryInterface, Sequelize) => {
    return true;
  },
};
