## QR Code Applications

### Share an URL to open in the browser

##### URL

```qrcode-sixthsize-left-
https://www.startrek.com
```
```
https://www.startrek.com
```
[]()
### Send an email

##### mailto uri
`mailto:name@domain.com`

Optional parameters, name=value, introduced with `?`, separated by `&`
* `cc`: comma separated list of email addresses
* `bcc`: comma separated list of email addresses
* `subject`: [URL-Encoded](https://www.w3schools.com/tags//ref_urlencode.asp) string
* `body`: [URL-Encoded](https://www.w3schools.com/tags//ref_urlencode.asp) string

Example: 
```qrcode-sixthsize-left-
mailto:jimkirk@starfleet.fed?cc=spock@starfleet.fed,montys@starfleet.fed&subject=Party%20For%20Bones&body=RSVP:%20I%20am%20coming!
```
```
mailto:jimkirk@starfleet.fed?cc=spock@starfleet.fed,montys@starfleet.fed&subject=Party%20For%20Bones&body=RSVP:%20I%20am%20coming!
```

See [RFC-6068](https://www.rfc-editor.org/rfc/rfc6068.txt) for reference.

### Send a text message

##### sms uri

`sms:phone-number`

Optional parameter, name=value, introduced with `?`
* `body`: [URL-Encoded](https://www.w3schools.com/tags//ref_urlencode.asp) string

`sms:phone-number:message` also seems to be recognized in practice.

```qrcode-sixthsize-left-
sms:5551212?body=RSVP:%20I'm%20Coming!
```
```
sms:5551212?body=RSVP:%20I'm%20Coming!
```

See [RFC-5724](https://www.rfc-editor.org/rfc/rfc5724.txt) for reference.
### Make a phone call

##### tel uri

```qrcode-sixthsize-left-
tel:555-1212
```
```
tel:555-1212
```

See [RFC-3966](https://www.rfc-editor.org/rfc/rfc3966.txt) for reference.

### Share contact info

##### MECARD

`MECARD:` followed by a sequence of `tag:value;` followed by another semicolon.

Tags:
* `ADR`: Address
* `BDAY`: Birthday `YYYYMMDD`
* `EMAIL`: Email Address
* `N`: Name: Last, First
* `NICKNAME`
* `NOTE`
* `SOUND`: Kana Name: Last, First 
* `TEL`: Telephone Number
* `TEL-AV`: Video Telephone Number
* `URL`: Personal Website

```qrcode-sixthsize-left-
MECARD:N:Kirk,James;ADR:60 Greene St, Riverside, IA, USA 52327;EMAIL:jimkirk@starfleet.fed;URL:https://www.startrek.com;;
```
```
MECARD:N:Kirk,James;ADR:60 Greene St, Riverside, IA, USA 52327;EMAIL:jimkirk@starfleet.fed;URL:https://www.startrek.com;;
```

See [MeCard_(QR_code)](https://en.wikipedia.org/wiki/MeCard_(QR_code)) for reference.

##### vCard

Supposedly kinda works but large and complex.  Left as an exercise for the reader.

```qrcode-sixthsize-left
BEGIN:VCARD
VERSION:3.0
N:Kirk;James;;;
FN:Jim Kirk
TITLE:Captain
EMAIL;TYPE=INTERNET;TYPE=WORK;TYPE=PREF:jimkirk@starfleet.fed
URL;TYPE=Homepage:https://startrek.com
END:VCARD
```
```
BEGIN:VCARD
VERSION:3.0
N:Kirk;James;;;
FN:Jim Kirk
TITLE:Captain
EMAIL;TYPE=INTERNET;TYPE=WORK;TYPE=PREF:jimkirk@starfleet.fed
URL;TYPE=Homepage:https://startrek.com
END:VCARD
```

See [RFC-6350](https://www.rfc-editor.org/rfc/rfc6350.txt) for reference.

### Share a location

##### geo uri

This is not well supported widely.

`geo:latitude,longitude`

Optional unofficial parameters, name=value, introduced with `?`, separated by `&`
* q: latitude,longitude
* z: zoom level 1-21

It may work best to specify the same location in the uri and in the `q` parameter.
The `q` parameter may also support a [plus code](https://maps.google.com/pluscodes/) on some Android devices.

```qrcode-sixthsize-left-
geo:41.479911,-91.580276?q=41.479911,-91.580276&z=21
```
```
geo:41.479911,-91.580276?q=41.479911,-91.580276&z=21
```

See [RFC-5870](https://www.rfc-editor.org/rfc/rfc5870.txt) for reference.

##### Web link to mapping service

Because of the lack of support (and perhaps the reason for it), it might be more reliable to specify a location as a link to a mapping service. They can offer more functionality than a `geo` URI can, such as the ability to recognize plus codes.

See [Plus Codes](https://maps.google.com/pluscodes/) and 
[Google Maps URL documentation](https://developers.google.com/maps/documentation/urls/get-started). Be sure to [URL-Encode](https://www.w3schools.com/tags//ref_urlencode.asp) as directed, replacing comma with `%2C`, plus with `%2B`, and space with `%20`. 

Some examples:

Search on Google Maps using a plus code:
```qrcode-sixthsize-left-
https://www.google.com/maps/search/?api=1&query=86HCFCH9%2BXV9
```
```
https://www.google.com/maps/search/?api=1&query=86HCFCH9%2BXV9
```
Directions on Google Maps using latitude & longitude:
```qrcode-sixthsize-left-
https://www.google.com/maps/dir/?api=1&destination=41.479911%2C-91.580276
```
```
https://www.google.com/maps/dir/?api=1&destination=41.479911%2C-91.580276
```
Open Google Maps using latitude & longitude:
```qrcode-sixthsize-left-
https://www.google.com/maps/@?api=1&map_action=map&center=41.479911%2C-91.580276&zoom=21
```
```
https://www.google.com/maps/@?api=1&map_action=map&center=41.479911%2C-91.580276&zoom=21
```
DuckDuckGo map using latitude & longitude:
```qrcode-sixthsize-left-
https://duckduckgo.com/?q=41.479911%2C-91.580276&iaxm=maps
```
```
https://duckduckgo.com/?q=41.479911%2C-91.580276&iaxm=maps
```
OpenStreetMap using latitude & longitude:
```qrcode-sixthsize-left-
https://www.openstreetmap.org/#map=19/41.479911/-91.580276
```
```
https://www.openstreetmap.org/#map=19/41.479911/-91.580276
```

### Share an event

##### VEVENT

Specify the time of an event in the VEVENT format of iCalendar.

Also not well-supported.  Below is the only subset I found works: an explicit time zone.

```qrcode-sixthsize-left
BEGIN:VEVENT
DTSTART;TZID=America/Chicago:22280322T000000
DTEND;TZID=America/Chicago:22280322T235959
SUMMARY:Captain Kirk's Birthday
END:VEVENT
```
```
BEGIN:VEVENT
DTSTART;TZID=America/Chicago:22280322T000000
DTEND;TZID=America/Chicago:22280322T235959
SUMMARY:Captain Kirk's Birthday
END:VEVENT
```

See [RFC-5545](https://www.rfc-editor.org/rfc/rfc5545.txt) for reference.

### Connect to Wi-Fi

##### WIFI

`WIFI:` followed by a sequence of `tag:value;` followed by another semicolon.

Tags:
* `T`: Authentication Type, `WEP`, `WPA`, `WPA2-EAP`, `nopass`
* `S`: SSID
* `P`: Password
* `H`: Hidden, `true`, `false`
* `E`: EAP method, `TTLS`, `PWD` (WPA2-EAP only)
* `A`: Anonymous Identity, `anon` (WPA2-EAP only)
* `I`: Identity, `myidentity` (WPA2-EAP only)
* `PH2`: Phase 2 method, `MSCHAPV2` (WPA2-EAP only)

```qrcode-sixthsize-left-
WIFI:T:WPA;S:NCC1701D;P:Resistance is not futile;;
```
```
WIFI:T:WPA;S:NCC1701D;P:Resistance is not futile;;
```

See [WPA3 Specification](https://www.wi-fi.org/system/files/WPA3%20Specification%20v3.5.pdf#page=33) for reference.


### Share a One-Time-Password token

##### otpauth uri

QR Codes like this are generated by an identity provider and scanned using a 
one-time-password (OTP) application (aka authenticator application).  They contain a secret that is shared between the identity provider and the otp application, along with algorithm parameters for calculating a one-time-password. Not all authenticator apps implement the parameters, so the default values are almost always what are used.

```qrcode-sixthsize-left-
otpauth://totp/Starfleet:jimkirk%40starfleet.fed?issuer=Starfleet&secret=SCGZ3I55D76X6L75WHX3H7M7HH3SEDU4
```
```
otpauth://totp/Starfleet:kimkirk%40starfleet.fed?issuer=Starfleet&secret=SCGZ3I55D76X6L75WHX3H7M7HH3SEDU4
```

See [Key Uri Format](https://github.com/google/google-authenticator/wiki/Key-Uri-Format), [RFC-6238](https://www.rfc-editor.org/rfc/rfc6238), and [RFC-4226](https://www.rfc-editor.org/rfc/rfc4226) for reference.

##### phonefactor uri

This is the private method Microsoft's Authenticator app is linked with an account.


### References
https://github.com/zxing/zxing/wiki/Barcode-Contents  
