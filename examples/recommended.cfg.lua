admins = { }

modules_enabled = {

	-- Generally required
		"roster"; -- Allow users to have a roster. Recommended ;)
		"saslauth"; -- Authentication for clients and servers. Recommended if you want to log in.
		"tls"; -- Add support for secure TLS on c2s/s2s connections
		"dialback"; -- s2s dialback support
		"disco"; -- Service discovery

	-- Not essential, but recommended
		"private"; -- Private XML storage (for room bookmarks, etc.)
		"vcard"; -- Allow users to set vCards

	-- These are commented by default as they have a performance impact
		"blocklist"; -- Allow users to block communications with other users
		"compression"; -- Stream compression

	-- Nice to have
		"version"; -- Replies to server version requests
		"uptime"; -- Report how long server has been running
		"time"; -- Let others know the time here on this server
		"ping"; -- Replies to XMPP pings with pongs
		"pep"; -- Enables users to publish their mood, activity, playing music and more
		"register"; -- Allow users to register on this server using a client and change passwords

	-- Admin interfaces
		"admin_adhoc"; -- Allows administration via an XMPP client that supports ad-hoc commands
		--"admin_telnet"; -- Opens telnet console interface on localhost port 5582

	-- HTTP modules
		"bosh"; -- Enable BOSH clients, aka "Jabber over HTTP"
		"http_files"; -- Serve static files from a directory over HTTP

	-- Other specific functionality
		--"groups"; -- Shared roster support
		"announce"; -- Send announcement to all online users
		"welcome"; -- Welcome users who register accounts
		"watchregistrations"; -- Alert admins of registrations
		--"motd"; -- Send a message to users when they log in
		--"legacyauth"; -- Legacy authentication. Only used by some old clients and bots.

	-- Usefull modules
		"idlecompat";
		"incidents_handling"; -- It will let you manage reports, inquiries, requests and responses through an Adhoc interface.
		"json_streams"; -- Simply loading this module makes Prosody accept JSON on C2S streams
		"spam_reporting"; -- When someone reports spam or abuse, a line about this is logged and an event is fired so that other modules can act on the report.
		"server_contact_info"; -- This module lets you advertise various contact addresses for your XMPP service.
		"ipcheck"; -- This simple XEP allows the client to ask the server for the IP address it is connected from.
}

-- Following config is required for "server_contact_info"
-- contact_info = {
--   abuse = { "mailto:abuse@shakespeare.lit", "xmpp:abuse@shakespeare.lit" };
--   admin = { "mailto:admin@shakespeare.lit", "xmpp:admin@shakespeare.lit" };
--   feedback = { "http://shakespeare.lit/feedback.php", "mailto:feedback@shakespeare.lit", "xmpp:feedback@shakespeare.lit" };
--   sales = "xmpp:bard@shakespeare.lit";
--   security = "xmpp:security@shakespeare.lit";
--   support = { "http://shakespeare.lit/support.php", "xmpp:support@shakespeare.lit" };
-- };

s2s_secure_auth = true
